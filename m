Received: from law14-oe23.law14.hotmail.com ([64.4.20.80] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Vsy2-0003gW-Ls
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 14:08:42 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Thu, 26 Jun 2003 01:31:10 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE23bdHd2V4MT00030545@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: "Uclinux-Dev@Uclinux.Org" <uclinux-dev@uclinux.org>
Subject: JFFs2 usage questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Now I can mount  using  jffs2.
and my directory does show the contents.
I have a few questions on the usage of JFFs2

1.)  I cannot mkdir into the folder. I mount dev/mtdblock2 on  /mnt.
If I do mkdir ,  the message comes
no space left on device

2.) if I reboot the system /mnt is left as empty.

3.) How can I provide that 1or 2 of my partions are readonly. That is they
are not erased

4.) I want that after booting, one partition is created as Jffs2. ( I can
add the commands in rc) and I can write on it like on do on /var which is
mounted on RAM

Regards
Vikram
