Received: from web53603.mail.yahoo.com ([206.190.37.36])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E79jD-00073R-TS
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 06:40:36 -0400
Message-ID: <20050822103351.25405.qmail@web53603.mail.yahoo.com>
Date: Mon, 22 Aug 2005 03:33:51 -0700 (PDT)
From: Komal Shah <komal_shah802003@yahoo.com>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <43098E60.7020502@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [omap2420 NOR] mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- "Artem B. Bityuckiy" <dedekind@yandex.ru> wrote:

> 
> Which MTD snapshot do you use? Please, try the latest. If you still
> see 
> JFFS2 bugs, enable JFFS2 debugging, gather its output, and send it.

Please ignore the last uncomplete e-mail reply. I pressed sent button
in-between :-)

Thanx for the reply. Right I don't have access to the board, but I can
give some details.

I use kernel from linux.omap tree : 2.6.13-rc6-omap1. But I can try to
apply latest cvs mtd snapshot.

> 
> And write about how did you create your JFFS2 image, how did you
> flash 
> it? Try to mount empty flash, create files, remount and see if it is
> OK.
> 

command for creating jffs2 image:
#mkfs.jffs2 -v --eraseblock=128KiB -l --root=./rootfs -o
/home/komal/rd-jffs2.bin

mkfs.jffs2 version is 1.45

I have flashed the image from u-boot bootloader. 

e.g #load the image in RAM through tftpboot
    #erase sectors
    #cp from RAM location to FLASH (cp command)

I will try to mount the partition from ramdisk, once I get access to
board and give you the detailed output with debugging enabled.

---Komal Shah
http://www.livejournal.com/users/komal_shah/

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
