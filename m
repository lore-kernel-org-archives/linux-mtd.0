Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE42AC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 14:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E65613AD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 14:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E65613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOUErtYMRGA1y4r7swNTTene0Krbh3znI3VeY02bQEc=; b=kwrdDEefbCCvbZ
	gv4/7vG8txWQi8tPx9qHc0SgLA+06jelC/Ket2el1E9xjrr2JPOdHd6UK36ISBP1heXW5Eb9CqXjE
	hBona2pyi9WFk+uPLMuqBiV3w0ynH70YVKnhz4sEi+KCc5cfkk1sBcK0hCiDHu6yeGj+5VW4QPtY9
	dUnSHWfqd1ADodH/znbt5/ZCHuZyfPNb9av6YVMAu+xezTo1IgYwfiMSYNNaFixz0JEt3Bq+udL8M
	OQCKkJDxqH+iOp6RGAtTCGakZ37XNxVjRhRxXV5v1bTiSg3NL9my80CUSmN+t8GJJQ4DX3k0Don9w
	yrNln3lKnpPRQBDczO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loSBL-004gTt-6U; Wed, 02 Jun 2021 14:49:19 +0000
Received: from mail-bn8nam12olkn2011.outbound.protection.outlook.com
 ([40.92.21.11] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loSBE-004gSI-FV; Wed, 02 Jun 2021 14:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8Emzbhzx9XY0dI61PFaEOqdimRb2ByFdx0239ZybDbVKbvXoyIvdc+5Q5QeDRWYrzfOFoPF+V/B+PFmMEJLXkkbNk2tnhqktOPVQ3hOheddBdPk/btZqCxzoP//2oZY2QZ/BVT5TBEdVEj7/S9aHeyFP+TWGGr08kCxlMnDvQhuPV2RaTDCaLK9B8RtQKBhehEQJ24DQBzMd0Tu3A28iYyrLiVLWjSCE5wS446kxUbVcqy2gZgldtC5rOfXpRL4fA6H8pdIAEX37yue2eA7aB9wAuRHoubMrQU6UCDzW+SpxtBDAicZQgvXIxPUzwxPZQGZ51fAMd9Mz5jEGiJgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfNpyxmrQmmcNDHgarT8TNfpoL5uS1apDeWzPUX4Ghg=;
 b=ghGBAmK8TdabpcLMBnTrQm7mW96njpFWTowaFm5X3E2S6Ba3nlP3TERdzjhfeByz6NsbokXjebDDHOaUfxZyudbam2nx0u+I3y9ngr0Ode4URDG+FEvgTFP2q06R0MqeWkmu5BNahbXaxzjJqzZ7xIqeTvKvW7WohC8IF/irOCSTI9MsKwvkQrhyjWmUmwJvbXSldgJAEIGSu5Bp92AIm5g/cjm6xcX5QSAwFpso8/GL4Ni92NE5yJs/SPZGYorQzPfI0PRhL2jkPSvTJknbamwHdlwTsWq14jPKLuud1VZcyexgf2YLrsHJSg0RG6zSwxR3ZnIBWKfzRs/rxYDbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfNpyxmrQmmcNDHgarT8TNfpoL5uS1apDeWzPUX4Ghg=;
 b=TFGpJxyDyVHS/2y7R56HJjeAJUka6xTCZFbYwIiQGSRf5Uwo0GbvVjS77BZLpyORoqJp7js/JcrG3ar6o+2sRGn0I6DGR4pXRKG9NBExlqlg5/H2oeDIXc8bWoLw1cW5izfIeDWqZ5xr4NlPQSe9v3uLcVf05HdCjjfk1AkclFM1kpzpU2qWoMP5u9W307yxtWrRLtcdRhKtXJ6rdWOTFiZjwJXDgjm1P4bp7VnH3nj9Cm9a73O4PY8RpccDUc9ARzTeUDJf9hyV+SPpLfGFGas4xIkAhO97IBTZKgrputLIzbeqk4tH16ntz+3a4av/llZEO78f8SpEcV3/BFnaZQ==
Received: from DM6NAM12FT018.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::50) by
 DM6NAM12HT089.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::405)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.10; Wed, 2 Jun
 2021 14:49:08 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::49) by DM6NAM12FT018.mail.protection.outlook.com
 (2a01:111:e400:fc64::474) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.10 via Frontend
 Transport; Wed, 2 Jun 2021 14:49:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:75BFF91B8A1C854DD0E108FDA107FD0C08D1C7A4CF9D8E70C796A3D942CDB8EC;
 UpperCasedChecksum:462765A786040B476C99A6524F9C20CBD58F3AB5C5CE4648BAE38A28C82C5FF0;
 SizeAsReceived:7797; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Wed, 2 Jun 2021
 14:49:08 +0000
Date: Wed, 2 Jun 2021 09:49:03 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-spi@vger.kernel.org,
 broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Subject: Re: [PATCH v3 1/4] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
Message-ID: <SN6PR06MB534255670866AE01B41DC6F7A53D9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210601201021.4406-1-macroalpha82@gmail.com>
 <20210601201021.4406-2-macroalpha82@gmail.com>
 <e609752d-ac37-cbfe-2f53-e23c3bb1b4d8@gmail.com>
Content-Disposition: inline
In-Reply-To: <e609752d-ac37-cbfe-2f53-e23c3bb1b4d8@gmail.com>
X-TMN: [7pBsUI6lMU2p35aXSttGab3T+FgvQH+Z]
X-ClientProxiedBy: SN4PR0201CA0031.namprd02.prod.outlook.com
 (2603:10b6:803:2e::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210602144903.GA13824@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0201CA0031.namprd02.prod.outlook.com (2603:10b6:803:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend
 Transport; Wed, 2 Jun 2021 14:49:07 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: caac2bb9-45d5-4738-557b-08d925d59334
X-MS-TrafficTypeDiagnostic: DM6NAM12HT089:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JSGHBmvvT2F5djCK8WWgxuDVixd+KlWTsBeaFvVb9a9I3Xji3AQWOPtGSWJsAMaRAeNQr7bqzPHlpEKVJHn8P7cYuKh1RztUtCaKGITZhW1dDnEvAPFriDerXpz+bP2tLdyCCWOzrEzcVDOv4zbXaY1yX4KxuTSNusJC+E7Y90meDOiB2KewLSEQOXN623XWLSPpbtSeAB36SmsIh5h9KxsPa63HIRtRxGPQoywPpo5u+gFBMCYtALf7OGOHdTs9L+g0NOGuZVSFxP5TjgM8rIQQurhMlq4I1eI0XEA+cmu/lukCMYZbKk3sU6eNi5HGm7ogCXt0EyP8PrU4bcwEacCxhK0d64X/FnAPwLtM+Tz7XNrIAXxvUbnR319gEVj/XlDbr9qF5rqXVRUKyZEYBfMxdRunXjanfZ8XEuEWhbZXYMyaP1KKCw0vka5KNK5MumCXXQ1ijBIoqz2bxKplA==
X-MS-Exchange-AntiSpam-MessageData: cMyH5OBDXR8EiUTN8ErzPbuhWnuqJG8LXXRp0vFXhLxJOvcZ8vEZ711zOrV8eOWhsPJ7vbRJWPsp8QFvljFtrDPUjJZJAriZCofPJG1/FiupblG3hBZmOrpkKXqcisCRbojrafWbXA3ciazi2j1Cvw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caac2bb9-45d5-4738-557b-08d925d59334
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:49:08.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT018.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_074912_760322_A4A83F1A 
X-CRM114-Status: GOOD (  43.86  )
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

On Wed, Jun 02, 2021 at 10:13:35AM +0200, Johan Jonker wrote:
> Hi Chris,
> 
> Some comments. Have a look if it's useful.
> 

All comments are useful. Thank you for your input. :)

> ===
> About the title:
> 
> dt-bindings: spi: add Rockchip Serial Flash Controller
> 
> Include a driver group name.
> Start with a verb.
> No need to mention "bindings" twice.
> 
> ===
> 
> In order to get this patch reviewed by rob+dt you must include:
> devicetree@vger.kernel.org
> 
> Check your review status here:
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Flist%2F&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210841031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=KhqRF2ly0Smf%2F1aE7yTrJ4FO5XPldagRW1gI8RF515E%3D&amp;reserved=0
> 
> Get the other lists and maintainers with:
> ./scripts/get_maintainer.pl --noroles --norolestats --nogit-fallback
> --nogit <patch1> <patch2>

Thank you, for now I've just been using the get_maintainer.pl and trying
not to bother too many people. I'll do this though going forward.

> 
> ===
> 
> Check document with:
> 
> make ARCH=arm dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> Remove any errors before submitting.
> 
> ===
> 
> In this serie you are introducing 4 new compatible strings, then also
> add 4 entries to dtsi files for the completeness.
> Could you give us a complete package?
> 
> rockchip,px30-sfc
> rockchip,rk3036-sfc
> rockchip,rk3308-sfc
> rockchip,rv1108-sfc
> 

Excluding the px30 I will not be able to test these. Should I just update
the compatible strings and clock names then?

> ARM: dts: rockchip: add sfc node for rv1108
> Copy node from manufacturer tree in rv1108.dtsi
> 
> ARM: dts: rockchip: add sfc node for rk3036
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Frockchip-linux%2Fkernel%2Fcommit%2F57bfc68e70cb58bd4786a6baff6315f252a19088&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210841031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=C5k6bCkt8qlzOquK9rECDN9fTK6HQDzxTR4Vp4othtA%3D&amp;reserved=0
> 
> arm64: dts: rockchip: add sfc node for PX30
> 
> arm64: dts: rockchip: add sfc node for rk3308
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Frockchip-linux%2Fkernel%2Fcommit%2F036e7e07a41c264a076c70ebf20cfeca031799a0&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210841031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=NAdFO27S6zQdSjG%2FHMdZfe%2Bx9Nh9VQJhGVAhTopFY7s%3D&amp;reserved=0
> 
> Fix there commit message and clock names.
> 
> ===
> 
> Johan
> 
> On 6/1/21 10:10 PM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add bindings for the Rockchip serial flash controller. New device
> > specific parameter of rockchip,sfc-no-dma included in documentation.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../devicetree/bindings/spi/rockchip,sfc.yaml | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> > 
> 
> > diff --git a/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> > new file mode 100644
> > index 000000000000..d5f8edd621ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fspi%2Frockchip%2Csfc.yaml%23&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210841031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RvUO4cmMOZb9B5l2MtUK3riDKebGLlKWt0KnnKaqENQ%3D&amp;reserved=0
> 
> rockchip-sfc.yaml
> 
> The comma is only used between <manufacturer>,<SoC name>-<function> I think.
> Ask a maintainer for exact name.

I was basing this off of names like renesas,rspi.yaml and cdns,qspi-nor.yaml,
but this is probably a good question for the maintainers.

> 
> 
> > +$schema: https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210841031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=OSRmMArQEVaWsZ%2BnxrqvfmO1pWk6dyjWVTunbw6j1Po%3D&amp;reserved=0
> > +
> > +title: Rockchip Serial Flash Controller (SFC)
> > +
> > +maintainers:
> 
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +  - Chris Morgan <macromorgan@hotmail.com>
> 
> sort
> no hotmail because it screws the message-ID

Is that a hard and fast rule? The Hotmail address I will be able to
respond to much quicker. I've actually had that address since before
they got bought by Microsoft. Worst case I can do the gmail I submit
patches from, though, but Hotmail is still preferred by me.

> 
> > +
> > +allOf:
> > +  - $ref: spi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> 
> > +    oneOf:
> 
> This format is wrong. Use fall back strings.
> 

Thank you, I was confused on this one section. I'll try to clean it up
more.

> > +      - const: rockchip,px30-sfc
> 
> > +      - const: rockchip,rk1806-sfc
> > +      - const: rockchip,rk1808-sfc
> > +      - const: rockchip,rk312x-sfc
> 
> remove
> I would advice against introducing compatible strings for boards that we
> don't have support for in mainline. Limit to things that we know what
> they look like.

I was under the impression these were also supported by upstream, but I'll
remove them if they aren't.

> 
> > +      - const: rockchip,rk3308-sfc
> > +      - const: rockchip,rv1108-sfc
> > +      - items:
> > +          - const: rockchip,rk3036-sfc
> 
>     oneOf:
>       - const: rockchip,rk3036-sfc
>       - items:
>           - enum:
>               - rockchip,px30-sfc
>               - rockchip,rk3308-sfc
>               - rockchip,rv1108-sfc
>           - const: rockchip,rk3036-sfc
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> 
> > +      - description: Bus Clock
> > +      - description: Module Clock
> 
> swap
> 
> > +
> > +  clock-names:
> > +    items:
> 
> > +      - const: ahb
> > +      - const: sfc
> 
> swap
> You must keep them in the same order as in your example and in the dtsi
> files (both mainline as manufacturer tree).
> 
> Maybe use this:
> 
>       - const: clk
>       - const: hclk

Heiko suggested we use clk and ahb as the clock names, to be consistent
with the NAND flash controller hardware.

> 
> 
> #define HCLK_SFC		257
> #define SCLK_SFC		58
> 
> 	COMPOSITE(SCLK_SFC, "clk_sfc", mux_gpll_cpll_p, 0,
> 			PX30_CLKSEL_CON(22), 7, 1, MFLAGS, 0, 7, DFLAGS,
> 			PX30_CLKGATE_CON(6), 7, GFLAGS),
> 
> 	GATE(HCLK_SFC, "hclk_sfc", "hclk_mmc_nand", 0, PX30_CLKGATE_CON(6), 11,
> GFLAGS),
> 
> ===
> 
> From clk-rk3036.c:
> 
> 	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
> 			RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, DFLAGS,
> 			RK2928_CLKGATE_CON(10), 5, GFLAGS),
> 
> 
> 	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED,
> RK2928_CLKGATE_CON(3), 14, GFLAGS),
> 
> The HCLK_SFC is missing and ignored in rk3036-cru.h and clk-rk3036.c
> Maybe this needs a fix?

It possibly does, but aside from hoping that I'm doing it right I lack the
necessary hardware to test the changes. I can make educated guesses though
by looking at the datasheet and board support package kernel.

> 
> #define HCLK_SFC		454
> 
> See:
> clk: rockchip: rk3036: export the sfc clocks
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Frockchip-linux%2Fkernel%2Fcommit%2F8373cf713ddd32037dc86462cac2d2d3cc859a99&amp;data=04%7C01%7C%7Cbadb9f60f0114af4d80308d9259e53f6%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637582184210851028%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=KZiR3s3opSYS6uplRJ%2B726qiFWY5tEfvo6GKAp4w81A%3D&amp;reserved=0
> 
> Maybe add more patches to your serie? ;)
> 
> ===
> 
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  rockchip,sfc-no-dma:
> 
> > +    vendor,bool-property:
> 
> remove
> See example vendor,bool-property at:
> Documentation/devicetree/bindings/example-schema.yaml
> 
> > +      descrption: Boolean value for disabling DMA
> 
> description:
> 
> > +      type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/px30-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> 
>     #include <dt-bindings/power/px30-power.h>
> 
> > +
> > +    sfc: spi@ff3a0000 {
> > +        compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
> > +        reg = <0x0 0xff3a0000 0x0 0x4000>;
> > +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> > +        clock-names = "sfc", "ahb";
> > +        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> > +        pinctrl-names = "default";
> 
> > +        power-domains = <&power PX30_PD_MMC_NAND>;
> 
> Add include for PX30_PD_MMC_NAND.
> 
> Check your example with scripts before you submit!
> 
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> 
> > +        flash@0 {
> 
> This controller handles only serial flash for now.
> So limit that with patternProperties.
> Also users can't add more then 4 subnodes.
> That's where these documents are for, so add!
> 
> 
> > +            compatible = "jedec,spi-nor";
> 
> > +            reg = <0>;
> 
>             spi-max-frequency = <108000000>;
> 
> > +            spi-rx-bus-width = <2>;
> > +            spi-tx-bus-width = <2>;
> 
> The sort order is:
> compatible
> reg
> interrupts
> the rest in alphabetical order
> (no status in YAML examples)
> 
> 
> > +        };
> > +    };
> > +
> > +...
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
