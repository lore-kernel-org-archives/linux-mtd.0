Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC1BC83004
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B772053B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0MsQtuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B772053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/23d4BejWPghiiYHCCC6TrERQMNYV3ax0BeEyvKSdV0=; b=Q0MsQtuv235nwD
	SguSbAP7JkVenf8JXAEo2HIM53eJr4zHom6bMVBf+tA1Qt/aYt+hC+3XzP5rtpKCW6O3PorKFX5d5
	jf/tOKpGR5zDM7WynA/FS7UYgT76EY50oMkCSVfjVosG6GfrruVkE9CtopbNXeU/DecNBQ2Qlh3LP
	+1w6GDF5aM7uVMxdBYgX2SH066uSov1EnxLXf0lwWHaYvsqI/A3Zf4StxHs2ksGBDrIMkWxmZnY+A
	u+wia1JXQuCHTeceIkiHBcbwj9uoOJKAHpl1M11QGf2UbcRvJApgDqJDlPwPwduDTWrcT7+ddlRZz
	em4XYp4AhSktzBLQph6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTLnn-0004by-St; Tue, 28 Apr 2020 08:41:15 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTLnl-0004aQ-1Q
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:41:14 +0000
IronPort-SDR: R1iS2NCISPYi9AuzsW8PMz6j8XLbr7/e/+TFor7opojiBH9PaBMyYmy3mg6tnBKtdM9CU1M1Zk
 n96W7q7jMADQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 01:41:11 -0700
IronPort-SDR: i5YEEhAnHht9VuIi9juMo+L1TdxiW0t9eA9cR3mnbisgDsuV+1R4chvJ73c2NF7zlDNh0Sq4C/
 vnwJISJTtnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="432105519"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2020 01:41:11 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id 7AED45802C8;
 Tue, 28 Apr 2020 01:41:06 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
 <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
 <20200428094049.3c0d4730@xps13>
 <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
 <20200428095459.6727fab0@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <e5afcd41-c8a3-0dc2-8c5d-5328b07b1058@linux.intel.com>
Date: Tue, 28 Apr 2020 16:41:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428095459.6727fab0@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_014113_093150_D356574E 
X-CRM114-Status: GOOD (  11.83  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 28/4/2020 3:54 pm, Miquel Raynal wrote:
> Do we have access to the spec or a register map? We could tell you very
> quickly if it is worth the trouble. But I am pretty sure as well that
> the controller supports more than 1 CS.

Got it, will update the changes to support multiple CS as generic-way.

Thank you!

Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
