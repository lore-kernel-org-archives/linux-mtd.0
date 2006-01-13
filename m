Received: from [213.239.212.131] (helo=mail2.syneticon.net)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExNOK-0003V8-Du
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 11:46:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 9277346ABF
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jan 2006 12:46:35 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 08888-17 for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jan 2006 12:46:25 +0100 (CET)
Received: from [81.173.143.146] (xdsl-81-173-143-146.netcologne.de
	[81.173.143.146]) by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jan 2006 12:46:24 +0100 (CET)
Message-ID: <43C7930F.3030807@wpkg.org>
Date: Fri, 13 Jan 2006 12:46:23 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: how to mount a 256 MB jffs2 image (without using 256 MB of RAM)?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just began to play with jffs2.

I have a small ASUS router which has a 4 MB flash, and 32 MB of RAM. It 
runs linux (http://www.openwrt.org).

4 MB flash is not much for a Linux distribution, but this tiny router 
has also a USB port, so I can connect a USB stick to it.

My original idea was to "format" this 256 MB USB stick with jffs2 to get 
more space - but of course, it's not possible, as it's not really a 
mtd/flash device.

So my second though was to create a ~256 MB jffs2 image on my Linux PC, 
copy it to the USB stick (formatted with ext2/3), and mount this image 
on a router.

I made some test, and unfortunately, it seems that to mount a 256 MB 
jffs image one needs an equal amount of RAM (256):


insmod mtdram total_size=262144 erase_size=256


Are there any alternative ways to mount a jffs2 image, so that it 
doesn't take so much RAM?


-- 
Tomasz Chmielewski
http://wpkg.org
