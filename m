Received: from moutng.kundenserver.de ([212.227.126.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuN6K-00055t-F8
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 13:28:05 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 3 Jul 2013 15:27:16 +0200
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E46CA@DBDE04.ent.ti.com>
 <1372857987.9767.162.camel@sauron.fi.intel.com>
In-Reply-To: <1372857987.9767.162.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201307031527.17219.arnd@arndb.de>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "tony@atomide.com" <tony@atomide.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 July 2013, Artem Bityutskiy wrote:
> On Wed, 2013-07-03 at 13:16 +0000, Gupta, Pekon wrote:
> > [Pekon]: Yes, I'm not seeing these build issues, as I'm cleanly
> > returning from probe with pr_err(), if the required libraries (/lib/bch.c) 
> > are not build-in the system.
> > -------------------
> > [Patch v4 1/4]: mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC..
> > @@static int omap_nand_probe(struct platform_device *pdev)
> > +	default:
> > +		pr_err("selected ECC scheme not supported or not enabled\n");
> > +		err = -EINVAL;
> > +		goto out_release_mem_region;
> > +	}
> > -------------------
> > However, if you are still seeing this, could you please send me your config?
> 
> I compile tested your patches too, and did not see any issues with my
> omap2_defconfig.


To clarify: I'm getting this error with randconfig on today's linux-next.
I think it only happens with MTD_NAND_ECC_BCH enabled, which is not
the default in omap2_defconfig.

	Arnd
