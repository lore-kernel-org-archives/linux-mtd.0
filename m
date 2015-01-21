Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDqZP-00054u-To
 for linux-mtd@lists.infradead.org; Wed, 21 Jan 2015 08:23:24 +0000
Received: by mail-pd0-f173.google.com with SMTP id fp1so23542095pdb.4
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 00:23:01 -0800 (PST)
Date: Wed, 21 Jan 2015 00:22:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Message-ID: <20150121082257.GB5273@norris-Latitude-E6410>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <20150117200137.71c1aca0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150117200137.71c1aca0@bbrezillon>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm sorry, I just noticed your reply as I was applying the patch. I can
back it out if we find a real objection.

On Sat, Jan 17, 2015 at 08:01:37PM +0100, Boris Brezillon wrote:
> On Mon, 12 Jan 2015 12:51:29 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > The MTD API reports -EUCLEAN only if the maximum number of bitflips
> > found in any ECC block exceeds a certain threshold. This is done to
> > avoid excessive -EUCLEAN reports to MTD users, which may induce
> > additional scrubbing of data, even when the ECC algorithm in use is
> > perfectly capable of handling the bitflips.
> > 
> > This threshold can be controlled by user-space (via sysfs), to allow
> > users to determine what they are willing to tolerate in their
> > application. But it still helps to have sane defaults.
> > 
> > In recent discussion [1], it was pointed out that our default threshold
> > is equal to the correction strength. That means that we won't actually
> > report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> > are almost too many to handle. It was determined that 3/4 of the
> > correction strength is probably a better default.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 816b5c1fd416..3f24b587304f 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -4171,7 +4171,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  	 * properly set.
> >  	 */
> >  	if (!mtd->bitflip_threshold)
> > -		mtd->bitflip_threshold = mtd->ecc_strength;
> > +		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
> 
> Just sharing my experience with MLC NANDs requiring read-retry: the
> number of reported bitflips often raise ecc_strength value (at least
> with the current read-retry approach).

I did not have fun when testing a few MLC NAND which required read
retry. I ended up recommending that most of our customers move off of it
onto another solution where possible. But yes, I can understand your
issue.

> This patch will definitely make UBI move NAND blocks over and over
> again considering the threshold has been raised and the block is not
> reliable anymore.

Personally, we found that we just needed to lower the
MTD_UBI_WL_THRESHOLD and let UBI move away from blocks with high bitflip
counts. I suppose we essentially treat the block as bad.

> While I like the idea of limiting the threshold to something smaller
> than what's recommended on the datasheet (or reported by ONFI) I wonder
> if it won't make things worst in some cases.

I wouldn't exactly say that there is any threshold recommended on the
datasheet or in ONFI. They simply specify a required correction
strength, with no word about any intermediate handling -- what do they
expect software to do when bitflips exceed the ECC strength? We
immediately lose data. So we need to preemptively move such data.

So I don't think it's a good idea at all to say that
threshold == ecc_strength. That renders your ECC nearly useless w.r.t.
the original design of UBI. UBI intends to use -EUCLEAN as a signal that
high # of bitflips. I would suggest that 23 bitflips on a 24-bit
correction algorithm is a "high # of bitflips." So as I see it, this
patch is just restoring that UBI assumption.

> Regarding the read-retry code, it currently stops retrying reading the
> page once the page has been successfully retrieved (or in other terms
> all bitflips have been fixed). But it might stop to soon, because by
> changing the bit level threshold (in other term retrying one more time)
> it might successfully read the page with less bitflips than the
> previous attempt (these are just supposition, I haven't tested it yet).
> If we can achieve that we could retry until we reach something below
> the bitflips threshold value, and if we fail to find any, just consider
> the lower number of bitflips found during those read-retry operations.

I believe I suggested scenarios like this to some flash vendors when
speaking to reps in person, but they didn't seem to consider that
likely. I think they were implying that there would be only one read
retry mode that gives a reasonable result. I'm not sure if they were
really the experts on that particular topic, though, or if they were
just giving me an answer to make me happy.

Honestly, there's a lot of work that goes into MLC NAND for use by
serious applications. For instance, SSD controller vendors, and even
eMMC makers, use plenty of low-level knowledge that we simply do not
have. From whatever I've gleaned about Toshiba MLC NAND (I don't think
they even try to sell much raw NAND outside of eMMC and SSD solutions),
they actually expose fine-grained voltage threshold controls through
their (non-standard, obviously) command interface, and their clients
likely use this to chart a targeted plan on how to adjust thresholds
over the lifetime of a block, rather than just using a dumb sequential
search like we do.

So anyway, that drifted a little away from the topic at hand. Are you
suggesting that we should not change this default in nand_base, because
of potential issues with highly-unreliable NAND that need read-retry? I
can back out the patch while we finish this discussion, although I'm not
very convinced so far.

Brian
