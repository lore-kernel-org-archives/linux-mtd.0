Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0XnQ-0004UQ-Ir
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 08:11:09 +0000
Message-ID: <483A709A.9070901@feig.de>
Date: Mon, 26 May 2008 10:11:06 +0200
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: --pad option [NAND Flash: Pagesize 0x800; eraseblocksize=0x20000]
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello
I have a huge problem concerning the mtd-tools:

I use makefs.jffs2 to create an image. I mount the Image and write to 
it, add files. Then I umount it and mount it again:
"empty flash at [address] ends at [address]"

This is because:
mkfs.jffs2 or nandwrite uses a --pad option wich fills the image with 0xFF.

If I write to the image via Linux, a page is written completly with 
appended 0x00 !!!!!

So what could I do - I must append 0x00 with the --pad option not 0xFF

Linux isn?t comkptable eith the mtd-utils at the moment....

Thank you for your help
