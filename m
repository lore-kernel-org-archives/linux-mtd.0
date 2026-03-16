Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8276BF506E0
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjHXncIpljJDlkZWJB1RZ72jCkmpGki4POEcBTJm1lo=; b=FwqCRwesjnC2OP
	Yq6LKqzCEru9gkLn9iFPcTfh9zXZNmCNvGrI/qU9N4QPex0mUXlbNj4Hq5ThfBnxrOSWdSerQKfkJ
	v86AN3cefxN+G+tcw4iW464DwzttQrYcuc1MhERBpMCmVrdqNlXae0eAQ3SoPfMho6kYJbeH8aGuk
	Cn/TOqiycEv+DYfRyruQDo8scXZ0WkByIYmc0kPAM6LhJX7t35ljS6+AQ1WtAQXvah1lGItOi0oOe
	jcTFEicvlm5mvDtq+yLrFq+GJFG3GDKo9cBXsYl6YODZPzgHdcIc4SA3PqK6m0+NJ0caOuAvLCMgc
	NbRVc4uZTu+N+bd7Fixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w294y-00000004CD9-3n5H;
	Mon, 16 Mar 2026 14:38:00 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w294x-00000004CCD-0HFE
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 14:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgoTXiUcVG3EtJJYAaj83pjLZyKbUOswN+0SfiXAet1qBFhF6LJe7Ct7VnhOqYbyzqM/RrCGu6LXSBGHqeBx37VoTiZv4Zp79ep39eZnYxeQw5Piwraocvi5BRtmeQBacxoWf/5c6UVKoNc/YZWQUdrOWOVvt6Wa5OBAbd/RQgxdncCNEMB0xpU9c0lAnQhs5Z0kZhFNHQICNxlTWCMyUGOq6wPpoEwX0XcagA6szKxor8wXEelnF1htFGs1gOJn8yH8poFRGWK3T3M3gqxX3MHSEDKuR049s4Ju1bI43SKpBPGHSlBF5mPRUFoKwGGH6E4hp6af607kJpff9Snb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk3lOaRWswkd7X6vqniml4aXQfTE05GbJZ2GpOFwEVg=;
 b=AZcvR77ELu/8nL3nSbxJiUoFqe3GjIdrGGbI7R7qLUiBwEjvfAFOs+UcFWRrJwdIgzsukLA3BYKJ6zQOJMGdi8tsWlK7JbwkD6HKyEwYGsyLLyNIaK+bP4ZkNDsrFs7jWSiHaAPjjm5dLTY9cDbnXXW5tYq6d+YMv9qhU8r4hi7w1IoxbprsG4N2mBl/4qgcIlCExFfJTLA9Oc7H/doXfTbezzw8OfuYkzxgZFcAwzApOzpt6zVj6DbQucER0AuRcdmlLKJ/YAJvOQ7ySFFVC7ZvAjNvNuoRS7yQC8GFlzIP/jYfzlVpx7AhzYb3fIXhD510h5jUMB47rdqUezbyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk3lOaRWswkd7X6vqniml4aXQfTE05GbJZ2GpOFwEVg=;
 b=BgLwto8SZDlQWk2TvOxUW57PNfastmkixk9ax8gBtaykn9qY2zzVqv/gds+rXXHJETZjb4tjX7xHeulVtZ6GeSyrxwMQYSbftx3+9+ueJ3KjlrAYVEG5ATLFuk8AXh6r7fbdFeYx2zYQmyMELMzVCnYR5tQNJl2MT4BBWmcPlHCNa15XD17ZalRDHlTF3X+A73UE8gx8XD9fvtF5tIQ6aWOliL5cdkktUPTRAc4Uw0PPZKUONI7+/pR4s0yDasj/2g6uuyrMOG4zQZPoHuUpddfYvcXgakk5R46VZSWUBv8dv1JvyD/BwvxKfrh3gdzgJskczy34V9bGUUDRqIUfVA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Mon, 16 Mar
 2026 14:37:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Mon, 16 Mar 2026
 14:37:44 +0000
From: Frank Li <frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "open list:MEMORY
 TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Thread-Topic: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Thread-Index: AQHctVJzQCgUyXPSzU2F4gTsA+AiJQ==
Date: Mon, 16 Mar 2026 14:37:44 +0000
Message-ID: <PA4PR04MB93666895F0D685181FFAF5DA8840A@PA4PR04MB9366.eurprd04.prod.outlook.com>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
 <20260313233450.GA3632753-robh@kernel.org>
In-Reply-To: <20260313233450.GA3632753-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9366:EE_|GV2PR04MB12293:EE_
x-ms-office365-filtering-correlation-id: 88c4161c-de4b-42a6-fca2-08de8369964c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: R10b3GfTOC3hHFLtRCX5RzLeaVDAC77xfdlTyoGM9v8qUzXbvupbfjUeNPfiC9B5MygEuDm7OKTAuTvXjt2lhjNeN4Z1LthyCee9fyQcgTladi4LBEQEjjcvNUkPlp2hcKJ/hSOxIQkCouEZhqnS/zIVRhIELNVTuyktPXZXEtRndeKVBTYNELoOoi2QFIJB/riio4Yqpok/9CC3Ov5MAA5GYkxCFvmOQInOADrQAenbKZy5zjTSnnTfjwBfXqEqPIJ2FeM6vct0z1qQlsIPcy3+6xVoZFkDdfLQkt69y6l6Ae0+CLDEII3bPVC68Q+y+59x7Nlsp1buQ5MTp2xFj2XAHorMQLWhCZf2PCJm8Pf9VXp0FxYm1cbSMrpOb7gqrm1Bj7QTkuyrxcY972p+zeyvaD8lWboxQPCnWzmNY0/8ls9tlIp8MKQl969HC0PzoeRmtQvY/3Y4EcZvDjyHTwOLP8CAsquQIfIUT5+YzbnLcWcqxesZrU83QLGwBvJG1AWGJZR+c6ntUqNyJpAt2s0J21EK9VOEmNy76aTRsXFrbmkJk0/Y6E+aflf1zDXKmdzcEN9i47QWIyEChllhwQNkBVBM+E03fCveZuAEVRsiCRcWLDQD2bBEEfwoMQLGoO0Ww8tKx7w2BOsrTJ3mRPKrJn+ZhyqLRPiT1YBbY4dFzClxfHAR8QQgo+jIacxiZrFyWGSOgmC1LBdhsVD+09muZeoQnh+1Yzkb2Ghkqvxq1rYZW5938bbKNkriMlzRuuhhwuUPrnE6IZIFNxTLC3Bg0IzBpqu4/oBATLEPrM8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ei81o/CrJfVAKJwKSEQuBHJAmk8WooPcAErI30H4AZN8hZTg4tzPp67vmovN?=
 =?us-ascii?Q?azkZS0U7WFPz+ivfMXYhs5NTD+fMjS2RqwS6C6WrmtvR67fkP6dIkrcbSZKA?=
 =?us-ascii?Q?Nq9w2dx1bj5RcWtNl4yP51tPt2GmBdVTj/bNzFfvXWjy4PpXgqVixZAGUK2Z?=
 =?us-ascii?Q?yiI1QHsEnr7+7Yan/tZ4XVtjrWZfj45kHX/XZsGob/NTP007qMtzplljI7YU?=
 =?us-ascii?Q?zsbu7bZfZy4Rpg9gH5qU1rR/r9jWXvepBfbHnas+x3bozp3+aOBN966tS8tU?=
 =?us-ascii?Q?vKlzWyc1mi/dDGf1/g0GMTy396fBPkTo3FRsZ/dO1/9XL8UyVe92ggLl5LS1?=
 =?us-ascii?Q?BTz47Zr0l77Cc1RKa1yXJBHtxaBgMMd3m+RoLX2wmGgbbJzEtwDSYdtxg6kD?=
 =?us-ascii?Q?o4tAyhqIpoT+XZY22z7mP/f9K2GjrCRTRt+2/S2b2xSd2chgzW/+HXPnUorq?=
 =?us-ascii?Q?mXAWwKayGRArUSFyUzpdqcBa1m0xidpjSe9gIwINNCbkKDqgJE7AHZ7JsGW/?=
 =?us-ascii?Q?lyF/pWfRgHe1lQIwm32HyhVzlsxdf7wx2jLYdDlQZQ+d0gOVfUP3sVmka6bM?=
 =?us-ascii?Q?GTfdtqS88M18zBRH2R5pkx9rcPgBssS1mipWOOmIxJ2i2SPsCaLio0ilj6Fh?=
 =?us-ascii?Q?FVgnaBa3zy+ZT5NNU1ATKCLD2GNDeuEDQmSwPfEFVvn3+rEKzRJopYignAst?=
 =?us-ascii?Q?Hr2qpEoNs0rBX6Slk8fBVGZ3y8h2gXk5wKWCNdGSQ7eWrytR4e5SSXhXSg6z?=
 =?us-ascii?Q?aGKiZGgh1uaZ+4qbV6sy7Qq4GNq6Zlf9LU3KDr1uHZiW4b0llPHn9oisBBfB?=
 =?us-ascii?Q?peS+aEbDHNYrxA0T4tQ79WCuU4roNDWGCNLocRQ5vP6AZb2RDaCRdKEoCorb?=
 =?us-ascii?Q?fdtpyA5HtbMYdEs6GZn89HzLecwWK3BoEX4jKmtI8PndfucNnswbLaGcNsW6?=
 =?us-ascii?Q?3i3QeHmvWLOJTu4pArwkbo0SdE5wmv/bJrZW7qVdhHXU/t4hl93rfaBZYwgB?=
 =?us-ascii?Q?cwca64HrLmBGwptJaaXsar1s/aDHj4I3Ji8rNNg17+kSxs8s1Z938+lsptyd?=
 =?us-ascii?Q?2E8ulUbWlLPBhjtl78vSOk9uyFB5ZXzwfChE8p6NLUdT775jSfIYFt9KljkI?=
 =?us-ascii?Q?THrammiHMVdmwVoqKTwVSgYyM7L9tuVolGxfooDvoxXdS3dltlXIh7NV2MxD?=
 =?us-ascii?Q?ErW4gOCREdhdNLn6g/p7TLZ0F5jR9kOalsr1QfVvyDMMQKtsMqECPpgg34+J?=
 =?us-ascii?Q?kBPHv9NJG+YsFtT8ENWwk9HhSJW6OBNvTfMMHQfFiE+MnpjMI90OFhnPVoTq?=
 =?us-ascii?Q?aWZMI8L7mL7slnk+U5E9YUaaIik0h4k6T54CBIj1AHkjBvPQYgL9NEKc2Tj9?=
 =?us-ascii?Q?U7+0DKsnL1Dthu67FcV1YvvuhkdL0R7AcKhJ00A3YGaE9zPMLzR2KLTQNeN0?=
 =?us-ascii?Q?CzA5NshtHEUfMsoc3NVqWMbb3+cCosIRpajECFwt44Zfcm5F0cUDp4/4yq34?=
 =?us-ascii?Q?IcNGLjUamxd8jTW4GeM5EyyasRAoxyMuy4wsppXdxEV/ZRCEwtN5Y6tNajoP?=
 =?us-ascii?Q?VfmSs+0jUiL5NCuQZDU1daeW8L2ldknQ3emAS+S70DDp2cMlwUnkSrctbGFn?=
 =?us-ascii?Q?+c1g0Luzn9hzhzC3WOe6Nrq9qE3kyKL+rQgABvRjhOLkTvVoZqZOwyStDf/b?=
 =?us-ascii?Q?MGIKVRHgeUIeDsX5Nv6vrMVeGpS4+WHb9BuxPZALwqDMRy7g?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c4161c-de4b-42a6-fca2-08de8369964c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 14:37:44.9332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPjiwTH4FLlVrQ9HuVF9/8L/2uFioDrpFz89P0katSx5fT5cy9sIdUYhu/z82KLR3cBnL7ATNfvE/82mN4RX8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_073759_114054_AE230D63 
X-CRM114-Status: UNSURE (   9.12  )
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

> > +select:
> > +  allOf:
> > +    - properties:
> > +        $nodename:
> > +          pattern: "^nand-controller(@.*)?"
> > +    - not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              pattern: "^fsl,"
> 
> I would just do 'select: false' and make sure all non-legacy
> controller bindings reference nand-controller.yaml.

I found some controller have not compatible string, such as
arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts

I am not sure if it is wrong. So I have not direct use "select false".

Is it okay omit these dts?

Frank
> 
> > 2.43.0
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
