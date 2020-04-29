Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3050C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 13:30:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928952085B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 13:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+ewCP6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928952085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjK75B84xyXt8wBccUouFDLN8UlvBKj/irM21fasy5k=; b=E+ewCP6J1pzSpZ
	oDN4G0igie5YhYS6KGSS6vbJY/u1qpuZCQrDVt3WTSYi6Kktu1yvD10uumesgnan6BPMegp/yOSoY
	QET7nw/5LYgwOySqEhTrEG1ufn9eySPHRgpqQoi9rGKbZ7D8vNV/wqf8nt7Gcf2uAHlj4CneBrfRw
	cnWqvl8epTeQGbyWggKZJ+dy01aW5E/Rcjz0gdX4okxKhxaF/yK6kbB9Kaigtw9opD4a4PA1oBC5J
	H46uwcUT0MO+T75Imp1dFrWkhdbSfL+U2K1xCCAZtR9tfVGaXptWTFNW7E1UAohQEwJKrU1ELFHCm
	oxYh7p9oskeRsIaaLoFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmmd-00072C-8Z; Wed, 29 Apr 2020 13:29:51 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmma-00070Z-3g
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 13:29:49 +0000
IronPort-SDR: xXq/IGSaq2ko5K/bAZowkst9YygAekKUe+m0Q2B8hri7a5MIj8qh4Rruu/wvUMhwwEpkwIXNtT
 0yC4x1KM+FBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 06:29:46 -0700
IronPort-SDR: WdiZ3VTqUAC9PwDAok0fNz7oAnmVxNVdLqjv1Gij+Nsbo0DVhNxRuGMqYOBoeta3hm+gxGDjM+
 BFPlQFRaLb6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="247989062"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2020 06:29:46 -0700
Received: from [10.255.166.42] (weehongg-mobl.gar.corp.intel.com
 [10.255.166.42])
 by linux.intel.com (Postfix) with ESMTP id 4E3C15802C8;
 Wed, 29 Apr 2020 06:29:42 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429133308.4f91c35c@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
Date: Wed, 29 Apr 2020 21:29:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429133308.4f91c35c@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_062948_213849_11413517 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

    Thank you very much for the review comments and your time..

On 29/4/2020 7:33 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 18:42:05 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> +#define NAND_WRITE_CMD		(EBU_CON_CS_P_LOW | HSNAND_CLE_OFFS)
>> +#define NAND_WRITE_ADDR		(EBU_CON_CS_P_LOW | HSNAND_ALE_OFFS)
>> +
> 
> I thought we agreed on dropping those definitions.

Yes , we agreed upon it, due to assertion/de-assertion of CS kept it.
Thanks!

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
