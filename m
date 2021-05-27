Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE39EC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8069961181
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8069961181
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDgEy/cc7JjpIIbcr4gyB36x/5nnfF/StJPkkkAffoA=; b=hOlwBPLD7ONUl2
	D4l5qHueOonCcMWSJKIpR/bEuS+cHix95nOEfAQwhh/NzbCNyD+0Nh1ni/Fe3odFsFdwkeP3NxYNA
	THlDMCuZXfbG86TZrfR1yEy1CQKGA/LFJF+BXLCRusC1mnG9LlVW5KX98FG0vo8AuHqImAR5fre0Y
	F7QsKrUfC0i9cDOWWpz/TL+bB5Kr6xkWmAZ95fPaPbDAbepROdVlQPgTfeAGZQUpwuWuGTsoYbm/R
	2jED1pmavzA/XdI9YRjx4Rv+J88eTVLc4I4CY8UqvmUInJLOPdC646scbWosxsFSJbajypn2MoqA1
	lf/tOQHazLBkF6aRSo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHC2-006rec-AG; Thu, 27 May 2021 14:41:02 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGg3-006aVb-L4
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 14:08:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RE7ujt026122;
 Thu, 27 May 2021 09:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622124476;
 bh=mN4S682wd8UcedJoUsd+cmh9EgUisPUpdvR5ONvh+AY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=C3lian4TP/MYaHLhA31LEUdif9/I45E0UFl/5JjzQ+brSS0Zn/KOcLL+ARNyN1YGW
 r+b6m4i7vLAHf7wRlTusN7CQBJDtOMdGic6PDVD37nwyZQP3QOZSHAGEJ1HfR0D8PI
 DHl4rm5rqFyzPYM/FzsNAwBYlaPBj93sEKiEzMI4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RE7umh045458
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 09:07:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 09:07:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 09:07:56 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RE7qi9099432;
 Thu, 27 May 2021 09:07:53 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add documentation for spi_nor_soft_reset()
Date: Thu, 27 May 2021 19:37:44 +0530
Message-ID: <162212417122.9400.10979239903864354902.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511093958.17258-1-p.yadav@ti.com>
References: <20210511093958.17258-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_070759_841314_786DE6B5 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, 11 May 2021 15:09:58 +0530, Pratyush Yadav wrote:
> Document what the function does and that it should only be used when it
> is known that the device supports it. This will avoid unaware
> programmers thinking that they can arbitrarily use it to reset the
> device.

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: Add documentation for spi_nor_soft_reset()
      https://git.kernel.org/mtd/c/ccfb7cf18f

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
