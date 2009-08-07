Received: from rcsinet11.oracle.com ([148.87.113.123]
	helo=rgminet11.oracle.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZGdu-0002Q2-0U
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 04:01:26 +0000
Date: Thu, 6 Aug 2009 21:00:37 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Paul Mundt <lethal@linux-sh.org>
Subject: Re: mmotm 2009-08-06-00-30 uploaded (mtd)
Message-Id: <20090806210037.a063114a.randy.dunlap@oracle.com>
In-Reply-To: <20090807033448.GA32592@linux-sh.org>
References: <200908060733.n767X6mN023120@imap1.linux-foundation.org>
	<20090806190233.6d4b4e28.randy.dunlap@oracle.com>
	<20090806192513.53f6488b.akpm@linux-foundation.org>
	<20090807033448.GA32592@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Magnus Damm <damm@igel.co.jp>, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Aug 2009 12:34:48 +0900 Paul Mundt wrote:

> On Thu, Aug 06, 2009 at 07:25:13PM -0700, Andrew Morton wrote:
> > On Thu, 6 Aug 2009 19:02:33 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > 
> > > On Thu, 06 Aug 2009 00:33:06 -0700 akpm@linux-foundation.org wrote:
> > > 
> > > > The mm-of-the-moment snapshot 2009-08-06-00-30 has been uploaded to
> > > > 
> > > >    http://userweb.kernel.org/~akpm/mmotm/
> > > > 
> > > > and will soon be available at
> > > > 
> > > >    git://git.zen-sources.org/zen/mmotm.git
> > > > 
> > > > It contains the following patches against 2.6.31-rc5:
> > > 
> > > 
> > > 
> > > drivers/built-in.o: In function `generic_onenand_remove':
> > > generic.c:(.devexit.text+0x1b8e): undefined reference to `del_mtd_partitions'
> > > 
> > > config attached.
> > 
> > Thanks.  It's mtd-make-onenand-genericc-more-generic.patch.
> > 
> Wow, I guess ARM people don't do randconfigs.
> 
> ---
> 
> [PATCH] mtd: onenand: select MTD_PARTITIONS.
> 
> All of the onenand drivers depend on mtd partition support being compiled
> in, so just select it. Fixes up build breakage:
> 
> drivers/built-in.o: In function `generic_onenand_remove':
> generic.c:(.devexit.text+0x80): undefined reference to `del_mtd_partitions'
> 
> Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Ack.  Thanks.

> ---
> 
>  drivers/mtd/onenand/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
> index 2d6b7c1..a38f580 100644
> --- a/drivers/mtd/onenand/Kconfig
> +++ b/drivers/mtd/onenand/Kconfig
> @@ -5,6 +5,7 @@
>  menuconfig MTD_ONENAND
>  	tristate "OneNAND Device Support"
>  	depends on MTD
> +	select MTD_PARTITIONS
>  	help
>  	  This enables support for accessing all type of OneNAND flash
>  	  devices. For further information see
> @@ -65,7 +66,6 @@ config MTD_ONENAND_2X_PROGRAM
>  
>  config MTD_ONENAND_SIM
>  	tristate "OneNAND simulator support"
> -	depends on MTD_PARTITIONS
>  	help
>  	  The simulator may simulate various OneNAND flash chips for the
>  	  OneNAND MTD layer.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
