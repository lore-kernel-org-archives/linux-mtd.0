Received: from el-out-1112.google.com ([209.85.162.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4jmJ-0004oe-J3
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 21:15:09 +0000
Received: by el-out-1112.google.com with SMTP id r27so699304ele.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Dec 2007 13:15:02 -0800 (PST)
Message-ID: <79ac09b60712181315y3c913d56o14a8f41efd677fdf@mail.gmail.com>
Date: Tue, 18 Dec 2007 15:15:02 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 on SPI Flash
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
If I choose to have a JFFS2 fs on SPI flash device, what is the
minimum size required?
For example a 16Mbit ST chip has a sector size of 512K bit while the
Atmel 16Mbit (AT45DB..) has a sector size of 128Kbytes.  Is there a
rule of tumb to apply for making th choice?
