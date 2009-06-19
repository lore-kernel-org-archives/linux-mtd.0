Received: from smtp116.sbc.mail.sp1.yahoo.com ([69.147.64.89])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MHTVl-00034R-Sf
	for linux-mtd@lists.infradead.org; Fri, 19 Jun 2009 02:07:32 +0000
From: David Brownell <david-b@pacbell.net>
To: davinci-linux-open-source@linux.davincidsp.com,
	Troy Kisky <troy.kisky@boundarydevices.com>,
	"Paulraj, Sandeep" <s-paulraj@ti.com>
Subject: Re: [PATCH v2 3/3] Add 4-bit ECC support for large page NAND chips
	on	Davinci
Date: Thu, 18 Jun 2009 19:07:00 -0700
References: <1245183812-11500-1-git-send-email-s-paulraj@ti.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D57B62E2E@dlee01.ent.ti.com>
	<4A3AB748.8080901@boundarydevices.com>
In-Reply-To: <4A3AB748.8080901@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906181907.00408.david-b@pacbell.net>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 June 2009, Troy Kisky wrote:
> > To answer your question, yes it can be at the end but I do not
> > see any reason why it has to be at the end 
> > Any reason why you insist that it should be at the end.
> 
> Well, for one, it is nice to have oobfree contiguous. But mainly, I hope
> to eventually use a default layout which will have the oob data at the
> end when 0 holds the badblock marker.

Also, I thought the agreement from previous discussions was to
put it at the end, keeping a contiguous oobfree area ... which
is why the OpenOCD [1] DaVinci NAND driver puts it at the end in
the standard HWECC4 mode (not HWECC4_INFIX):

 - with 2K pages ... ECC in bytes 24..63 inclusive.
 - with 4K pages ... ECC in bytes 48..127 inclusive.

Now, the 0.2.0 release for that hasn't frozen yet, but the idea
was to have it match what Linux does.

So if the plans for Linux change, make sure I know so I can submit
a patch ... though I'd rather see the previous agreement kept.

- Dave

[1] http://openocd.berlios.de/doc/html/index.html
 
