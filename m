Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U8et-0003GY-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 15:52:55 +0000
Received: from hhlstryder ([10.70.0.100])
	by hermes.mvista.com (8.11.0/8.11.0) with SMTP id g0PG2MB01410
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 08:02:22 -0800
Reply-To: <sikenaga@mvista.com>
From: "Scott Ikenaga" <sikenaga@mvista.com>
To: <linux-mtd@lists.infradead.org>
Subject: No data nodes found...
Date: Fri, 25 Jan 2002 10:03:58 -0600
Message-ID: <FFEBJPOLADLDEDEKEOGFGEKACIAA.sikenaga@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Running Linux on MIPS based custom board.

We have 4MB AMD flash and using MTD driver(/drivers/mtd/physmem.c) 
for creating the partition.

The flash is directly mapped with starting address at
0xbfc000000 and is of size 0x400000 bytes.

The flash partition is mounted as a jffs2 partition.
When we try to remove some files from the filesystem which is
mounted as a root filesystem, it occasionally gives the following
warning:

  jffs2_read_inode(): No data nodes found for inode #209

What are possible causes of that gives this warning?

Thanks.

Scott
