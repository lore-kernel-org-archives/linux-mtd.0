Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQuru-0003iy-GS
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 11:45:36 +0000
Message-ID: <1484048711.26691.51.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/1] UBI: Fix section mismatch
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Date: Tue, 10 Jan 2017 13:45:11 +0200
In-Reply-To: <20170110093705.6310e828@bbrezillon>
References: <20170109181004.195157-1-andriy.shevchenko@linux.intel.com>
 <1483990466.26691.47.camel@linux.intel.com>
 <20170110093705.6310e828@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-01-10 at 09:37 +0100, Boris Brezillon wrote:
> On Mon, 09 Jan 2017 21:34:26 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Mon, 2017-01-09 at 20:10 +0200, Andy Shevchenko wrote:
> > > WARNING: vmlinux.o(.text+0x1f2a80): Section mismatch in reference
> > > from
> > > the variable __param_ops_mtd to the function
> > > .init.text:ubi_mtd_param_parse()
> > > The function __param_ops_mtd() references
> > > the function __init ubi_mtd_param_parse().
> > > This is often because __param_ops_mtd lacks a __init
> > > annotation or the annotation of ubi_mtd_param_parse is wrong.  
> > 
> > Please, discard this. It fixes one and add another.
> 
> Just remove the __initdata specifiers on mtd_devs and mtd_dev_param
> and
> you should be fine.

Yes, I already have this patch.

But I decided to talk to Artem and just talked.

We thought about comment to explain what is going on there and why
section mismatch is false positive, though a bit error prone (since you
have to keep in mind 0000 permissions).

So, one solution here is to unmark them and, what I would add, change
permissions to read-only.

If you are okay with this I will send series.

> 
> > 
> > > 
> > > Cc: Richard Weinberger <richard@nod.at>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/mtd/ubi/build.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > > index 85d54f37e28f..00a46ff61528 100644
> > > --- a/drivers/mtd/ubi/build.c
> > > +++ b/drivers/mtd/ubi/build.c
> > > @@ -1389,7 +1389,7 @@ static int __init bytes_str_to_int(const
> > > char
> > > *str)
> > >   * This function returns zero in case of success and a negative
> > > error
> > > code in
> > >   * case of error.
> > >   */
> > > -static int __init ubi_mtd_param_parse(const char *val, struct
> > > kernel_param *kp)
> > > +static int ubi_mtd_param_parse(const char *val, struct
> > > kernel_param
> > > *kp)
> > >  {
> > >  	int i, len;
> > >  	struct mtd_dev_param *p;  
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
