Received: from law14-oe33.law14.hotmail.com ([64.4.20.90] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19WDTW-000654-Fe
	for <linux-mtd@lists.infradead.org>; Sat, 28 Jun 2003 12:02:34 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "jffs" <jffs-dev@axis.com>
Date: Thu, 26 Jun 2003 23:24:47 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE33scmwKsUoA000552d3@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: only 0x50000 size partitions are mounted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I have put JFFs2 support in my uCdimm

the erase size shown in /proc/mtd is 0x10000
So I keep a partion atleast 0x50000

1.) Is it right that for a partition to work properly I must keep its size
as a multiple of 0x50000

Anyways I do keep it.

I have found that if a partition is only 0x50000 in size, i can mout it. If
it is 0x100000 or 0x150000 or 0x200000,  I cannot mount it. If I mount it,
the system hangs or gives me lots of Call trace .

Also Somtimes the kernel is curropted which is not even in the boundary of
the partition i want to mount.

What could be the reason?

Help me here.

Vikram
