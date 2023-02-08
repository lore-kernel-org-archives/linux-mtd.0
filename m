Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4B3C636D7
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJXYlBjOiCHX2l9cj4338tHRBlYLkEcD2KS2xL6gmoE=; b=uAxF1rrVMLE736
	C5qXC+h0aVKY+WPyMWT+WiwDSWOLBZY674/npLMqHLAgYZQ+N8BblreoslY+u3WcPUb5R/kf6ciJg
	PRxMWgJxlRUMkMUfZYOwsroT0Opf0QT4tgSmZe3zVhP8lV1GKpJG1m/WwUbhbXeJ8QlJpaEfqN8Yk
	FJ6Gl4F3yuyFs5VD3xp7fzMs57Cwwa8V1ilaIfyqrXitGGnNY/PQyV2HXDmC7jnBoI5HRTJg66dSZ
	zHmr65Nx9/IkD0F8shCl5z3Evb2u5ElIW2zy+2QH7PGnSNtDA3XSiwnyAF0xUuFQ2VBCfeZz4tdqk
	mA7As5mOpYCC5qVSVK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkdr-00FmcA-E8; Wed, 08 Feb 2023 13:37:43 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkdf-00FmWu-KY; Wed, 08 Feb 2023 13:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675863451; x=1707399451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mvzxSsipozkOczStJxxLS2JmQaRIUgdUKmAgwtMA4Cg=;
  b=lXFoA+MVLTRkQSxu0KHMpJHInGxJHIBIToLC3JLWRlgYNjwdrayETyA2
   FUQcaEF1tx3ShQUkVmkS8MTuqNFH+yypKWOOrNeGaiAGaQ5bBh/Lh8zM7
   KXwMMCuPVlzaIY8AFcNuaJcFnV0uwSOjiXmbMdxcpwxQBBklt0EPKGvF6
   BULH4WpzzH7qEwFj4y49Be7IWdATZzg0nFDV+oQRKLhryb1WRK6yjzssL
   +dgv4cj5myc9ZLDvv6kklywuqBArkKrXT98dCvetUR2e/2qJI7mdoMcsf
   DT2l3SmhjqzIHQYXWrFfkGoXUMlX4qRkv0mWBEAuXluMGBfcvsRAebIjd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="313436560"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="313436560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 05:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776020864"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="776020864"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2023 05:37:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPkdN-00485l-0I;
	Wed, 08 Feb 2023 15:37:13 +0200
Date: Wed, 8 Feb 2023 15:37:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Tony Lindgren <tony@atomide.com>, John Stultz <jstultz@google.com>,
	Doug Anderson <dianders@chromium.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Colin Foster <colin.foster@in-advantage.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 09/12] of: property: Simplify of_link_to_phandle()
Message-ID: <Y+OliBAHiUPzbBPG@smile.fi.intel.com>
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com>
 <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
 <CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_053731_740329_B73AEA79 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, Feb 07, 2023 at 11:31:57PM -0800, Saravana Kannan wrote:
> On Tue, Feb 7, 2023 at 6:08 PM Saravana Kannan <saravanak@google.com> wrote:

...

> Another way to get this to work is to:
> 1) unload pinctrl driver, unload spi driver.
> 2) apply overlay
> 3) reload pinctrl driver, reload spi driver.
> 
> This is assuming unloading those 2 drivers doesn't crash your system.

Just a side note.

For ACPI case the ACPICA prevents appearing of the same device in the
namespace, so the above is kinda enforced, that's why overlays work better
there (but have a lot of limitations).

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
