Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365F5FB5E88
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ3yGOke5kk9iVB4OWYw2m9DgbPS+TcalJSQnkXjfEI=; b=d5ju887ToYYcgP
	v1r7S1srTWq6muoqT5EVsp9z+EZmd1edeoCuDo1k/oVl87Z054xgdLDH/pt8kh8qH78hmLbKwgChu
	EKX1MxfNg4+PSeLkuMTc9uFHXcxpx8iTSd7dPtqk8u8rr3hS0ifb3ra7QXTTV++hggGMwa/xY6RfB
	EhlO/MZP1EiSHc8fQ6Ftz6tqUKrC4mgdC6Zj399i51QznUUnWGBz2uNxMQE/7I2+CrFf4IsRG6p5e
	leX6EDVF0Z5RQThjj91JwzBEusV+qHtCIGO+XQPTSOg+FMrWOdUdEmCO08YbcMXR5olkoC2lDMb1L
	NScLdr8bSNtp+1QfML2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Hej-000000055kT-434B;
	Mon, 16 Mar 2026 23:47:29 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Heh-000000055k5-2UX7
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 23:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ri7+kAEZt1hr3R0PaMJWSj07PUcuYXFOJckVRUNaKveWlFZdhtJYfNlbhhzMl3O8MQRoGUfE9uaJkkmk5qPqZwpzs8nycVIbYjRC+9fQ298xsmxYGL+XIkKIylMmsF0uKxlOoRMmbdZP7Vku0RN6mF2IqrlnpyodrkAIqMbpwtL9NWArA4XO/iA6evwYevpLIPrQqXnEowa0N4/P4ANytKE3QNQyQo/IZDZbFAuXDD/Lc5ojvBkl40GWpZfQ/huRuLAwcIH1NbKqWXM3f1PxwsW7QiSd3P/447tlsc2GKkrmlzoVI1IfXzFNru2tD/6C8IphzPpT7qyLjkMQf3WQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NGxHOMWIdeYaV123EjI/fNhq/BwqhYjzat1yd51p2Q=;
 b=JTKEBCMmvvMT6rLoYvpMct3Z7imKZtUjhmxsYpeSu90AZtKAHqia9D1VncPD2fVXFfaauLedSQDm8SDulmriOId0gy4bXVcEYAXrigXZdil1xJtKF4lO50yWzfdS3FjANd2JoarIzQKflhWRiwNWnJIJWbyM5AvqipVpBRBaNmUZI3brS6Q9JhDO5fgXfyeoh9QkLwkPMhiI5QUvWuOZD7uXFUJCMAgS7G3mtxCJIBOsG9AriGmmpuXn6h3ounakvsKrM+LJAs09y9qT25yD/ZD9KmaJb6PNeYwdsjx06MIk3BXI4d+d4zcyFQDF/oYOod0P/7mh0pLC3fS3h7O4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NGxHOMWIdeYaV123EjI/fNhq/BwqhYjzat1yd51p2Q=;
 b=aqZ3u0RGl4IOW+/ay675wGL5xqTkKp5dSIv7S4LdaCHj3buvr7s6NOueSRKDuRiflMhxT67MeLDJID6VW6v2ORt5smt8KmyeSA+dLCHIX7mT7ei6si0FXbbvCZUgrwqNuFt3Aj819etL00MbuOCrQ39jfzbRnMUUbQjnrPp4I5iSdZ91L7wlnUitvL3T/+S2NFan9LfOSyLIJjKM2PwG581Uo4uO+SdpgMSu1Dcym9WDfyn+/b7TMPw+YNbufxlAV/LU81wRgDJDE+yuT+VbCVuWdBaQ6MQM6cFRc9c1+UGGBa4fm+FUqk6UO5t5GlSPpnBCjWIp2bjYTIpZh27dCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12421.eurprd04.prod.outlook.com (2603:10a6:150:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 23:47:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Mon, 16 Mar 2026
 23:47:11 +0000
Date: Mon, 16 Mar 2026 19:47:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Message-ID: <abiWfytPEzbRAIcK@lizhi-Precision-Tower-5810>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
 <20260313233450.GA3632753-robh@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260313233450.GA3632753-robh@kernel.org>
X-ClientProxiedBy: PH0PR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:510:f::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: d553ff19-6bdb-4f5e-b2bc-08de83b657e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: n4KbU68BQYSyCM2sz1ntSryMIL6G+wMVaoT8pVHhDHos9nU+rjLbjNPFDIDLNhB5xUH/SNmosYo9QGGz8GSXLNV6H+P51gR2cLw1tpHorb0lrZhRHImHLnQ84Omm6w31z+cv89t9PQ6Z5Bam46rtHmb46mkNv+9w4jJSHM6AZ2jLFA68aOuaH4H9hqYuLffePCSDk/8oYQWL7ULVgMpJzAL3Xt7Iobzb6GcQx8mfOK7nOYf05n20CKAogsXzSFWXLIa7yy3UbrFR42fPjxN10UsW4CvUyaMAJWImJFhxl2yVA5EoVHx5tttSAGfoN9r+g+NBzVSJao3CnXS0WKc0wdoJZrijSQvZV5x+FRdhPeNTjfjRsfR8s2189e9AEHkOpFdDSKJKAi0RGjBk9K55BERJ1TPREdwAA2OFwhLSGEo+ARe+sLXUda4Xkp83RjvIcmjiQLWbQuDTseWc3d6XJPMOk1R26z59gdj6JhDN8DWGq+0XSz+b9QAcr/ybW2GHBQJ4XTWEhb1Ym4olhUtIOPkOtUUqs5Q7X9CifauJSVoSq0hhlNTP6pQA9t6a9jMgW4GHPq5RkoQJZ4rkWAQOdrthSz4ynM6b1N8S6VA/ItWrcSsZ1ZgRZvwQtPqXgtJZIeXue18ctHcARn79+/0DWXI3LiL0QsgB3fCI62l7VEecLZ7gpsW4YhE8gbTX2ZxWAJT+/hfYyN7L+RB3m9pV74fPM3cNwsdHBcq0gA8cBhVvdqcZ0NYDzUfGKPQ6BSxK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGFw2MY82oE+reGoPYX3jJIJzpfkoYhbj0s4129tMTRYsXTjFaegnEl0MVY2?=
 =?us-ascii?Q?44ETpytUrn71feRH4S+xaPors48dIIZPKDuv5kSc6I5JPvONAcrEAt05ZDxS?=
 =?us-ascii?Q?KmA5bRfuBH8J3lWmr0hgzLKHHj+WvhhhZkkR0ZRq6TyTDanV/iVCnTckDPRV?=
 =?us-ascii?Q?/TL8XtC49lvYq/ekWsUkWD3Sip42FPquD4HBp9kGMp0sb/wapSThO/cG9UFp?=
 =?us-ascii?Q?I9koAHT7+ngKVcIRSfRW/OVKtFpFjTyMfcS6n/uXC6FXO0Jk0KQpmDnZrO3W?=
 =?us-ascii?Q?X0j1KXRUSpHpXnLE+0izLBvbbJKayi6aSn/NaqVhdnYHYErJIeVBYDDGG1Pz?=
 =?us-ascii?Q?tDiyB+jw7sK8Kx2CzBYB01MO9xMpijCn4aLC13q/iGidwVfniFavK0bAlw7x?=
 =?us-ascii?Q?5UoN2XDacX8ZEleJ9xWn2LeVIV1fe0Ltx11w6pi066bQ+wBXjTlXOj3E7bjZ?=
 =?us-ascii?Q?TiEP75qM8TUtL5AqxpCq8Fc91UCXbHNife8QrWf1Cx9A2yshuq/1p6QvEMe0?=
 =?us-ascii?Q?XXSCEWkJgtEBScSMrbiOcodIMCV+IHSp4HGn8Clk02J8d2GDuAhV9wWDBm/S?=
 =?us-ascii?Q?dZ375/NsV3gfg0oHR0GxAVo8W0MtlPVNLkPcPoRFTntYe7quOtGwZ55+e2Bf?=
 =?us-ascii?Q?J6mzQtaRuI9ES8xZNafn9w/RBvFa80YHn7+0+iywWHA4QnoOMRc8XEX7V+Uo?=
 =?us-ascii?Q?Z5C2dccTGXAvfx349cqQc3PZgERpp8rgU6LR9OYJyVVsF+CD4b3Ll/62r6/R?=
 =?us-ascii?Q?S0GycvuYEAOIntuDIutApR/k/U+LpstLsATzj7th691KmLvBPBiSZzjzdfr4?=
 =?us-ascii?Q?/WSLtaVk8j4yLHvSB+b9V8xefRkVl177TmlUASx/W5UTMeAL3x+6hfyKJoe5?=
 =?us-ascii?Q?WFrsXxmEBqiTbI0GyydDEOhnCiQtxvBf3RH+VSR01kag7fId6Y8hbtbdeN/T?=
 =?us-ascii?Q?yD8EziDuW19cOvFTB6Chu7v8zM25qvatnVDLSrPpssP9+wpmQBPXI23isSPE?=
 =?us-ascii?Q?s1zKASgxn50rSsiN0SaIzb6jowkzD9UZb/jjyr8rIR54Zt4sOnBppMRFS9xY?=
 =?us-ascii?Q?bomVZInuOH6bJp61b0/vWMTqD1ArB01xUjt4K/iGHSfbegsqm2m+awA34gnF?=
 =?us-ascii?Q?7CB07AUxsLODJ8yCLnVQvGmrMWY/7AHUZjH1+yZEGOVT/eIno1cChRBJ+FSE?=
 =?us-ascii?Q?mUrNUxT5HgC9XFfi0vrfznwm0agPrwndayrNVumF+wtIVdzkq3dpl7gN/P5s?=
 =?us-ascii?Q?//hrgsKJ+FiL8C14wooyqBmhjxibW1DTfkm/8Kd8dp043no35DX7n6p8zw5d?=
 =?us-ascii?Q?GWp9lfQkeSAJcCxoMREhRXE53BEGhX7UurT+Z5Rssjpno8Gg8W+9lYig6B1Y?=
 =?us-ascii?Q?xsub9p5s47p/XjXH8EBHKpoxTjx4iYMWQJkqbyGQvB9ckYB8M1N6MVMVbhH5?=
 =?us-ascii?Q?FXOtjT/7FOBPHVws/R9+iwQ5TTv2tB03ODBhhuxrFwH5jI0ecjIpBQiXaIjN?=
 =?us-ascii?Q?cJWiAdccS/epSR9mmAb1HGr8KSTjMuIFGcNnT0/ZWhr3V9yETD254asnj67K?=
 =?us-ascii?Q?O+7scvn9z+feFmO9LJ3/NCDYZ/S1ZhhfOVYIKOcWVNCX1s1OU2o36ETRjKz1?=
 =?us-ascii?Q?ih8Uu3tAoTns0Si9sLc03woeVCRGGSyDchpbHbRtDhccKfTWAt1q4fnhl9A5?=
 =?us-ascii?Q?j/78L0YJmg0BXd1CKaXHKVgf3/jjySCWjWNsAjfJqypOM7BF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d553ff19-6bdb-4f5e-b2bc-08de83b657e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 23:47:11.7547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANNS5Jxj1S02846+VGG+irPFSxA20SNxdrJ/k+G9rNbpkqmUQScOKBOyygf6v4i6nMXsD7pTXLUkAIerUQq7Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_164727_644463_B90B92E8 
X-CRM114-Status: GOOD (  17.21  )
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

On Fri, Mar 13, 2026 at 06:34:50PM -0500, Rob Herring wrote:
> > --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> > +$id: http://devicetree.org/schemas/mtd/nand-controller-legacy.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> >  title: NAND Controller Common Properties
> > @@ -10,21 +10,22 @@ maintainers:
> >    - Miquel Raynal <miquel.raynal@bootlin.com>
> >    - Richard Weinberger <richard@nod.at>
> >
> > -description: |
> > +description: >
> >    The NAND controller should be represented with its own DT node, and
> >    all NAND chips attached to this controller should be defined as
> >    children nodes of the NAND controller. This representation should be
> >    enforced even for simple controllers supporting only one chip.
> >
> > +  This is only for legacy nand controller, new controller should use
> > +  nand-controller.yaml
> > +
> >  properties:
> > -  $nodename:
> > -    pattern: "^nand-controller(@.*)?"
> >
> >    "#address-cells":
> >      const: 1
> >
> >    "#size-cells":
> > -    const: 0
> > +    enum: [0, 1]
> >
> >    ranges: true
> >
> > @@ -39,33 +40,26 @@ properties:
> >      minItems: 1
> >      maxItems: 8
> >
> > +  partitions:
> > +    type: object
> > +
> > +    required:
> > +      - compatible
> > +
> >  patternProperties:
> >    "^nand@[a-f0-9]$":
> >      type: object
> >      $ref: raw-nand-chip.yaml#
>
> Shouldn't this be removed? The main thing is legacy bindings don't have
> these nand nodes.

Support both to provide migration path. Need support both to make existing
boards migration to new layout.

The i.MX8's old boards use old layer out. but new boards, we expect use new
layout, but they use the same compatible string.


>
> >
> > -required:
> > -  - "#address-cells"
> > -  - "#size-cells"
> > +  "^partition@[0-9a-f]+$":
> > +    type: object
> > +    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
> > +    deprecated: true
>
> Is there any .dts (in tree) with partition nodes not under 'partitions'
> node. Maybe this can be omitted.

arch/arm/boot/dts/nxp/imx/imx27-apf27.dts

Frank

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
