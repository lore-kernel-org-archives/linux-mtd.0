Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 164sLU-0001md-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 23:24:28 +0000
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Linux MTD Mailing List" <linux-mtd@lists.infradead.org>,
	<icampbell@arcom.co.uk>
Subject: RE: [Fwd: Re: Caching of reads] 
Date: Fri, 16 Nov 2001 17:33:48 -0600
Message-ID: <000501c16ef7$242a1640$3e03010a@arcom.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0006_01C16EC4.D98FA640"
In-Reply-To: <7102.1005948313@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_0006_01C16EC4.D98FA640
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> There should be more debug info than that from JFFS2, shouldn't there?

That's what I get with verbosity = 1 
I've attached another partial log generated with verbosity = 3

> Are you sure that's right? Those sizes look suspicious. But it definitely

Absolutely not - but it is what the kernel is logging.

> looks like some of those nodes are being read repeatedly - I 
> don't know why
> they're being dropped from the page cache. What kernel, precisely?

kernel.org 2.4.14, patched with the Linus VM fix
(http://www.uwsg.indiana.edu/hypermail/linux/kernel/0111.0/1084.html)

.config attached also

> Please could you turn that off?

Given the option it would be :(

Any thoughts on where we should be looking ?

Best,

-Alex

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of David Woodhouse
> Sent: Friday, November 16, 2001 4:05 PM
> To: Alex J Lennon
> Cc: Ian Campbell; Linux MTD Mailing List
> Subject: Re: [Fwd: Re: Caching of reads] 
> 
> 
> 
> 
> > An strace seems to show it's related to the fork(), shortly 
> after the fork()
> 
> There should be more debug info than that from JFFS2, shouldn't there?
> 
> > <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC 
> f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> > <7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC 
> b16a4fa6. dsize b, csize b, offset 0, buf c3beec60
> > <7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 
> 544bdb58. dsize d, csize d, offset 0, buf c3be1ea0
> > <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC 
> f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> > <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC 
> f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
> > <7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC 
> b16a4fa6. dsize b, csize b, offset 0, buf c3beec60
> > <7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 
> 544bdb58. dsize d, csize d, offset 0, buf c3be1ea0
> 
> Are you sure that's right? Those sizes look suspicious. But it definitely
> looks like some of those nodes are being read repeatedly - I 
> don't know why
> they're being dropped from the page cache. What kernel, precisely?
> 
> 
> > The message in this transmission is sent in confidence for the
> > attention of the addressee only and should not be disclosed to any
> > other party. Unauthorised recipients are requested to preserve this
> > confidentiality. Please advise the sender if the addressee is not
> > resident at the receiving end. 
> 
> Please could you turn that off?
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> _____________________________________________________________________
> This message has been checked for all viruses by MessageLabs 
> Virus Control Centre.
> 

_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre. 

Company registered in England No. 1608562.
Registered Office: Unit 8, Clifton Road, Cambridge, CB1 7EA, United Kingdom, Tel: 01223 411200.
------=_NextPart_000_0006_01C16EC4.D98FA640
Content-Type: application/octet-stream;
	name="jffs2.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jffs2.log"

wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 113
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 114
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 114
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 115
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 115
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 116
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 116
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork()                                  =3D 117
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771
. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
[WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 117
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 118
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 118
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 119
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 119
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 120
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 120
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 121
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0], 0, NULL) =3D 121
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    =3D -1 ECHILD (No child =
processes)
sigreturn()                             =3D ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, =
calculated CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
{st_mode=3DS_IFREG|0755, st_size=3D132432, ...}) =3D 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) =3D 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC =
f3b6e771. dsi
ze 7, csize 7, offset 0, buf c3be3220
<7>Read 7 bytes to c3be3220
<7>Data CRC matches calculated CRC 186b259f
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6. =
dsize b,
 csize b, offset 0, buf c3be31e0
<7>Read 11 bytes to c3be31e0
<7>Data CRC matches calculated CRC 1193fcf4
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58. =
dsize d,
 csize d, offset 0, buf c3be3220
<7>Read 13 bytes to c3be3220
<7>Data CRC matches calculated CRC 808bf9b7
)                                  =3D 122
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) =3D 0

------=_NextPart_000_0006_01C16EC4.D98FA640
Content-Type: application/octet-stream;
	name=".config"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=".config"

#
# Automatically generated make config: don't edit
#
CONFIG_X86=y
CONFIG_ISA=y
# CONFIG_SBUS is not set
CONFIG_UID16=y

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# Loadable module support
#
CONFIG_MODULES=y
CONFIG_MODVERSIONS=y
CONFIG_KMOD=y

#
# Processor type and features
#
# CONFIG_M386 is not set
# CONFIG_M486 is not set
CONFIG_M586=y
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP2 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MCYRIXIII is not set
CONFIG_X86_WP_WORKS_OK=y
CONFIG_X86_INVLPG=y
CONFIG_X86_CMPXCHG=y
CONFIG_X86_XADD=y
CONFIG_X86_BSWAP=y
CONFIG_X86_POPAD_OK=y
# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_USE_STRING_486=y
CONFIG_X86_ALIGNMENT_16=y
# CONFIG_TOSHIBA is not set
# CONFIG_I8K is not set
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set
CONFIG_NOHIGHMEM=y
# CONFIG_HIGHMEM4G is not set
# CONFIG_HIGHMEM64G is not set
# CONFIG_MATH_EMULATION is not set
# CONFIG_MTRR is not set
# CONFIG_SMP is not set
# CONFIG_X86_UP_APIC is not set

#
# General setup
#
CONFIG_NET=y
CONFIG_PCI=y
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
# CONFIG_PCI_NAMES is not set
# CONFIG_EISA is not set
# CONFIG_MCA is not set
CONFIG_HOTPLUG=y

#
# PCMCIA/CardBus support
#
CONFIG_PCMCIA=m
CONFIG_CARDBUS=y
# CONFIG_I82092 is not set
# CONFIG_I82365 is not set
# CONFIG_TCIC is not set
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
CONFIG_KCORE_ELF=y
# CONFIG_KCORE_AOUT is not set
CONFIG_BINFMT_AOUT=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_MISC=y
CONFIG_PM=y
# CONFIG_ACPI is not set
CONFIG_APM=m
# CONFIG_APM_IGNORE_USER_SUSPEND is not set
# CONFIG_APM_DO_ENABLE is not set
# CONFIG_APM_CPU_IDLE is not set
# CONFIG_APM_DISPLAY_BLANK is not set
# CONFIG_APM_RTC_IS_GMT is not set
# CONFIG_APM_ALLOW_INTS is not set
# CONFIG_APM_REAL_MODE_POWER_OFF is not set

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_CFI_B1=y
CONFIG_MTD_CFI_B2=y
# CONFIG_MTD_CFI_B4 is not set
CONFIG_MTD_CFI_I1=y
# CONFIG_MTD_CFI_I2 is not set
# CONFIG_MTD_CFI_I4 is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
CONFIG_MTD_SBC_GXX=y
# CONFIG_MTD_ELAN_104NC is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Parallel port support
#
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_PC_CML1=m
# CONFIG_PARPORT_SERIAL is not set
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_PC_PCMCIA is not set
# CONFIG_PARPORT_AMIGA is not set
# CONFIG_PARPORT_MFC3 is not set
# CONFIG_PARPORT_ATARI is not set
# CONFIG_PARPORT_SUNBPP is not set
# CONFIG_PARPORT_OTHER is not set
# CONFIG_PARPORT_1284 is not set

#
# Plug and Play configuration
#
CONFIG_PNP=m
CONFIG_ISAPNP=m

#
# Block devices
#
CONFIG_BLK_DEV_FD=y
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set

#
# Networking options
#
CONFIG_PACKET=m
# CONFIG_PACKET_MMAP is not set
# CONFIG_NETLINK is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
# CONFIG_ATM is not set
# CONFIG_VLAN_8021Q is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_LLC is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# Telephony Support
#
# CONFIG_PHONE is not set

#
# ATA/IDE/MFM/RLL support
#
CONFIG_IDE=m

#
# IDE, ATA and ATAPI Block devices
#
CONFIG_BLK_DEV_IDE=m

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_HD_IDE is not set
# CONFIG_BLK_DEV_HD is not set
CONFIG_BLK_DEV_IDEDISK=m
# CONFIG_IDEDISK_MULTI_MODE is not set
# CONFIG_BLK_DEV_IDEDISK_VENDOR is not set
# CONFIG_BLK_DEV_COMMERIAL is not set
# CONFIG_BLK_DEV_IDECS is not set
CONFIG_BLK_DEV_IDECD=m
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_BLK_DEV_IDEFLOPPY is not set

#
# IDE chipset support/bugfixes
#
# CONFIG_BLK_DEV_CMD640 is not set
# CONFIG_BLK_DEV_RZ1000 is not set
CONFIG_BLK_DEV_IDEPCI=y
CONFIG_IDEPCI_SHARE_IRQ=y
CONFIG_BLK_DEV_IDEDMA_PCI=y
CONFIG_BLK_DEV_ADMA=y
# CONFIG_BLK_DEV_OFFBOARD is not set
# CONFIG_IDEDMA_PCI_AUTO is not set
CONFIG_BLK_DEV_IDEDMA=y
# CONFIG_IDEDMA_PCI_WIP is not set
# CONFIG_BLK_DEV_AEC62XX is not set
# CONFIG_BLK_DEV_ALI15X3 is not set
# CONFIG_BLK_DEV_AMD74XX is not set
# CONFIG_BLK_DEV_CMD64X is not set
# CONFIG_BLK_DEV_CY82C693 is not set
CONFIG_BLK_DEV_CS5530=y
# CONFIG_BLK_DEV_HPT34X is not set
# CONFIG_BLK_DEV_HPT366 is not set
# CONFIG_BLK_DEV_PIIX is not set
# CONFIG_BLK_DEV_NS87415 is not set
# CONFIG_BLK_DEV_OPTI621 is not set
# CONFIG_BLK_DEV_PDC202XX is not set
# CONFIG_BLK_DEV_SVWKS is not set
# CONFIG_BLK_DEV_SIS5513 is not set
# CONFIG_BLK_DEV_SLC90E66 is not set
# CONFIG_BLK_DEV_TRM290 is not set
# CONFIG_BLK_DEV_VIA82CXXX is not set
# CONFIG_IDE_CHIPSETS is not set
# CONFIG_IDEDMA_AUTO is not set
# CONFIG_IDEDMA_IVB is not set
# CONFIG_DMA_NONPCI is not set
CONFIG_BLK_DEV_IDE_MODES=y
# CONFIG_BLK_DEV_ATARAID is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

#
# Fusion MPT device support
#
# CONFIG_FUSION_BOOT is not set
# CONFIG_FUSION_ISENSE is not set
# CONFIG_FUSION_CTL is not set
# CONFIG_FUSION_LAN is not set

#
# IEEE 1394 (FireWire) support (EXPERIMENTAL)
#
# CONFIG_IEEE1394 is not set

#
# I2O device support
#
# CONFIG_I2O is not set

#
# Network device support
#
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
CONFIG_DUMMY=m
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_HP100 is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_PCI=y
# CONFIG_PCNET32 is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
# CONFIG_TULIP is not set
# CONFIG_DE4X5 is not set
# CONFIG_DGRS is not set
# CONFIG_DM9102 is not set
# CONFIG_EEPRO100 is not set
# CONFIG_FEALNX is not set
CONFIG_NATSEMI=y
# CONFIG_NE2K_PCI is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_DL2K is not set
# CONFIG_NS83820 is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPP_ASYNC=m
# CONFIG_PPP_SYNC_TTY is not set
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_BSDCOMP is not set
# CONFIG_PPPOE is not set
CONFIG_SLIP=m
# CONFIG_SLIP_COMPRESSED is not set
# CONFIG_SLIP_SMART is not set
# CONFIG_SLIP_MODE_SLIP6 is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# PCMCIA network device support
#
# CONFIG_NET_PCMCIA is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Old CD-ROM drivers (not SCSI, not IDE)
#
# CONFIG_CD_NO_IDESCSI is not set

#
# Input core support
#
# CONFIG_INPUT is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_EXTENDED=y
# CONFIG_SERIAL_MANY_PORTS is not set
CONFIG_SERIAL_SHARE_IRQ=y
# CONFIG_SERIAL_DETECT_IRQ is not set
# CONFIG_SERIAL_MULTIPORT is not set
# CONFIG_HUB6 is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set

#
# I2C support
#
# CONFIG_I2C is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
CONFIG_MOUSE=y
CONFIG_PSMOUSE=y
# CONFIG_82C710_MOUSE is not set
# CONFIG_PC110_PAD is not set

#
# Joysticks
#
# CONFIG_INPUT_GAMEPORT is not set

#
# Input core support is needed for gameports
#

#
# Input core support is needed for joysticks
#
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
CONFIG_WATCHDOG=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_SOFT_WATCHDOG=m
# CONFIG_WDT is not set
# CONFIG_WDTPCI is not set
# CONFIG_PCWATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_60XX_WDT is not set
# CONFIG_W83877F_WDT is not set
# CONFIG_MIXCOMWD is not set
# CONFIG_I810_TCO is not set
# CONFIG_MACHZ_WDT is not set
# CONFIG_INTEL_RNG is not set
CONFIG_NVRAM=m
CONFIG_RTC=m
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# PCMCIA character devices
#
# CONFIG_PCMCIA_SERIAL_CS is not set
# CONFIG_MWAVE is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_AUTOFS4_FS=y
# CONFIG_REISERFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_FAT_FS=m
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=m
# CONFIG_EFS_FS is not set
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=3
# CONFIG_CRAMFS is not set
CONFIG_TMPFS=y
# CONFIG_RAMFS is not set
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
CONFIG_DEVPTS_FS=y
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UDF_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=m
# CONFIG_NFS_V3 is not set
# CONFIG_NFSD is not set
CONFIG_SUNRPC=m
CONFIG_LOCKD=m
CONFIG_SMB_FS=m
# CONFIG_SMB_NLS_DEFAULT is not set
# CONFIG_NCP_FS is not set
# CONFIG_ZISOFS_FS is not set
# CONFIG_ZLIB_FS_INFLATE is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_SMB_NLS=y
CONFIG_NLS=y

#
# Native Language Support
#
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_UTF8 is not set

#
# Console drivers
#
CONFIG_VGA_CONSOLE=y
CONFIG_VIDEO_SELECT=y
# CONFIG_MDA_CONSOLE is not set

#
# Frame-buffer support
#
CONFIG_FB=y
CONFIG_DUMMY_CONSOLE=y
# CONFIG_FB_RIVA is not set
# CONFIG_FB_CLGEN is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_VESA is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_HGA is not set
CONFIG_VIDEO_SELECT=y
# CONFIG_FB_MATROX is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_SIS is not set
CONFIG_FB_GEODE=y
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VIRTUAL is not set
CONFIG_FBCON_ADVANCED=y
# CONFIG_FBCON_MFB is not set
# CONFIG_FBCON_CFB2 is not set
# CONFIG_FBCON_CFB4 is not set
CONFIG_FBCON_CFB8=y
CONFIG_FBCON_CFB16=y
CONFIG_FBCON_CFB24=y
CONFIG_FBCON_CFB32=y
# CONFIG_FBCON_AFB is not set
# CONFIG_FBCON_ILBM is not set
# CONFIG_FBCON_IPLAN2P2 is not set
# CONFIG_FBCON_IPLAN2P4 is not set
# CONFIG_FBCON_IPLAN2P8 is not set
# CONFIG_FBCON_MAC is not set
# CONFIG_FBCON_VGA_PLANES is not set
# CONFIG_FBCON_VGA is not set
# CONFIG_FBCON_HGA is not set
# CONFIG_FBCON_FONTWIDTH8_ONLY is not set
# CONFIG_FBCON_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y

#
# Sound
#
CONFIG_SOUND=m
# CONFIG_SOUND_BT878 is not set
# CONFIG_SOUND_CMPCI is not set
# CONFIG_SOUND_EMU10K1 is not set
# CONFIG_SOUND_FUSION is not set
# CONFIG_SOUND_CS4281 is not set
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_ESSSOLO1 is not set
# CONFIG_SOUND_MAESTRO is not set
# CONFIG_SOUND_MAESTRO3 is not set
# CONFIG_SOUND_ICH is not set
# CONFIG_SOUND_RME96XX is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_TRIDENT is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
# CONFIG_SOUND_VIA82CXXX is not set
CONFIG_SOUND_OSS=m
# CONFIG_SOUND_TRACEINIT is not set
# CONFIG_SOUND_DMAP is not set
# CONFIG_SOUND_AD1816 is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_ADLIB is not set
# CONFIG_SOUND_ACI_MIXER is not set
# CONFIG_SOUND_CS4232 is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_VMIDI is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_NM256 is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_PAS is not set
# CONFIG_SOUND_PSS is not set
CONFIG_SOUND_SB=m
# CONFIG_SOUND_AWE32_SYNTH is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_YM3812 is not set
# CONFIG_SOUND_OPL3SA1 is not set
# CONFIG_SOUND_OPL3SA2 is not set
# CONFIG_SOUND_YMFPCI is not set
# CONFIG_SOUND_UART6850 is not set
# CONFIG_SOUND_AEDSP16 is not set

#
# USB support
#
# CONFIG_USB is not set

#
# USB Controllers
#

#
# USB Device Class drivers
#

#
# USB Human Interface Devices (HID)
#

#
#   Input core support is needed for USB HID
#

#
# USB Imaging devices
#

#
# USB Multimedia devices
#

#
#   Video4Linux support is needed for USB Multimedia device support
#

#
# USB Network adaptors
#

#
# USB port drivers
#

#
# USB Serial Converter support
#

#
# USB Miscellaneous drivers
#

#
# Bluetooth support
#
# CONFIG_BLUEZ is not set

#
# Kernel hacking
#
# CONFIG_DEBUG_KERNEL is not set

------=_NextPart_000_0006_01C16EC4.D98FA640--
