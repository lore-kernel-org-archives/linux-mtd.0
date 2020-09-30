Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FF1C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:29:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6BC20EDD
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BD65GgUP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P9V/byVJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F6BC20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EOHWXivt0AWpP3PwJiY9mIMSux+lEmAFxDlp9uaNBfM=; b=BD65GgUPTV8qiKS0860lCODqp
	jjzj9DmizUR8WUPneUXVwtEVmzhEYIWXkbGx5rkXnzzh/S9R7W+4XuRbcPP/mH/vSeSWSYNzmrY7j
	n3ukzOXjZzoWeZjuVreeW92+POaLBoVAqAU3pPx+mvr5C4QNxtL57KR754NeJQZbPQH4telKEn/Zr
	9+4a2hbrzEyI3g0+Zc8cpNcx97BFr7n5gmpZH38t24Pk0bUy/PVfAMx2mcylRzDQSrd+zfuBKUh2s
	mQBlZ+Olsh+vxYbyFyA9trJjDRQ/FfkAN/tcSRok5pC693pD3OOwg2LiepzXdc62QCzevPYtNV0V8
	zAQ9emlIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXSz-00024H-Fn; Wed, 30 Sep 2020 08:28:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXSx-00023i-Oj
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:28:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U8RtCA016363;
 Wed, 30 Sep 2020 03:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601454475;
 bh=8JdpRbJ74Ne4r+saV14wPMRRgvRusJVpZ6c9SL1M234=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=P9V/byVJgzMR46mj0UzMKC8f+JAg91FWPlV7stelCbbAgddFqgZwFvH+7E2Ds3EMZ
 aCJpn65cF88rUYGx1bizK0LU/9ipaf2aNt3n2ZHwTRDPSe0d2n5WLqGv9ekSp+9S+p
 MPaBVqJDwYdhDjQjegNFyunv7KcaHcBO3gUWQGQI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U8RtqX033168
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 03:27:55 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:27:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:27:55 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8RpZV083330;
 Wed, 30 Sep 2020 03:27:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 0/4] mtd: hyperbus: hbmc-am654: Add DMA support
Date: Wed, 30 Sep 2020 13:57:49 +0530
Message-ID: <160145373830.11652.18386065887476104991.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924081214.16934-1-vigneshr@ti.com>
References: <20200924081214.16934-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_042759_861174_E554F754 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 13:42:10 +0530, Vignesh Raghavendra wrote:
> This series add DMA support for reading data from HyperBus memory
> devices for TI's AM654/J721e SoCs
> 
> With DMA there is ~5x improvement in read througput.
> 
> v2:
> Fix DMAengine APIs usage issues pointed out by Peter.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next, thanks!
[1/4] mtd: hyperbus: Provide per device private pointer
      https://git.kernel.org/mtd/c/714fb2fbe7
[2/4] mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access
      https://git.kernel.org/mtd/c/aca31ce968
[3/4] mtd: hyperbus: hbmc-am654: Drop pm_runtime* calls from probe
      https://git.kernel.org/mtd/c/992df3bb35
[4/4] mtd: hyperbus: hbmc-am654: Add DMA support for reads
      https://git.kernel.org/mtd/c/00c9cf49a6

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
