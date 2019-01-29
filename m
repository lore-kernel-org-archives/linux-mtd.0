Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D7C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 08:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB921214DA
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 08:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T92VtFtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB921214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlQorQsFpBk5FYQDD/tcI0jGBPztcxRI76vCwqhExhE=; b=T92VtFtwKfLZyU
	4sUPhrC9cbd+d8brjI5iSFW7fNziSeN2VE2OYyVhGvOwwQMSiUPiGHANy5NKqFFuOqgYbdAVFBscE
	pRhxdb4vSIXncIBgSLh/ztUT2ahccexjjPbTxvOIXFHRVldlpa2XJHTbp2mSr888CUIuTkeAg1LXM
	BpoZ9kbe3iHfnS/iRMJ2mCzCamOzLSIFxiovps1IFVhBfp1zQtyu47e2QwxR0281JaMSMe1Vc0oig
	lH8AUdyUoU8LlWj9rykwrowX/mYzKbxGUgoIEXWiagUjIpc97CjfJWxXqzC6jWy9xLe/3+Wv94abX
	Gi6ifedCFVYRgO8mcs1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goP1u-0002d2-Jf; Tue, 29 Jan 2019 08:46:02 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goP1r-0002Th-Ep
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 08:46:01 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 4328F6A97A7;
 Tue, 29 Jan 2019 09:45:53 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 29 Jan
 2019 09:45:52 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Tue, 29 Jan 2019 09:45:52 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info
Thread-Topic: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info
Thread-Index: AQHUt60C8UqS3FnMwUazAVqci9fJ16XF3fYA
Date: Tue, 29 Jan 2019 08:45:52 +0000
Message-ID: <0a8ae87a-5c71-0d07-e3c0-b3f665f4ea35@kontron.de>
References: <1548750550-23565-1-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1548750550-23565-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <1BA1732D09912D4C94190E3C2F1947D7@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 4328F6A97A7.AE885
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, broonie@kernel.org,
 computersforpeace@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-next@vger.kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 sfr@canb.auug.org.au, yogeshnarayan.gaur@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_004559_661095_3C7B4995 
X-CRM114-Status: GOOD (  12.23  )
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
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.01.19 09:31, Yogesh Narayan Gaur wrote:
> Add MODULE_LICENSE info to fix below warning:
> WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o
> 
> Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> ---
>   drivers/spi/spi-nxp-fspi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 0327216ef7aa..90f3d2e4fe5d 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1103,3 +1103,4 @@ MODULE_AUTHOR("NXP Semiconductor");
>   MODULE_AUTHOR("Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>");
>   MODULE_AUTHOR("Boris Brezillion <bbrezillon@kernel.org>");

I just found a typo in Boris' last name when I looked at this diff. The 
second 'i' is too much.
The same typo can also be found in the comment header of the file.

>   MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
> +MODULE_LICENSE("GPL v2");
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
