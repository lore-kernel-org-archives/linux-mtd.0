Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 164nCd-0001OU-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2001 17:54:59 +0000
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: "Ian Campbell" <icampbell@arcom.co.uk>
Cc: "Linux MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: RE: [Fwd: Re: Caching of reads]
Date: Fri, 16 Nov 2001 12:04:24 -0600
Message-ID: <002e01c16ec9$1fdddc80$3e03010a@arcom.cc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1005926529.15603.29.camel@LinuxDev>
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

>Strange. JFFS2 doesn't do caching - that's supposed to be handle by the
>Linux VFS/VM. But set CONFIG_JFFS2_FS_DEBUG=1 and
>echo 9 > /proc/sys/kernel/printk, then see what it's actually being asked
>to read each time.

An strace seems to show it's related to the fork(), shortly after the fork()
?

-Alex

--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    = -1 ECHILD (No child processes)
sigreturn()                             = ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated
CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
{st_mode=S_IFREG|0755, st_size=132432, ...}) = 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) = 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC f3b6e771.
dsi
ze 7, csize 7, offset 0, buf c3be1ea0
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6.
dsize b,
 csize b, offset 0, buf c3beec60
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58.
dsize d,
 csize d, offset 0, buf c3be1ea0
)                                  = 841
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 841
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD (Child exited) ---
wait4(-1, 0xbffff840, WNOHANG, NULL)    = -1 ECHILD (No child processes)
sigreturn()                             = ? (mask now [])
rt_sigaction(SIGINT, {SIG_DFL}, {0x806c32c, [], 0x4000000}, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
stat("/bin/sleep", <7>Node read from 00d9d8f4: node_crc f3b6e771, calculated
CRC
 f3b6e771. dsize 7, csize 7, offset 0, buf c3be1ea0
{st_mode=S_IFREG|0755, st_size=132432, ...}) = 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) = 0
fork(<7>Node read from 00d9d8f4: node_crc f3b6e771, calculated CRC f3b6e771.
dsi
ze 7, csize 7, offset 0, buf c3be1ea0
<7>Node read from 00cec5c0: node_crc b16a4fa6, calculated CRC b16a4fa6.
dsize b,
 csize b, offset 0, buf c3beec60
<7>Node read from 00c55d1c: node_crc 544bdb58, calculated CRC 544bdb58.
dsize d,
 csize d, offset 0, buf c3be1ea0
)                                  = 842
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {0x806c32c, [], 0x4000000}, {SIG_DFL}, 8) = 0
wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 842
rt_sigprocmask(SIG_BLOCK, [CHLD TTOU], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre. 

Company registered in England No. 1608562.
Registered Office: Unit 8, Clifton Road, Cambridge, CB1 7EA, United Kingdom, Tel: 01223 411200.
