Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0e1F-0003IY-9J
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 07:36:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Sunil Khandelwal <skhandelwal@neomagic.com>
In-Reply-To: <6.0.1.1.0.20050803093247.0346bf70@mail.neomagic.com>
References: <6.0.1.1.0.20050803093247.0346bf70@mail.neomagic.com>
Content-Type: text/plain
Date: Thu, 04 Aug 2005 13:41:15 +0200
Message-Id: <1123155675.26146.118.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can mtd support 10 bytes ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-08-03 at 09:38 +0530, Sunil Khandelwal wrote:
> Hi
> 
> NAND Flash controller on our ARM based board has a mode where in, it writes 
> 10 bytes of Reed-Solomon code on last 10 Bytes of OOB.

10 bytes RS code for 2048 bytes of data ? 
Does the controller write the bytes automatically ?
Is there a datasheet of this controller available ?

>  On read it can do 
> error correction in the data read before transferring them to buffers. Does 
> existing mtd layer can work with such controllers.

It will not work out of the box, but without further information I can
not even tell you which changes are necessary to fix this.

tglx
