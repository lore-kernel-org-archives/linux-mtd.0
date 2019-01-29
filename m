Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D67C282D0
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 11:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A573218A3
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 11:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6nqqOVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A573218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7opdCUu4NsiwPQ7j0NaoVCtLmZ49S11M8aUkB5XXKY=; b=s6nqqOVy/EMePT
	PxV5SCrgqCtFbADVxrTtNazbG4cXVLXLKGVbNCiNUidq9fXJ+nW75dsG2XzREdZlFUd4e3Z7ZCFlb
	yWuHT4r24LLk9zS9NfRSN7Q7Qnmy/+3PP7oz7QLc01V2J9ugDlIaMra8OwQ5NHkKu2ZlqZP3w/m8w
	T5jAPTYJy7B1SIlFjqy3XbtcJEwhu0ew84pP1tO7fLvTgHcOf7/d9zRv5Y6nUw/9hIJavKW9FT7ee
	nci4Kp9rzs68GXVuFY9YEyb0gETLdEJ0FwyWG4+i1o02f/WinrPKFr8cOtcSl92yPoqmmmV8WYGw4
	7jP5Y1309vApXShDmRXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goRqi-0004d0-7m; Tue, 29 Jan 2019 11:46:40 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goRqY-0004V0-Py
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 11:46:33 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 88CC467A6F2;
 Tue, 29 Jan 2019 12:46:03 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 29 Jan
 2019 12:46:03 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Tue, 29 Jan 2019 12:46:03 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Topic: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Index: AQHUt7jCop3Mc0YUEkGW97blapUdPKXGEDYA
Date: Tue, 29 Jan 2019 11:46:02 +0000
Message-ID: <4759d7a9-71a2-70a7-2704-0ef7fa37b2ca@kontron.de>
References: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <E72C4CE49EAAC148BF6512A7604DC5F6@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 88CC467A6F2.AFE61
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, broonie@kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-next@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, yogeshnarayan.gaur@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_034631_171902_2E54C81C 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.01.19 10:55, Yogesh Narayan Gaur wrote:
> Typo fix in Author Boris Brezillon last name and update with new
> email address.
> 
> Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>

Oh, so this was my typo in the first place and you just copied it ;)
Thanks for sending the patch.

Mark, could you please squash this with the original commit 
(84d043185dbe spi: Add a driver for the Freescale/NXP QuadSPI 
controller) in spi-next?

Acked-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/spi/spi-fsl-qspi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> index f0a340026ba4..6a713f78a62e 100644
> --- a/drivers/spi/spi-fsl-qspi.c
> +++ b/drivers/spi/spi-fsl-qspi.c
> @@ -10,7 +10,7 @@
>    *
>    * Transition to SPI MEM interface:
>    * Authors:
> - *     Boris Brezillion <boris.brezillon@bootlin.com>
> + *     Boris Brezillon <bbrezillon@kernel.org>
>    *     Frieder Schrempf <frieder.schrempf@kontron.de>
>    *     Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
>    *     Suresh Gupta <suresh.gupta@nxp.com>
> @@ -959,7 +959,7 @@ module_platform_driver(fsl_qspi_driver);
>   
>   MODULE_DESCRIPTION("Freescale QuadSPI Controller Driver");
>   MODULE_AUTHOR("Freescale Semiconductor Inc.");
> -MODULE_AUTHOR("Boris Brezillion <boris.brezillon@bootlin.com>");
> +MODULE_AUTHOR("Boris Brezillon <bbrezillon@kernel.org>");
>   MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
>   MODULE_AUTHOR("Yogesh Gaur <yogeshnarayan.gaur@nxp.com>");
>   MODULE_AUTHOR("Suresh Gupta <suresh.gupta@nxp.com>");
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
