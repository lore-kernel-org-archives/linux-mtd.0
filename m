Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D743AC4321E
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Nov 2022 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0CiUnb/c/v5rMBXzAzfBec7CwblLwWAPBFd5wje2Es=; b=BbMD6rK1ybD8JK
	Ar/n1HERFf+yT+vsyOHrmAsM3S3wvCdv9shtJ9W5fVP3JJF36BVYw07S6hVFPar0ZZQH+zRUOs3uO
	u8E3sYHudAtWlNYEwzTeuYTbYNUFKr7cJYDgblqpSmO9RRSIFBWyq74Oc5ll9yFlWGsPLGznE443p
	hvQTwlaWf0XCN3XLf7NSi4b8XT6ZlkRRsnl7p80QrJJsrI4SXPY/j1zaV41HRz4RifjsRKMkc/VYN
	H8Lon7I+adrFaDb5or2Ztz6QTP1ZMJZxzSqV1XEdj/sq6yE/TErNyzv+bi+OTy1/1OlktLazLs3gH
	/tcp8EFKKTM7GvhYgTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxLj-006top-Dq; Sat, 26 Nov 2022 15:44:16 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxLg-006tjv-Am; Sat, 26 Nov 2022 15:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669477452; x=1701013452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TYZva1qhZaDDzx7ssD6565IlpCg24ayIFbcaC7tY8Tc=;
  b=V1SxMmpbUl+nWWZ8R41Pd+bRfL9qCWJUUMinYD0rKmcz3vblKHJ9Sn38
   rFsJVplbr8gt8yW5dMjNxIuLMmO05Y6VmEStILLQO0ISJ4ZS/0uMZ72XB
   T3U32Q0MB4zv0n1w1jrExqhpup401jlrVa39kIz9Fx45jg8EoDjhgNwW4
   Ovqdy3rket2RW0vPqcKgbDSBbZJKseap5W6a5UU+bvLDrSulec6eUl7Ng
   LQnNAjfCe8v5TnzXfFPixZwd3vGCWUdh5RGFjgteu8obCo7tkOIOv6eXi
   nuHHqUxD+X3gQLqf2C45ar2rd71AsEvAT15gKkgzLQ8Uu9pPdLbi/2QxS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="312239915"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="312239915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 07:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="620587303"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="620587303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 26 Nov 2022 07:43:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oyxLL-000Bco-1n;
	Sat, 26 Nov 2022 17:43:51 +0200
Date: Sat, 26 Nov 2022 17:43:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
	Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Purism Kernel Team <kernel@puri.sm>, patches@opensource.cirrus.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-crypto@vger.kernel.org, kernel@pengutronix.de,
	netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <Y4I0N3KpU/LSJYpd@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
 <20221122201654.5rdaisqho33buibj@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122201654.5rdaisqho33buibj@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_074412_435192_F05630DF 
X-CRM114-Status: GOOD (  16.75  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 22, 2022 at 09:16:54PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:

> > Queued all of the below:
> > with one tweaked as per your suggestion and the highlighted one dropped=
 on basis
> > I was already carrying the equivalent - as you pointed out.
> > =

> > I was already carrying the required dependency.
> > =

> > Includes the IIO ones in staging.
> > =


> > p.s. I perhaps foolishly did this in a highly manual way so as to
> > also pick up Andy's RB.  So might have dropped one...
> =

> You could have done:
> =

> 	H=3D$(git rev-parse @)
> 	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
> 	git am ...
> 	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; ec=
ho 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo=
 'Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..
> =

> (untested, but you get the idea).

That's, for example (just last from the history as is), how I usually do it
(tested):

 git filter-branch --msg-filter 'sed -e "/Signed-off-by: Andy Shevchenko/ a=
 Tested-by: Daniel Scally <dan.scally@ideasonboard.com>"' -f HEAD~4..HEAD


-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
