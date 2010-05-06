Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9yCO-0002YL-LL
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 10:20:58 +0000
Subject: Re: [PATCH] UBI: Remaining typos and comments cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4BE28B46.40908@renesas.com>
References: <4BE23A03.1030001@renesas.com> <4BE23A8D.7040106@renesas.com>
	<4BE28B46.40908@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 13:19:37 +0300
Message-ID: <1273141177.3702.227.camel@localhost>
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

On Thu, 2010-05-06 at 18:26 +0900, Shinya Kuribayashi wrote:
> Artem-san,
> 
> On 5/6/2010 12:42 PM, Shinya Kuribayashi wrote:
> > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> > index 016ec13..cd0bf57 100644
> > --- a/drivers/mtd/ubi/io.c
> > +++ b/drivers/mtd/ubi/io.c
> > @@ -64,7 +64,7 @@
> >   * device, e.g., make @ubi->min_io_size = 512 in the example above?
> >   *
> >   * A: because when writing a sub-page, MTD still writes a full 2K page but the
> > - * bytes which are no relevant to the sub-page are 0xFF. So, basically, writing
> > + * bytes which are not relevant to the sub-page are 0xFF. So, basically, writing
> >   * 4x512 sub-pages is 4 times slower than writing one 2KiB NAND page.  Thus, we
> >   * prefer to use sub-pages only for EV and VID headers.
> >   *                                 ^^^^
> 
> Looking at the last line, I think above 'EV' is a typo of 'EC', right?
> I'll incorporate it in the next submission,

Right

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
