Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZyI7-0007aN-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 19:33:47 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H04006C4M7GUI@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 31 Jul 2002 20:33:17 +0200 (MEST)
Date: Wed, 31 Jul 2002 20:33:52 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: do i have to "eraseall" first?
In-reply-to: <10399.1028120646@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>, ?? <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <0H04006C5M7GUI@smtp-out.bhp.t-online.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
 <6562.1028118221@redhat.com> <10399.1028120646@redhat.com>
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

On Wednesday, 31. July 2002 15:04, David Woodhouse wrote:
> kevin@gv.com.tw said:
> >  now it report many "magic bitmask not found" do i have to do
> > something like "eraseall /dev/mtdblock1" before "cp test.img /dev/
> > mtdblock1"?
>
> Yes. eraseall /dev/mtd1. I don't remember how you are supposed to write the
> images so the ECC is correct. Thomas?
cp test.img /dev/mtdblock1 should write ecc correct, if it's configured 
correctly. See 
http://www.linux-mtd.infradead.org/tech/nand.html

But eraseall does not set the block is erased and "jffs2 formatted" info in 
the OOB area, which leads to "magic bitmask not found".

We decided some time ago, that erase, invoked from the shell, _CANNOT_ do 
this on it's own, because it will not know, which filesystem is going to be 
mounted.

The information is set, when erase is controlled by jffs2.

The only safe way to do it, is 
cd yourstuff
cp -r * /mnt/bla

or you tell your bootloader to do it.

-- 
Thomas
___________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
