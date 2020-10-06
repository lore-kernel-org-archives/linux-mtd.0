Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1E2C4363D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 11:45:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE3C2078E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 11:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MruMwfVB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GnzJZ4Fv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pzgjT2BV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FE3C2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=639zloNRISNNIhZ5oiTZZ5J8n1IN475FsfhyLN0TYU0=; b=MruMwfVBaTSyNinR3JAvl9nzSX
	hEKAqAFSiojfj+oJsWKvaTPUNj1N/7+ydDVP8V9XrK/ZIqfmNKLYMZZDwmvKYmLjCNJ970+zsRu56
	x8hLZ8xIjrdf6aL9uNXN2Cqblt4Am+5D/70c0bnq83f0rhqcUGUAR1OtgcCbZdIyZXckCJb0IMrTV
	XNMmttNGYiBAYURz44wR8Eq5r58kBgL6kyP9Tr+BR5c4qr9TVWYWxFeHNEWFY/07YIBM2KalvbisX
	AOnMHfFc3A8SxFSVFFH4tKg1a8J9WVKySpA3eOAMpLH5TWLxB41yYJnz86MlY8mB0rO/uWLxodRpC
	triULpdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPlOP-0005bB-Vt; Tue, 06 Oct 2020 11:44:30 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPlOM-0005aZ-Pc
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 11:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601984666; x=1633520666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HyEHdxpzCqQPDE9KOl5WdvgooN1P3k6kHUj8sK3EUrA=;
 b=GnzJZ4FvrkEmH7TR6SJfj1lpv733ZRN4OBXabSGynShLI4ZPO/9hGsxT
 wsNl2a6B6LGvVmffpql+bFFzIWEwe1gZqwsnIPIs+GcOLhJAkq8x8dvBd
 CoKIxqSO6QkI45u8Bx5HMW+a+P7jdN/pRu/kCGOpqmNAx7dToUi4bImz9
 lHV7yZh5LAR+JFyqiYP7duoRilO72KCQ8lnovIq4RsbU9vNMCyIjCjNRB
 H9uQ+YWikmjmZ+QC1BZ4VfIEEgwmwlQGZJrECL870d/TMujDFKALErShw
 ZaA2646OKSL3JFV/xra+TkTL3p6QZt2bUssr6H6L0yDHLZ04rcKArv1+I g==;
IronPort-SDR: 1Wk3BKJpWzvJp6Yad5pe5JAgrAZSTDAg/9en/RUYLa2dYDgKbxOWB6sVFqHa+gBTm+DKkUCKOg
 eCmgKXCIC1W79dEQd1bLYoPtLkmGt/Vx04gEtFGvYNrvIAHs16n1gpIk+Muth2uZTQkiY3TsE+
 LuvH1ZTScfnGFYYYDLpJMNLHFUvdma7e8afyZ+XcBUgPDA2p0xJY3HfKAAknx/XIWfIYdmOmbY
 9jHSXVqM2kghMVBVHEN69n8i7dyDcTy9CHJfu62Mu2nUyTXzp6/Wejn2RVEWRqIVl0Qsqxvl8j
 fUk=
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="94362825"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Oct 2020 04:44:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 6 Oct 2020 04:44:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 6 Oct 2020 04:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK7OXhjJseNuajO2D0xIRlVASPPzrvpzvVSnrYdD7bjJulv8YuIB7nohHR4rvNBg5XMn7Bpkt64HkVzgWodzrPiVBbpBqFrgesxNWhxQMDbZz6OIXpj1dCV7Sf+mN9b1wEFIAsDTujmwaf6fB6Ci2ojaCIwy0BXLtpSEUZOeHdvPt1vcNAu+JOjTZTcffyH7BvSb1gG096rak+wASvCkWAuJS2A/MrVIVKyHYZmftmDDcfSnO7NB9fcLB9UWyeF/Fgb8cG4o5OpLLzDMbs7tWarDQhbNU7C2WlxquMlM2u3m/3OmIBe62wq9/e6scKNvpqIXhe1aFaSv1/7vIe2+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyEHdxpzCqQPDE9KOl5WdvgooN1P3k6kHUj8sK3EUrA=;
 b=ZfCVGP5PLShw5eigF3XBFgJziH/r9iFqeIcxcISMLBymZitDLGyo+pKfZpvksvPdB+tpp9oj99lQ02NcMROFFCO+fsGDxHNaz8CiYZppkCTWcr+sJRqssDRKFZL2nvKWkJysnF9HUdwvxdBhEwpUu19j0ps+rCUrVn/Vwbm/tm7B9G0Chqy/p8NphqCTzMDuCK/jXqBub0MpRir14bViIgnWZ8WmBY7tFksWK6NWcRqagnKGv0BH3s22VXPn9hEmrlt1fRuWE4QLofEh/8x+F86TYPVHctXus8vAW7ppScd0T2bkL+NXdggARxSRd4Obe/Q3XGXrBFB0GPWBN2Lmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyEHdxpzCqQPDE9KOl5WdvgooN1P3k6kHUj8sK3EUrA=;
 b=pzgjT2BVRR0ytpTV5bCr/vciDTGbkclJ4Ve2XMbOjhEhV+yJvEUGrZlkz/32z1u4Kn8qZjjpd+lEVuwf7DU6Yyp6GTnnqkSjpX03cOwvOJP2/TDzYcavgFXZw5vUIqoQqLKIOJpTrAUlvHJH/Guu3/4YcC40uJRODheuaoiumiQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 11:44:23 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3455.021; Tue, 6 Oct 2020
 11:44:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bert@biot.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix address width on flash chips > 16MB
Thread-Topic: [PATCH v2] mtd: spi-nor: Fix address width on flash chips > 16MB
Thread-Index: AQHWm9YHYn9h83ZKS0S/mMEMTqJKHg==
Date: Tue, 6 Oct 2020 11:44:23 +0000
Message-ID: <fa017eb8-2927-8560-7744-65592eb5a391@microchip.com>
References: <20201004213204.11584-1-bert@biot.com>
In-Reply-To: <20201004213204.11584-1-bert@biot.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: biot.com; dkim=none (message not signed)
 header.d=none;biot.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 537d9ca4-e645-48c6-8dcc-08d869ed2bd8
x-ms-traffictypediagnostic: SN6PR11MB3245:
x-microsoft-antispam-prvs: <SN6PR11MB3245A1576CDB9306A22E6806F00D0@SN6PR11MB3245.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:409;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6upj5UycWuQJU6wXTUR76zW0U+/gbQ5Mbb2i+pLFvEsohPZcSbM79Qnozrwt4pWbRqgV26co6f/SN5h37S7sqrhHV9/rGiI2v7HYRLZwV38K1QRiT01ignyxek3klzxVqkKhxxXKQrEA89W07Kp1DVXFGQrLhAHN0vavQGrTYNSKSVEGf+1kvIMvc0OoRk1fYMZhIN8Cu5/tnpeW8/z/nE15jVitz0+/mmjcwh9uSMV2FSM9LgJvy2zOA6DdMhjfjUJMF3yWrPSDqgMAZ4Vhdca8IdMGqDPpKUprrGLVLqWBECfUGwx4PA0M2aY7op5iSqFJSZ5O6kY0+Sq5fUFyO1vrs314iD0niF+++ZJev4wn8PROUN5cPkVtJycJJXj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(396003)(376002)(136003)(478600001)(31696002)(71200400001)(83380400001)(86362001)(66446008)(66476007)(8936002)(66946007)(64756008)(66556008)(6512007)(8676002)(76116006)(5660300002)(36756003)(53546011)(31686004)(2906002)(2616005)(6486002)(110136005)(316002)(6506007)(186003)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0EnI3+ayg9m9sTZuBGAB/7W/euVnSFWYWj81StjXNgCmlj+vOfFa2E4Kfb0uqN1WXd1nh4YfQY+H9ohPjrGe4Ia/HZ5G6M+ozogcX1rJw3whifYGSdno6U+BBoTalDa53XfSu5IefiwCGR0qzdqKNqElsXluuHm937Z8i1L9mgYSpqFXyll2XnLYFUYLUZ4YZ5dxeq/n64CFIPcQPRcp1q79+NvHVeAHv8j9CLvn0WYHbwGmtFSCK/MAx2VnqtzopcLRL+CN/ukY+/MbTZhZiAoRe3AKXQohKYRox6SV4vtSs9iM0mPc3gobVL/bqGT4LGdCrlwqU6w2XKfey1Nv2nXOtqsbHrrAIUMq/PRYHZ3qrb9KKlROwC9AcQhl8sGjSCyN5o3umLGVmnODMA9oWylKmOO2UKMfq+Rsoc2xBhHVewsX6b2WfEx/piRMNvMOEX2TpFwZtDuPx+K2mGRp6Nv/MuHXFKSSMiw3slvZQXeyQMKGe6hg49g3zT7ocrJoefnKXvc07c1ByLRvEEW4Tzs9d7GHJ0NxI1ORFnaSid9RY99rLPW5Iw/68ayP7xw0Sqe0NLiBO7J2V1SHpysN6MIF59Xw8I8UOG5NsVkhKPWaOn6Qcm8SutybmMuSqGQxh22dpplVg/YFkFm09QwpMw==
x-ms-exchange-transport-forked: True
Content-ID: <B500135147064C42AC99E11FB6AA3D6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537d9ca4-e645-48c6-8dcc-08d869ed2bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 11:44:23.4791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qf7WAUL943iJOCYzZKifjH72COxCENlQGxYAIbJao7eGccA0/fmgDrSe+C9VowSiK31bLJdm5iQ13wK4QdmJka33J+W7+NmHf0kFNzpL0OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_074426_988827_07F09DD4 
X-CRM114-Status: GOOD (  20.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/5/20 12:32 AM, Bert Vermeulen wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> If a flash chip has more than 16MB capacity but its BFPT reports
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
> 
> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> did get set. This fixes that check.
> 
the problem was uncovered with commit f9acd7fa80be, so maybe a Fixes tag
will help.

Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
> Signed-off-by: Bert Vermeulen <bert@biot.com>

We can have this automatically in the stable tree by adding the tag:

Cc: stable@vger.kernel.org

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..a2c35ad9645c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>                 /* already configured from SFDP */
>         } else if (nor->info->addr_width) {
>                 nor->addr_width = nor->info->addr_width;
> -       } else if (nor->mtd.size > 0x1000000) {
> -               /* enable 4-byte addressing if the device exceeds 16MiB */
> -               nor->addr_width = 4;
>         } else {
>                 nor->addr_width = 3;
>         }
> 
> +       if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> +               /* enable 4-byte addressing if the device exceeds 16MiB */
> +               nor->addr_width = 4;
> +       }
> +
>         if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
>                 dev_dbg(nor->dev, "address width is too large: %u\n",
>                         nor->addr_width);
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
