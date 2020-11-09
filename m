Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53B7C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 23:24:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CBD6206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 23:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="momAY2yY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fovPLMPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CBD6206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MVlIfqI0EPZMdEaKoXt5i2s4t0Wkr1+ljLPjQMFfNjU=; b=momAY2yYVLZEM/5J1q7MOhW9k
	AafR0FjEzbQbR25GlpDhDgg57A7DXI4aDomAmwffltFEkCrOs96E85OKCmybzLRb8s8l7ejqMA0Ua
	Vj0LaeuReSOqpuqqLubotqRu+bfzv6L6XBCchCldjFgTfbz5XdnmhJRzC/CheCH/4R0fDyYMsRrEU
	2mwbh1Fu6J2tfuD1lY0tiEuOp684QsrQJ4CysiFQMyrqQhc8lG7itfHpFXM5ijOqxT3yvyB4cU0AJ
	mfgmbaxbgY0EdMwBW2t/11OhA+Wj7ry5fsORBcpVG2gHVE1sTlz4Su5k8WtnZ78PoostQQhSaXxFI
	SDWBT/ERg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGW3-0005d1-4r; Mon, 09 Nov 2020 23:24:03 +0000
Received: from mail-am6eur05on2051.outbound.protection.outlook.com
 ([40.107.22.51] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGVz-0005bY-Ud
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 23:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkF+59xqhiyxN7jqxSkNlKbijETW0hjaeYcMVKBohDFCyF1CbPBYLf3kqi3khJ1h69mduyL8lLrwkV6x50erPARs4EICinQ1FlNQYjr8Us7YsgKuP6Zm+u7wFAt6xUPZiDk+/NMKUNJ7meTd0QZXLVLpD6BHm4mJph8piIXiui42/EoWI8F+K/hrQKHljgigWdXre53htaBT3vxoiN4w4+dFpXG5Tq27j/Vuii+GwmUZVoOynH+a71bufL7nlwR/QJ5JFxJrUU5+314IO2gdpY9MD1TrX1O5+BtSE66sbKDKtxwv0Yz6gWH6BV9h+hq2Bps9bUA5hbO2bEhVRxaeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KMmy9wLWqBmUjqzFCo017IhPwzl5Su/5RyMsfB8fi8=;
 b=PkshM1e1kZD+4YHEt63pLeWPVQShkPObQXPLmxumIZ87C6RxtnhTQb6I4OEByL0f0WgCmwmpczraDWVKiZAn8bnH6c32aT316fih0WhkSbzFaL+STu2yfdHztmZU+ZAHk7Mn/Pw6ovqh7avI85DB+6GSHCKln38YbAaL/BL4IR9DcToH9fBfmjd0yj746WmTp4RIReKaOOxe8cZ+qAFyEhFzIXM3nY3sw/eTeYzHEeuNd9wfpuhQm5dEiSqDoeimKuWDSZDOdPKkco3LgK8bvsQj5dTVEsmq9o0exPhLL2KCe4puGZaD3oHdXobHzyFGwYaJh1BUVQjz2mM3NMwayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KMmy9wLWqBmUjqzFCo017IhPwzl5Su/5RyMsfB8fi8=;
 b=fovPLMPGS+2CvO5BMdT4uYWMT2BB3U9KDYj8zm2P0K6NpzSLsyb2M3GTjp6OgA8D9nHafUuSVAzNlh7pek3fJe3UCAJW+t6Bnwjckp7w3FITjBwfdhdRVV/Sd8GXu/HUzN6vOZx8yIoMOzLAKu5b8KGO8XbEo4OLARavwcCcPqg=
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR04MB5750.eurprd04.prod.outlook.com
 (2603:10a6:20b:ab::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 23:23:55 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 23:23:55 +0000
From: Han Xu <han.xu@nxp.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "vigneshr@ti.com" <vigneshr@ti.com>
Subject: RE: [PATCH] mtd: rawnand: gpmi: fix reference count leak in gpmi ops
Thread-Topic: [PATCH] mtd: rawnand: gpmi: fix reference count leak in gpmi ops
Thread-Index: AQHWtPVw8ho46w4WUUyH73lbJjXdd6nAdLhQ
Date: Mon, 9 Nov 2020 23:23:55 +0000
Message-ID: <AM6PR0402MB370187895E960D19DA7850AD97EA0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
References: <20201107110552.1568742-1-zhangqilong3@huawei.com>
In-Reply-To: <20201107110552.1568742-1-zhangqilong3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [70.112.23.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bbdcbad8-ef30-4d4f-f40a-08d88506872d
x-ms-traffictypediagnostic: AM6PR04MB5750:
x-microsoft-antispam-prvs: <AM6PR04MB5750A56EDD5F0D0A367B06C697EA0@AM6PR04MB5750.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPRLVqU043IjqnlTG74NpTvET7K9n8jmH/AztnuJy3SxGtzfEh4PJb7uLuET+uLy/PJ5PxMhjrjLsncSIMai6yYgusEN2yVFYlUwFfUb8F4bmrSPnyU09yNy1kZ2zRpq5RA0IV4t/bjzJ442auQjZaeY/TRPOiKjxRcsy5ShbHoCyxQWYHLtWqGelzDr+kj2X/1mX0FL1wQW5UnEHJCEELHfMsT8RQKgBN3qXHYICdri/gyZEbcSXVjW98QbXnplGOzqWu2opsSS6tQmlHCjc0dmdoE+jTmmsDW4AG/wtex88adtyNp8bfCyynnl8Jf/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(33656002)(71200400001)(83380400001)(76116006)(66446008)(66556008)(66476007)(64756008)(66946007)(52536014)(7696005)(6506007)(53546011)(44832011)(4326008)(8676002)(5660300002)(8936002)(2906002)(316002)(110136005)(478600001)(186003)(54906003)(86362001)(26005)(55016002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: o7OKUxXVpUQKuvC6RYUi54/FN6Dp0dtdYMsJQaYoOU08irhOdjbq7eH/31YawLuzIR9aHID8aJf784bOVp6sKL9mNnhKnTBFvj5Gcn/QNoqrV4bQqEaOc9VnjFKso8HkMJAPcE4ie+wW6U2SugDxE732UXMjIN+brVuDvx/iUX9X5efF0Usb4dVtPsAWD3OpNqqPx6lUi9ZHLk/zzXzWe639ZwqZmZFgzE9cMvn+u6mgwW1TTCIZfzhhXfyJ57ep/rEXOIkRsdJyvj6YTwltdUwAavEe2ghIUDhPvoV5xaZsZGP03HWX7kx5xacGBCSVfeWt7oMIpWmSbqHkjmJrMgrsUyl2wTXMcyS0LhqhYLQ/u/dj7tiFUnWMosrH8jReiFj8jdMg2LsOqhWra5APeWs4JpOgRjs0cx0JjmEqfA1HTHyRWOlA+/PpBRT6BGIq9yY5V1ApAGGSfePTLq5DXWj2ZHzNLcqdlybPH5LXSJOa6Pzp9ZcEjoUvjLXtnDYFHC2kWw30mztn/YsAKac8w4eijowrlSMyA1vAD1WmqQD2o0r8T7fyDt5/YSfFn34KB8x4w/dyps9MycVAwi30gQ4ia96nq0wyE81DjydaJwiSHMvUzsxq5TMxr8bHBimD7r5ksEKsZFr34ZEaQDyz4w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdcbad8-ef30-4d4f-f40a-08d88506872d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 23:23:55.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZmqYghKafDwIcmQEDhcihwVvwjoLt1G2mR9iP77e//aWIEh9CrVctohakz1l0QFv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_182400_198922_0245E735 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Zhang Qilong <zhangqilong3@huawei.com>
> Sent: Saturday, November 7, 2020 5:06 AM
> To: Han Xu <han.xu@nxp.com>; miquel.raynal@bootlin.com; vigneshr@ti.com
> Cc: richard@nod.at; linux-mtd@lists.infradead.org
> Subject: [PATCH] mtd: rawnand: gpmi: fix reference count leak in gpmi ops
> 
> pm_runtime_get_sync() will increment pm usage at first and it will resume the
> device later. If runtime of the device has error or device is in inaccessible
> state(or other error state), resume operation will fail. If we do not call put
> operation to decrease the reference, it will result in reference leak in the two
> functions(gpmi_init and gpmi_nfc_exec_op). Moreover, this device cannot enter
> the idle state and always stay busy or other non-idle state later. So we fixed it
> through adding pm_runtime_put_noidle.
> 
> Fixes: 5bc6bb603b4d0 ("mtd: rawnand: gpmi: Fix suspend/resume problem")
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index dc8104e67506..b5f46f214a58 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -149,8 +149,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
>  	int ret;
> 
>  	ret = pm_runtime_get_sync(this->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(this->dev);
>  		return ret;
> +	}
> 
>  	ret = gpmi_reset_block(r->gpmi_regs, false);
>  	if (ret)
> @@ -2263,8 +2265,10 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  		this->transfers[i].direction = DMA_NONE;
> 
>  	ret = pm_runtime_get_sync(this->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(this->dev);
>  		return ret;
> +	}
> 

Acked-by: Han Xu <han.xu@nxp.com>

>  	/*
>  	 * This driver currently supports only one NAND chip. Plus, dies share
> --
> 2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
