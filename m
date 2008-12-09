Received: from web58904.mail.re1.yahoo.com ([66.196.100.233])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LA641-0001zK-HY
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 17:08:02 +0000
Date: Tue, 9 Dec 2008 09:07:59 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: Minor Error in UBIFS FAQ
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <69731.17422.qm@web58904.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Could not find FAQ to generate patch.  Did we mean UBIFS images (see below)

How to create an UBIFS image?
Creating UBIFS images might be a little trickier than creating JFFS2 images.
First of all, you have to understand that UBIFS works on top of UBI which works
on top or MTD which basically represents your raw flash. This means, that if
you need to create an image which would be flashed to the raw flash, you should
first create an UBIFS image, than UBI image. In other words, the process has 2
steps.
However, as described here,
UBI has a volume update facility and there is an ubiupdatevol utility
for this. So you may update UBI volumes on your running system as well.
In this case you only need an UBIFS image, and you do not have to make the
UBI image, i.e., the process has only 1 step in this case.
So, there are 2 utilities:
	* mkfs.ubifs which creates UBIFS images;
	* ubinize which creates UBI images out of UBI images.  <==== ERROR  out of UBIFS images


      
