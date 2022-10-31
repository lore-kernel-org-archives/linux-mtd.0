Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36199FA3740
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Cc:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFBjCnZCwrqtgPldHDm/cyXH+/NAseVe0MiaJT23E8E=; b=v6mgCeFTcLEMZL
	x3dY3ab/0wOhF5/uxSo5SFDXYoscj1VGQU2rGZ07DYu3i7ipamUbnEXEw359e60Xaemf1YoqCeAvH
	Y9oiPLjopDvMlXCkK+Z3isV56JfHQGZ76107yuti9utoFSpAglvwsYxzVUafzQlUbT5TveQvgu0Jv
	XYMCO2MZ/47gw8RCSvPCkpiO6Px4bAFznIbfa9h247uVQHO4K+LF3juvbtkBD75h/083yO7s1GXEl
	pu8lLXETf69HhbsWyDggLwZy8cwox4Y9y3syLZ9TGDME1b8atM1p2J6KWM0uEizagoxQQ8EP8/n+i
	qwVn5R7Wli584e4EZoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTv8-00Bh5S-IT; Mon, 31 Oct 2022 12:29:38 +0000
Received: from mail-am0eur02on2106.outbound.protection.outlook.com ([40.107.247.106] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTv3-00Bh1H-3b; Mon, 31 Oct 2022 12:29:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcn7Ule52jGw9KRj7AbZxCn9S7dK9hGefDm1lAW3gEGsssqBsk5x9BxFIGUtydejeYvQJCfMrBU7PYEzlewMZk5Iuz2w/beZhuOm5GxGgc9aONql7YFQBl2viww3fXKzUWDMsMRx99xl0qnvsh9LCKdPuW6YF9cardtFqwGUNKV07mUn/osMfWJ05fWCmTFZy/FRXZD7RwlPqUgHogkpSDOZzHSw4OYudGQ+3n5LjgVTgCpJ7EiM3wXE3nk21UrKuiYJ66vgY4Ap0WIegvxLAayDdWAAErAibjxHlug8D1hWiV6dVp1FQ/xUeQjVRWbqynQTKz/uIATUchCyhpOyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ze04daiqQCxsubJ19Q+fHryLi0SMgpEphsSMhIlu+Q=;
 b=f+p1g0uH6TfDt+K0QleO8yzURPurxeD8qrVwxpy2sLNp45TkLT/vHrgtByEMSV7PDFGF/gqyV7ooJ3E7ZbibcF9eSIoa2KCwFk0vuE//Y3wlrb7Pa+PQjWmdrX/FZ/Yg+PLzLnNNulF8rVyYQTm6ELSkja06Tu70pd4li1eL5WKANHazCyMm66Kyr4sPK6WsUHLOxdHfqei9yITi9AylmWuqOJBFFkgIU2WhiEfZgh54quKP3rZPW6IBKTFa+Oig6AtGBVl5iceboByQ1CFdQUJ69tpDnPt2PkeJ2K6z4XZnRZ6F190GmiBBVfpCFIKvi+vEFr5D0SBy2neYLLJLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ze04daiqQCxsubJ19Q+fHryLi0SMgpEphsSMhIlu+Q=;
 b=vbOBp/ZqFQRcGRsIV9V0R+i2ACZzHWAhaiB7w5H2uFzLz8J1cbk15Q1ucDtXMGph9bWXytkNPbcjozntHrjEwQVNzMg2cr9ExE4zYqRswnPrhDdnZCoZuEAN9NiQr+KR3S22aXkTRWexEwzpgVvqZEYe2FE9CUyzPLWA7gUYuoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by GV1P190MB1898.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 12:29:25 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 12:29:23 +0000
Date: Mon, 31 Oct 2022 14:29:22 +0200
From: Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
	=?iso-8859-1?q?Gregory=0A?= Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Elad Nachman <enachman@marvell.com>, Chris Packham
	<chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20221028145049.76db792f@xps-13>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
	<20221026134545.7146-2-vadym.kochan@plvision.eu>
	<33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
	<VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
	<10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
	<20221027151825.166a9255@xps-13>
	<e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
	<20221027155025.7c04774a@xps-13>
	<683dffbc-744f-80cd-2262-b6deb4200ccc@linaro.org>
	<20221028094740.3c11f52b@xps-13>
	<a98f00bd-013a-a1ce-0054-bbceeaefcefa@linaro.org>
	<20221028145049.76db792f@xps-13>
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
Message-ID:  <VI1P190MB0317E5C8AD323A8D1A4B5D8195379@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|GV1P190MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d4075b-fd0e-4938-c40b-08dabb3b8adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ipMxeKDB5NowAFO0NrZK3FgkV0/Ji8IhaztogLaqVoemUmhAYbTDZhPElWFZxKCDrFkM4w+A8RsNYEDjSzuBOqm8vKtcihwIEseXNYpkLvJTj6/1lI8eQ80N0C6rQdIqNNUjt/3r9rZmgAJvXOOq9jg04ZOBPMyuipl8pC8qBLrbRI0PXJ9xG12yw9Xn7dAtW1ZrceYxM/SaGrpxWAQyqR+8F+LwIOGMZBsWOKA4QuvlzdVXggVCfLfDkyH7x/llQbehCSekLBBXAQOJYaDf79NCTW/PLtCBpc1gFcp5f0Ins2SAvKsKS7IZVOlG/MpfcSOziax5n/ekN7Ng4nRxKbfNaf9IT3NEMBKPbY2tCecsH39fx3nMdGNZON2+PfHAI5zxcbHa545wQC++qzRS3UpnpISZrW0Kt9WsbzByTPgbbL6ubLFy6QFvQh7mlwoYX2ILCDGGzd2IgDdMwLUhjEb6kFYogvNFX0UVFlONiz67EKNuF04lyh6pidDn+ZFgzzy/6zdtFRA9XIGVX/QppkNFxm7rHuqEhQUOsz3aeDzRLGqJcVtWfE/Pmw+GvIJNxvWkyM9YcmO6LuzCWRM7UkJgdy0K/aodK6MKHZUQEPaJvN/LTVZDfYgRDwyCC2Hoj/mc9iTuIdLJ+jtzuKs1dfELfVKhYrZZZu5CHasSrFOaJfn2Xi3cxgPd7pOResGV98d8YdQEbWKwvIFE9x7FS2DmXmh+r/jP2dCmMYS3MTr/HsNsLvVPtj4mQjAdvodTy/GlirFDiIRLa/paijt1ew==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39830400003)(136003)(346002)(376002)(396003)(34036004)(451199015)(86362001)(38350700002)(38100700002)(55016003)(33656002)(41320700001)(2906002)(44832011)(4744005)(508600001)(316002)(66946007)(66556008)(8676002)(4326008)(7416002)(8936002)(5660300002)(110136005)(54906003)(52536014)(6506007)(41300700001)(7696005)(66476007)(186003)(9686003)(52116002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lsawMWTOuWM8slR5+jXQmD1iArhtaolC71zV4924O7D9cv2aLV2d+0n5esif?=
 =?us-ascii?Q?/dJNxxhtcjbi5eXUkroTVgAtUhZ+lMIIQfzYv2iZIkcLwYo12v0UUE8eiiAP?=
 =?us-ascii?Q?zxU2EYW/K0kVHIBH7OGFkUtxYyLFNHZywTFnqETJ8fofghucVizJC76hSKdq?=
 =?us-ascii?Q?NLniuQPhyLv/1GeIgFf6IgLwqK21VfM7PODqyg6EphXyVjov6H0uVBpRrlyf?=
 =?us-ascii?Q?VfNWmaRGweQ67FKpgbpaUPuqBZ9xfhTAyonCtVCRrqu0DC7oD4T/GDgdtgBV?=
 =?us-ascii?Q?PR/wQEEQfKkwoBRbbyFrm7laQEexY7b9AGRsLAy2gZ8mUZugAylAEJWp7K8Q?=
 =?us-ascii?Q?fsotE+kRXtQ/4PDbyBpcuynpL0nQhczG9LgLVi88/pmx0NISC6swOLbXFwkw?=
 =?us-ascii?Q?NCVaPEnzpT3QyqtKUSBh9DYx7jou69UrnyB8HmgLQ3ZExnfyGCENtCOmAbYN?=
 =?us-ascii?Q?EOY4emUTYH4yXLcNXpGoM7+I3eLZUUl9x7xuUx8hrEWcGQDjWFjQfblaquQ1?=
 =?us-ascii?Q?ntZbmxikAX+qE2hGiQXd1qgktv1DFT+AcwI2VbJ9pPWsVVhaiTogTWpWiF0L?=
 =?us-ascii?Q?ikvsLs2qa8aXn/uaJ8ubSw2QV7H/ldGyk5lZwuTZsIB7Y6OCmrvr6GbVikiJ?=
 =?us-ascii?Q?WWsPPr5k4wuYtmFA5KTs8yvf6VzYxg0CDk2Nsf3nli69JfDSi+rVb/9iKMB3?=
 =?us-ascii?Q?5OYvZjQRpfGkRJCyh6pDLrns9T88IN6WeuSKC+er2w1/GxqyMmdeZO2gmntF?=
 =?us-ascii?Q?TG9aC6SUS7R+AQ+5hNlGC2kzpnoK3DscvQlYU7S+VvPEnqigQzBY0QVJkqn+?=
 =?us-ascii?Q?pm5j1mSxhoCdCAYbhKnHlf7BVS67C6Z+SgJ7s5KpIVlM4gjA+ZGW4xIudzSh?=
 =?us-ascii?Q?wG2+YtvRWdmmuHhY+yu2KHUSC29rOPq7NfaXEuR8AWy325JSD42Pel9Xgn30?=
 =?us-ascii?Q?Q9l4XmbenDaN3+O2eQNsx+OrUkSbJ0cuUwAyVH89ZP92RzUurwda6OOEDSsB?=
 =?us-ascii?Q?VqF8bGm5rXYoWLF/78jC7+cR0vg4B7GbT49VTaX60Cqxve838KfSKNFBARFk?=
 =?us-ascii?Q?O1SZqL4J/MjFz5eeR1ljTPT701jYgmf0kXTNRB2rJPJGs38pibHc+rXVjaN5?=
 =?us-ascii?Q?P28MNrOXOIQ/cKm9t1yi5bsp10WXHQD+xugPZk5seLDWuSBWOCToVoq/Masb?=
 =?us-ascii?Q?csxZDDKbZ4drsP4h7ZvzwMGZZ4bxmn1U3at/Q9r+iy0xag1STAK2sB4tbqp7?=
 =?us-ascii?Q?ebuX0jdAnq2IXqMAuxaQg1A4WFft01Haf065D/JfUjpxauIKvBpmaTlJFrKS?=
 =?us-ascii?Q?wrufuitZw3gXTjQsfFpC6623FjfJMSD+3+CqhxK5tEGqZIga01IWgFjvVlGy?=
 =?us-ascii?Q?8CVoyO/W6rSfOG2x+0zE02ba2bWAnQ/08rupFUC00uGufdUKkQovsDIu/edN?=
 =?us-ascii?Q?Q+M2zin5v94Sv0/7umgHRaElAFtd5ChGqJPMJgkHREZYtskUb/d1DKkJvLdX?=
 =?us-ascii?Q?ACe6KqbrKaL9t5cYTNOQj79FhKKvYppCejiOML1PCJhlVGnezXgUU23zdPYP?=
 =?us-ascii?Q?JYWZKSq4KGNtWUiOlhmQGzEvJ7eW35iwxrnI4IP8mZYwqgjbvKujj1XjiNBn?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d4075b-fd0e-4938-c40b-08dabb3b8adf
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 12:29:23.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnRjoO6HK9y8UGEM2spAeWT25e2gCFBSy/GeNy++DPAHxAe2MhYLEo71hO2GNQw6aFwAlNHkiZuBhDq/iURxHceL6/hE6kNFdoqDGvdAdVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB1898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052933_443508_43E1AFE4 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof, Miquel,

On Fri, 28 Oct 2022 14:50:49 +0200, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Hi Krzysztof,
> 

[snip]

For me it looks like the "label" and "partitions" can be dropped from this series,
so in the future they can be handled by the common mtd-related yaml ?

Regards,
Vadym Kochan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
