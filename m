Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AF2C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 05:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B5620870
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 05:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZIJ7O8g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c2sRdplL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B5620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DSKoZrRuG7+ESvq/2dQbiclG1luA5JTbC2LzmQ5R09g=; b=bZIJ7O8g84uAfjd8h0F2B+rHQ
	Loly3YWwpfBC8J2xZF2l9GQvrZxqL+KvClsrrJLy0rTVQ3J8OCgVMy1dZq2VDDoan7piCmuHfJMkf
	osToRzrVDt9dvqHaQn0W8q8deE5DHmVZpoKsTMm3f13rVR34jJ75PDFMXgOVSBCydcSutci9seMDF
	hdf4VDBG7wHLHUy5nfB6EaCa8gNsrEY8apNICCkrJjgcHtsMIvulejUsPBuGZhkc79Ymzi6mgQW7X
	mFaMdb3dj6v6nS6BMll9bZaa9GBY+CtHUSozrocDcvBwCnDUwVdPllAxL57FDVjV7I+znxpRUb3iU
	HAZoSMmOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPfRa-0002SQ-St; Tue, 06 Oct 2020 05:23:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPfRX-0002S7-EP
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 05:23:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0965NI46032902;
 Tue, 6 Oct 2020 00:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601961798;
 bh=5Feol3WKm5zX0b3OB4XP9b2vuJwJd91pvKimsOUKvh8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=c2sRdplLX7OCb71sIS2RGIsBkaCCckZvojwAdRLr60GkzsrsfpUTAyTJlxiYNIW8e
 FZk/fteDhnGUlLw6JfG56IZcXEGpOnfzbQaJf8DEoGbujm772xoItNUMhi5z0ZVZxk
 ar6767SkJeTcpWt9BEzcDKOb8Ma4t0iA0LOvdCrg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0965NIcD049792
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Oct 2020 00:23:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 00:23:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 00:23:18 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0965NFS9062469;
 Tue, 6 Oct 2020 00:23:15 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: Prefer asynchronous probe"
Date: Tue, 6 Oct 2020 10:53:13 +0530
Message-ID: <160196166120.11915.2526794978202188721.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005090321.8724-1-vigneshr@ti.com>
References: <20201005090321.8724-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_012319_606345_DFF862F0 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 14:33:21 +0530, Vignesh Raghavendra wrote:
> This reverts commit 03edda0e1edaa3c2e99239c66e3c14d749318fd6.
> 
> This leads to warn dump like [1] on some platforms and reorders MTD
> devices thus may break user space expectations. So revert the change.
> 
> [1]:
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] Revert "mtd: spi-nor: Prefer asynchronous probe"
      https://git.kernel.org/mtd/c/9a3422a110

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
