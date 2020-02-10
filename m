Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E6CC352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 08:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09A320733
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 08:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fQS4ZpA6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MlgjgnoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F09A320733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqSulYpI8RYghXhBo9diG/VZ/CmWCpNNL4YvASI7Cb0=; b=fQS4ZpA6AcAL7/
	zmZfO/IcYSAQbRr4bpmiJskDJ4GKzVqr1DhdDMTpkRavydzvJ3msPfHM+QAH5I07Vhbbi8CRiB4sz
	ijw+ZMdSTRhWupWHexa9RzShlmWKHz+iVdtoKppsBgqHD6dQ5Dt3YDPDHWsYeLZJ9oaz4daIWZZi5
	jiZjtli1Irzmvd1SrV3guL15mM4ddsbS4mb7DuFNb66/P3sxPMxW1sttnqixzexKXGnbTzO28sisZ
	QwMGv8x/zQAkFk+PH+IQqLVyxJ6U2DL7zl0Z9NvwJ7Buh4SHLHJpWQS00oE7PxsDh+H0h0CdmC6s4
	IoSL+OGQpqmsW1GG1tSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j14d0-0003cY-H1; Mon, 10 Feb 2020 08:41:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j14cq-0003Sp-OI; Mon, 10 Feb 2020 08:41:06 +0000
X-UUID: 78f00cbbde854adc8629ad60cc099217-20200210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Jme6XnUcV22sv+Lb0GfidwDPAVP5wJkTpFliBwJ3cpI=; 
 b=MlgjgnoIA4AD4sGad07cNjNs9aeX4kPOkUBvg6aJe/XqqKbp6z7t+WdI8EyBQG7wwk4xzFLVfTa+JAxwf9PZ2n7AHIwcbS7t1WZ32/TY3Vt36qp+4oPBYAJm/RO/vCS/hK5rMBvIQNeNet3kupcf44gHZJvloGaQBGVgtKNZf/Y=;
X-UUID: 78f00cbbde854adc8629ad60cc099217-20200210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1163598211; Mon, 10 Feb 2020 00:40:59 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 00:30:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 10 Feb 2020 16:31:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Feb 2020 16:31:12 +0800
Message-ID: <1581323455.2213.6.camel@mtksdaap41>
Subject: Re: [PATCH v2] mtd: mtk-quadspi: add support for DMA reading
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 10 Feb 2020 16:30:55 +0800
In-Reply-To: <20200208084022.193231-1-gch981213@gmail.com>
References: <20200208084022.193231-1-gch981213@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_004104_796155_322B26E2 
X-CRM114-Status: GOOD (  10.78  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-02-08 at 16:40 +0800, Chuanhong Guo wrote:
> PIO reading mode on this controller is pretty inefficient
> (one cmd+addr+dummy sequence reads only one byte)
> This patch adds support for reading using DMA mode which increases
> reading speed from 1MB/s to 4MB/s
> 
> DMA busy checking is implemented with readl_poll_timeout because
> I don't have access to IRQ-related docs. The speed increment comes
> from those saved cmd+addr+dummy clocks.

Hi Chuanhong,

Thanks for your patch, I'm checking with Guochun to see if we could
release IRQ related information to you.


> This controller requires that DMA source/destination address and
> reading length should be 16-byte aligned. We use a bounce buffer if
> one of them is not aligned, read more than what we need, and copy
> data from corresponding buffer offset.

I've checked with our HW guys. The limitation is on DRAM only.
So for read we should check buffer and length to make sure it is
aligned, but don't need to check from.

Joe.C

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
