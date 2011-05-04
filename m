Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHl9I-0000BH-5u
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 23:06:29 +0000
Received: by wyb28 with SMTP id 28so1571469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 16:06:26 -0700 (PDT)
Message-ID: <4DC1DBEE.1020407@gmail.com>
Date: Thu, 05 May 2011 01:06:22 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: jffs2 not working on SST39VF2301
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

i am posting from some days for some mysterious issues using jffs2.

After mounting a mkfs.jffs2 created image, i am getting several 
different warnings, bad CRC, bad totlen, I/O errors etc etc ..

I finally find out an old post to this list:

http://answerpot.com/showthread.php?1156495-mkfs.jffs2%3A+JFFS2+and+minimal+erase+block+size 


Issue seems to be that mkfs.jffs2 don't allows 4KB erase size, as the 
flash chip have, and don't work reliable if the erase size don't match 
the mtd-detected erase size.

So i think if i have no chance to use jffs2 fs properly with this flash 
chip.
Since the issue is known, is there any official/unofficial patch around ?
Could UBIFS work with 4KiB erase size ?

many thanks,
angelo
