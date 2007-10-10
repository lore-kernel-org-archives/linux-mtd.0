Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IfhxO-0004yt-HT
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 21:15:05 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: mtd support for large NAND
Date: Thu, 11 Oct 2007 09:11:58 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710110911.58596.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Last I looked (2.6.23), mtd_info is limited by a u32 size field to 4Gbytes of 
flash. That's no longer very large and is limiting some applications.

Is anyone working on this?

-- Charles
