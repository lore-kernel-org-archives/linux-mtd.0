Date: Mon, 22 Feb 2010 22:53:04 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 13/15] MTD: add few workarounds to nand system for
	SmartMedia/xD chips.
In-Reply-To: <1266874402.4971.9.camel@maxim-laptop>
Message-ID: <alpine.LFD.2.00.1002222235560.4136@localhost.localdomain>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
	<1266863982-5258-14-git-send-email-maximlevitsky@gmail.com>
	<alpine.LFD.2.00.1002222223090.4136@localhost.localdomain>
	<1266874402.4971.9.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Alex Dubov <oakad@yahoo.com>, Vitaly Wool <vitalywool@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	stanley.miao@windriver.com, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 Feb 2010, Maxim Levitsky wrote:

> On Mon, 2010-02-22 at 22:25 +0100, Thomas Gleixner wrote: 
> > On Mon, 22 Feb 2010, Maxim Levitsky wrote:
> > 
> > > * Add an option NAND_SMARTMEDIA that can be set by nand driver
> > >  If set, it will cause separate ID table to be used, which includes
> > >  mask rom devices and new xD cards
> > 
> > Why that option ? We can just extend the existing ids table and be
> > done. No extra magic needed.
> >  
> 
> Two reasons.
> 
> First of all several xD chips (I belive the Type M) have exactly same
> IDs like normal nand chips. However they don't report capabilities about
> pagesize, blocksize, etc.

You mean that crap ?

+       /* xD only */
+       {"xD 512MiB 3,3V",              0xDC, 512, 512, 0x4000, XD_TYPEM},
+       {"xD 1GiB 3,3V",                0xD3, 512, 1024, 0x4000, XD_TYPEM},
+       {"xD 2GiB 3,3V",                0xD5, 512, 2048, 0x4000, XD_TYPEM},

Oh well, that's a perfect example of designed by comittee shit.
 
They abuse the 2k chips IDs and define crappy sizes just to fit the
stupid spec.

> I am confident that these cards have an internal FTL and controller, and
> just 'emulate' that nand interface.

Either that or the adapter translates the 512B commands to 2K
commands. I bet on the latter. AFAIK are xD cards just as stupid as
SmartMedia ones, i.e. bare NAND chips in a flat plastic housing with
gold contacts.

> Also, my card  reports write protect, although, xD cards don't have any
> 'switch' to make them protected.

Neither have SmartMedia Cards nor bare NAND chips. WP is a pin on the
interface which is controlled by the adapter hardware.

> Even if there were readonly ROM xD cards (the odds of this are virtually
> zero), these won't just expose this in WP bit.

Hmm, I wonder whether that horror has the WP bit inverted.

Thanks,

	tglx
