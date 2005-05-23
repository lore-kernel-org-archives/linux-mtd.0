Received: from zproxy.gmail.com ([64.233.162.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaHrs-0003Jd-RH
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 14:41:37 -0400
Received: by zproxy.gmail.com with SMTP id 8so1636083nzo
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2005 11:41:35 -0700 (PDT)
Message-ID: <999d19fd050523114173e3ceca@mail.gmail.com>
Date: Mon, 23 May 2005 15:41:35 -0300
From: Michel Fidelis <michel.fidelis@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mtd + jffs2 error "No space left on device"
Reply-To: Michel Fidelis <michel.fidelis@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to mount a jffs2 file system on a MTD partition.
My partition (/dev/mtd1) has 768 KB (0xc0000) (3 flash continuous
sectors of 256 KB (0x40000) each one).
I'm thinking the problem is with the -p option in the mkfs.jffs2 command.

The steps I have done are:

1)eraseall /dev/mtd1 (if I use the erase command it just erases the
first sector).
2)mkfs.jffs2 -p 0xc0000 -e 0x40000 -d jffs2dir -o jffs2.img (the image
is created without erros)
3)cp jffs2.img /dev/mtd1 (it executes without erros)
4)mount -t jffs2 /dev/mtdblock1 /mnt (it executes without erros)

However, when I try to create some file on the /mnt file system I
receive the following error: No space left on device.

The df /mnt output  is:

Total 768 KB
free 0 KB
total nodes 0 KB
free nodes 0 KB

I'm working with a Motorola m5272c3 board which has an AMD Am29PL160C
flash memory (2 MB). I'm using Kernel 2.4.x.

Can anybody help me?
