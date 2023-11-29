Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB2C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MqPntVbY2xOAE4r2SwI8uGTfviqVT487lSwSJH8i3I=; b=pHf/3VqAFjL73A
	+A2wETGYkJPLxA3gKSIctRW903Gic+Hmj8Gr5rqjZMBFy/p/GcuT/viGlm+sJgB9Zi6J609MoPRmT
	GIm01bWiRrvbaDNhdeHtPKZrL45S1t+xojHif1x3Qp2z7/6nyx0OYJtPgnj5VFCF6mPap00fXH7s9
	LL8UEnUNd8dWgxMvpbXSqPvNRVR0npwmcmN4PUut8PfL6DRM0LExKlQNpbJcZZub/bH0wqaJMvRXK
	EqWR/geJY5gImBLpfE/mGrIr2dt3TMMMbbGVa5hrkFP95scMRcUHI+Cq3tvazjpRtrDUApx6+YNlF
	e/b2+iOUA9iS4e2Diy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Edj-007J1x-11;
	Wed, 29 Nov 2023 07:05:43 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Edg-007J1Z-0X
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 07:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701241540; x=1732777540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1qmvHwfK7iTIDc/XSt6kxSJ8+uPc6tnRGIsBlPEG/V0=;
  b=c0YPq5jAJpNJVCsukJsS9Qznx7ros5SS96vc3HwJ1usHNB2J8Al/Gkim
   S7+z8G6qvGS6Z46GzquoweOhRelb43d2JwTZ8ssTk6OmQsdEDw7G7QGJw
   FXFpvnJWfQW5wj48EjDvnBP/nikn8yJwYGv6+6FcH3pVX7OdBTm2R3U58
   kY6nPdTM3hZaUfhl2snYLRen6rr89vFI5p72/S7wI7JhOhH0THBTm6u8X
   clMihtOghQIixG7v6PgcVdC7pcxw4uCwm0K9JqNtjuGpjTjlOunu/H07b
   46seR97xoIweGFol+++nm06IyAI9vb/pxY5o2cVqWQYvv8ngmkir0J3bQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391977382"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="391977382"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 23:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772585802"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772585802"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 23:05:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6B64023A; Wed, 29 Nov 2023 09:05:31 +0200 (EET)
Date: Wed, 29 Nov 2023 09:05:31 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP
 with -EOPNOTSUPP
Message-ID: <20231129070531.GP1074920@black.fi.intel.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_230540_241702_6776B422 
X-CRM114-Status: GOOD (  19.41  )
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

On Wed, Nov 29, 2023 at 02:43:10PM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> This commit updates the SPI subsystem, particularly affecting "SPI MEM"
> drivers and core parts, by replacing the -ENOTSUPP error code with
> -EOPNOTSUPP.
> 
> The key motivations for this change are as follows:
> 1. The spi-nor driver currently uses EOPNOTSUPP, whereas calls to spi-mem
> might return ENOTSUPP. This update aims to unify the error reporting
> within the SPI subsystem for clarity and consistency.
> 
> 2. The use of ENOTSUPP has been flagged by checkpatch as inappropriate,
> mainly being reserved for NFS-related errors. To align with kernel coding
> standards and recommendations, this change is being made.
> 
> 3. By using EOPNOTSUPP, we provide more specific context to the error,
> indicating that a particular operation is not supported. This helps
> differentiate from the more generic ENOTSUPP error, allowing drivers to
> better handle and respond to different error scenarios.
> 
> Risks and Considerations:
> While this change is primarily intended as a code cleanup and error code
> unification, there is a minor risk of breaking user-space applications
> that rely on specific return codes for unsupported operations. However,
> this risk is considered low, as such use-cases are unlikely to be common
> or critical. Nevertheless, developers and users should be aware of this
> change, especially if they have scripts or tools that specifically handle
> SPI error codes.
> 
> This commit does not introduce any functional changes to the SPI subsystem
> or the affected drivers.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
