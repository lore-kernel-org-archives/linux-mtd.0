Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JyRe1-0001qi-Fo
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 13:12:46 +0000
Message-ID: <4832CE49.1080903@feig.de>
Date: Tue, 20 May 2008 15:12:41 +0200
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to write a jffs2 image to NAND [nandwrite fails !!!!!!!!!]
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

Hello,

I successfully created a jffs2 image with mkfs.jffs2.

If I want to use nadwrite to write this image to the device:

MEMSETTOOBSEL: Inappropriate ioctl for device

I use the latest kernel 2.6.25.3 -> MEMSETTOOBSEL isn?t implemented 
anymore in the kernel !!!!!

What could I do ??????

Thank you very very much !!!!!!!!!!!!!!!!!!!!!!
