Received: from skyhigh.actrix.co.nz ([203.96.16.175])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAcOx-00088R-30
	for linux-mtd@lists.infradead.org; Sat, 18 Feb 2006 19:26:12 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Russ Dill" <russ.dill@gmail.com>
Date: Sun, 19 Feb 2006 13:29:00 +1300
References: <43EB96DC.3030900@eptar.com>
	<1140253826.2480.651.camel@localhost.localdomain>
	<f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
In-Reply-To: <f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602191329.00413.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 19 February 2006 07:11, Russ Dill wrote:
> > Some words about Reed Solomon.
> >
> > Reed Solomon needs hardware support for performance reasons. Efficient
> > usage of Reed Solomon requires a different Data / RS-code layout:
>
> At what level is hardware support required? I'm involved in the design
> of a new system with a 466Mhz 80200. Should fpga considerations be
> mode for ecc correction? What sort of logic would be best to put in
> the fpga?

If you have NAND going past or through the FPGA then thinking about RS or ECC 
is a GoodIdea.

ECC is pretty expensive (yaffs_ecc.c is a bit faster than nand_ecc.c, but 
still requires quite a bit of computation). From what I've heard, RS is a lot 
more expensive.

I have not yet looked at RS yet, but I "pencil designed" a fast and simple ECC 
scheme that needs approx 22 flipflops + some other gates a while ago. This 
mechanism is used pretty much as follows:

1) Clear flipflops.
2) Transfer data
3) Read calculated ECC out of flipflops.

So the actual correction is still done in software, but the expensive part - 
the calculation - is done in hw. This gets you most of the way there with 
limited hw costs.

I hunch that you could do something similar for RS.

-- CHarles
