Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tsy3-0001GB-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 17:55:23 +0100
Date: Tue, 24 Sep 2002 09:55:21 -0700
From: Marc Singer <elf@buici.com>
To: Nick Bane <nick@cecomputing.co.uk>
Cc: linux-mtd@lists.infradead.org, yaffs@toby-churchill.org
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Message-ID: <20020924165521.GB2533@buici.com>
References: <200209231220.12682.ayalon@tadlys.com> <20020924014556.6EC8B43F2@tiger.actrix.co.nz> <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz> <007801c2639b$3a4bc4c0$0100a8c0@p450>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007801c2639b$3a4bc4c0$0100a8c0@p450>
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

On Tue, Sep 24, 2002 at 08:23:06AM +0100, Nick Bane wrote:
> The modifications I made to bootldr (CRL bootloader as used in iPaq
> handhelds) were trivial after mkysffsimage was fixed (ask for a copy as the
> CVS one is still badly broken).
> 
> Bootldr copies the data 512+16 bytes at a time into non-broken NAND. The
> kernel is then booted with prior knowledge as to where to find the YAFFS
> data and all is ok.

What is non-broken NAND?

> How this works with DOC I am unclear as I had noticed a while back that
> there was hardware assisted ECC. This might get in the way of YAFFS ECC but
> maybe this can be circumvented.

As far as I can tell, the hardware ECC just makes the DOC faster.
Also, I think that Microsys has released information about how to use
the hardware ECC.
