Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 190hwp-0004gH-Ir
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 14:06:35 +0100
From: "John Burch" <jburch@vincisystems.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 2 Apr 2003 08:06:52 -0500
Message-ID: <002101c2f918$bbd9a710$1200a8c0@JOHNB>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Will JFFS2 ever read/write an area of flash memory that is within the
same mtd partition but outside of the jffs2 image (as defined -p switch
of mkfs.jffs2)?  In other words, if the jffs2 image spans 0x0 - 0x120000
and it lies within an mtd partition that spans 0x0 - 0x140000, will the
last 128k, spanning from 0x120000 - 0x140000, ever be accessed in any
way by jffs2?  Would that 128k area be as safe/non-volatile there as in
a separate partition?
=20
Thanks,
John
=20
