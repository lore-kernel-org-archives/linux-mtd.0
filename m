Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044FDC07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 17:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A9D61C7F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 17:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A9D61C7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1H52SDjDC1w/JafXOJDdlBUqwCp3zBL+NN4cJF5gJE=; b=DaI8bQ6N+VjulK
	MA6zUrnKhKzOmD6yqsu3p4vEuDNn5mOS3EJZJG1++pdW0nG9XMQDiKqBjoPog5Vs2mhmSy7CSXCZT
	hlADCPU980mMlMq04lmBiQWJPAbFLa8ObuUanudXLAeu/vETD827KuRBdub9Su1OhWeY8w19xSxpJ
	YJluP6y8wlbB7YoAHNwVM9J1ph0mZsXYDf7qnhF6dPs9kFt0oMiGG7oMWpEH72YRbVi26bMkKJvQX
	fFINOUgjWp+/WDQcP8dXZLMT1UIbPs/ZNtGuOyFFnZkPb7asvwo76Th01zKYyGrypZKMG2vRqQm/u
	j83Yv4h8QZjQKPljpRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Ayn-00FLXi-3J; Wed, 07 Jul 2021 17:04:57 +0000
Received: from mail-bn8nam11olkn2076.outbound.protection.outlook.com
 ([40.92.20.76] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1AyV-00FLUu-W0; Wed, 07 Jul 2021 17:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI4bLPWzE7lATbk5/ACVGoT+bk6qb5TsjIx5CiOdjwSYou99TLuVHYlKIyUwxjJztPcoTIUrtUDvgRsFYOBjh/u2pJ859KGNTXfyO6X8+q6Ls/fc6HxyOD34xRZzsVwtUmoWo8HWpinUfHgdRUGuz+27Js4FX+jWMHYLaaRKZKmyEp5zU0fIBWycliAHtSKwgX30ETgzVw8Y8iVEKCSqiWv+G4J7BixNZfiIswCeuPniyMUdxvmVSNM1QijKkrdRkaHrCQfdEZTtQpwvK/0Rsj31+A7WDu8CHDBGB7dGPIM0voSyiglHRxMYHWp7Di4o8ScO6lQsy0+N6dbDgSpAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAJ/qeCgQFACMwz/KoZbFEZ6IjHBCOOdM82Akdlh5us=;
 b=WLP2B5U+Aln1N5kKDeN//XCs+tlT0GgPeHS+PcjxybPsuIo1xJOdzIQcfsbjCAXO/RZ6eCTSKHmqAqGbBRxpcEQnxNrjDufdF7qE+XqSKJ2KyIPJWvCnX63Vde0dQwqg+X9VZMvVP+tGq3t37aW63lKDztHu75tAjCOaqd4ZdFpAAxSc1hnnC80a5Tb+XQdldeoMJ5AQn1xiorT9pjEiKL4JGz7wDj1unmLJj28x1YRoX/YUVOT8ZgTj0GssBwD04DXyD2yGoKbpci901zskCfrAXdpm6Ozc9n2HT+A8yTa5RlRtfQ+OxvK1TsxH0KAbHH0tYGgVqbzB+259Wo7tAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAJ/qeCgQFACMwz/KoZbFEZ6IjHBCOOdM82Akdlh5us=;
 b=TkCWyK0qIj7Ob53HVLgw/2DLkZ+xlF1EXcGIYekd515/u9ykw+yqjp8hS02baokGKBSEJE422rzTAFAKZ7n0nKl7zy6Vc447uKtOS35PjnfD82fD2ZPH13bGbYNn/bF5/q30LtqzJgus4Y6S1lg0vJFM/7gZ9DpE++A8dGw+UDhZ1wvLp+RLkoS4EqCMiZeDfsugRwO8hpMBrLcs+Y5Ama9+Z06yTriRA/LvBAncsuZJPXnKHqGnBr2shM8PyCUpdA9asGbqkJDStS9rAUWu8SosW8vtvxEKbhWkzyzj9XGiuBwdOt+14sPOXUhPEjPI0zg8nt7Ii+V1+7Q2nYtLKg==
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::53) by
 CO1NAM11HT171.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::221)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:04:35 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:3861::4d) by CO1NAM11FT004.mail.protection.outlook.com
 (2a01:111:e400:3861::345) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 17:04:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E799ED8E515EB1A4DEE6D8A62ECBEED4EB9B0FD42E473A0C39B31929EA6E94DC;
 UpperCasedChecksum:370A28CE49271E721BDCB1B72C7489D68B51F31FCC8E12E20794002276E225A8;
 SizeAsReceived:7919; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:04:35 +0000
Date: Wed, 7 Jul 2021 12:04:32 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v11 10/10] arm64: dts: rockchip: Enable SFC for
 Odroid Go Advance
Message-ID: <SN6PR06MB534224A3D7A26D2AE5275331A51A9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210707090843.5959-1-jon.lin@rock-chips.com>
 <20210707090925.6203-1-jon.lin@rock-chips.com>
Content-Disposition: inline
In-Reply-To: <20210707090925.6203-1-jon.lin@rock-chips.com>
X-TMN: [0gTFhj3i3uKEWtV5qGRcz7DJyhbu43Jm]
X-ClientProxiedBy: SN4PR0501CA0040.namprd05.prod.outlook.com
 (2603:10b6:803:41::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210707170432.GA31377@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0040.namprd05.prod.outlook.com (2603:10b6:803:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.12 via Frontend
 Transport; Wed, 7 Jul 2021 17:04:34 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3ea99f44-28d8-43ad-f4aa-08d941694bbb
X-MS-TrafficTypeDiagnostic: CO1NAM11HT171:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOMbKP5LcsIwA90xYhDUAu9/wqsgBhiHiI19yPuKVHSeYWeRzFUy6DLECE2qpN6xER/16x0MB3l50fRD9403Id1KZeW6w7joSFgulWenaRx90U5zeCKt9S7Vpq84ZZW9696iXeZZ8GFPy4aWtTxS5CVzAOTEiuc5Ju1/gfJz+wuqwsc/aEeG4msk70kTo/p2g7Zz9OwMUrkgzwLFf0w+Obe93N/h9nCiF2TsCww/q41nVWyWA9SQ0M6IJhcsqlQ/SaADQSmFEIQEwx0hGipuHSqFuz/pOYEPind22OUjOGy4pADbq0F1yyjn11WM75dDpwR03SRMl2klLIOPvemCwkkZ6PpLazoReILjabmV5K/ofYYbxMjb9dRijA4owD0+NjnkHoSffq3Kh/YU0NA0RkD6Ax2dfZ0AoBD19/7Lbadl6zedQJgpCVGZslz/WEpK
X-MS-Exchange-AntiSpam-MessageData: sgym3dD09T9DhoxcOQFgckMQe0XolSYvX6CRQ06ytbAW2L6FjMgTaWvE3NnMX4Ns1Q1V9Nvx9DkCSWH2lIzFxFpebWMMuk1HG1f/Bbl4N7mUFdYtjIOj0JLw41BQhqr9LDU01tougUWzLmOZnVshOA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea99f44-28d8-43ad-f4aa-08d941694bbb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:04:35.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_100440_164892_15D693FE 
X-CRM114-Status: GOOD (  20.43  )
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

On Wed, Jul 07, 2021 at 05:09:25PM +0800, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> This enables the Rockchip Serial Flash Controller for the Odroid Go
> Advance. Note that while the attached SPI NOR flash and the controller
> both support quad read mode, only 2 of the required 4 pins are present.
> The rx bus width is set to 2 for this reason, and tx bus width is set
> to 1 for compatibility reasons.

Thank you, I just tested this patch again and all seems to be well.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v11:
> - The tx is set to 1 for Odroid Go Advance device
> 
> Changes in v10: None
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> Changes in v1: None
> 
>  .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> index 49c97f76df77..4410a6ef5ada 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> @@ -484,6 +484,22 @@
>  	status = "okay";
>  };
>  
> +&sfc {
> +	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
> +	pinctrl-names = "default";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <108000000>;
> +		spi-rx-bus-width = <2>;
> +		spi-tx-bus-width = <1>;
> +	};
> +};
> +
>  &tsadc {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
