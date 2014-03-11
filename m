Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNLG8-0002GN-HA
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 11:54:13 +0000
Date: Tue, 11 Mar 2014 12:53:47 +0100
From: Philippe De Muyter <phdm@macqel.be>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: Kconfig: give the CFI command set version in
 prompt and help
Message-ID: <20140311115347.GA20584@frolo.macqel>
References: <1394204641-23453-1-git-send-email-phdm@macqel.be>
 <20140311102738.GB18811@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140311102738.GB18811@lee--X1>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 11, 2014 at 10:27:38AM +0000, Lee Jones wrote:
> > Enhances the help for the CFI command set choices.
> > 
> > Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> > ---
> >  drivers/mtd/chips/Kconfig |   16 ++++++++--------
> >  1 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> > index e4696b3..9f02c28 100644
> > --- a/drivers/mtd/chips/Kconfig
> > +++ b/drivers/mtd/chips/Kconfig
> > @@ -169,33 +169,33 @@ config MTD_OTP
> >  	  in the programming of OTP bits will waste them.
> >  
> >  config MTD_CFI_INTELEXT
> > -	tristate "Support for Intel/Sharp flash chips"
> > +	tristate "Support for CFI command set 0001 (Intel/Sharp chips)"
> 
> tristate "Support for Intel/Sharp flash chips (CFI Command Set 0001)"
> 
> >  	depends on MTD_GEN_PROBE
> >  	select MTD_CFI_UTIL
> >  	help
> >  	  The Common Flash Interface defines a number of different command
> >  	  sets which a CFI-compliant chip may claim to implement. This code
> > -	  provides support for one of those command sets, used on Intel
> > -	  StrataFlash and other parts.
> > +	  provides support for command set 0001, used on Intel StrataFlash
> > +	  and other parts.
> >  
> >  config MTD_CFI_AMDSTD
> > -	tristate "Support for AMD/Fujitsu/Spansion flash chips"
> > +	tristate "Support for CFI command set 0002 (AMD/Fujitsu/Spansion chips)"
> 
> tristate "Support for AMD/Fujitsu/Spansion flash chips (CFI Command Set 0002)"
> 
> Etc ... read better for me.

What's important here is the command set version, not the names of some
old flash chips producers.  Some have stopped producing flash chips
or have sold or renamed their flash chips divisions.

And on a 80 columns screen, the command set version would fall out of the
screen in menuconfig.

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
