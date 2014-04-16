Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaHRw-0007Hb-9G
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 04:27:54 +0000
Date: Wed, 16 Apr 2014 07:27:27 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] include/common.h: fix build against recent 0.9.33 uClibc
Message-ID: <20140416042727.GB4849@sapphire.tkos.co.il>
References: <f4242477d038f71b8dce112047fae342878ebcf3.1397593003.git.baruch@tkos.co.il>
 <2055220.5Wt3obd1St@vapier>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2055220.5Wt3obd1St@vapier>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Tue, Apr 15, 2014 at 07:09:45PM -0400, Mike Frysinger wrote:
> On Tue 15 Apr 2014 23:16:43 Baruch Siach wrote:
> > An implementation of rpmatch() was backported to the 0.9.33 branch of
> > uClibc. So the uClibc version check introduced in commit 50c9e11f7e
> > (include/common.h: fix build against current uClibc) is not enough. Rename
> > the local rpmatch() implementation to avoid collision.
> > 
> > Cc: Mike Frysinger <vapier@gentoo.org>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  include/common.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/common.h b/include/common.h
> > index 3b1366e927c4..838dc757bdf1 100644
> > --- a/include/common.h
> > +++ b/include/common.h
> > @@ -107,7 +107,8 @@ extern "C" {
> >  #if __UCLIBC_MAJOR__ == 0 && \
> >  		(__UCLIBC_MINOR__ < 9 || \
> >  		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
> > -static inline int rpmatch(const char *resp)
> > +#define rpmatch __rpmatch
> 
> probably want to:
> 	#undef rpmatch

Thanks for reviewing. I'll update and repost.

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
