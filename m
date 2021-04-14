Return-Path: <SRS0=WaUJ=JL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCA1C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 06:05:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B772A611C9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 06:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B772A611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:CC:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kUeS2OS9V7LEEsVMNM2ZrkTzwVmLfy7/Cxt1Ag7jcw=; b=JIUNMdPG39zAKd6ZbnHIju3D7R
	YZNp6OM6Ivgk4o2r9cCImrF9SXdoDqv0yxpeSXtAmBYYs7jOtUVJ01ok8T8JriG9817WKe4mB5u6b
	acb5ydCSqWNftLsYMpB2YcdfAYsyxEcR/MnRtlJVorq8kIPsd7DaI0xYWmpY5TxEqNfTGwhePrTBu
	wD36QZZS5+ANiEn1SIuw45x6GiCkn4CZW22McB3cF3hGc6TGxd2+a+fac8bTT8YSLnn+p8nUIXgr8
	UHtqj5i5gIMVC+DrozJ/NGyj8p54eMY40k0ZYnVrLQkXwgQHevArfC6M/Q7dCpl72gW9CsfzY7vKg
	EwQkvRTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYdm-00Bc2j-QS; Wed, 14 Apr 2021 06:04:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYdj-00Bc2H-GE
 for linux-mtd@desiato.infradead.org; Wed, 14 Apr 2021 06:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:CC:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HCeVkDQkRNrxMxazo/umoU63nCa2sOF/0awevh8PLw0=; b=h9xlY6wrHQxErUoOHIEpTmbq3R
 kQMjvyh1MJNF+ekvUhuxOZBQmbBst2/WRS/1PFsZbbLiIv3zX83V7wJW0MH2mrNF/si0KI7dLusNG
 DUqp7Xvx2/GN1urx3F0e3JXtJmAw5SUDGNhaNFIhOmbpeBGYDptmQxJpin8teqFaxGu/BieOQH2dE
 Wi4d6V6L2BqPi4FEbndiqC/2kBL/1jI1+GfslBOF5kq2vei36vnhZ74HlputEhCQdPvLyBuIUoeo8
 ucl699wSWcC09vAaYa7/IJEIPWcnASFe2RuOi7JfXJOfoUsGThwXWDBEVBFAK8QLuC4fr46hKp3AG
 3Kx0U4jw==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYdg-007Vvr-PA
 for linux-mtd@lists.infradead.org; Wed, 14 Apr 2021 06:04:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13E64Vp8079349;
 Wed, 14 Apr 2021 01:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1618380271;
 bh=HCeVkDQkRNrxMxazo/umoU63nCa2sOF/0awevh8PLw0=;
 h=To:CC:From:Subject:Date;
 b=k+3qZ1AOljWB5v02V31sIJOBLd9cW2pZKHvGHO74L5lTP0/V2vhWryWmCAAu9t2+o
 zoicYk+qQl1YtbJhMOxV5CtxkSJuoE/z49uOhFCPHCJjEr0+QmpsyrLaTWl/2dBknt
 maOw6kaDfmbj89OiSBJTvcZcU9gZJBcfF8f6+JuI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13E64VwW079584
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Apr 2021 01:04:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 14
 Apr 2021 01:04:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 14 Apr 2021 01:04:30 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13E64SpO046226;
 Wed, 14 Apr 2021 01:04:29 -0500
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: =?UTF-8?Q?=5bGIT_PULL=5d_CFI_and_HyperFlash_changes_for_v5=2e13-rc1?=
 =?UTF-8?B?4oCL?=
Message-ID: <76cae1e2-a1f4-ad3a-3c21-64f4dbd945c1@ti.com>
Date: Wed, 14 Apr 2021 11:34:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_230436_955590_86BAB15B 
X-CRM114-Status: UNSURE (   8.76  )
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

Hi  Miquel, Richard,

Here is the CFI and HyperFlash related PR for v5.13-rc1. Thanks!

Regards
Vignesh

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/for-5.13

for you to fetch changes up to f3907773d60229afa8e6c0a3ee5085715192a9cb:

  mtd: cfi_cmdset_0002: remove redundant assignment to variable timeo (2021-04-08 00:13:19 +0530)

----------------------------------------------------------------
CFI changes

Just a couple of fixes for v5.13-rc1
* Disable broken buffered writes for CFI chips within ID 0x2201
* Address a Coverity report for unused value

----------------------------------------------------------------
Colin Ian King (1):
      mtd: cfi_cmdset_0002: remove redundant assignment to variable timeo

Mauri Sandberg (1):
      mtd: cfi_cmdset_0002: Disable buffered writes for AMD chip 0x2201

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
