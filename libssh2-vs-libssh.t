#include "doctype.t"
#include "setup.t"
HEAD(libssh2 vs libssh)
#include "body.t"

#include "menu.t"

<p>
TITLE(libssh2 vs libssh - A comparison)
BOXTOP

<p>libssh2 and libssh both provide an API to develop SSH based applications.

<p>Here's an attempt to put some light on the differences between them.

SUBTITLE(libssh2 1.7.0)
<p>
<ul>
    <li>License: <a href="https://en.wikipedia.org/wiki/BSD_licenses#3-clause_license_.28.22Revised_BSD_License.22.2C_.22New_BSD_License.22.2C_or_.22Modified_BSD_License.22.29">3-clause BSD License</a>
    <li>Developped in: C (30218 SLOC), sh (1102 SLOC), Perl (65 SLOC), Lisp (33 SLOC), AWK (23 SLOC)
    <li>NUmber of functions: 170
    <li>Key Exchange Methods: diffie-hellman-group1-sha1, diffie-hellman-group14-sha1, diffie-hellman-group-exchange-sha1, diffie-hellman-group-exchange-sha256
    <li>Hostkey Types: ssh-rsa, ssh-dss
    <li>Ciphers: aes256-ctr, aes192-ctr, aes128-ctr, aes256-cbc (rijndael-cbc@lysator.liu.se), aes192-cbc, aes128-cbc, 3des-cbc, blowfish-cbc, cast128-cbc, arcfour, arcfour128, none
    <li>Compression Schemes: zlib, zlib@openssh.com, none
    <li>MAC hashes: hmac-sha2-256, hmac-sha2-512, hmac-sha1, hmac-sha1-96, hmac-md5, hmac-md5-96, hmac-ripemd160 (hmac-ripemd160@openssh.com), none
    <li>Authentication: none, password, public-key, hostbased, keyboard-interactive
    <li>Channels: shell, exec (incl. SCP wrapper), direct-tcpip, subsystem
    <li>Global Requests: tcpip-forward
    <li>Channel Requests: x11, pty, exit-signal, keepalive@openssh.com
    <li>Subsystems: sftp(version 3), publickey(version 2)
    <li>SFTP: statvfs@openssh.com, fstatvfs@openssh.com
    <li>Thread-safe: just don't share handles simultaneously
    <li>Non-blocking: it can be used both blocking and non-blocking
    <li>Your sockets: the app hands over the socket, calls select() etc.
    <li>OpenSSL, Libgcrypt or WinCNG (native since Windows Vista): builds with either
</ul>
SUBTITLE(<a href="http://www.libssh.org/">libssh</a> 0.7.x)
<p>
<ul>
    <li>License: <a href="https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html">GNU Lesser General Public License</a>
    <li>Developped in: C (46021 SLOC), C++ (1181 SLOC), sh (186 SLOC), Python (9 SLOC)
    <li>NUmber of functions: 213
    <li>Key Exchange Methods: curve25519-sha256@libssh.org, ecdh-sha2-nistp256, diffie-hellman-group1-sha1, diffie-hellman-group14-sha1
    <li>Hostkey Types: ssh-ed25519, ecdsa-sha2-nistp256, ecdsa-sha2-nistp384, ecdsa-sha2-nistp521, ssh-rsa, ssh-dss, ssh-rsa, ssh-dss
    <li>Ciphers: aes256-ctr, aes192-ctr, aes128-ctr, aes256-cbc (rijndael-cbc@lysator.liu.se), aes192-cbc, aes128-cbc, 3des-cbc, blowfish-cbc, none
    <li>Compression Schemes: zlib, zlib@openssh.com, none
    <li>MAC hashes: hmac-sha1, none
    <li>Authentication: none, password, public-key, hostbased, keyboard-interactive, gssapi-with-mic
    <li>Channels: shell, exec (incl. SCP wrapper), direct-tcpip, subsystem, auth-agent-req@openssh.com
    <li>Global Requests: tcpip-forward, forwarded-tcpip
    <li>Channel Requests: x11, pty, exit-status, signal, exit-signal, keepalive@openssh.com, auth-agent-req@openssh.com
    <li>Subsystems: sftp(version 3), OpenSSH Extensions
    <li>SFTP: statvfs@openssh.com, fstatvfs@openssh.com
    <li>Thread-safe: Just don't share sessions
    <li>Non-blocking: it can be used both blocking and non-blocking
    <li>Your sockets: the app hands over the socket, or uses libssh sockets
    <li>OpenSSL or gcrypt: builds with either
    <li>Client and server support
    <li>SSHv2 and SSHv1 protocol support
    <li>Supports Linux, UNIX, BSD, Solaris, OS/2 and Windows
    <li>Automated test cases with nightly tests
    <li>Event model based on poll(2), or a poll(2)-emulation.
</ul>

SUBTITLE(Feature by feature)
<p>
 The same data, in a table:

<table>
    <thead>
        <tr>
            <th>item</th>
            <th>libssh2</th>
            <th>libssh</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Licence</td>
            <td>BSD</td>
            <td>LGPL</td>
        </tr>
        <tr>
            <td>Server-side support</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>GSSAPI authentication</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Eliptic Curve Key Exchange</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Eliptic Curve Hostkeys</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Automated test cases with nightly tests</td>
            <td>no (tests available)</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Stable API</td>
            <td>yes</td>
            <td>mostly</td>
        </tr>
        <tr>
            <td>C compatibility</td>
            <td>C89</td>
            <td>C99</td>
        </tr>
        <tr>
            <td>strict namespace</td>
            <td>yes</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>man pages for all functions</td>
            <td>yes</td>
            <td>no</td>
        </tr>
        <tr>
            <td>Doxygen documentation for all functions</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Tutorial</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>SSHv1 support</td>
            <td>no</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>Build concept</td>
            <td>Autotools and CMake</td>
            <td>CMake</td>
        </tr>
    </tbody>
</table>
BOXBOT

#include "footer.t"
