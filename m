Received: from esteem.com ([198.65.249.253])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gqPu-0004NQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 18:34:14 +0100
Message-ID: <3D612C1F.55297C10@esteem.com>
Date: Mon, 19 Aug 2002 10:34:23 -0700
From: Conn Clark <clark@esteem.com>
MIME-Version: 1.0
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: How does one mount an existing jffs2 partition so it is writeable?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi All,

	How does one mount an existing jffs2 partition so it is writeable?
After a reboot I can mount my jffs2 and read from it, but not write to it
I can erase it first and mount it then read and write to it , but then I
lose my info on it which defeats the whole reason for having it.


Here is what I am doing.


[/]# MAKEDEV
[/]# mkdir gpig         
[/]# mount /dev/mtdblock3 /gpig
[/]# cd gpig
[/gpig]# ls
kernel_192e_V0.0.03ps
[/gpig]# cp ../bin/MAKEALL .
cp: ../bin/MAKEALL: No such file or directory
[/gpig]# 
[/gpig]# cp ../bin/MAKEDEV .
Write of 68 bytes at 0x00059a28 failed. returned 0, retlen 0
Not marking the space at 0x00059a28 as dirty because the flash driver returned retlen
zero
cp: ./MAKEDEV: Input/output error
[/gpig]# 
 
What step am I missing?


Thanks in advance

	Conn
-- 

*****************************************************************
  If you live at home long enough, your parents will move out.
 (Warning they may try to sell their house out from under you.)
*****************************************************************

Conn Clark
Engineering Stooge				clark@esteem.com
Electronic Systems Technology Inc.		www.esteem.com

Stock Ticker Symbol				ELST

"clark@esteem.com" Copyright 2000 By Electronic Systems Technology
 This email address may be used to communicate to Conn Clark
 provided it is not being used for advertisement purposes, unless
 prior written consent is given. This email address may not be 
 sold under any circumstances. All other rights reserved.
