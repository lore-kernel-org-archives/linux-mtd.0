Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7019EC636CD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpWJ5kDg4KVwTdcOQf6AMXgJLWEyOYBStoRQf43Qyfw=; b=Th2Q+R4YTk0RWT
	Y4hdas945X24UV6VEwLD2vsSQ59SoXNbaX2g8YMe3zthex9p/tgWg+l9zFbQnCWoYbKYhidaO00Qn
	RnK2oECHuarxdFnpqoLGUq3pOVG8uBLFzYaOPzIsRxUcOKQIH/zM50zzNmbaq9so0dmmdU0f7Sz8f
	CWsr2PB2n0AzY3/33X6PWBsDXIZj5BYtZPT9vBjvQClgMmn7K1+2jyxFqZHsl+YN0EhNZIrb7tT6B
	+xuxZ0ooOpDF8NpKkXhtKzFvmufDQT3+9TFnqaknFB0jtNdovOTLpO6yFqgLQbD95yqBT9ys2aAr8
	pTzptXl0sYDFCPxy1vGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLDd-00BhuF-M0; Tue, 07 Feb 2023 10:28:57 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLDS-00Bhre-NP; Tue, 07 Feb 2023 10:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675765726; x=1707301726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qFKo6P9N6kXoK08jHrxIsWsAo99hMsJ26Xtn6cj93Is=;
  b=hWLT3hR4T6IdjfVKyjCXuOZru6N1cDz4WFG6kkvniWYSK5vv4I837e3j
   yHT870hXyr6L9tx0EVHgFjA95uN3TXYHPWHuoTOJcoEvfAYuMD4u84Z5M
   RNwAUO8qh5vsaZd+0FqS2PnWlAHkVgfktdSWfszLBaeJnSImp84rNlVb9
   qJQgwzM54ZUpB6Ex7AfdNkQ8gj5Z7LbjFCWSqsJQwPS6SERqW5wjAvWWt
   j3rhzukVjW5bSYiDuV3PGQzPBOYch6aiLL3OmdTi1E9gjzULI0N8DxrTh
   1pk08QQfvWRaxZ9Ywq2c/9wNX80dHQsx4QVy4N3RsSlrIUa+M0wCoiyQw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356841103"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356841103"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616762031"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="616762031"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 02:28:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPLD9-003ZAe-19;
	Tue, 07 Feb 2023 12:28:27 +0200
Date: Tue, 7 Feb 2023 12:28:27 +0200
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
Message-ID: <Y+Iny2bM9vcUPsDy@smile.fi.intel.com>
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-5-saravanak@google.com>
 <Y+ImCyHS7ZIr8bNd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+ImCyHS7ZIr8bNd@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_022846_792090_AB795240 
X-CRM114-Status: GOOD (  17.65  )
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

On Tue, Feb 07, 2023 at 12:20:59PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 06, 2023 at 05:41:56PM -0800, Saravana Kannan wrote:
> > Registering an irqdomain sets the flag for the fwnode. But having the
> > flag set when a device is added is interpreted by fw_devlink to mean the
> > device has already been initialized and will never probe. This prevents
> > fw_devlink from creating device links with the gpio_device as a
> > supplier. So, clear the flag before adding the device.

...

> > +	if (gdev->dev.fwnode && !gdev->dev.fwnode->dev)
> > +		fwnode_dev_initialized(gdev->dev.fwnode, false);
> 
> Please, do not dereference fwnode from struct device. We have dev_fwnode()
> for that.

Note, with that fixed you may add my
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
