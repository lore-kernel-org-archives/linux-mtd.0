Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB9C38A2D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Cc:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrnN7W2Pt2LPwVaXpSysZl76ntDU7U0sCvUD0IXD+SI=; b=uxoTJ2yvX/MQkO
	/CAkRSDlCp3URftIrPwdMJXnnDFNQaa80vDHUMKi+wejJQME+IFZ3Hr+U4icQH4mmea7tC8MeYFJ/
	Zg/LUiFKpFywmWFHDaR87NuAWy5Hxh6mNPMetKoWXq26l31V7K3FPHbJPGnCL4RLwpbzDVRoTCgba
	ZQiXz0uJgwYvdwtIfITqfY7K/3on8iVIBcuIaMWSr0xhd1Pxmlb6iUcuK2GqyyhyK0M2UCrpan4yQ
	DLO5lJWH1tY63r5bFRpmZlN/muRVdwN65njcCr/Z7rZLGCphAEockQzeB2QXQNFfzPz8M+QHpXp7i
	YDz4TxxdTLPY9OBrRkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omy7t-001ol7-DK; Mon, 24 Oct 2022 14:08:25 +0000
Received: from mail-eopbgr60108.outbound.protection.outlook.com ([40.107.6.108] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omy7q-001ojY-Ex; Mon, 24 Oct 2022 14:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9LdTpe9QwZf4g9ABLQyX7kWAws9zbdKS1jGmdHWeqAj+snMdKvFcQZKeSU3snTn2bfbkoRPg1JEIVF4pGYNTXBpCB6FdkvoYtKtdElKjB3wmPDJE8BpoN3egcuW5Ry9AVZbHhCd+gmU/bzbH6UXGI82LRtHmdA600lxCSm4MFqS+hpmkBjEky1ljr3Y6WpvkrUg+fE/s2REe2ty+H3srfOFm0/f7wMvTNt3CQJ0xMFcTMAtzbYYC/SD3eTyHca3QDt3WiiHwUyEMKYoFNSNe+E5JgiWZizKrXjt16yTbCogTlfuFxbRtxz+uHKokWCW+Sh4ocOw9Me5dBWBcKexpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1h8u1jwP4Qm8LKmv5W/b6q6mOSeemJj4VmGpDLPTT8=;
 b=lrBtVASHd40JnlghJsBJVE+0Bg+iMMPGi1+GxH4mYQm1JqXKgSghVStVJmo5buJdZ9fpLA4ErYcxjbA/Na2EN0RD1sXZTK0uK4Zaf/yIoRoV+/ILWe6JsLdG6yyFFv/FGe+m/x4BplV3jpYzaUsadws1B9G5N/jBvi1l3MuyFlXZCF905iTtiL6DvAwhLSWsQ4wzAgPKFMXhuKDaqramKdalrKI/AxqTjC0/M9GWJ0LaW+qMFEpuFgnj5uUNWKiFFoPPX8DJkP02U5WWEjlST9haew/emZds3XrLIDQNXz3TMuNkz9NDrriVyN9zepBAbipnOg9/J+DxhrKW73UQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1h8u1jwP4Qm8LKmv5W/b6q6mOSeemJj4VmGpDLPTT8=;
 b=UePMTYi0ArHDz1ieagALcFMZgpol0Prg/eazhf8n2dYqBv5YH+JvuzD5e0rugEh/X8fPBUs9Ttxu0Md9tZOFMSzsMxlc9nL61TgaHhGrFiLazRXs6/OkezJ8MA3xmNhmuz5vciig32peRYah7Va1U3T/hbGXyoW60Eu409jvB0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by AS8P190MB1078.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 14:08:17 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969%5]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 14:08:17 +0000
Date: Mon, 24 Oct 2022 17:08:14 +0300
From: Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn
	<andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>
In-Reply-To: <5ef70149-5079-173f-ab6a-a9f0cc01f281@linaro.org>
References: <20221022082628.23876-1-vadym.kochan@plvision.eu>
	<20221022082628.23876-2-vadym.kochan@plvision.eu>
	<5ef70149-5079-173f-ab6a-a9f0cc01f281@linaro.org>
X-ClientProxiedBy: AM6P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::25) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
Message-ID:  <VI1P190MB03171976C0A5F4BEA804FD87952E9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|AS8P190MB1078:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c07992-3ceb-4ecf-0096-08dab5c93282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9My65dzdDcB/xvGaXye7oRLJbjI9AAfoi/48w2DduX3NE3lZ8tYkZR/1fOKl2hkbgZOdapLFRF5Qpn/dXrVnNl4WSP5fk3GjtGvTjtPJycuyeE3885jn8eJeIVK2GKIxF+ehRxAcuEWpJu+CvrILSgB69jMCaMVc/a1ovxd+BemoCUVnRahYOoo8ceAhwXPp7tj96HCvycDjJWb3Kx8alqCx6tL3WjP1sD8S9RqZLZa2NvYetQe+Rhzd1UavNvzgHmRcTApY5rvmDSDAkK7ziuH49CJ3gInTLsmy1ySij+qMnxne0OaQzxmuKBuKadA4XQ9Rj5anrrg3mvPp5NjlfFkzkU1dr1dCfObqSXDyhoS1L/3LlY5EUwD/nOre9VQ9y+VNFY+9JXemTOaRFSqudffCfH9PjwAnBe2lUJ5sI4H7bQTab9MtrNLW3lXJ6l68tJuzhebC9IwowGm0D6Q6xY5FJGEJ3b6sJjC94LzgFkKRVeqD3ovA3nOtCuPnvAGuS9lYA3EI5k0KRJ+Fy5WWSmUMeJJkXYWC+wPFgvcD77x8yJ1EFwTew0wpjQYquGGiKQwE+eUR0fCEqJcq+S5zpwP03rCqUcjjYWi2mYLUmjEGALGEUNLniFiEc3xxAM4KVf7V/QSc3OEgLPj/PyJGyBgBrbqpk6PxJJg8Uuadx+cTciduBtXpLtm2fErgJTYTmMQs7WCKl9KWg7CthOBMKsyuTx20dloTLAfgKN97CqzvcJBVSRVb8vBnZqtxV91kvQNEZ4kJHLZwBDM8CQGt3A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(34036004)(136003)(366004)(39830400003)(396003)(451199015)(2906002)(5660300002)(7416002)(44832011)(4744005)(52536014)(55016003)(41320700001)(33656002)(41300700001)(83380400001)(38100700002)(38350700002)(921005)(316002)(6666004)(110136005)(66556008)(86362001)(8936002)(8676002)(66476007)(4326008)(66946007)(186003)(52116002)(9686003)(26005)(6506007)(508600001)(53546011)(7696005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?brxdpXrPHAQ4Y1MsUgkNAu5FICVRLNg8nwsOY0Kz7kdulgaHbl326JwfI6FJ?=
 =?us-ascii?Q?9s9k4brtpisaqhqKr/xQQPxeolmi4ZR9hoeunFx8svQELitesBUPrkLVL6vE?=
 =?us-ascii?Q?CJAr7jhZToatt73bIdtpqx52yDWCOLkLxRRrGPuhq+B7TMsBJxQusjKEXycU?=
 =?us-ascii?Q?nQ9eVuDqn4HA9ixBu6c6zme0LPMJxWpbYEyJL8wOLdUn2JtYdVIs+/4bw253?=
 =?us-ascii?Q?YhtqLKtI2NDvz9BpBgITLW3sG0oJZSOEZ8/xCtyFAJWLnOhBFFFUByr1z9Q8?=
 =?us-ascii?Q?gh3O35bX6tlvWBjDPqiKs8hM3yWEX+bf7sXun+0VmkshxfNoMpS66NZtZmSo?=
 =?us-ascii?Q?Es4OvbhMhf7gRWcsE+Vcfo7S4pFdOYurXCRjloLwbxGWLFgjVl6vH/fT/hJf?=
 =?us-ascii?Q?Ilk76A5I6Kbna4jH8XSgZ85R4g6wjAkDi3j8W6y2IBJ+EMUsZMjiqQ/JzdH0?=
 =?us-ascii?Q?mJ09vPyifu66+eoXS0Zx2WyeeIoc4y2WK2k1dZXbzMxADcIRi5EytNiyPXLz?=
 =?us-ascii?Q?FkXXH1MmFQmAR0sQNPsjB81i4FD64ubircmwAd/pTVRjYyqd4BY0ezNdxu9W?=
 =?us-ascii?Q?EYWl6IhGIjPSBR3fcPSYdu625ZpzQGfRjpzAAlb712NrgkuCXBvQKw5H+TQM?=
 =?us-ascii?Q?6H0J0M0ddUU/2oWFelEUD3vHmpQSxaP4QlDjhzsiZyEvCONjrq73hKQkg2Te?=
 =?us-ascii?Q?m8ji5GMuAwWZjm5LXnmubQj4gylkQzQHoDNXAcxDAi+0GjoDqBjBes7GAV89?=
 =?us-ascii?Q?Z3TCJBb8yr2FqO5kDMDJdWRpOAR8BS7LsfjcKZx4xfjopchAXOxrncf81bnH?=
 =?us-ascii?Q?Y3f7k5PKDMOeLFMNcxnYRr4wPVEI12NLkJoqia4O7C1sfaaE8QX+C8aijyAG?=
 =?us-ascii?Q?PZaK2SHFKfwfZDLDdEu8yNpMsj5lvFQRScYHEBJZd5q+K1CyCsvhcVRibo4R?=
 =?us-ascii?Q?45PbTbg1aDuOAdwAewdhy420A7SeZF2KdConiQQxfmgdLzJ2o/ZVsN2RmgFC?=
 =?us-ascii?Q?sDeuLUY1uhjxkR14K/rzQPXJa3VsDCvKC5qdQf0Rbx2b26PG9FLaBVnvURgK?=
 =?us-ascii?Q?gM3bsYVxnHT6fSRr7pVdb3PcozsKCs9t/w9GN2fd9smLX9/+yHh2oDRUnZg9?=
 =?us-ascii?Q?Ljk0TZc3aesWREQ2Qc5JRxouHfDn6+oh+JJtlO9AOcG6b/xnmEnkcnnbC/bz?=
 =?us-ascii?Q?UfLgG2f8ZoKWYXaOm54YIaCbDSTJ02uWx0fgjFrwesq2I4HPmuNqSYsy8/mI?=
 =?us-ascii?Q?YO0lXcqhlaWJ085ln5v4/5TzYFQxZam8KXclRQ7INA12nOHhp0R2D1iQHDh7?=
 =?us-ascii?Q?rRPAU7m7oYWvY+vViQAoloGL7wr1b26teSXT9ePKIY2i7xaYEJT9cpU0G/3g?=
 =?us-ascii?Q?WJBUghyEtJ2z6DiNFjblzAN2ppHNs0KBvhsd1b83ZHYLvtO7eQ8a9qqvejNA?=
 =?us-ascii?Q?yT5J4RO+6qaf7DbIiJ4sWxztzXbEgFuS+955DvLiFBZKM+7YqdxEqw0dHnnv?=
 =?us-ascii?Q?YBSQPoTSYZ3Zz2qX+/bzivIrv1A1YuP5m1Y10zwBu+04inrvTy8krzY54L4a?=
 =?us-ascii?Q?4amDut1UJPKD3eFZ6NskmUKKJujxXTDaTaUF1lRcEKC7QDrlQzSqlxkS8hqP?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c07992-3ceb-4ecf-0096-08dab5c93282
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:08:16.8655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTEFXNxSdA7FzpC8l3LF1b1lZZX2N6TSpZIhypnYdxNkDOMfCgZHgZKe/ws6QMb0OU2WbOO/GKbZC5iIeDquVKIOA2wEwEZKC5yBHNXAeCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_070822_764775_999D7729 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Krzysztof,

On Sat, 22 Oct 2022 12:21:07 -0400, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> On 22/10/2022 04:26, Vadym Kochan wrote:
> > Switch the DT binding to a YAML schema to enable the DT validation.
> > 
> > Dropped deprecated compatibles and properties described in txt file.
> > 
> > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > ---
> > v2:
> >   1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
> I guess all my comments from v1 apply.
> 
> Did you test the bindings?

Sure, I tested it for arm and arm64, thanks for the comments
I will fix them.

Regards,
Vadym

> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
