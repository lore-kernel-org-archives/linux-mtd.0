Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12u1Sl-0003Ch-00
	for mtd-list@infradead.org; Tue, 23 May 2000 00:18:19 +0100
Date: Mon, 22 May 2000 16:14:46 -0700 (PDT)
From: Andre Hedrick <andre@linux-ide.org>
To: Andries Brouwer <aeb@veritas.com>
cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.rutgers.edu,
        mtd@infradead.org
Subject: Re: HDIO_GETGEO vs. BLKGETSIZE
In-Reply-To: <20000522161756.A23047@veritas.com>
Message-ID: <Pine.LNX.4.10.10005221612500.4473-100000@master.linux-ide.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


If we have a superior answer over the "HDIO_GETBIGGEO" kludge, I am up for
change.  I would ask it to stay until we verify that the newest changes
are what we desire........after that.....rip it......

On Mon, 22 May 2000, Andries Brouwer wrote:

> On Mon, May 22, 2000 at 01:06:17PM +0100, David Woodhouse wrote:
> 
> > Is it permitted for a driver to returns CHS values for HDIO_GETGEO which, 
> > when multiplied together, don't match the value returned by BLKGETSIZE?
> 
> Yes - HDIO_GETGEO may contain whatever you want.
> A modern fdisk will use the values for heads and sectors/track
> given by HDIO_GETGEO, but ignore the value for cylinders.
> 
> Indeed, since cylinders is a 16-bit field and the number of cylinders
> can be larger than 65535, the value may be truncated, and is to be
> considered worthless.
> 
> Instead, the number of cylinders is computed as BLKGETSIZE/(H*S).
> (Thus, there is no need for a new ioctl HDIO_GETBIGGEO or so.
> I think the code for it should be deleted from the kernel.)
> 
> Andries
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.rutgers.edu
> Please read the FAQ at http://www.tux.org/lkml/
> 

Andre Hedrick
The Linux ATA/IDE guy



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
