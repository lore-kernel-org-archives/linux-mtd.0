Received: from anchor-post-37.mail.demon.net ([194.217.242.87])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AE9yc-0006ek-Sw
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 16:12:18 +0000
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-37.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1AE9xU-000IA6-0b
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2003 16:11:08 +0000
From: "" <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 27 Oct 2003 15:45:28 -0000
MIME-Version: 1.0
Message-ID: <3F9D3D98.6453.14E703@localhost>
Content-description: Mail message body
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: SmartMedia FAT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would like to be able to access FAT partitions on a SMC via Linux. Curently the 
hardare loads its' configuration and boots the hardware from files on a FAT partition. 
The hardware itself has no hardware flash translation layer. The SMC has been 
created on a USB device which contains a flash translation layer conforming to the 
SFFDC standard. After this a JFFS2 root is mounted. It would be nice if I could 
change the hardware and boot files from Linux but I have been unable to find any 
reliable way of accessing the FAT filesystem.

As far as I understand, from the information I have read, I would need to create  a 
block driver which contained a SSFDC compatible translation layer ? In the nand 
FAQ it mentions SmartMedia FAT. I have been unable to find how this is 
implemented. Has anyone implemented this yet ?

I would like to know if my assumptions are correct. If so I guess there are many ways 
this could be achieved. 

1. Wrirte my on block driver ?
2. Bolt on some bits to mtdblock ?
3. As I don't do this all the time write a user app to update via /dev/mtd

All comments welcome.


Many Thanks

Simon.__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
