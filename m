Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C81DC636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6SWmovUXG0kdLTamt4BLGv2JqJuuVLqXkHOgCgRA1A=; b=biWWpe0BVDkhww
	zcIqBvsX/SiNYffysfqzWsfY2Vt5iorUkMFtWYQ77gFGU9IVLH67GOWZZmzOMRv6mzsilXPDGQb9f
	OplQZq9a4/2Nk+odxSDcymMfrw+X//IlZ9r6jhIVYHEjNjkeoHLFKXFuvGYv+IxEoVCm3D0CDW2wR
	XrR99jyn5QoztKYzw/l62bmtY97ZfoHghzaiVsaoDXywVvgapAAXAyCjFqCPqzMnJzBu1kwhBZIuu
	DQirG+4rT7eq9X7bvE5gOX+xZ3Q/P5Kl3coNsH7p+IiMDc8m1l63QKRZZJGZcHYq5ZyEpCA6L4lPO
	FmcfN/GzojLCQjYwgWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPL6T-00BgID-W3; Tue, 07 Feb 2023 10:21:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPL6I-00BgEz-EF; Tue, 07 Feb 2023 10:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675765282; x=1707301282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y2U9WIJPBm0L0FSDgjHarSz3qorOt0PpIQPRP0xPIhs=;
  b=cT+UQbxMbnlkoMWpfRGW8e53J8GAowVo4CfiygBTtK2fEp1WC6e1ZzfZ
   JtOz9DHWpBZgou+A0OYxYfGTIFiGRXP/HLtG5goan5HXpW3Mn1NWgqyaD
   X4ywu+UDldW3pXXmMlUeiTEaTYOUguHaGFyzw5r5/j+AvwitOhW7C+F8o
   Zz7Pgo+oEv/q5WS957cMQovh1dXfiFx46tSXrawmTIAkiwXmDlweE6yOa
   J9OqfUe9zhUrWm9tA7yoGrURRnO14SVrifsbCgrJzobpsq/PTysQjncyt
   cmME2UkY/4q4xpIEhl/IvQpcelquUKOHqSFDJKWiFKsmuU7B0m3WSFb7+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="328112315"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="328112315"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="697227157"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="697227157"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2023 02:21:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPL5v-003Z31-2O;
	Tue, 07 Feb 2023 12:20:59 +0200
Date: Tue, 7 Feb 2023 12:20:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Jean-Philippe Brucker <jpb@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 04/12] gpiolib: Clear the gpio_device's fwnode
 initialized flag before adding
Message-ID: <Y+ImCyHS7ZIr8bNd@smile.fi.intel.com>
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-5-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207014207.1678715-5-saravanak@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_022122_602175_F0175820 
X-CRM114-Status: GOOD (  12.35  )
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

On Mon, Feb 06, 2023 at 05:41:56PM -0800, Saravana Kannan wrote:
> Registering an irqdomain sets the flag for the fwnode. But having the
> flag set when a device is added is interpreted by fw_devlink to mean the
> device has already been initialized and will never probe. This prevents
> fw_devlink from creating device links with the gpio_device as a
> supplier. So, clear the flag before adding the device.

...

> +	if (gdev->dev.fwnode && !gdev->dev.fwnode->dev)
> +		fwnode_dev_initialized(gdev->dev.fwnode, false);

Please, do not dereference fwnode from struct device. We have dev_fwnode()
for that.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
