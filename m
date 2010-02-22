Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjgW2-0007kE-2D
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 22:12:38 +0000
Received: by fxm6 with SMTP id 6so5320700fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 14:12:32 -0800 (PST)
Subject: Re: [PATCH 13/15] MTD: add few workarounds to nand system for
	SmartMedia/xD chips.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.2.00.1002222235560.4136@localhost.localdomain>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
	<1266863982-5258-14-git-send-email-maximlevitsky@gmail.com>
	<alpine.LFD.2.00.1002222223090.4136@localhost.localdomain>
	<1266874402.4971.9.camel@maxim-laptop>
	<alpine.LFD.2.00.1002222235560.4136@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Feb 2010 00:12:29 +0200
Message-ID: <1266876749.4971.15.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2010-02-22 at 22:53 +0100, Thomas Gleixner wrote: 
> On Mon, 22 Feb 2010, Maxim Levitsky wrote:
> 
> > On Mon, 2010-02-22 at 22:25 +0100, Thomas Gleixner wrote: 
> > > On Mon, 22 Feb 2010, Maxim Levitsky wrote:
> > > 
> > > > * Add an option NAND_SMARTMEDIA that can be set by nand driver
> > > >  If set, it will cause separate ID table to be used, which includes
> > > >  mask rom devices and new xD cards
> > > 
> > > Why that option ? We can just extend the existing ids table and be
> > > done. No extra magic needed.
> > >  
> > 
> > Two reasons.
> > 
> > First of all several xD chips (I belive the Type M) have exactly same
> > IDs like normal nand chips. However they don't report capabilities about
> > pagesize, blocksize, etc.

Sure, I didn't meant the #WP line. Sure it is set by the controller.
I mean WP bit in status report.

Best regards,
Maxim Levitsky
