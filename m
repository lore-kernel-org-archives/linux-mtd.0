Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvJ2j-0005rO-JD
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 15:16:21 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J1J00EQR9IYQVD0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 15:16:10 -0400 (EDT)
Date: Tue, 27 Jun 2006 15:16:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-reply-to: <1151433983.6394.230.camel@pmac.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@pentafluge.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jun 2006, David Woodhouse wrote:

> On Tue, 2006-06-27 at 14:38 -0400, Nicolas Pitre wrote:
> > OK, but I think this should all be done within cfi_udelay().  Or maybe 
> > not since cfi_udelay() is used by other chip drivers.  
> 
> I'm not sure I follow that argument. cfi_udelay() is used in basically
> the same circumstances by other chip drivers, so why not do it there
> instead of open-coding it?

The code simply ends up being simpler.  With my patch it looks like:

        /* set our timeout to 8 times the expected delay */
        timeo = chip_op_time * 8;
	[...]
                /* OK Still waiting. Drop the lock, wait a while and retry. */
                spin_unlock(chip->mutex);
                if (chip_op_time/2 >= 1000000/HZ) {
                        /*
                         * Half of the normal delay still remaining
                         * can be performed with a sleeping delay instead
                         * of busy waiting.
                         */
                        msleep(chip_op_time/2000);
                        timeo -= chip_op_time/2;
                        chip_op_time -= chip_op_time/2;
                } else {
                        udelay(1);
                        cond_resched();
                        timeo--;
                }
                spin_lock(chip->mutex);

I think trying to fit cfi_udelay() here would add more complexity than 
it intend to prevent since the condition needed to update the delay 
variables will still have to remain out of cfi_udelay() anyway.


Nicolas
