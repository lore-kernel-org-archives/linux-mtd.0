Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9815C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:27:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FC920758
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 09:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+L4GjM9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U5pQQ/8S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FC920758
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qzpynFpY3JoRTwu8VyWyAnZDeFWrrjLBy+PDTPPfSSE=; b=M+L4GjM9iwZYg+IQiGhaJI4Ho
	I3mIeSE4dXPB4Lx3IDR/+k44aDTU2BTx5FPcWKJ8KdgZskSJqyDm/XvK9gRDr3ZB53yYdOM4etNci
	09VQkFuX34SFEiHHEMY+gfha46wjdwWhGabMXiC/w+23Q+zAfpQjxa/NQRBRn4Zvi+xxoL6sifiD0
	nP/ZkFyUV1RonV6qcCWIsvoWrize5azD4F5q5cf86EJFL8Df2dbzBpxphtxfrhSBPvRr8OS1ktaXU
	J5bJGrj/D7gC2+bybtN2Xr1ED8oZ2tQFPQ3naqDP4JudJsRQAGHGyawXWnuMnpBbZUm3V0kqiLIQ4
	pHrNeC1dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juujH-0007A3-KG; Mon, 13 Jul 2020 09:26:31 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juujE-00078o-An
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 09:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594632388; x=1626168388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sc+KWNIo6p/iCBHx1epfb0sdu87u2/k/YmWGZO/3aaE=;
 b=U5pQQ/8S9UVqsWk0YvTluKFJECPqbsl7Vh/nkq/tidUWfOgAHgmW8x3e
 4NgIX2pilRjD32jct+mz0dfoc642Kc+20K3uFk9/uDI5N8AeDvS9UwcMr
 vQ/SkXGhyBeBiHBBIFq+fn3TfETLTDptgT/WfAkB+c3M3zNCP/QauKIh7
 p9xEye+yA9aIgsPPx+f9tsj3vVcImh8/GPOsWB8VhI8qctv3R61CeVa20
 34pkNYJTs4uvRuFRISSlGpmgjCdv83VbBc/lBPMV/rTLskzvPkSfejwSe
 /oe3r24vAdDzpEzJJ28wRnnmDnSxP54FUYjS7Yxc/9lmAG27OH4SsoINQ g==;
IronPort-SDR: cXDMEgZ1lhxdGHI89qfYHNn8m9e8EfsV0PD9Imb2nXXiofaJfy4gliLLI1NJwhqxIhnm87fv8z
 zgqgG2gaP/YZPrO2SQSoDFebzyxttKXYsSo4kN5JG4Tc8qxu+xD4jDPz+cko4PUTBDpp7ScdYC
 y3Xctrtn7ALBMcThj2UC029hvJnS8NG6Y+yooMWBv5ImHMTsoe9Q4I9y61rWeAX29UYl9og4/B
 W+Ib52dKzabVRYSjQP9z+vRFRx8dUsrtk4q1Wlih9fM3ByyTRjVJofRrwbweuzWUs0CanvoDQ4
 f9M=
X-IronPort-AV: E=Sophos;i="5.75,347,1589266800"; d="scan'208";a="18947325"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2020 02:26:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 13 Jul 2020 02:25:53 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 13 Jul 2020 02:26:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, "kuwano.takahiro@gmail.com"
 <kuwano.takahiro@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
Date: Mon, 13 Jul 2020 12:26:19 +0300
Message-ID: <159463163327.204564.1606113601564542018.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
References: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_052628_570530_9A0F57DB 
X-CRM114-Status: UNSURE (   4.91  )
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
Cc: vigneshr@ti.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 richard@nod.at, Takahiro Kuwano <Takahiro.Kuwano@cypress.com>,
 miquel.raynal@bootlin.com, Bacem.Daassi@cypress.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jun 2020 14:16:50 +0900, kuwano.takahiro@gmail.com wrote:
> The s70fl01gs is a dual die stack of two s25fl512s die with dedicated chip
> select pins to each. Tested with the device and confirmed that is working
> as two s25fl512s devices. The current device ID in the flash_info table
> matches with s70fs01gs which does not work with current MTD.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
      https://git.kernel.org/mtd/c/8c8f97573eb3

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
