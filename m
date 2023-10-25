Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7677BC07545
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 05:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ojsFDYDts4DMhx7CXCVWRy8W7JKR1WsxLM29sKzjUE=; b=KqDHp52JuSY3mH
	mS31MRsH4wxs1g4UjiJh/veFxba4cE8uozrZQeIAmuAJ3hrorlNzAt+1GrhCvGqOa7AoAsePUPIHq
	EUn5FkfxEghxP5Nv9js8h6fEB9881aaX1TCur7ikvQbodR5zOeVBcACfm3VWDod3tJ2RGbREQE7gh
	yo+eucJIYjCiwaFFP/9Vg9jJdcNkhGhNX0gUEXwg0OJPX+thkvakFcS3DWifH1NWdFw66uqi0Shia
	9EkpFUXS4uRPBE0UL40Lo7G06jr1JmDL+EAb5byeqFiR0n4WwL0jiUWYscPGTs5wlPkx3pVCVKVz7
	GIsMcr2MnK++aeE6NfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvW55-00BO9b-1s;
	Wed, 25 Oct 2023 05:05:23 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvW53-00BO74-0d
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 05:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698210321; x=1729746321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=htZwSr1yPfU4DAE0T3T5Cf6TY9qanaVYs1o0tVaq0Wc=;
  b=Us7xdCbZh/L2MJX22b82hSKk0xAPqujFAVmdWUOfKUyCN+w0pYI8u1Zy
   ei3neLQ4EKOhEWLc8AxQTUkx+UivLWwpFd7kZGfCNX5c7zyjJr2ihl0IT
   klxmYLapIZVT0G6rC37UFUMBzmrWPa+oDWRtxSw6sqG8eqS0Mt8ShowaO
   ZOt7doLTZIedtwCIRWeG9McO4Ghtv8UY8jbx/xOZxJy/UW53SHhnbw8YZ
   hEQneyJ80wdecW83fWsyogLO0Ed6JK9b9J2VPEbM2po+MqlDL0b6pIjVS
   plu0BUYfAe/PqpCGvvJsSV2UxM/RgAk9LO8cxxQZ3FF0vQqeearh8J9Lm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="367451380"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="367451380"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 22:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882324731"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="882324731"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Oct 2023 22:05:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0ADD5125; Wed, 25 Oct 2023 08:05:08 +0300 (EEST)
Date: Wed, 25 Oct 2023 08:05:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Improve reporting for software reset
 failures
Message-ID: <20231025050508.GH3208943@black.fi.intel.com>
References: <20231025030501.490355-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025030501.490355-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_220521_252487_D1FAFD41 
X-CRM114-Status: GOOD (  10.03  )
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

Hi,

On Wed, Oct 25, 2023 at 11:05:01AM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> When the software reset command isn't supported, we now report it
> as an informational message(dev_info) instead of a warning(dev_warn).
> This adjustment helps avoid unnecessary alarm and confusion regarding
> software reset capabilities.
> 
> v2. only lower the priority for the not supported failure
> v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only

In addition to Michael's comments, please put this version information
below the '---' line.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
