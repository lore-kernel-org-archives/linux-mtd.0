Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66645C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiC87GORyQGAp9AtxEG/x9ArTuYtlG8owRLUubyeI38=; b=B62SMi6Jq/bi40
	hkARvcFK18bTjw3/h8uoT59Y+MU0yT7F6AmWt5FSr0rCxPnSeSF4rhcxwiiaxatiuGqfvSlusX6U7
	pd9PQSjIIEINDRyZdSRLm/tWwsnolroM5jUVoDSvsWHv6ACtAWevBi4Y3t97Ak2SI05qdT6cSmWNb
	8JKivXQg4sBXxA45TH5PZgVtWKWo5/bqRVJHKYJSUgD0BFYhNiFLF6o9f6vcwQj9+R6W3HlxKsPRs
	FULopfnU+3k8qQO8hsInjWPuIorVd52M/IM0BtbhCbS94vsOHZu+JlnbE42FQC+oTK+IANHTo6O9o
	NhZYXpMOL8incVdMCe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Zaj-00EJLU-2r;
	Mon, 13 Nov 2023 16:15:13 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Zah-00EJKp-0I
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 16:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699892111; x=1731428111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8rY+BuPATDdFllS11rT6X+vOd362jahNzwQrfoDc4Ns=;
  b=bKzjEPv2JfsihPD3J3J6wM01pFc0MJ6EoHZjZEgWwi3StunPWKElI2Yk
   o29JVGvRNodhpw7/0+o63RjD9kbp5PrQsY20UrPi3jRJhPYtUkj8z9mzd
   uQlnTq5x6OpyTyvOoqRN1qiUsMnc6lpgSHRTLhB90wDQGbTNROCDSs/tJ
   jzd4owhvme7ICFYB2bJ6l3wjtvM/yKQ8P2TnovBZR2hWWGRLexzsTIITp
   4uCMHCLJHSJmmU9OCQ8u4deSCG1OINJHS6E7c9PpyOrORes5N1cFg2YIW
   yvjOWYxQMsVMHT0Xdut2d+UZgsnU6jmX80W2SSv8D0C8qRQ6KI/5yENk8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394365807"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394365807"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714266736"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="714266736"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:15:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2ZaX-0000000DbOz-1Zn1;
	Mon, 13 Nov 2023 18:15:01 +0200
Date: Mon, 13 Nov 2023 18:15:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ronald Monthero <debug.penguin32@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
	martin.blumenstingl@googlemail.com, paul@crapouillou.net,
	robh@kernel.org, u.kleine-koenig@pengutronix.de,
	AVKrasnov@sberdevices.ru, r.czerwinski@pengutronix.de,
	jaimeliao.tw@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand
 controller response
Message-ID: <ZVJLhbvXSbmnEfwb@smile.fi.intel.com>
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
 <20231113160751.620810-1-debug.penguin32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113160751.620810-1-debug.penguin32@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_081511_173553_4C75CC79 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 14, 2023 at 02:07:49AM +1000, Ronald Monthero wrote:

I'm not sure if it's a dup email of the previously sent v2. In any case I have
commented on v1 and v2, please consider addressing them.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
