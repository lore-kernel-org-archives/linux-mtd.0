Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F240AC0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nl/iYxtmf5vl++8xBD3VtFAPkItiMNu42hqgelQ2c+E=; b=dG64zfU7gGobzQ
	8gJnORjS6+DhDI8l+J0lo7ycmCGi39vXlQ+PPDMAgIVbUmM3gnBL5dzvvSlW1Q5kJDlxDIS7b3yHC
	NOYPnDQXbfwGSdQIArF12zrP1tOIr36L78Rbq9j+brnKwLPeGgVsAn5PH828at1fwxj0gt+qlB1Hw
	KpDscQM6VitF/MOERAcDs09qMbJ1gTwyRvICASobsnG8YJ6YXuWHacMgZLSNps5aI3eRtKxiGULDx
	ZLb5JN07NlYZ3Cp1qTGvQiKMsAWv0Rw7C0iMnE0ygWgfiweVeaHLBLVWlo25m4vnQyhfS3R1wQTgd
	1qLuS73w+cm+19z2+P5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGZU-00000007sCr-2XGV;
	Wed, 29 Jan 2025 22:30:08 +0000
Received: from mail-am6eur05on20623.outbound.protection.outlook.com ([2a01:111:f403:2612::623] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdGZS-00000007sBQ-0mDO
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 22:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnwlxFYow0ORZEBDhb2dJdPGjGLskSezo6NlnGrNCmdiJc3sy0xlIJCVik70XVaKaF/9OP0cM9I8d6HyfMradMLssYXu26WkV3lSJbDnJEfaNxeLdwUEMdSnMCdyFDHd4gevr0scdUxAOYUFj5sIE0ex4nBwxTWOv0mI0fTv8LzuRpjuMsE65EFFENYvEhjowFqNCXgfHdTlWyAGbpMoVuMdwPsqeAMnbHPoYUczzwBIz4lI8zinBH/f4HN+MhlXxwV6WJqvW2VAfBbGjdvuQlLRH6vRwGtdnPKR47T9SqURdIpDRKetAaQoNCOihsN4cpc7XLlM+VJHp4zbJYH2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwXEZi8cIC2ZmG8SvYMGoJwQalQTB7TpFfDrIrVR/tg=;
 b=Lhn3y4pVeAIS7vku8x1ThPy/Nn/vFUzT0UJQjqWPnkKAUamv0KQeOu5BIyGiAuFVxv/N0IETSdLBf5Sz3TqQcPhcSxfOjEBHJaHXU/cxJFUXgicCSKEA8iBBVf/tGipFTfsorleks1BzZQctrrCnF4dyYTX6SXORWFmnZZgeMG5IWKVa+SbJKywLFrkZU7r9w9qhSkvJbV4Fm00XJm78R41rXNyN23isksSRoVtl/SVts8h4y8L60fdb1jDWnSzdrjWgwSwcdO1OtdGb4Z20q4bC/UGrOUxq8fVxkluRYar1Wm3DX/RXuiZfdPRP3JNrwxBSTt4KWb9hpyg9KlUNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwXEZi8cIC2ZmG8SvYMGoJwQalQTB7TpFfDrIrVR/tg=;
 b=e1ri2ZWHUaUT+4RZl/Y9dgZFNO/AyC7uUvBPe8CTKYZRcuHbxXd1Pj1lBo2z9sMkDvwM01kTvmQo2uiyuI2bEqGX0CGgDybfI0HID0+g+sgIxEIOJnsabNOVM9Cs/a3RG7AUaNXa22YKaiGiTpdhytv1lGZyH4JiozyAJKidDj5Yvb4ov9O8uCDM/dvQvKj6FFD9aCS3gNVtjLoFnW9h4p8BcukjQ7cxPXLj3FBUjY12mwGRhtrmWH/diocieCBMPb1E5rPl2i3MFb4iWUpsN5ar0b/9y2uLKvdKywqA5nenkoH88GAmw+WMTfdzCKt3KjayEOjEUa0UdI23zfrI0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 22:29:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 22:29:54 +0000
Date: Wed, 29 Jan 2025 17:29:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b4a154-9a6b-4ff1-0ad9-08dd40b47456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Tty7MLVK/B4BwdTWMQDi//rs9ChpRx6nj2vQfbTAbKYeADjyf5+Gcz0vhU?=
 =?iso-8859-1?Q?tYhFyHm4KkksazkGrc71BF410o3qhSrq8/etHPVoG4Ckaot0j0RNG0FvaV?=
 =?iso-8859-1?Q?tDH6B6tSyHdaW+pFWIx7POzbOoE3Vs10sfJ6xscBYBQCqS7JOCILdRZQak?=
 =?iso-8859-1?Q?vfJjUE8OLn43o/4SsH/DJaM4uFUR7N8QkqqH3m4VaNY6Agk1yra20Z/0UF?=
 =?iso-8859-1?Q?tk5OX+SrE8KkHI5wvTU95djsCtAB5jz1id0/h3T6s1KLvUyYiiTZjv4rV8?=
 =?iso-8859-1?Q?ERpgdtK7OSrRQikSNVX6Y4eNhTnv9KPeSdHC0KJWMYh6nFE6WjF+oZGE/T?=
 =?iso-8859-1?Q?xvFoehsOlKtvVj1LcgqvA9mdAkOGS+s+HX1Kz9AXifum5kXPjWgNCTwrqg?=
 =?iso-8859-1?Q?rbWW6vWU5qy/hiVPMTYx+KUZkUVii8d1mvDo04gztucsKAaK0SylvcYBHl?=
 =?iso-8859-1?Q?kkSPV0I1l2T6Ju2//L82X1/WF8C5w1tuQF8QmWUQbNc4N73wkMZ+6BE7Ky?=
 =?iso-8859-1?Q?EWNSQ8vN5UvasTK3kQjdB1dfxetnzA3CSJUhPUKMdKL1kZuqjfjU0xovWR?=
 =?iso-8859-1?Q?FHAYPiTJwsKio1aobaJTc5eaDGvd+dazsHVI7/3vrraUiSGh+5EOfmG6L3?=
 =?iso-8859-1?Q?pX99WG7E2XG4+stXZjbVqkSsnlHDkBLF3yhQV0JD3hKTT7lTKl4ldtHKT3?=
 =?iso-8859-1?Q?dvTBG2OAcsp/mAMKcM3l/aXif2obk5PvGM/7dFQXPiFUNgySaS7/fpf/xc?=
 =?iso-8859-1?Q?tpn1UMpsWl9oKwy3ORGpb2xRqB7w0tMRrGoO+LTEnTWlvtHFpfr7u4PLq7?=
 =?iso-8859-1?Q?X+2xeHyXjEzRQNkKKN7I/cMzbNn/2x74Ija0HIXi3zWrpzw4N92AYzlHgg?=
 =?iso-8859-1?Q?7xxCcMpXZQg03xzmfb4URYXd8V6mHpOnK4BqpT1/CtHI3Yxokrb7hkUk7S?=
 =?iso-8859-1?Q?wMVFR1/A3H0QzHE62TpiblaxOrwqbYBf15u5HlHPoQD/0vHP0bEuo1ZrZM?=
 =?iso-8859-1?Q?WeevJdSVmbtq3Szps7HXR9tQSejNVu5dMbVsW88cfDJ6BTPESJQTRpJE4p?=
 =?iso-8859-1?Q?jAaR1OFlCv3hgbVx6dQCm8++EqCnFOfqSI1FY6WU/sXYcreo2KQa5YVQ47?=
 =?iso-8859-1?Q?JEcZcGK5xN5dGZzvLzd/bZXTgw7zPeJNKKWwADFvFeOH4RXxcMd9FFyNqJ?=
 =?iso-8859-1?Q?3gsgVOMQmh3iWAysh08dFy4nB+gS3/0/RjgnUXfm2ZpcvTRMB7sj48zYW3?=
 =?iso-8859-1?Q?d4TZEGTXA/ZvfIt5zBE3FK7RFxfFJ7OuMCbCcZye3KsFIpk9hCjUcbVQ7g?=
 =?iso-8859-1?Q?wOoDMm4wjNFgKKyjCopbuErrSmzgu8DzGOvjdOT8m5IVVCau9a3C7swC+/?=
 =?iso-8859-1?Q?JffhOrVkjg6mBG59HPkXFPTmLniJm9kJ2M0c8V85GIeTDXWnVJiK/O13k6?=
 =?iso-8859-1?Q?ZfTW40dFYUXhP9QK66z32OPMVyFitFfqJvrGrrR0CavcJnep7oLgGni5Qd?=
 =?iso-8859-1?Q?h6bzTSQCZgUMHQMz7Sh/JH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f3CK1l1yCBSbba1DBW8FukO2fm15mR7SwxoYuy67astrppTE1saq+yIuYL?=
 =?iso-8859-1?Q?WgYbGKjbISVR+KP4i7Km4WSoH/Iu7RJ2EfRdG2+rmrJUlLfEocHjV+bsSj?=
 =?iso-8859-1?Q?GsojgaKqPpoIkibiGbZ5BumHGZV/N3y++3XLGbd6QFsbLMooY3xGmZtnEz?=
 =?iso-8859-1?Q?JvxtkYBcitDfsfkxQqxMDk2evAHOH821XfpLYoAty21qJTemxUq6k+4H9T?=
 =?iso-8859-1?Q?+LRrLwiiEVFgGc+xt03FVEpJOg0hFaJ9hgVbo8h3gitM8ZDXKFpLNRnEuv?=
 =?iso-8859-1?Q?GEM3QbYJXHAqeVvnG9sQ1wQsKerEKBdXHgxxA/SF6Y5OBfc6V2AVVpynYP?=
 =?iso-8859-1?Q?VGMA60tXFEC4OyyY4yJi8n374ropIOLJetOi3u8XZh8q6uHXY1zj2Fsvty?=
 =?iso-8859-1?Q?NqV4SoRxw5gmpWkxAH+SrHrjTJXse1slpgHh4e3SAHN7H1UWp9ICMeBmUf?=
 =?iso-8859-1?Q?neTZnP/N0ZhYoG1LfxrKeqy9pj5Dkg7BJ9ZLFuZxNN3pf5Z3owz5MwPmbH?=
 =?iso-8859-1?Q?dxFqwuJouhz5LWLyuHIvEjoD5rDMU+iX1M90xPjwYLcQhsHZ6SvQMumsYE?=
 =?iso-8859-1?Q?F6UtPVQ1MclFQrk05HTOmiKAloOktHyo9u7a/MNBhj2X6OZ4OyoZaiJfAq?=
 =?iso-8859-1?Q?SdmGN/Vb4hD4EAsRyRTAkfYQIibtXZeHYQCvFyHV5HNhcT8nDiLbr2+Vqc?=
 =?iso-8859-1?Q?uehrGWofQLqRxIUbds+Iqk0PMJxqsIlqplkdfeA0/at2gFDjIEMgmdioqt?=
 =?iso-8859-1?Q?AGhUvdS1rmprOEkr23I7P740cl6UA2tAYQpn28gv5F0ebjEd4qmp/7Gutz?=
 =?iso-8859-1?Q?C4A68JpEKZ/xGVviqK01f18jfB/ly1qJDRnNBQpKQIyFEWabWfOgAGn+lt?=
 =?iso-8859-1?Q?KWxsprDKNGjRif59rh+zM+aPJ48XBFkc+De7Aydo3Zsu5v/p9VoPi0eRhy?=
 =?iso-8859-1?Q?QyyR6xOmVEURs5fqqFKSFVH0z8+6FESKegjjDWOxT5NJkPgQlosNga1xQa?=
 =?iso-8859-1?Q?MyUYg6OV0IG4dDA2fac9hmaJE3ofok0dGLMzqStWZXjxc8c117fpCDYq4/?=
 =?iso-8859-1?Q?YKy6e7fWTKUeP83wsPPijZ0Pdo8Yg1vyVZ+NqNtbmYS/FAVWbKbgFgOUzG?=
 =?iso-8859-1?Q?5Qy9d3GgssVBjAf8xqmXOOi6ZpwmkkmfBDDEpWsfIxxvAlRyzBT0+IzjNw?=
 =?iso-8859-1?Q?oltkxqs0IgBGVhLl0zR0AiYx07QqQpUj1LH5ovzmjqEDANnOtbh6wdzW1S?=
 =?iso-8859-1?Q?jzwBVAcsA2AYOlw/Y+GqEMeagX8y8nGhu6M+tTcqYPs+Oxpxvx1AYUNbL/?=
 =?iso-8859-1?Q?vlpl79b0X4tBDI1dIEIAd6ZdtZ3vx1ybp9GzavrfLN4ljmNiNcBFkVnfnr?=
 =?iso-8859-1?Q?ByVemvKPfA5QJcixs5fqPqWOrix1aCLdv6zPn5/Mw2bSkQ32uT4bWYPnwe?=
 =?iso-8859-1?Q?2r59iahI+ZgVpcSQhATeUrkahlSiqIkmMP44aPMEdg4REPVYNKOGhqzLz0?=
 =?iso-8859-1?Q?lNmQFSctrnooWruz0OiKoqcUV7dfy1zWy06as6dpSNYDUXTHx/HQ7nD6eV?=
 =?iso-8859-1?Q?oRwP/sCTlABfG7hmLgDhgPHmoAyMtxnjoUAyThWGix7EVLTD+GbWJtwtSe?=
 =?iso-8859-1?Q?rM0E4M/KZT6hM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b4a154-9a6b-4ff1-0ad9-08dd40b47456
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:29:54.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KPtjEtOBaIQxSiJLY8wmtG/N9cqzgVCstLsLy0kTLYj8T3xnFcv2Bjy3Rbd8Xjvf2KG+jaF57WMtw6Tr+O6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_143006_228968_9DA8666E 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jan 26, 2025 at 07:58:55PM +0100, J. Neusch=E4fer wrote:
> This is a spin-off of the series titled
> "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".
>
> During the development of that series, it became clear that many
> devicetree bindings for Freescale MPC8xxx platforms are still in the old
> plain-text format, or don't exist at all, and in any case don't mention
> all valid compatible strings.
>
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>

Please cc imx@lists.linux.dev next time

Frank

> ---
> J. Neusch=E4fer (9):
>       dt-bindings: powerpc: Add binding for Freescale/NXP MPC83xx SoCs
>       dt-bindings: ata: Convert fsl,pq-sata binding to YAML
>       dt-bindings: crypto: Convert fsl,sec-2.0 binding to YAML
>       dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding to YAML
>       dt-bindings: dma: Convert fsl,elo*-dma bindings to YAML
>       dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
>       dt-bindings: watchdog: Convert mpc8xxx-wdt binding to YAML
>       dt-bindings: spi: Convert Freescale SPI bindings to YAML
>       [RFC] dt-bindings: nand: Convert fsl,elbc bindings to YAML
>
>  .../devicetree/bindings/ata/fsl,pq-sata.yaml       |  59 ++++++
>  Documentation/devicetree/bindings/ata/fsl-sata.txt |  28 ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 ++++++++++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 -------
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
>  .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         |  53 ++++++
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 ++++++
>  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   |  83 +++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------=
------
>  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++
>  .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++
>  .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          |  67 +++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 -----
>  .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      |  17 --
>  .../devicetree/bindings/spi/fsl,espi.yaml          |  56 ++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml |  71 +++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  |  62 -------
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   |  25 ---
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  |  64 +++++++
>  21 files changed, 1212 insertions(+), 444 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250126-ppcyaml-680ccd8b3fc2
>
> Best regards,
> --
> J. Neusch=E4fer <j.ne@posteo.net>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
