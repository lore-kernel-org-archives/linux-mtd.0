Received: from mail-ew0-f218.google.com ([209.85.219.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nbnye-0008Ka-Oj
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 04:33:37 +0000
Received: by ewy10 with SMTP id 10so2664443ewy.31
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 Jan 2010 20:33:31 -0800 (PST)
Subject: Re: ubiformat image verification
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61001311650v136a002v3a8e261e91d4a457@mail.gmail.com>
References: <dbdb2ea61001291118v78722d73gee24345e61e41766@mail.gmail.com>
	<1264796505.21418.3.camel@localhost.localdomain>
	<dbdb2ea61001311517o730595b3j1c32bc8327908f43@mail.gmail.com>
	<dbdb2ea61001311650v136a002v3a8e261e91d4a457@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 01 Feb 2010 06:33:29 +0200
Message-Id: <1264998809.2517.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-31 at 19:50 -0500, twebb wrote:
> >>> Can the image that is written to NAND using ubiformat be read back
> >>> (using nanddump) and compared identically to the original image file?
> >>> I want to somehow verify that the image was written error-free to NAND
> >>> flash.
> >>
> >> It can. But it is simpler to add a --check option to ubiformat and teach
> >> it to read stuff back and verify.
> >>
> >
> > Yes, a --check or --verify option would be nice.  Does it matter
> > whether the underlying NAND flash is erased or not prior to the
> > ubiformat?
> >
> 
> I'm finding that it does matter whether the NAND is erased or not
> first.  If erased, the comparison after read back is successful.  If
> not erased in advance, the comparison fails.  Can you confirm that
> this is accurate?

ubiformat works correctly without any prior erase. It erases everything
itself, you do not need to do this. Erasing is bad because you loose
erase counters.

You cannot verify things by reading back, because ubiformat changes
erase counters, so they are not the same as in input UBI the image.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
