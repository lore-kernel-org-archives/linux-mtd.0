Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CC9C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7245B207ED
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 10:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quB0MBf2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7245B207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2EywJ8knnoPWA+qitpxAlCUlIF4AzKG1StMtfl+48Y=; b=quB0MBf2KtNBYh
	gvlVg41lKaH1fEGW0njPSbBM3b8X8yngiwFmXRxBxDdLHXkPqqCZIHLexDVL/SVfDT1J66Mma3tmO
	eyCSnqSTy5e6D4WzgNOL2BU32v/c+bRRKBxSeAX3YkY3e/p9pwC1JNxkV/s4PcA6a+seOakaPW/9S
	0j5ih8aP/eT4KjI9rbDd9lNlu5v/pCIoW/jp0cw/aJXTUsSmIwGAAhY0UdMModLeiFsU9yUiWemjY
	5XR621dAAZOec88wMGSdoGDD3g39PnI9R4bRCocDIoq/ELTCNxgtzzljXAWf5XBh/vd3A4QqL/nWn
	ua3/RWCJNUX637QMisbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbLu8-0007Jf-Lu; Wed, 20 May 2020 10:24:52 +0000
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbLsq-0006Ni-Gj
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 10:23:40 +0000
Received: from belgarion ([86.210.245.36]) by mwinf5d33 with ME
 id gyPT2200D0nqnCN03yPTG4; Wed, 20 May 2020 12:23:30 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 20 May 2020 12:23:30 +0200
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: rawnand: Remove the cmx270 NAND controller driver
References: <20200518163300.304732-1-boris.brezillon@collabora.com>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 20 May 2020 12:23:14 +0200
In-Reply-To: <20200518163300.304732-1-boris.brezillon@collabora.com> (Boris
 Brezillon's message of "Mon, 18 May 2020 18:33:00 +0200")
Message-ID: <87d06yoqgd.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_032332_852539_F46185B4 
X-CRM114-Status: GOOD (  12.80  )
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
 Richard Weinberger <richard@nod.at>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Boris Brezillon <boris.brezillon@collabora.com> writes:

> The CM-X270 board has been removed, we can remove the custom NAND
> driver as well.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * Update the commit message
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
