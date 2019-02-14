Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6DCC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461D121900
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MbnGrvNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461D121900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2vqGnu8WvFheIc1h3FayP5FXD5pxbJSB5/SxawCNmE=; b=MbnGrvNGYmCB1c
	hqY+pLsOc6/e+MHqqgD+3ZILvb2njuupfrf4sfUL3KOXuyiZQNRHnqXHF7Rcq1OwGz0nhW/jIgH1f
	7tuBiGjFjwT81H/4UeZLl64ie8UUyhBQzdBeZ6bcCJttgMjq3caP2KCyUXSPqW109KHLwAYWnGL+1
	dmjBUo/Dw1l6TJKkqKzjl3Qa4UWlfbeBlNMJdEpKiU7yy7qrm0KMcP0KNVuBmsKqqnuD3K0YNTdiX
	k0dJGhRSUlwr6dfXWL2qy/fSludHPmh96utu2ob50D6dwqMKhxaR9Sr1+7uNxgUKox/x0xpuq0q0L
	4Ii1k+YenaR8K5enmijw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guGd6-0006uB-Ao; Thu, 14 Feb 2019 13:00:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guGcp-0006Us-4w
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 13:00:28 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A9A6D27D7F6;
 Thu, 14 Feb 2019 13:00:21 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "A. Celenk" <ahmet.celenk@procenne.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [V4] mtd: spi-nor: split s25fl128s into s25fl128s0 and s25fl128s1
Date: Thu, 14 Feb 2019 14:00:18 +0100
Message-Id: <20190214130018.29906-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1549952682-9649-1-git-send-email-ahmet.celenk@procenne.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 50685024f273589e91d55f2f5c2f40a96638b942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_050023_831107_CAAFE0BB 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Tue, 2019-02-12 at 06:24:42 UTC, "A. Celenk" wrote:
> From: "Ahmet Celenk" <ahmet.celenk@procenne.com>
> 
> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
> split into two to match the correct JEDEC ID's for each version. Solves
> paging related issues of S25FL128SAGBHI210 chips.
> 
> Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
