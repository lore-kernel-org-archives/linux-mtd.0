Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4751C04AAF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 01:33:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF1C2082E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 01:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwdeAo+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF1C2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xRrm8mc+PWZPaNxEfDXLlOGOwYTS0u8owEkWh1A7gM=; b=VwdeAo+KEFAL/M
	DBa5ho1iFEtNM4PnTqvvaJQwzZSoPPdsTon5Fjg6ALKr1r6ZY1x6nY3V+s7IR6YMQ2jUkBE11CUa+
	Mvw7WbtYnnnWnpnHH4WfS08ISvQEOg0SBCgNPfOIgdDg+qStpW9P5P9YqvFrOjroW0fAvsqv1HVY7
	hyiXn7PezIlqluh18NHqx+4uD0EyTLMYgZzCG3C44oEwhfk/XeCh5NsRpJFLXJCAeIFS5uloZnWEt
	IaMFMCX+IjmDY8/P3GoPcdlyT3NMhJbCGahz+VvDj37JZmS/mJSen9wuK7MghvNy/lIp3snhRO+6R
	ROhSrPMfpfLbpKmhXSJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRRkC-0004Ks-QD; Fri, 17 May 2019 01:33:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRRk7-0004KJ-Oa; Fri, 17 May 2019 01:33:06 +0000
X-UUID: 240b116df51d4af4bced219bf8999b33-20190516
X-UUID: 240b116df51d4af4bced219bf8999b33-20190516
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1481420559; Thu, 16 May 2019 17:32:51 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 18:32:50 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs03n2.mediatek.inc
 (172.21.101.182) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 17 May 2019 09:32:48 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 17 May 2019 09:32:47 +0800
Message-ID: <1558056767.26455.98.camel@mhfsdcap03>
Subject: Re: [PATCH v3 0/4] MTK NAND driver improvements and fixes
From: xiaolei li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>
Date: Fri, 17 May 2019 09:32:47 +0800
In-Reply-To: <20190507102541.34341-1-xiaolei.li@mediatek.com>
References: <20190507102541.34341-1-xiaolei.li@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DEDBB04AA2B29EFE1166FD095A42ECA9DBA2B78EACBE6B0BD84B2E65F0ACEF0D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_183303_805837_45DA9EFE 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Sorry to bother you, but may I ask if it is fine to accept this patch
set now, patches all with your review.

Thanks,
Xiaolei

On Tue, 2019-05-07 at 18:25 +0800, Xiaolei Li wrote:
> The following patch set mainly contains:
> * Fix low level time calculation of read/write cycle to meet tRC_min
>   and tWC_min requirements.
> * Refine RE# pulse width calculation and data sampling to improve read
>   performance.
> * Add CS validity check.
> * Fix oob buffer pointer wrongly setting.
> 
> Changes on v3 relative to:
> --------------------
> 
> tree    : https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/
> branch  : nand/next
> commit  :
>         'commit 1c14fe2167ef ("mtd: nandsim: switch to exec_op interface")
> 
> Patch v3:
> ---------
> - Fix some comment style.
> - Format patch base branch: nand/next
> - Pend to sent patch "mtd: rawnand: mtk: Setup empty page threshold
>   correctly", because it seems that we should confirm this change has no
>   side effect and need more test.
> 
> Patch v2:
> ---------
> - Fix type
> - Reference correct faulty patch
> - Refine code to do calculation and condition in separate steps
> - Fix empty threshold calculation
> 
> Tests:
> ------
> 
> * ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA by
>   'dd' command.
> * all drivers/mtd/tests/* pass.
> * speed test:
>   eraseblock write speed is 11087 KiB/s
>   eraseblock read speed is 19986 KiB/s
>   page write speed is 10689 KiB/s
>   page read speed is 18724 KiB/s
>   2 page write speed is 10611 KiB/s
>   2 page read speed is 18713 KiB/s
>   erase speed is 103696 KiB/s
>   2x multi-block erase speed is 354248 KiB/s
>   4x multi-block erase speed is 350459 KiB/s
>   8x multi-block erase speed is 356173 KiB/s
>   16x multi-block erase speed is 356173 KiB/s
>   32x multi-block erase speed is 358120 KiB/s
>   64x multi-block erase speed is 356173 KiB/s
> 
> Xiaolei Li (4):
>   mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
>   mtd: rawnand: mtk: Improve data sampling timing for read cycle
>   mtd: rawnand: mtk: Add validity check for CE# pin setting
>   mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue
> 
>  drivers/mtd/nand/raw/mtk_nand.c | 84 +++++++++++++++++++++++++++------
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
