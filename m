Received: from sessmg23.ericsson.net ([193.180.251.45])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a30P2-0003cT-D2
 for linux-mtd@lists.infradead.org; Sun, 29 Nov 2015 11:44:25 +0000
From: Goran Cengic <goran.cengic@ericsson.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS node magic number off by single zero-byte
Date: Mon, 30 Nov 2015 10:46:58 +0000
Message-ID: <2F27BCDE355D444CB7EA7E1569D84650289D6DDD@ESESSMB203.ericsson.se>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've encountered a peculiar issue with the UBIFS failing to mount because o=
f an unclean node.
UBIFS complains that the node is unclean since it can't find the magic numb=
er,
however in the bytes dumped I can see that the magic number is there except=
 that it is offset
by a single zero-byte. Here is the log:

[11996.131746] UBIFS error (pid 1635): ubifs_check_node: bad magic 0x101831=
00, expected 0x6101831
[11996.150772] UBIFS error (pid 1635): ubifs_check_node: bad node at LEB 22=
:4096
[11996.157958] Not a node, first 24 bytes:
[11996.161647] 00000000: 00 31 18 10 06 08 34 38 e5 cd 26 00 00 00 00 00 00=
 a0 00 00 00 00 02 00                          .1....48..&.............
[11996.174759] CPU: 0 PID: 1635 Comm: syslogd Tainted: G           O 3.10.6=
2.R1A08-rt62 #1
[11996.182824] [] (unwind_backtrace+0x0/0xe0) from [] (show_stack+0x10/0x14=
)
[11996.191405] [] (show_stack+0x10/0x14) from [] (ubifs_check_node+0x258/0x=
280)
[11996.200245] [] (ubifs_check_node+0x258/0x280) from [] (ubifs_read_node+0=
x19c/0x26c)
[11996.209693] [] (ubifs_read_node+0x19c/0x26c) from [] (ubifs_tnc_read_nod=
e+0x44/0x11c)
[11996.219311] [] (ubifs_tnc_read_node+0x44/0x11c) from [] (ubifs_tnc_locat=
e+0x100/0x18c)
[11996.229013] [] (ubifs_tnc_locate+0x100/0x18c) from [] (ubifs_iget+0x60/0=
x5b8)
[11996.237937] [] (ubifs_iget+0x60/0x5b8) from [] (ubifs_lookup+0x194/0x1c4=
)
[11996.246511] [] (ubifs_lookup+0x194/0x1c4) from [] (lookup_real+0x30/0x4c=
)
[11996.255079] [] (lookup_real+0x30/0x4c) from [] (do_last.isra.29+0x510/0x=
b28)
[11996.263913] [] (do_last.isra.29+0x510/0xb28) from [] (path_openat+0xa8/0=
x428)
[11996.272832] [] (path_openat+0xa8/0x428) from [] (do_filp_open+0x2c/0x78)
[11996.281317] [] (do_filp_open+0x2c/0x78) from [] (do_sys_open+0xf8/0x184)
[11996.289802] [] (do_sys_open+0xf8/0x184) from [] (ret_fast_syscall+0x0/0x=
30)
[11996.298543] UBIFS error (pid 1635): ubifs_read_node: expected node type =
0
[11996.305365] UBIFS error (pid 1635): ubifs_iget: failed to read inode 94,=
 error -117
[11996.313071] UBIFS error (pid 1635): ubifs_lookup: dead directory entry '=
messages', error -117

I see this issue on kernel v3.10 and I've googled it but have come up with =
nothing.=20
I'm unable to reproduce the issue deterministically but it shows up randoml=
y on
a couple of different boards we run in our continuous integration setup and=
 the symptom
is always exactly the same even though the failed process might be differen=
t.

I wonder if anyone on the list has seen anything similar?

With kind regards,

	Goran
