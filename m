Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYJNS-000647-SZ
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 15:25:48 +0000
Date: Wed, 7 Dec 2011 17:25:37 +0200
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtdoops: fix the oops_page_used array size
Message-ID: <20111207152537.GA8719@nokia.com>
References: <1322563758-26317-1-git-send-email-roman.tereshonkov@nokia.com>
 <1323006318.9400.52.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323006318.9400.52.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 04, 2011 at 03:44:57PM +0200, Artem Bityutskiy wrote:
> On Tue, 2011-11-29 at 12:49 +0200, Roman Tereshonkov wrote:
> > The array of unsigned long pointed by oops_page_used is allocated
> > by vmalloc which requires the size to be in bytes.
> > 
> > Signed-off-by: Roman Tereshonkov <roman.tereshonkov at nokia.com>
> > ---
> >  drivers/mtd/mtdoops.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> > index 1e2fa62..0782b31 100644
> > --- a/drivers/mtd/mtdoops.c
> > +++ b/drivers/mtd/mtdoops.c
> > @@ -369,7 +369,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
> >  
> >  	/* oops_page_used is a bit field */
> >  	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
> > -			BITS_PER_LONG));
> > +			BITS_PER_LONG) * sizeof(unsigned long));
> 
> But it is already in bytes. I do not understand which problem this patch
> fixes - it looks incorrect to me.

BITS_PER_LONG is equal to 32.
If we want to allocate memory for 32 pages with one bit per page then
32 / BITS_PER_LONG  is equal to 1 byte that is 8 bits.
To fix it we need to multiply the result by sizeof(unsigned long) equal to 4.



Regards
Roman Tereshonkov
> 
> -- 
> Best Regards,
> Artem Bityutskiy
> -------------- next part --------------
> A non-text attachment was scrubbed...
> Name: signature.asc
> Type: application/pgp-signature
> Size: 836 bytes
> Desc: This is a digitally signed message part
> URL: <http://lists.infradead.org/pipermail/linux-mtd/attachments/20111204/a96b926e/attachment.sig>
