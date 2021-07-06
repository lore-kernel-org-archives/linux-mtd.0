Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D95AC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4376C613D1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 16:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4376C613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zaq9+dtFo3sPs3iJL+LrOhlOKyXbow5tLgzYQQdyQp8=; b=QXdUBpU6qcaaqE
	ACmg0a5ZSaoaMlSBbc236AEkrnnQSyBShdSX6SyyY2BumleRZTz+3FbyFG48FTkfqAaNy3JRgnucA
	Y4RBheZoh8kENNJVO0q57Xq6dYbEqJkwSY1DOwXVQ0Io7KsxyYpghvLpo2A9wbzXDTSkXXQvp64XY
	A5x6aQ3c+apS3QgPfImaUGHo7m2lVX73Svnzhd1y18ttsQzv8sCstohrHPcxwLXZB+kPYvpEowpLd
	7bj8wK9x5JsfPN+14qXDMYrX8bhUM2LR7qyD53I4Anii0hO1xkBHzg/BX/MNsEGX443IrIRQS82rk
	0dFnNjqdWnjQgDaHTBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0nXQ-00CCVD-6z; Tue, 06 Jul 2021 16:03:08 +0000
Received: from mail-bn7nam10olkn2059.outbound.protection.outlook.com
 ([40.92.40.59] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0nXA-00CCUb-37; Tue, 06 Jul 2021 16:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OniGtGfPZ+ANj2XnH0BWiuXxB9aw78GBoroN0nPejGQmK0yJv0rw/1O8FPLxNjGJFtblUXucTiEgZr5O1iRYK88Nh/JIQFDQJCFQmJ7RehUBgZWsUIZa1K3qrF9dxCe/zH6tcyOSXb52ww1GOXq8dPejM1U1zvhZYhtPVKDe0nkXl1uOizC9iiQAbtqzK6ofiDRIqrtXmTHbHlAvPHSp3kmoXmcG4CupnQ2A0dULG/ZbqKBi3sLQroWaxEkBJ9J3rQUjs5WLpS4n/qxwARUw+FwCPjRHuGr3qm+hBCzM6c6u8CDFu8MNvHTnjV3it0vwQ1PZNAl6K5gzjBjSUsqyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj8CNucKnxvNTb6De3skuc3O9d7ESrJTnOnd/0ZztGs=;
 b=gSb8ahJ3PBV6kQ17YoKsqALafjKt404pvlJA+mY3CEGGzsWvP+0l2bSYmHMunJ5rW8DvadPnzcdOvRVmIlQS8HuFycYo+QrkE2rf6ME+6ZInS2FuoMp308m5fUMsMn/4NTUS3RCi2+hCJUuVE6/Lxa3we3Odqicj6e436KPRWN/dYhlclSl6hI00MFw9klwjqNIMrNlAKCpoVmHB1eBoi3Nh2bo6d3u2fgyACuoL6DibWEC4HdJH2VjM9Xst3bvvfq+e8bHZKdf6Gv/EO1NHpl/0qdyBC4fWQxmWvdsm2E23SuiWCNitT/JkCnT59+Fg94GtMAdJ48SWJivfQWZ4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj8CNucKnxvNTb6De3skuc3O9d7ESrJTnOnd/0ZztGs=;
 b=Um2e/PS0uvIkXveGoftyl3ebzypRGXBXXTE7cPQAtcSdmGQ0Fh8UUQ+eXfgqO4opKSvAUhwrI8YRbIYoSSCi6oigNRqMgFpb47M0lTt0YCvRchkZ5n9YQUSwOogDP0zMsP1rNxK1WiwiwhfTdlt7SzLKs6MJ+vvQtrWOLD9Em1/mJShQW9SdZJ+ycl1LiQZbj2CmgWjSkUf0F0mhFaI0sO67w+pEwDcf4fu7FObI4VfGnIkgi4duvY/lJXt479FvZPzJ41fgIwt5YK2Oo4eo8itQilOGVrdRY2+6UhN9/vpEo7rHLD4KfwbeNDAbQGnVIQsp89Q7G5yuknP3Hcpr5g==
Received: from MW2NAM10FT044.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e87::47) by
 MW2NAM10HT194.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e87::157)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 16:02:48 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e87::46) by MW2NAM10FT044.mail.protection.outlook.com
 (2a01:111:e400:7e87::145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 16:02:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:58FDF37FAADCBA87CB463E08004ADF8DA33BF2D91C36A47AC1686B12A515C5FE;
 UpperCasedChecksum:6D779073AADB5840154A9E0289D4B1A9A20DF83D04C3775CA71253675C17F943;
 SizeAsReceived:7915; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:02:47 +0000
Date: Tue, 6 Jul 2021 11:02:45 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 10/10] arm64: dts: rockchip: Enable SFC for Odroid Go
 Advance
Message-ID: <SN6PR06MB5342083A6EF4A591CF076E79A51B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210630134745.7561-1-jon.lin@rock-chips.com>
 <20210630134814.7748-1-jon.lin@rock-chips.com>
Content-Disposition: inline
In-Reply-To: <20210630134814.7748-1-jon.lin@rock-chips.com>
X-TMN: [CaTGh5h2tZ/Nah8ni+jnLhxSYX37e34Z]
X-ClientProxiedBy: SN7PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:806:126::13) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210706160245.GA13074@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN7PR04CA0188.namprd04.prod.outlook.com (2603:10b6:806:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 6 Jul 2021 16:02:46 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b7d259b0-9f56-4872-76af-08d940977f6f
X-MS-TrafficTypeDiagnostic: MW2NAM10HT194:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrAU9f9TWQvc8+4F+RbaDBquOIO8zl5+M0Vtjfd+o4EtmpOgI5xrBcYx1+9PBPLlK4CDwdxEHJM73USdlO6RnkGpBELepQPmLqWB8KmRcSVsgbiz2iQU2hVa4l0hc5/8dGFY5A/3+gtQAWfpto8ZsecYafm9dQZNCL+fsWRzGAlNcvkHxTLbPCmeW/5j5kHXymnAJlZuQUMPhhO2xv8Pr9XNZ3tPw6zW34o9oMOouzpk+Cc7rTwXXqmUGzZSYf4q8WIUlDYL3ABtVMTig77RlvEpLS6m0e6IeQpfymaIpFOxjjqLvf2gEsNG+E+iRrsO/CHYGMa0uWXNIgt+vok5FMk7oM1/mf6h8cPpz7EodYOul0riaMlI5ROL009oyDUYEYxqdCFi7I7VO4Nma70iu95TTTdthw6FvPGgQwyPB5V4w2EKYb0sKLqFVXVeFWrP
X-MS-Exchange-AntiSpam-MessageData: NoezxMnBVureeRnd7+2FcoGm9s8RrbiTlIt9ACKIQPwiP8HLAGNJ9q22CYh445a3yuOQEHMzvxl45jV+mawk+gUbptp1cYxCj7lxmwOGmM2mKME1jWHCN13CUAkCQBEMeQcBLK4NPrdPjfp1shIViQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d259b0-9f56-4872-76af-08d940977f6f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:02:47.8512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT044.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM10HT194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_090252_258034_0A3DD948 
X-CRM114-Status: GOOD (  23.82  )
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

On Wed, Jun 30, 2021 at 09:48:14PM +0800, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> This enables the Rockchip Serial Flash Controller for the Odroid Go
> Advance. Note that while the attached SPI NOR flash and the controller
> both support quad read mode, only 2 of the required 4 pins are present.
> The rx and tx bus width is set to 2 for this reason.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
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
> index 49c97f76df77..f78e11dd8447 100644
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
> +		spi-tx-bus-width = <2>;

Confirmed on the latest patch I still need to set the spi-tx-bus-width
to 1 otherwise I receive the following errors:

This is when I do the test case of reading 4MB of random data from
/dev/urandom, then writing it to the last 4MB of the SPI flash,
then reading it back and comparing the md5sum to see if the data is
different. I usually get the errors below on the writing stage if the
spi-tx-bus-width is 2, but if it is 1 things progress as expected and
the hashes match (which I consider a passing test case). Given you have
tested this same controller/SPI-NOR combination I'm assuming this is
a board errata of some kind. Can we change the spi-tx-bus-width to 1
for this reason?

[  145.863221] mtdblock: erase of region [0xe28000, 0x1000] on "spi2.0" failed
[  145.871080] blk_update_request: I/O error, dev mtdblock0, sector 29000 op 0x1:(WRITE) flags 0x4800 phys_seg 5 prio class 0
[  145.883529] Buffer I/O error on dev mtdblock0, logical block 3625, lost async page write
 
Sorry I haven't responded to messages lately, I was out of town on
vacation the last 2 weeks. I'll check the U-boot driver next.

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
