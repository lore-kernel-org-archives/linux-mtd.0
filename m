Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1PLy-00038D-Et
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 08:36:31 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050216124409.GC16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
	<1108555269.24721.83.camel@tglx.tec.linutronix.de>
	<20050216122015.GB16239@synertronixx3>
	<1108556645.24721.86.camel@tglx.tec.linutronix.de>
	<20050216124409.GC16239@synertronixx3>
Content-Type: text/plain
Date: Wed, 16 Feb 2005 14:36:28 +0100
Message-Id: <1108560988.24721.93.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd liste <linux-mtd@lists.infradead.org>
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

On Wed, 2005-02-16 at 13:44 +0100, Konstantin Kletschke wrote:
> Am 2005-02-16 13:24 +0100 schrieb Thomas Gleixner:
> 
> > Can you verify, that this happens with MTD CVS code too ?
> 
> I linked drivers/mtd and fs/jffs2 into 2.6.10:
> 
>   LD      fs/built-in.o
>   drivers/mtd/Makefile:11: /Makefile.inc: No such file or directory

Please read

http://www.linux-mtd.infradead.org/ Section Installation 

or

mtd-cvsroot/INSTALL

tglx
