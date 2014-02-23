Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHVMG-0005Fg-RJ
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 09:28:27 +0000
Date: Sun, 23 Feb 2014 10:27:56 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd/ts5500: Add dependency
Message-ID: <20140223102756.506da111@endymion.delvare>
In-Reply-To: <20140223020119.GA11836@norris-Latitude-E6410>
References: <20140214112824.27b98f1d@endymion.delvare>
 <20140223020119.GA11836@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Sat, 22 Feb 2014 18:01:19 -0800, Brian Norris wrote:
> On Fri, Feb 14, 2014 at 11:28:24AM +0100, Jean Delvare wrote:
> > There is no point in displaying the TS5500-specific driver entries if
> > TS5500 board support itself isn't enabled.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> > ---
> >  drivers/mtd/maps/Kconfig |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- linux-3.14-rc2.orig/drivers/mtd/maps/Kconfig	2014-02-14 11:21:15.116363700 +0100
> > +++ linux-3.14-rc2/drivers/mtd/maps/Kconfig	2014-02-14 11:23:53.286863374 +0100
> > @@ -124,7 +124,7 @@ config MTD_NETSC520
> >  
> >  config MTD_TS5500
> >  	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
> > -	depends on X86
> > +	depends on TS5500 || (X86 && COMPILE_TEST)
> 
> Shouldn't this just be
> 
> 	depends on TS5500 || COMPILE_TEST
> 
> since it's such a simple driver, it can be compiled under any ARCH?

Could be. As I didn't have any other architecture to test on, I decided
to play it safe and assumed the dependency on X86 was there for a
reason. Looking at the code again, you appear to be right, there
doesn't seem to be a need to restrict compilation testing to X86.

I'll send an updated patch, thanks for the suggestion.

> >  	select MTD_JEDECPROBE
> >  	select MTD_CFI_AMDSTD
> >  	help
> > 
> > 

-- 
Jean Delvare
Suse L3 Support
