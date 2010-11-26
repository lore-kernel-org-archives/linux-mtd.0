Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLyWn-0000kT-2z
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 13:39:53 +0000
Received: by pwj8 with SMTP id 8so458959pwj.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 05:39:50 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 26 Nov 2010 22:39:50 +0900
Message-ID: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
Subject: Flashing UBIFS over fastboot
From: Leo Barnes <barnes.leo@gmail.com>
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

Hello!

I am trying to get UBIFS to work on a fastboot-based Android device.
So far, I have managed to create a working UBIFS partition on a
running device using ubiformat/nandwrite, but whenever I try to flash
images with fastboot, the flashing process fails. I assume that this
is because fastboot expects YAFFS2 images (which contain OOB-data)
while what I am trying to flash is UBIFS images (which do not). So my
question:

Has anyone either got fastboot to work directly with UBIFS images, or
is it possible to somehow create UBIFS images that "look like" YAFFS2
images (by creating dummy OOB-data for instance)? As it is, fastboot
obviously misinterprets the images. Or does anyone have any data on
exactly how the UBIFS and YAFFS2 image formats look like? In that case
I might be able to figure out some way of doing it.

Best regards,
//Leo
