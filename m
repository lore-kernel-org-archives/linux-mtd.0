Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OA0Dt-0006iB-4H
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 12:30:37 +0000
Received: by wwf26 with SMTP id 26so1343428wwf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 May 2010 05:30:34 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 May 2010 14:30:34 +0200
Message-ID: <i2z804f0d21005060530qb2a65906j62e68c9f6f5e90bc@mail.gmail.com>
Subject: <4>mtd->read(x bytes from y) returned ECC error / Node header CRC
	failed / READ error
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After some powercycles I get sometimes messages like this:

uncorrectable error : <3>uncorrectable error : <4>mtd->read(0x3f8
bytes from 0x25d8408) returned ECC error
JFFS2 notice: (220) jffs2_get_inode_nodes: Node header CRC failed at
0x25d8408. {ffe0,ffe0,ffe0ffe0,ffe0ffe0}

I do check a 30MB file wether it contains the original information,
but reading/compare give holes of 2048bytes which gives "0" instead of
its content.

I don't access the jffs-fs with writes, just boot and read some files.

In the next reboot everything is fine again. So what can I do, to prevent this?

Or who can I ask? I am lost.
