Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 190r90-0007xT-H2
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 23:55:46 +0100
From: "John Burch" <jburch@vincisystems.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 2 Apr 2003 17:56:07 -0500
Message-ID: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: Can mtd partition span multiple devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm wondering if a single mtd partition can span more than one physical
flash device.  For example, if two flash devices span the following
address ranges, 0x0-0x3FFFFF and 0x400000-0x7FFFFF, can an mtd partition
be defined as follows?

Name: spanning_partition
Size: 0x200000
Offset: 0x300000

So this partition would span physical addresses 0x300000 - 0x3FFFFF
(device 1) and 0x400000 - 0x4FFFFF (device 2).


John
