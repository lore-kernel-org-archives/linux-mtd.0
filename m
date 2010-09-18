Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox19k-0004T7-3L
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 17:24:58 +0000
Received: by bwz19 with SMTP id 19so4991591bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 10:24:55 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: nand: Expand nand_ecc_layout, deprecate ioctl
	ECCGETLAYOUT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1283163647.12995.43.camel@brekeke>
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
	<4C6DD170.1060807@renesas.com>  <4C6E9C23.6060703@broadcom.com>
	<1282646703.24044.162.camel@localhost>  <4C746DE0.7000104@gmail.com>
	<1283163647.12995.43.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Sep 2010 20:24:50 +0300
Message-ID: <1284830690.1721.3.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 13:20 +0300, Artem Bityutskiy wrote:
> On Tue, 2010-08-24 at 18:12 -0700, Brian Norris wrote:
> > My e-mail address has changed, since I am no longer working at Broadcom.
> > I will still be able to track messages to my old account if the MTD mailing
> > list is CC'd.
> 
> Oh, does it mean you will stop loving MTD and we won't see steady flow
> of improvements for you? :-( BTW, I think you have been doing great job
> - MTD subsystem needs love badly!
> 
> > Note that on the same subject (different thread) David suggested our new
> > struct be allocated dynamically:
> 
> Yes, but I agree with your arguments and also think it is ok to keep it
> simple for now. So I'm applying this to my l2 tree, and then it is up to
> dwmw2 to take it or not.
> 
> But I also have some requests about commentaries, so if you can re-send
> another version of this patch, it would be nice. But I take this one for
> now, it is good enough.
>  
> > +/*
> > + * Copies (and truncates, if necessary) data from the larger struct,
> > + * nand_ecclayout, to the smaller, deprecated layout struct,
> > + * nand_ecclayout_user. This is necessary only to suppport the deprecated
> > + * API ioctl ECCGETLAYOUT while allowing all new functionality to use
> > + * nand_ecclayout flexibly (i.e. the struct may change size in new
> > + * releases without requiring major rewrites).
> > + */
> 
> I think a similar comment should exist in linux/mtd/mtd.h. Indeed, that
> file is our API with user-space, and our users will probably look at it,
> and it is nice to document the situation with 'struct
> nand_ecclayout_user' there.
> 
> > +#define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
> > +#define MTD_MAX_ECCPOS_ENTRIES_LARGE	448
> > +#define MTD_MAX_ECCPOS_ENTRIES_OLD	64	/* Previous maximum */
> > +/*
> > + * Correct ECC layout control structure. This replaces old nand_ecclayout
> > + * (mtd-abi.h) that is exported via ECCGETLAYOUT ioctl. It should be expandable
> > + *  in the future simply by the above macros.
> > + */
> 
> I find this comment confusing. First, "Correct ECC" -> "Internal ECC",
> because one could think "Correct ECC structure" means something like
> "structure which describes ECC corrections" or something like that.
> 
> Also, I'd avoid mentioning things like "old nand_ecclayout", because
> with time this will be confusing. Could you please imagine that you are
> an MTD newbie reading the code in 2012 - you have no idea what was
> happening in the past in the ancient 2010. 

Brian,

would you address the small things I noticed in a follow-up patch?
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
