Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1Pob-0003Yl-9d
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 09:06:06 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050216133753.GD16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
	<20050216133753.GD16239@synertronixx3>
Content-Type: text/plain
Date: Wed, 16 Feb 2005 15:05:56 +0100
Message-Id: <1108562757.24721.103.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops vanilla 2.6.10
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-16 at 14:37 +0100, Konstantin Kletschke wrote:
> Am 2005-02-16 13:44 +0100 schrieb Konstantin Kletschke:
> > Am 2005-02-16 13:24 +0100 schrieb Thomas Gleixner:
> > 
> > > Can you verify, that this happens with MTD CVS code too ?
> > 
> > I linked drivers/mtd and fs/jffs2 into 2.6.10:
> > 
> >   LD      fs/built-in.o
> >   drivers/mtd/Makefile:11: /Makefile.inc: No such file or directory
> 
> Stupid me, patchin.sh :)

:)

Please turn on JFFS2 debuglevel 1 and use a serial console for logging.

Boot with nfsroot and do

# cat /dev/mtd3 >image.bin

Then try to mount:

# echo 9 >/proc/sys/kernel/printk
# mount /dev/mtd3

Send me the log and the binary image.

I guess you create a jffs2 image with mkfs.jffs2. How do you program it
to the FLASH ? Please send me the original image too.

tglx
