Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsOd1-0003Xb-Dd
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 19:37:42 +0100
Subject: Re: FAT vs jFFS2 for NAND.
From: Thomas Gleixner <tglx@linutronix.de>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 20:38:52 +0200
Message-Id: <1150742333.29299.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-19 at 11:31 -0700, Han Chang wrote:
> Thanks! The reason for using FAT on the NAND is when the device has the NAND 
> is connected to a PC via USB, it can appear to be storage device read by the 
> PC user directly.
> 
> Could you provide more details on how to get this SmartMedia Format driver?

Its in the old MTD CVS: 

cvs -d :ext:anoncvs@cvs.infradead.org:/home/cvs co mtd

The driver is in drivers/mtd and probably needs some serious attention.

> Anyone know any other source base which I can leverage to do the job?

Not that I'm aware of.

	tglx
