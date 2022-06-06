Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E70C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hcxe75u+txGjJ0jFfw9s1bIZjlQCoeZdirnGpOXXaLM=; b=jRdp9f2YaRITPV
	U7KfJ8FE9hYXDGDplVgDK9EWmaBt5m2595XtpLw7fjbdrmFUlv4IoT0lPdxz9VSeS47aTfhyIpR3l
	78zqOluZlUfDddd9WOBiNQoMWSYq3uSM0eWxvxvKsmKwtIl9pJJSrpoB4VX5fsYCWgjbPDBe6o28C
	14MWqqSqVlWDhoYrI4hij5VkQN6OJFWAFUK8Trs2vJnqswRXthJc6deCPwnNDPg/spjVb9B1mkUkK
	L/MHcq7n1tinq5YG4oYrtJGsPjwbYfl86MCfObT1A38tVRjK+pJ+qjjgbvrMMR30giMWnURzObyM0
	192aDworuRGU6J3O0ohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDKb-001R7m-Rk; Mon, 06 Jun 2022 14:03:45 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDKY-001R6r-SP
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 14:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654524222; x=1686060222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9IrcWpEZ1onVKEQM9HtkzelZJAwW//kAKQMPdHQ32hY=;
  b=GMonEpDScU9Ra95B215ZclFd5wXqtnCBDXS7E20R+OM1ctcKvc/e70P5
   wl5mvpHompBFpo8++YU2vtPhPeTWRymOzOAkImDGyGYRveYhH5iQDmDoL
   Y8hlZaqJTCErKucr9OeFAmGNN/8kPxhjiNNGlVuFdCV/7W1kQigZWw3j9
   oOdvchTWAAl+jK1HVGZjuWnVibU5ros2V/vvhFAF5aW9wrQ6h/ZU8qJnJ
   wUPbN/RHFJOM9artLY6lUQm2puXaUyhpliX7PN0wzPeahANP+95nHUwGj
   IF7G6NjpJXD95tqlzXGjY+75bK/qizj/5j9Muz93m1GeB2f1YRZlo6jFw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="363001221"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="363001221"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 07:03:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="682257691"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 07:03:35 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 06 Jun 2022 17:03:32 +0300
Date: Mon, 6 Jun 2022 17:03:32 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI
 controller does not support it
Message-ID: <Yp4JNGvUzHIuYAHx@lahna>
References: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
 <ad148cd90c1abd391f9014471a555307@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad148cd90c1abd391f9014471a555307@walle.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_070343_005494_2F3A7F1F 
X-CRM114-Status: GOOD (  13.82  )
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

Hi SPI-NOR maintainers,

On Mon, May 09, 2022 at 09:12:17AM +0200, Michael Walle wrote:
> Am 2022-05-06 12:51, schrieb Mika Westerberg:
> > The Intel SPI controller does not support low level operations, like
> > reading the flag status register (FSR). It only exposes a set of high
> > level operations for software to use. For this reason check the return
> > value of micron_st_nor_read_fsr() and if the operation was not
> > supported, use the status register value only. This allows the chip to
> > work even when attached to Intel SPI controller (there are such systems
> > out there).
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>

Gentle ping on this :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
