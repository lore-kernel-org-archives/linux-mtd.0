Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24A2C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743742145D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dM7rm4la"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743742145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzXkNEi7WQxoGswNnpH9WCXcicd+jzoksQ5YhjfLGNc=; b=dM7rm4lavddc+J
	nLPUQCTmZD3Zm4AQ9lAJkFJ1TQReuPihFsNpHvai0CfFVQefWNJhebjf0+KeES1E7pwuM+XLqQ6Do
	GmyE2XNorc844dtgh8D2nXm0NNtwxwqiagE06AGhxtapRNO2+uALn7P/xIsIBHBodQ2QWa5m2bFzc
	gjQunR4D0dPbsCKiaoauXP+HV3AhHioqf+ZVzkn+MfzPrzfcAbXb04Ea9kf+IgZ/FRaNddnhwEyZ8
	67GWOJ+DSXMkoUJhFNDSs0TnbXiIuT3mWtv6RUq50xDO5HYzYgZlDVHDhI51FA0XIYGsVvxMC1bkf
	DiLqRU8AyN/i1RipkA/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSZ1-0004bS-Ss; Mon, 20 Apr 2020 09:18:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSYy-0004Zz-Bc
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 09:18:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0CDDE2A0A3B;
 Mon, 20 Apr 2020 10:17:58 +0100 (BST)
Date: Mon, 20 Apr 2020 11:17:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420111754.5863324b@collabora.com>
In-Reply-To: <20200419222040.GJ185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200419222040.GJ185537@smile.fi.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_021800_522595_6BB517F0 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 20 Apr 2020 01:20:40 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:
> > On Fri, 17 Apr 2020 16:21:47 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>  
> 
> > > +static const struct of_device_id lgm_nand_match[] = {
> > > +	{ .compatible = "intel,lgm-nand", },
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);  
> > 
> > You probably have a missing "depends on OF" in your Kconfig.  
> 
> Since it's using device property API, dependency is not needed.
> 

There's no compile-time dependency, but this driver will be pretty
useless if all its users have the NAND controller node defined in their
DT and CONFIG_OF is not enabled. I guess the OF option is selected by
arches, so explicitly depending on OF is only relevant if you change
the dependency rules as suggested in my other reply.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
