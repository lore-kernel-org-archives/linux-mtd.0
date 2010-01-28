Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaX6r-0002XI-RZ
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 16:20:50 +0000
Subject: Re: [PATCHv2 0/7] mtd: Dynamic allocation of device numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
In-Reply-To: <1264695141.1973.148.camel@localhost>
References: <1263337693.3011.14.camel@achroite.uk.solarflarecom.com>
	<1264695141.1973.148.camel@localhost>
Content-Type: text/plain
Date: Thu, 28 Jan 2010 16:20:38 +0000
Message-Id: <1264695638.2783.3.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-01-28 at 18:12 +0200, Artem Bityutskiy wrote:
[...]
> When I apply your patches and compile, I get:
> 
> make[2]: `scripts/unifdef' is up to date.
>   Building modules, stage 2.
> Kernel: arch/x86/boot/bzImage is ready  (#4)
>   MODPOST 150 modules
> ERROR: "idr_get_next" [drivers/mtd/mtd.ko] undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
> 
> Indeed, it is not exported.

This looks like an oversight from when idr_get_next() was introduced.
Is there any reason not to export it?  If not, I'll add that to the
patch series.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
