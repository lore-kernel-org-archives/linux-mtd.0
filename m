Received: from smtp104.sbc.mail.gq1.yahoo.com ([67.195.15.63])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKEwn-00020Q-7H
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 17:10:52 +0000
From: David Brownell <david-b@pacbell.net>
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
Date: Fri, 26 Jun 2009 10:10:41 -0700
References: <200906252128.08460.david-b@pacbell.net>
	<200906252256.16902.david-b@pacbell.net>
	<ce9ab5790906260422q136ed6e1p41593ece4b5fe319@mail.gmail.com>
In-Reply-To: <ce9ab5790906260422q136ed6e1p41593ece4b5fe319@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906261010.42073.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 26 June 2009, vimal singh wrote:
> The problem is that HW ECC engine in BCH mode dose not provide any
> possible configuration where we can keep ECC bytes in main area
> itself. OOB + ECC data has to be in only spare area.

Healthy.  I disike that "infix OOB" myself.  It is however
a standard ECC mode in the NAND framework.  :(

So you're asking about how to map hardware-specific details
to the NAND framework?  That wasn't clear.


> Would it not be the good idea to perform read/write for full (2112 bytes) page?

I'm not sure I can answer that without reading up on that
particular NAND ECC engine.

Recall however that the NAND framework will think in terms
of 2KB reads, with OOB data on the side.  There will be
separate reads for 2K and then 64 bytes.


> And enable HW_ECC before read/write and then call for ecc.calculate or
> ecc.correct accordingly. Rest all things can be taken care by
> underlying controller driver.

Those sentences seem to elide critical parts of the process.
Like the details of OOB and ECC handling, which seem to be
what you're not sure of...
