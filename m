Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GMn3-0000fg-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 17:12:57 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H650029F7VJNS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 18:42:56 +0100 (MET)
Date: Mon, 25 Nov 2002 18:40:56 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Nand flash and blob
In-reply-to: <018501c294a8$12311ba0$6401000a@zorak>
To: anidea@earthlink.net, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211251840.56144.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <018501c294a8$12311ba0$6401000a@zorak>
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

On Monday 25 November 2002 18:28, Gabriel Goldstein wrote:
> This is interesting.  I was planning on storing my ramdisk image in the
> nand flash and still having blob expand it to ram.  I can see benefits
> to both ways.  If I store the ramdisk.gz in flash, I will always have a
> good image to boot up to, if I store it directly in nand, I could have
> persistant information much easier.
If youre not going to have a lot of changing environment, there is no real 
reason to use a ramdisk. 

> How do you handle the aspect of all of the dev devices?  Are they part
> of the root file system in ram still?
My root fs is on JFFS2 and the /dev/ directory is on there

> If I wanted to make a JFFS image, how do I take a directory and make a
> file system image that I could load though blob?  Or how else would I
> get it in there?
You mean a JFFS2 image ? Either you boot your Kernel via NFS, mount your FLASH 
with JFFS2 and copy all the stuff you need over there. The other way is you 
build up your root fs in a directory and use mkfs.jffs2, which is in 
mtd/utils, to build a fs-image. Then you still have to modify blob to burn it 
into the flash. Read also http://www.linux-mtd.infradead.org/tech/nand.html

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
