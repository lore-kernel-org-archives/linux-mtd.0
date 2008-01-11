Received: from smtp107.biz.mail.re2.yahoo.com ([206.190.52.176])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDKEE-0005cv-IB
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 13:47:30 +0000
From: "Zhong Li" <zql@glomationinc.com>
To: <linux-mtd@lists.infradead.org>
Subject: MTD Make select_chip optional?
Date: Fri, 11 Jan 2008 08:47:13 -0500
Message-ID: <F57D96A984C7417F88EC7A545CE40B46@Saturn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the NAND chip capacity grows it seems designs with multiple chips become
less common than single chip.  Looking at the nand_base.c it seems the
select_chip gets called a lot.  Wouldn't it make significant performance
increase if the select_chip call is made optional only for hardware design
with multiple chips?

zl
