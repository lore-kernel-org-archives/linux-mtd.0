Received: from rv-out-0910.google.com ([209.85.198.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVkK3-0007Yo-Lh
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 04:45:23 -0400
Received: by rv-out-0910.google.com with SMTP id c24so331674rvf
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Sep 2007 01:45:13 -0700 (PDT)
Message-ID: <8bd0f97a0709130145u474ab017ocf58b004c5d69dc0@mail.gmail.com>
Date: Thu, 13 Sep 2007 04:45:13 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
In-Reply-To: <20070913013702.d446739a.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1188804323.29566.6.camel@roc-laptop>
	<20070913013702.d446739a.akpm@linux-foundation.org>
Cc: bryan.wu@analog.com, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/13/07, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Mon, 03 Sep 2007 15:25:23 +0800 Bryan Wu <bryan.wu@analog.com> wrote:
> > This is the driver for latest Blackfin BF54x nand flash controller
> >
> >  - use nand_chip and mtd_info common nand driver interface
> >  - provide both PIO and dma operation
> >  - compiled with ezkit bf548 configuration
> >  - use hardware 1-bit ECC
> >  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs
> >
> > ...
> >
> > +int hardware_ecc = 0;
>
> scripts/checkpatch.pl, please.

that isnt static so checkpatch.pl wouldnt have caught it ... it should
be static though of course and then checkpatch.pl would have thrown a
static init 0 warning :)
-mike
