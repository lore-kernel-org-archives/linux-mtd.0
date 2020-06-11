Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EEBC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 10:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940F1206C3
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 10:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3p83uHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940F1206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdYQQ0h/GfEFUi/7VzN2H+64K8cevtnLh9fbCuz9HHw=; b=q3p83uHmtqKYeL
	03Bm5nmu4b59Xn6Ifok5iXAHUqyafq74KCOPZrCm4q1gXqDalQeU66yOlfXj/cU8WAASA/FKPaP3z
	acf+04WitBGVPuxp2JrCaICvsbbinmcyoTLzP2EK3VkHPM/ohstqw1iR2XGEv61OBNhAdp6XCUVpl
	r63nYTui+jLq/G1PxzrlAammPFokF+G0BtVObKX8ff3beVzC/k3gdItWokxBaEAU9cI5IyeGeUOIS
	Mdb/NrPyR6Sx+f+EzLbPlaU8JCHI4/LlmSDh1u1FEHw6I8ccycnkuEHx8E8Ae2Bz03hn3kdDqZEQ8
	pKXv1HmJJAki66ICCDGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjKco-0004Cu-2q; Thu, 11 Jun 2020 10:39:58 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjKcj-0004CN-1j
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 10:39:54 +0000
IronPort-SDR: ZQ4+a3zkN2N16SY0efLGUUeE9MVmwU0U37KTgkOtLskkcJIUKCidh9WWhwYP7Nqzh4ohMvH8qg
 AUTBOM4EJdLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 03:39:51 -0700
IronPort-SDR: n1oDAK+8ZZRCo4XPJCfRE/6cleWAyxhiJPzudO4+U5xSV/Bp68ZuhzSbxXvQkATLEVN8eu6V0y
 T7NxhaoTxIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="380349596"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 11 Jun 2020 03:39:48 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 11 Jun 2020 13:39:47 +0300
Date: Thu, 11 Jun 2020 13:39:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Luis Alberto Herrera <luisalberto@google.com>
Subject: Re: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Message-ID: <20200611103947.GC247495@lahna.fi.intel.com>
References: <20200610224652.64336-1-luisalberto@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610224652.64336-1-luisalberto@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_033953_160139_BE5B928A 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 tudor.ambarus@microchip.com, Jethro Beekman <jethro@fortanix.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jun 10, 2020 at 10:46:49PM +0000, Luis Alberto Herrera wrote:
> This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
> for poll_timout". That change introduces a performance regression when
> reading sequentially from flash. Logging calls to intel_spi_read without
> this change we get:
> 
> Start MTD read
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> End MTD read
> 
> With this change:
> 
> Start MTD read
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> End MTD read
> 
> Signed-off-by: Luis Alberto Herrera <luisalberto@google.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
