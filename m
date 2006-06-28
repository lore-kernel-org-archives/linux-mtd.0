Date: Wed, 28 Jun 2006 08:48:01 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-Reply-To: <Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
Message-ID: <Pine.LNX.4.56.0606280837520.15141@pentafluge.infradead.org>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, 27 Jun 2006, Nicolas Pitre wrote:

> ... and it also improves system responsiveness too, especially in the 
> case were the loop uses udelay() which is a spin delay as there is more 
> opportunities for rescheduling.  However...
> 
> > If timeout is greater than timer resolution (probably erase operation)
> > We do the following
> > 	sleep for half of operation timeout
> > 	and do in cycle the following
> > 	"Checking the status"
> > 	sleep for timer resolution
> > It adds insignificant CPU overhead but it provides higher resolution 
> > and resolves the issue of low erase speed. (In some cases this 
> > solution saves CPU resources significantly - if we exit before than 
> > erase operation is done we will wait for 1us in cycle for case old 
> > implementation. Due to erase time is very big we will do cycle for 
> > long time.)
> 
> OK, but I think this should all be done within cfi_udelay().  Or maybe 
> not since cfi_udelay() is used by other chip drivers.  So actually I 
> think we should simply not use cfi_udelay() and simply open code those 
> delay choices right within inval_cache_and_wait_for_operation() 
> directly.  
>
> What about this (untested) patch?  It does simplify the code as well.
That is absolutely suitable. a) it shouldn't break the functionality b) it  makes code easier for reading.
Could you please wait some time until I verify changes. I think I'll done it today.

Thanks,
Alexey
