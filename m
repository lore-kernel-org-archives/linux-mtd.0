Received: from mail-in-07.arcor-online.net ([151.189.21.47])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXdzk-000687-S7
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 19:46:50 +0000
Received: from mail-in-05-z2.arcor-online.net (mail-in-05-z2.arcor-online.net
 [151.189.8.17]) by mx.arcor.de (Postfix) with ESMTP id 3F694108218
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2012 21:13:42 +0200 (CEST)
Received: from mail-in-06.arcor-online.net (mail-in-06.arcor-online.net
 [151.189.21.46])
 by mail-in-05-z2.arcor-online.net (Postfix) with ESMTP id 27F4B73CC4
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2012 21:13:42 +0200 (CEST)
Received: from antares (xdsl-89-0-70-197.netcologne.de [89.0.70.197])
 (Authenticated sender: dralbrecht.dress@arcor.de)
 by mail-in-06.arcor-online.net (Postfix) with ESMTPSA id 1622810BFA5
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2012 21:13:42 +0200 (CEST)
Received: from antares (antares [127.0.0.1])
 by antares (Postfix) with ESMTPS id B2FD7B4049
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2012 21:13:40 +0200 (CEST)
Date: Thu, 24 May 2012 21:13:33 +0200
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: oops jffs2_garbage_collect_live in 3.2.16
To: linux-mtd@lists.infradead.org
Message-Id: <1337886820.2241.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 protocol="application/pgp-signature"; boundary="=-G8IpDR0KP4TcXXnaIp0W"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-G8IpDR0KP4TcXXnaIp0W
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm running 3.2.16 on a Freescale MPC5200B (PPC) based board.  One MTD devi=
ce with a jffs2 fs on it is a 512 kbyte NVRAM (/dev/mtd6), which is quite i=
ntensively used (syslogd writes to it).

I got an oops (a NULL pointer deref?) while I was running a test applicatio=
n which reads/writes a vfat-formatted CF card over the parallel ata interfa=
ce of the '5200:

[105543.288910] Unable to handle kernel paging request for data at address =
0x00000000
[105543.324759] Faulting instruction address: 0xc013a6c4
[105543.347657] Oops: Kernel access of bad area, sig: 11 [#1]
[105543.353293] PREEMPT test-cf
[105543.356611] Modules linked in:
[105543.359842] NIP: c013a6c4 LR: c0101fec CTR: 00000077
[105543.365026] REGS: cfabdd20 TRAP: 0300   Not tainted  (3.2.16)
[105543.371001] MSR: 00009032 <EE,ME,IR,DR>  CR: 48884022  XER: 00000000
[105543.377659] DAR: 00000000, DSISR: 20000000
[105543.381949] TASK =3D cfa28000[81] 'jffs2_gcd_mtd6' THREAD: cfabc000
[105543.388103] GPR00: 00000000 cfabddd0 cfa28000 fffffffc 00000000 0000000=
2 00000000 54cc9384
[105543.396818] GPR08: c028e898 c0290000 00000000 ddd86af2 c028e548 df7ffff=
f 0fff0000 cfabddfc
[105543.405530] GPR16: cfabddf8 cfabddf0 cfabddec cfabde00 cfabddf4 c0ad400=
0 00002000 00002000
[105543.414238] GPR24: 00001d07 00000006 00000000 c0ad4d07 4fbb3ec9 4fbb3ec=
9 cfa7f400 00000077
[105543.423160] NIP [c013a6c4] crc32_le+0xa4/0x150
[105543.427834] LR [c0101fec] jffs2_garbage_collect_live+0x624/0xf18
[105543.434076] Call Trace:
[105543.436679] [cfabddd0] [cf37b070] 0xcf37b070 (unreliable)
[105543.442329] [cfabdde0] [c0101f20] jffs2_garbage_collect_live+0x558/0xf1=
8
[105543.449305] [cfabde90] [c0102fa8] jffs2_garbage_collect_pass+0x6c8/0x7c=
4
[105543.456284] [cfabdee0] [c01045f8] jffs2_garbage_collect_thread+0xa8/0x1=
9c
[105543.463349] [cfabdf90] [c003d354] kthread+0x7c/0x80
[105543.468466] [cfabdff0] [c000e32c] kernel_thread+0x4c/0x68
[105543.474093] Instruction dump:
[105543.477230] 7c0a5a78 70800003 4240ffac 4082ffd0 54bff0bf 3864fffc 54a50=
7be 41820068
[105543.485326] 3d20c029 7fe903a6 38c00000 3989e548 <7d26202e> 38c60004 7d4=
94a78 552bd5ba

This happened exactly *once*, and I could not reproduce the issue.

Any idea what went wrong, and how I could fix the cause?

Thanks in advance,
Albrecht.=

--=-G8IpDR0KP4TcXXnaIp0W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iD8DBQBPvohkn/9unNAn/9ERAh/3AKC6UPCX/Ytb5VvppUBLZnw5vg1vTACgpD5r
zJKqf0G5X+fKcHQ7a5rDeZA=
=A1d5
-----END PGP SIGNATURE-----

--=-G8IpDR0KP4TcXXnaIp0W--
