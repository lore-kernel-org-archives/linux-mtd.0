Received: from 205-158-62-67.outblaze.com ([205.158.62.67]
	helo=spf13.us4.outblaze.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Vd8k-0000m4-Bh
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 21:14:42 +0100
Received: from 205-158-62-68.outblaze.com (205-158-62-68.outblaze.com
	[205.158.62.68])
	by spf13.us4.outblaze.com (Postfix) with QMQP id 46F541866623
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 20:14:30 +0000 (GMT)
Message-ID: <20030626201522.9222.qmail@indiainfo.com>
Content-Disposition: inline
MIME-Version: 1.0
From: "Madhav Kandhikonda" <madhavonline@indiainfo.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 27 Jun 2003 01:45:20 +0530
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: May day, May day; DoC2000 with Flash How-to!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello2all,

I am a new member to this list. I am in deep trouble and am 
seeking your suggestions/help. My problem is:-

DoC-2000 (96 MB) & Toshiba Flash (96 MB) How-To 
***********************************************

I have these devices on a VIA C3 powered 533 MHz ENDAT board. 
To my horror, this board has only ONE IDE port. 

My objectives are to perform these tasks:-

a) DoC2000 as Boot device
b) Flash as Storage device

Here are my problems for which am looking suggestions:-

Till now I have put these efforts
*********************************

a) Unplugged Flash from the IDE port, and connected
   a Hard Disk to that IDE Port with CD ROM drive. 
b) Tried to install Linux on DoC2000, ended in errors
d) Since I don't have additional board, I have no clue
   how to install Linux on Flash Chip
3) Before that, I need to install Linux on DoC2000

I am in total mess, I lost 1 full week in this process

Installation Environment
************************

a) Red Hat Linux 7.2 & 7.3
b) Kernels 2.4.18-3; 2.4.18-27.8.0
c) Doc2000 driver version 5.1.4
d) Boot Loader LILO version 22.5.3-1; 22.5.4
e) gcc version 2.96-110 

What am I looking from you
**************************

==> How to make DoC2000 as Boot device
==> How to make Flash device as Storage device
==> EXT3 or JFFS2 for Flash File system? 
==> How to use GRUB instead of troublesome LILO

**By using only ONE IDE port for these 2 devices**

I have tried very hard with all combinations of 
OS & Kernel, all in vain! I would be grateful, if 
one of you could expain in steps. I have just 
ONE day & ONE night left:(:( 

Lastly, I have read your etiquette to go through 
the archives to search for my problem. I don't have
enough time, hope you understand; Thank You:)


Regards,

Madhav
-- 
______________________________________________
http://www.indiainfo.com
Now with POP3/SMTP access for only US$14.95/yr

Powered by Outblaze
