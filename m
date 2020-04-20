Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0A5C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:41:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3A72078E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iKFi4n0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3A72078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywCPLnukliit0fZa8pI2Vu5g5TDabnHCkZGbNE8DFPk=; b=iKFi4n0u1y9/76
	8Y7csXOKrEqmkfbr1WnCZbdRQQ/uqd02jZY/FoLKhIeGqT7al+yOsxT+yQpoHetg5/izMwNmVUFrX
	Ubk7GHm93BQ6XrM+UUTUHKl4OeRR16TcyuwCq+CYEiN/8svILFaTd0hEMpQYJQLoGPTTd5OCOrR7I
	4RtvrWCnoFAjKkRUFQYyX9w814e6emrJYi2PNw18Y2zo5N+2NRPoj6OZB/NZTEGcFKHFBFd0vFN/9
	iE2hzkSyCITbKSPyhyCizmuNVEctx6qoy7w8XFiYhc8Gt7QTzPFiNaMulhj3gveNvc5yNGPsGH5YE
	eMYiNbihgK8Mz4HqlEkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQTrx-00027q-AF; Mon, 20 Apr 2020 10:41:41 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQTru-00026M-L4
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 10:41:40 +0000
IronPort-SDR: DDO489k0I0NpPCm4Fb309s14kCCkgPb9C68gSIYYx305CvKss4OxUVuuNi7zksfun1VUmlTPdl
 i/mVXx18QFQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 03:41:37 -0700
IronPort-SDR: CuBgA2GPporm8LwVqOhvXcm/FADyoJq9PhQASrJEFXqPPNOTZpGlNMJkyu0Ed5UErAilfC6YUC
 Atn5n0pRCRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="333883264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001.jf.intel.com with ESMTP; 20 Apr 2020 03:41:32 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1jQTrk-0020ag-T6; Mon, 20 Apr 2020 13:41:28 +0300
Date: Mon, 20 Apr 2020 13:41:28 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420104128.GL185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com>
 <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
 <20200420115256.3a0ff647@collabora.com>
 <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
 <20200420122859.2a210268@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420122859.2a210268@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_034138_702279_C3D92CA3 
X-CRM114-Status: GOOD (  20.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree <devicetree@vger.kernel.org>,
 qi-ming.wu@intel.com, Anders Roxell <anders.roxell@linaro.org>,
 Vignesh R <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 20, 2020 at 12:28:59PM +0200, Boris Brezillon wrote:
> On Mon, 20 Apr 2020 13:14:42 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > On Mon, 20 Apr 2020 12:44:51 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > > > <boris.brezillon@collabora.com> wrote:  
> > > > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:  
> > > > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

...

> > > > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > > > + {}
> > > > > > > > +};
> > > > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > > > > > >
> > > > > > > You probably have a missing "depends on OF" in your Kconfig.  
> > > > > >
> > > > > > Since it's using device property API, dependency is not needed.
> > > > > >  
> > > > >
> > > > > There's no compile-time dependency, but this driver will be pretty
> > > > > useless if all its users have the NAND controller node defined in their
> > > > > DT and CONFIG_OF is not enabled.  
> > > >
> > > > No, it's not.
> > > > See [1] for the details how ACPI may utilize this table.
> > > >
> > > > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id  
> > >
> > > Except the NAND framework does use the OF lib when parsing common DT
> > > properties (like nand-ecc-mode, etc), so it does depend on OF if you
> > > want those props to be parsed, which, according to the DT binding patch,
> > > is the case.  
> > 
> > I see, so, NAND framework can be transformed at some point. In any
> > case, from driver perspective it's OF independent.
> > 
> 
> Well, it uses it only if the driver passes an OF node which this driver
> does (see the nand_set_flash_node() call), so no, it's really a driver
> dependency.

Look like still it's framework dependency which driver has to rely on.
Means more work would be needed in case NAND to convert to fwnode API.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
