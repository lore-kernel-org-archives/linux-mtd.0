Date: Fri, 23 Nov 2007 10:10:53 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Add P3x support with CFI 1.5
In-Reply-To: <1195810580.25590.25.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0711231001530.27937@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711221841320.22964@pentafluge.infradead.org>
	<1195807919.25590.23.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0711230926210.26663@pentafluge.infradead.org>
	<1195810580.25590.25.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 
> > Signed-off-by: Alexey Korolev <akorolev at infradead.org>
> > diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> > --- a/drivers/mtd/chips/cfi_cmdset_0001.c       2007-08-10 01:28:15.000000000 +0400
> > +++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2007-08-15 15:27:52.000000000 +0400
> > @@ -276,7 +276,7 @@
> >                 return NULL;
> >  
> >         if (extp->MajorVersion != '1' ||
> > -           (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
> > +           (extp->MinorVersion < '0' || extp->MinorVersion > '5')) {
> >                 printk(KERN_ERR "  Unknown Intel/Sharp Extended Query "
> >                        "version %c.%c.\n",  extp->MajorVersion,
> >                        extp->MinorVersion);
> 
> It's whitespace-damaged, and your email address in the Signed-off-by is
> broken. I corrected both and committed.
>
Thank you so much for commit. I verified the patch before sending to you it was ok. I will find why the patch got damaged to prevent the same issues in future. Sorry for damaged patch.
