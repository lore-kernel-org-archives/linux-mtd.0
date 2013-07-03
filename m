Received: from mga02.intel.com ([134.134.136.20])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuN1Y-00061c-DS
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 13:23:10 +0000
Message-ID: <1372857987.9767.162.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Wed, 03 Jul 2013 16:26:27 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9E46CA@DBDE04.ent.ti.com>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
 <201307031503.50033.arnd@arndb.de>
 <20980858CB6D3A4BAE95CA194937D5E73E9E46CA@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 Arnd Bergmann <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-07-03 at 13:16 +0000, Gupta, Pekon wrote:
> [Pekon]: Yes, I'm not seeing these build issues, as I'm cleanly
> returning from probe with pr_err(), if the required libraries (/lib/bch.c) 
> are not build-in the system.
> -------------------
> [Patch v4 1/4]: mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC..
> @@static int omap_nand_probe(struct platform_device *pdev)
> +	default:
> +		pr_err("selected ECC scheme not supported or not enabled\n");
> +		err = -EINVAL;
> +		goto out_release_mem_region;
> +	}
> -------------------
> However, if you are still seeing this, could you please send me your config?

I compile tested your patches too, and did not see any issues with my
omap2_defconfig.

-- 
Best Regards,
Artem Bityutskiy
