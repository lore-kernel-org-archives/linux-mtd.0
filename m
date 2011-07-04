Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QddyR-00028G-4w
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 07:53:44 +0000
Received: by vws8 with SMTP id 8so4342990vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Jul 2011 00:53:41 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 4 Jul 2011 15:53:41 +0800
Message-ID: <CAOS=UCWrc=Zk3usT=5yLect2kncniuBkDC8eenYj=Byt+7=p5g@mail.gmail.com>
Subject: Cramfs: bad root offset issue
From: Qi Zhang <qzhan2009@gmail.com>
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

Hello:

   I'm usinig mkfs.cramfs to generate a simple filesystem
   # mkdir test
   # cd test
   # touch a
   # cd ..
   # mkfs.cramfs test test.bin

   Then I burn it to a NAND flash partitions
    The nand flash page size is 2k. and my platform is android 2.1
with the kernel version 2.6.29 like.
    During mount I got below information:

    cramfs: bad root offset 262276752
    mount: mounting /dev/mtdblock4 on /mnt failed: Invalid argument

    Any one can help me? thanks!

Regards
Zhang Qi
