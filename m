Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2884C636D4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUDUX/3Q5tpnV1UoVz6SAH+OuAmaqhAbpZ2g2F7mQNs=; b=4L0uimoLjr2V8a
	rg/fouvYYfngYog1RPiJDQLrCIMTnprx/jaueRvJUVV82KPbYg6jfuhjSLkVMSqs1UfkSS5lHtXmj
	Ch2JFUQmqA0eQkwJaCSNhbXX2vvWzxQf7pxrOm3mng8rWN6Qs+1Qu9iw971RygoVkyAF1Agqls6jK
	pi3twSUWMwFgqlUHNLQfamaRzUq6cDJFyfZYMmeAFWEbIFSlJqeN8/W5r7R5lIezci2J6bnRR/W+Y
	krXiNFaENk0h5CH2MXzWWMYP2LfRt0j0Q+EEnxl3OK75r1nerJKIVbYJeQkLiI66qwclWHl+MbCRv
	zx8uA8QSd1IPeRa2B+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGzu-005ma4-4B; Wed, 15 Feb 2023 12:34:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGzg-005mWB-T6; Wed, 15 Feb 2023 12:34:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 628C961B4E;
	Wed, 15 Feb 2023 12:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EADC433EF;
	Wed, 15 Feb 2023 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676464478;
	bh=UdB5gcZ1ipRdvMF/VYd7e+V0Gy9qLJujvD96WZvS0NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCpoOc8iHx3XcRwBSD1ZDGP40QOJqNIxZTP+CRuJvEBLFgtOvJHb1BxmmVQVfcWPz
	 DPq298F9sCKiTeahJyumwLmhzWr9yLHuVSt/Mq5h78veRLGCdNRsAQHf5/jlKiUChd
	 8no4Zb0DtNaYMe8Larvl6+gOzcfXADoQV3n31OpI37s4NQZPPzZ76+mFaeI75IShx0
	 fBSKmCTTMHdUu/uG4tD/KLRby5vMvJ7nwVoO2+s1CTjifo3P032eI5Pd6K3fCrMyho
	 +7hgd9oQhxO2zo08wGaCj5FxGS2syXQflakHSPJ4CtIOHS5c3xxNQmN6SuEQblgliV
	 KrB2+yr/wTnhQ==
Date: Wed, 15 Feb 2023 12:34:30 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	John Stultz <jstultz@google.com>,
	Doug Anderson <dianders@chromium.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Colin Foster <colin.foster@in-advantage.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
Message-ID: <Y+zRVsyZ2iJlrM8u@myrica>
References: <20230207014207.1678715-1-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_043441_061617_4DA0D918 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Saravana,

On Mon, Feb 06, 2023 at 05:41:52PM -0800, Saravana Kannan wrote:
> Naresh, Tony, Abel, Geert, Dmitry, Maxim(s), Miquel, Luca, Doug, Martin,
> Jean-Philippe,
> 
> Can I get your Tested-by's for this v3 series please?

Sorry for the delay (I misconfigured my inbox). I tested virtio-iommu with
these changes, no regression:

Tested-by: Jean-Philippe Brucker <jpb@kernel.org>


Removing driver_deferred_probe_check_state() by reverting [1] breaks
loading virtio-iommu as a module, as the dependency between PCI devices
and PCI IOMMU is ignored, and the device probed too early [2]. I'll try to
figure out how to make that work.

Thanks,
Jean

[1] https://lore.kernel.org/lkml/20220819221616.2107893-5-saravanak@google.com/
[2] https://lore.kernel.org/lkml/Yv+dpeIPvde7oDHi@myrica/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
