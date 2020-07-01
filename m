Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87910C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:50:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CC42073E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YvGT88KA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vyokZfnl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Z9xUml2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CC42073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KxnNsF+fCpNO4u8RE9mJCtPLzQ00I/1tGD+AS8ilsgA=; b=YvGT88KAeAuZCTPbL4zt93k0D
	RM5zZoLpl9RrL0CCtRLJv7nkUqM+KQvmSxgTcPLf9jTsSzaFEpzzDgPH+QbbZkquRXgrgDKg9kNmD
	EEx+SBA+taQ0Y0sw/NBs2RJ+MCL8xAC3YT1BVQoNi+chEejkgw9rrv455L8JdhNuxe2pfDlpcyHEH
	mJP0Nea2P9jgThm36A9Dm8fFnhFx5OcwW0BIwMLw3p7cJPpGEL5l+THd+MlVLzb+KQqwZ88LRQBrl
	VOI3ptiiQHmTiOipzKvQw5BotJgaY0/IEEZTDgl4p3tTu3pECQ+Hyqct50bQ8ChudYdQMi1L1gFkC
	0TqKU03Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXVW-0001yt-FC; Wed, 01 Jul 2020 07:50:14 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXVT-0001ws-HT
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 07:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593589811; x=1625125811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J3kYlYnJ61dfxPpzHR5C9uPJ8o4ZENcdID2xfd+nczI=;
 b=vyokZfnlI9mwVuJI6opDFcT+rSM3q+Xlus++TO05yGw9WtoXLtRazeLM
 P50Rw0hHQ/o0SEU4LnI0uEZwz7rHvHlAb+oV3U83ovVb15ccWUPF6fpPo
 brTA+ESR1TpZ4NCGOuVYJ/gGSkXuwzSX0yZ2GHjchdDe5KOzb83NFEgqD
 szqt/Lm9KsSRAZ2JbPUehATPTPHcUKwvRrK0CktaeZKYz2gYr1AK3zK8k
 ZdSsljymYCoIhDmXVxHhRW+xnEPB47iM1il0lGNqtwhnD6UM7RFkj3dA5
 EnmZ+VEBolJM/EBf3QrpGJgLuFnm1gb2z8AMk3Ri4/bDZpwRIyG+BbYmh g==;
IronPort-SDR: H1NZCgbhNA9UxMY3CfL/0VWs7SYVOglDLHXF7BOzCdJLws/dWlI/I6Z1Zw6DlUDmOLtHfd4NYK
 h75VAghLJU77RhRqng5UOuVL+AegC7qN5NLoY56CmdfzRhEAPqqpfadLR8aXStxmObvBcvF/hx
 v1+/ohAQxaQ/deAIOvXz/f9WStWE8REDV274+LtGMg/o4/j23KcF/jBF3xDdclPwBErYEsQUOg
 fCt98ZkWSyfPCQRZl6PF2NbWSpus50U2O6MWT9G1EI9tTbdfU5+VBZ1wc+eO0Axp4OXDkZNZMD
 0zo=
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="85779390"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Jul 2020 00:50:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 1 Jul 2020 00:50:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 1 Jul 2020 00:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dg30Oj3zojyqNssUqG1+5TzWSx4FxelVfzt+eVDqD9SUdT1v4Ioi+LrSwAHoOklMPLZoYIu2rU6s6AG3SG4CoEu/iCKfYcr/x7jDqmMw1eZxBz/ExuXvdquN8Nobl3eKG3s9THcG42V1X1YEk3UiiOOlrU6kNjvopdHf4RQ2hxFiXCSogYcv/g7HuD0dOG5JVZHXdS2CiTgxfzuDQwmR07uzEHZ7s2yZWz9xSYlMPm6n1eeyFuR2VPriLqpB1gjsGt/t8E0JDuJDIc3C5vqA8Kgi+ZowqFw2G7MlTLUayvarT0ed/cGarIaOFXBUsQfjJWOecghsDutRLUlR8XMQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3kYlYnJ61dfxPpzHR5C9uPJ8o4ZENcdID2xfd+nczI=;
 b=BJEGroazMxdtfBTSr+ENRxIbVGNHIGszCVGUBtWRSHIDPZfvgCKB8V/1diCM4QdZ27olbp0L+EQMgQ2hv9ok/I08ln1h2zsjuPy0rg4j8YTYyBB7VSUUtyW6wrDf6x0gOxQYTCEW+coM+pRmfrk+Pnz37FLTJWOTPGbpZ5uyQ9Wa6KI+WE8RDiWhoAdyw24pbvSxvC6v5jcc1+gcYNr14ePbj7UFYlc+rFIOuh6Ke5lNG6We2MwQ57d4ldg1o8Cd7QgA6AO5U35/iYfC+HlTOgBFn6wOrDfO58uBTGKMB1kUbcaY6r4aVx70LBSTHIPeIYcAUywvlGXfmn2ZmlT62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3kYlYnJ61dfxPpzHR5C9uPJ8o4ZENcdID2xfd+nczI=;
 b=Z9xUml2di+piug+Wk3vuG/8DR+xiyDvEctGusH+PC0K8GwPy6UQA9YipzGCDz1d2Zt44EQMM9MUcXHf1DaWGKshdQizQEOM9FDSj2Ps07PaSVeADjne0FpnCAtzTSJ3wj1Ls/Tb1qEM7GPGPjGKwzpXTUiAnlS3bA5kYZYGZ6/Y=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB4404.namprd11.prod.outlook.com (2603:10b6:a03:1c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 07:50:06 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 07:50:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <daniel@makrotopia.org>, <linux-mtd@lists.infradead.org>,
 <microcaicai@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for xt25f128b chip
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for xt25f128b chip
Thread-Index: AQHWT3w7Z6UNDBuqHEyxi4oEeduFmg==
Date: Wed, 1 Jul 2020 07:50:05 +0000
Message-ID: <ac8e9689-4148-c31e-4253-66385490c304@microchip.com>
References: <20200206171941.GA2398@makrotopia.org>
In-Reply-To: <20200206171941.GA2398@makrotopia.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: makrotopia.org; dkim=none (message not signed)
 header.d=none;makrotopia.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a15271e-6931-4023-36ee-08d81d935ebe
x-ms-traffictypediagnostic: BY5PR11MB4404:
x-microsoft-antispam-prvs: <BY5PR11MB4404B1FAED9374215F1FE593F06C0@BY5PR11MB4404.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1xg+z0qaGjTLEcMGG+kt3CnJbK6yqMPZaWa922SoJcIngN5zOCKxptm189QBvDPy3W7paVDAG1YJdB6eUaQjXBKG2cWo2v6OQkHWHkFRdY5MvJgb/y8rDvTRQ2pObpuenwvE94t5tMcLsLSlce02+SwYd1t70+yrP6eYCPjqbgQA+VNg4ZVpuNTYxdjuqCN9kQv5FDpdXZtSLjjgjXX2E9DK71YT1YWGa+BQ1o4rQm6lDK9fcNizgA5tFjvArLzT0V8SVoPWeQhLz6OjzXQoCw04u77jQ2hpdPJ9lm/KtfFNxGKraL7blhp/cGmftdQ5XiE3FC52/uo90VGfm42ZI7QPF5WxLpcFV1oDQEGTSIXnuI2B9BZhwmT0UXWEP/46ErREJmpnf7XoM0pSIqqxThns2HVaKI8RPhzEaJZBVRMwDf8df6swGSS/AdgO9RexJ9+gdy/sLPgfmuNunOGXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(64756008)(66446008)(36756003)(83380400001)(71200400001)(26005)(186003)(53546011)(91956017)(4326008)(66556008)(6506007)(66946007)(66476007)(8936002)(8676002)(6512007)(2616005)(6486002)(54906003)(31686004)(31696002)(110136005)(316002)(86362001)(5660300002)(966005)(76116006)(2906002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: r8RpzzFr4qJnGbYMxita+MPpf8fW+vR9gz5ygrNJ4giAbNRr2w9KBaM2Xq/7v3KnHyGk+RjONwwBDuMiCTzGIKKtOV7dw7DOEYZNZ2RThjNbbw4P/4qdY6wLVWD0nennLFcGg5utiBsSmNms6bxvQKa/+3MqwtZzNUAkYkvkQZ0U17+uUmg7RXBBbqY1sbisfPP9grljGKEnaDUK2bQb2vVvVeaPlnUx36S9kapszx0oGHGt35C94lp8TWLD1knn7xZyJLx78etaDPXCO/yx58yvGK9Gq44uTNDZL/5dPohQE5DAGYYz32OIO1NcqJZRCMqcvZ50kGE2+p3IpFsXisK3sXB0hdSqg3CZqS4cadbYgRBvVSlT+K4rZGgaGOmfRTFl8UdRB9n7ZlhysYFXPqTLXJl8sJ7CWRo1OizBl1aNfAPuDJGoxVNONz0ESOjgMRogCZbJx0MxYR6cvvY3hWBhTmHrqpRsMLnawfOkxho=
x-ms-exchange-transport-forked: True
Content-ID: <413547C527300A4BA090FF79BE12F4A8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a15271e-6931-4023-36ee-08d81d935ebe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 07:50:05.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +UXCbeXUrbw/PIfgj/VRyN+qG2GvnxKfrwTTYN0PxG1aq+OhXm1TkTMDanA4lMdDNMRp5tHuww/P5Lx/GJPeccO9YYAu5/VlFjc0S0t9Cn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_035011_762137_3B225B06 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: eitan@neot-semadar.com, pepe2k@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Daniel,

On 2/6/20 7:19 PM, Daniel Golle wrote:
> Add XT25F128B made by XTX Technology (Shenzhen) Limited.
> This chip supports dual and quad read and uniform 4K-byte erase.
> Verified on Teltonika RUT955 which comes with XT25F128B in recent
> versions of the device.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: remove XT25F128A, flash ID and features are identical with XM25QH128A
> 
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4fc632ec18fe..b36c9044f597 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2706,6 +2706,9 @@ static const struct flash_info spi_nor_ids[] = {
>  	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
>  	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +
> +	/* XTX Technology (Shenzhen) Limited */
> +	{ "xt25f128b", INFO(0x0B4018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ },
>  };

Can you point me to the xt25f128b datasheet?

We'll have to re-spin your patch to the latest spi-nor/next.
Microcai sent a similar patch at
https://patchwork.ozlabs.org/project/linux-mtd/patch/CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com/

Would you sync with Microcai and send another version?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
