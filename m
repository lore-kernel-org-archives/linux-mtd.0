Date: Fri, 16 Nov 2007 11:29:14 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <Pine.LNX.4.64.0711161040540.30610@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.64.0711161123200.1241@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<1195194827.2533.79.camel@shinybook.infradead.org>
	<Pine.LNX.4.64.0711161040540.30610@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David

> > 
> > Can I see the debug output from jffs2_build_inode_fragtree() when it's
> > building the offending file?
> >
> No problem. I will send you log today. 
Here is the data. Thanks to Roman for help.

New file:
-------------------
[root@Linux /tmp]#
[root@Linux /tmp]#mount -t jffs2 /dev/mtdblock9 /mnt/mtd6
potential mdata is ver 1 at c30923a0
tn c30923c0 ver 2 range 0x0-0x32 ov 0
Add c30923c0 (v 2, 0x0-0x32, ov 0) to fragtree
[root@Linux /tmp]#cat /mnt/mtd6/pltn c30923a0 ver 2 range 0x0-0x32 ov 0
Add c30923a0 (v 2, 0x0-0x32, ov 0) to fragtree
[root@Linux /tmp]#cat /mnt/mtd6/plrnor.file
Data CRC 1decb93d != calculated CRC c98c11cd for node at 002c0084
Data CRC 1decb93d != calculated CRC c98c11cd for node at 002c0084
cat: Read error: Input/output error
[root@Linux /tmp]#
[root@Linux /tmp]#
[root@Linux /tmp]#


Holey
-------------------
[root@Linux mtd6]#/tmp/holey
97453 bytes written to 6906 (0 of 100000)
35046 bytes written to 64102 (1 of 100000)
3533 bytes written to 55042 (2 of 100000)
51517 bytes written to 24084 (3 of 100000)


...........................................

[root@Linux /tmp]#mount -t jffs2 /dev/mtdblock6 /mnt/mtd6
[root@Linux /tmp]#tn c3f062c0 ver 3 range 0x1a000-0x1a001 ov 0
tn c3f06340 ver 28 range 0x19000-0x197a7 ov 1
tn c3f06320 ver 27 range 0x18000-0x19000 ov 1
tn c3f06a00 ver 39 range 0x18000-0x1834c ov 1
tn c3f069e0 ver 38 range 0x17000-0x18000 ov 1
tn c3f069c0 ver 37 range 0x16000-0x17000 ov 1
tn c3f069a0 ver 36 range 0x15ec4-0x16000 ov 1
tn c3f063c0 ver 35 range 0x15000-0x15ec4 ov 1
tn c3f063a0 ver 34 range 0x14000-0x15000 ov 1
tn c3f06380 ver 33 range 0x13000-0x14000 ov 1
tn c3f06360 ver 32 range 0x12000-0x13000 ov 1
tn c3f061e0 ver 55 range 0x12000-0x12751 ov 1
tn c3f06b40 ver 54 range 0x11000-0x12000 ov 1
tn c3f06b20 ver 53 range 0x10000-0x11000 ov 1
tn c3f06b00 ver 52 range 0xf000-0x10000 ov 1
tn c3f06ae0 ver 51 range 0xe000-0xf000 ov 1
tn c3f06ac0 ver 50 range 0xd000-0xe000 ov 1
tn c3f06aa0 ver 49 range 0xc000-0xd000 ov 1
tn c3f06a80 ver 48 range 0xb000-0xc000 ov 1
tn c3f06a60 ver 47 range 0xa000-0xb000 ov 1
tn c3f06a40 ver 46 range 0x9000-0xa000 ov 1
tn c3f06a20 ver 45 range 0x8000-0x9000 ov 1
tn c3f06280 ver 60 range 0x7000-0x8000 ov 1
tn c3f06260 ver 59 range 0x6000-0x7000 ov 1
tn c3f06240 ver 58 range 0x5000-0x6000 ov 1
tn c3f06220 ver 57 range 0x4000-0x5000 ov 1
tn c3f06200 ver 56 range 0x3000-0x4000 ov 1
tn c3f06300 ver 5 range 0x2000-0x3000 ov 1
tn c3f062e0 ver 4 range 0x1000-0x2000 ov 1
tn c3f062a0 ver 2 range 0x0-0x1a000 ov 0
Add c3f062c0 (v 3, 0x1a000-0x1a001, ov 0) to fragtree
Add c3f062a0 (v 2, 0x0-0x1a000, ov 0) to fragtree
Add c3f062e0 (v 4, 0x1000-0x2000, ov 1) to fragtree
Add c3f06300 (v 5, 0x2000-0x3000, ov 1) to fragtree
Add c3f06320 (v 27, 0x18000-0x19000, ov 1) to fragtree
Add c3f06340 (v 28, 0x19000-0x197a7, ov 1) to fragtree
Add c3f06360 (v 32, 0x12000-0x13000, ov 1) to fragtree
Add c3f06380 (v 33, 0x13000-0x14000, ov 1) to fragtree
Add c3f063a0 (v 34, 0x14000-0x15000, ov 1) to fragtree
Add c3f063c0 (v 35, 0x15000-0x15ec4, ov 1) to fragtree
Add c3f069a0 (v 36, 0x15ec4-0x16000, ov 1) to fragtree
Add c3f069c0 (v 37, 0x16000-0x17000, ov 1) to fragtree
Add c3f069e0 (v 38, 0x17000-0x18000, ov 1) to fragtree
Add c3f06a00 (v 39, 0x18000-0x1834c, ov 1) to fragtree
Add c3f06a20 (v 45, 0x8000-0x9000, ov 1) to fragtree
Add c3f06a40 (v 46, 0x9000-0xa000, ov 1) to fragtree
Add c3f06a60 (v 47, 0xa000-0xb000, ov 1) to fragtree
Add c3f06a80 (v 48, 0xb000-0xc000, ov 1) to fragtree
Add c3f06aa0 (v 49, 0xc000-0xd000, ov 1) to fragtree
Add c3f06ac0 (v 50, 0xd000-0xe000, ov 1) to fragtree
Add c3f06ae0 (v 51, 0xe000-0xf000, ov 1) to fragtree
Add c3f06b00 (v 52, 0xf000-0x10000, ov 1) to fragtree
Add c3f06b20 (v 53, 0x10000-0x11000, ov 1) to fragtree
Add c3f06b40 (v 54, 0x11000-0x12000, ov 1) to fragtree
Add c3f061e0 (v 55, 0x12000-0x12751, ov 1) to fragtree
Add c3f06200 (v 56, 0x3000-0x4000, ov 1) to fragtree
Add c3f06220 (v 57, 0x4000-0x5000, ov 1) to fragtree
Add c3f06240 (v 58, 0x5000-0x6000, ov 1) to fragtree
Add c3f06260 (v 59, 0x6000-0x7000, ov 1) to fragtree
Add c3f06280 (v 60, 0x7000-0x8000, ov 1) to fragtree

[root@Linux /tmp]#
[root@Linux /tmp]#ls -l /mnt/mtd6
tn c3f065e0 ver 3 range 0x1a000-0x1a001 ov 0
tn c3f06560 ver 28 range 0x19000-0x197a7 ov 1
tn c3f06580 ver 27 range 0x18000-0x19000 ov 1
tn c3f06820 ver 39 range 0x18000-0x1834c ov 1
tn c3f06840 ver 38 range 0x17000-0x18000 ov 1
tn c3f06860 ver 37 range 0x16000-0x17000 ov 1
tn c3f06880 ver 36 range 0x15ec4-0x16000 ov 1
tn c3f06280 ver 35 range 0x15000-0x15ec4 ov 1
tn c3f06260 ver 34 range 0x14000-0x15000 ov 1
tn c3f06240 ver 33 range 0x13000-0x14000 ov 1
tn c3f06220 ver 32 range 0x12000-0x13000 ov 1
tn c3f066c0 ver 55 range 0x12000-0x12751 ov 1
tn c3f066e0 ver 54 range 0x11000-0x12000 ov 1
tn c3f06700 ver 53 range 0x10000-0x11000 ov 1
tn c3f06720 ver 52 range 0xf000-0x10000 ov 1
tn c3f06740 ver 51 range 0xe000-0xf000 ov 1
tn c3f06760 ver 50 range 0xd000-0xe000 ov 1
tn c3f06780 ver 49 range 0xc000-0xd000 ov 1
tn c3f067a0 ver 48 range 0xb000-0xc000 ov 1
tn c3f067c0 ver 47 range 0xa000-0xb000 ov 1
tn c3f067e0 ver 46 range 0x9000-0xa000 ov 1
tn c3f06800 ver 45 range 0x8000-0x9000 ov 1
tn c3f06620 ver 60 range 0x7000-0x8000 ov 1
tn c3f06640 ver 59 range 0x6000-0x7000 ov 1
tn c3f06660 ver 58 range 0x5000-0x6000 ov 1
tn c3f06680 ver 57 range 0x4000-0x5000 ov 1
tn c3f066a0 ver 56 range 0x3000-0x4000 ov 1
tn c3f065a0 ver 5 range 0x2000-0x3000 ov 1
tn c3f065c0 ver 4 range 0x1000-0x2000 ov 1
tn c3f06600 ver 2 range 0x0-0x1a000 ov 0
Add c3f065e0 (v 3, 0x1a000-0x1a001, ov 0) to fragtree
Add c3f06600 (v 2, 0x0-0x1a000, ov 0) to fragtree
Add c3f065c0 (v 4, 0x1000-0x2000, ov 1) to fragtree
Add c3f065a0 (v 5, 0x2000-0x3000, ov 1) to fragtree
Add c3f06580 (v 27, 0x18000-0x19000, ov 1) to fragtree
Add c3f06560 (v 28, 0x19000-0x197a7, ov 1) to fragtree
Add c3f06220 (v 32, 0x12000-0x13000, ov 1) to fragtree
Add c3f06240 (v 33, 0x13000-0x14000, ov 1) to fragtree
Add c3f06260 (v 34, 0x14000-0x15000, ov 1) to fragtree
Add c3f06280 (v 35, 0x15000-0x15ec4, ov 1) to fragtree
Add c3f06880 (v 36, 0x15ec4-0x16000, ov 1) to fragtree
Add c3f06860 (v 37, 0x16000-0x17000, ov 1) to fragtree
Add c3f06840 (v 38, 0x17000-0x18000, ov 1) to fragtree
Add c3f06820 (v 39, 0x18000-0x1834c, ov 1) to fragtree
Add c3f06800 (v 45, 0x8000-0x9000, ov 1) to fragtree
Add c3f067e0 (v 46, 0x9000-0xa000, ov 1) to fragtree
Add c3f067c0 (v 47, 0xa000-0xb000, ov 1) to fragtree
Add c3f067a0 (v 48, 0xb000-0xc000, ov 1) to fragtree
Add c3f06780 (v 49, 0xc000-0xd000, ov 1) to fragtree
Add c3f06760 (v 50, 0xd000-0xe000, ov 1) to fragtree
Add c3f06740 (v 51, 0xe000-0xf000, ov 1) to fragtree
Add c3f06720 (v 52, 0xf000-0x10000, ov 1) to fragtree
Add c3f06700 (v 53, 0x10000-0x11000, ov 1) to fragtree
Add c3f066e0 (v 54, 0x11000-0x12000, ov 1) to fragtree
Add c3f066c0 (v 55, 0x12000-0x12751, ov 1) to fragtree
Add c3f066a0 (v 56, 0x3000-0x4000, ov 1) to fragtree
Add c3f06680 (v 57, 0x4000-0x5000, ov 1) to fragtree
Add c3f06660 (v 58, 0x5000-0x6000, ov 1) to fragtree
Add c3f06640 (v 59, 0x6000-0x7000, ov 1) to fragtree
Add c3f06620 (v 60, 0x7000-0x8000, ov 1) to fragtree
-rw-------    1 root     root       106497 Jan  1 00:10 holey_file-854
[root@Linux /tmp]#
[root@Linux /tmp]#cat /mnt/mtd6/holey_file-854 >/dev/null
Data CRC 07d4e438 != calculated CRC 3eb80fd1 for node at 00235718
Data CRC 07d4e438 != calculated CRC 3eb80fd1 for node at 00235718
Data CRC 07d4e438 != calculated CRC 3eb80fd1 for node at 00235718
cat: Read error: Input/output error
