Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955D9C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6808F21927
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n71IEE79"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6808F21927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y35p/CEzY2a8WzaD9JIXxY1LhpJOEXU7sEbeakRy6Es=; b=n71IEE79Gk+pFh
	qKPeYzPXpjIOZqL8/oJX3fMNjP5sN4wGEd2RFECMrlFInYFDL4ehvKVZA1YN/qDhK9Dfssr4uftPC
	raHjH5gejBYGnjEDIJt/Kd8m7rBSIIen1XszqxPU3vUxGiWFhCtMcNLPUu67MqV6g5DPt4ip+Dv6o
	j3GI7fsThqPzYeHxcfFF7vOfAZ8hhS1O70HOUyGcc3r3/wp0hm67uaZJMxXZ+CHl+6FLf02CZDHxw
	5wKKZP6B09QpQVpQ83sSNV/bYGRnEU2ShUR60Qgz0UcKOAiW1aS0U8PKTqzGWWAlsvS2MMY7E74tT
	yfrgJHk5IsdhPhXl82ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQTfp-0007Ri-GV; Mon, 20 Apr 2020 10:29:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQTfl-0007Q4-BU
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 10:29:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AA0B2A0057;
 Mon, 20 Apr 2020 11:29:02 +0100 (BST)
Date: Mon, 20 Apr 2020 12:28:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420122859.2a210268@collabora.com>
In-Reply-To: <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com>
 <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
 <20200420115256.3a0ff647@collabora.com>
 <CAHp75Vfp_WYNR8kHVsSVumGzuVbGEGpAjfXVvJAV7t6zXXY+HA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_032905_525162_0F516E78 
X-CRM114-Status: GOOD (  20.21  )
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
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, "Ramuthevar, Vadivel
 MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, "open list:MEMORY
 TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, masonccyang@mxic.com.tw,
 piotrs@cadence.com, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 20 Apr 2020 13:14:42 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Apr 20, 2020 at 12:53 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Mon, 20 Apr 2020 12:44:51 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >  
> > > On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:  
> > > > On Mon, 20 Apr 2020 01:20:40 +0300
> > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > > > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:  
> > > > > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > > > > "Ramuthevar,Vadivel MuruganX"
> > > > > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > > > > >  
> > > > > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>  
> > > > >  
> > > > > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > > > > + { .compatible = "intel,lgm-nand", },
> > > > > > > + {}
> > > > > > > +};
> > > > > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > > > > >
> > > > > > You probably have a missing "depends on OF" in your Kconfig.  
> > > > >
> > > > > Since it's using device property API, dependency is not needed.
> > > > >  
> > > >
> > > > There's no compile-time dependency, but this driver will be pretty
> > > > useless if all its users have the NAND controller node defined in their
> > > > DT and CONFIG_OF is not enabled.  
> > >
> > > No, it's not.
> > > See [1] for the details how ACPI may utilize this table.
> > >
> > > [1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id  
> >
> > Except the NAND framework does use the OF lib when parsing common DT
> > properties (like nand-ecc-mode, etc), so it does depend on OF if you
> > want those props to be parsed, which, according to the DT binding patch,
> > is the case.  
> 
> I see, so, NAND framework can be transformed at some point. In any
> case, from driver perspective it's OF independent.
> 

Well, it uses it only if the driver passes an OF node which this driver
does (see the nand_set_flash_node() call), so no, it's really a driver
dependency.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
