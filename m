Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E93C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 07:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94A2613F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 07:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A94A2613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DekV9+Ic+xuLPIGxVfKYZtqQGqpSn8fsQRE+tAPKsFo=; b=v991YBj/OcDgEl
	WfVQTUVHUxbuMipxx/nBS/BKo+7lJiphIVNqby9IysAkATkh4Cop3MonBDR4TblIcvuFKAur8q845
	DUgfoTsx9Vt66AlXeK4P8a8/6SIgtBM0a81UUDp9NgD5jYTOMTxwTjYqGrOHCXEw/4AD4zKkaiKVX
	1udaB0gqhGW3WF2dQ+A3jWosPHHc+cNmAVKR3nYsGGULDmMoes4doCYvstwoelbJvDd3xZA+7TBWW
	q2y5WFBB0ad+zIZ8dYT4ZFgajhFcArxXrnMl7ZD3ZizKRF/cs7HIRbfD+VOZQO0HEMzHnCsZMEA8o
	cwLcN+FIbU4LOvLtOw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrEkH-00HA4C-TJ; Thu, 10 Jun 2021 07:04:54 +0000
Received: from mail-co1nam11on2071.outbound.protection.outlook.com
 ([40.107.220.71] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrEkF-00HA3I-8e; Thu, 10 Jun 2021 07:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ptdmfmkiln7UKbe3mSE35sKRzkJbUMpFguiuZpl6B7TK2SKXQJlLtBZOg8ixnQl+UqD03/pNVc8DKFBMQP1nlvLIhNSOgRx7+0nSfdMLeKWg5hW9GZoeNNkPd+5/ki/9x9VX5CGvY/qE7tizViZUx6jXjtx93B/H7j6VGKo7ps8lOloKiyymHwfBkqwuMz1vhFCTXTbaJxFyfbDpnJEoz0+kx5LBuoGVzSYAwvckQbsfo8beEYNH0Gq+SxGKF3qexHmxY/Q6kH9MtYGB4j9geA5MMQOEk6ZxM5fJX6K0nmM5ki4a1vdt6Z/mjYZ31liFQEBAV16bVnJgrMIXviwKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFqlDo/XB2iZQ0g6Sk8RF0BFPocKHXbSQG5c4fBUmc4=;
 b=Of0QQ0CpDEJ01HXdRHgpFPeyEn7ZRJyAF0cdih3rdU2/o2wk6SVmKCyLrwgAimbaEQJpjqx23ziVuvrSMLBUvNpuw2MHNcT6Q/zTMS2yJpA1Njd2wq8AVfAS/vBc1wccbJwMo+/D95ECHCZFilHj+k7DfQ1HkShJsXF3lPpDpYh1nW/dEXYnPB67TVXqx8IoDrHbQp/+LLn/zMheUbe+g+j5PsNfYJIvASn6sM9iAB7/DuOLM2VzyDvm/QMUom8//ZLqTidz7R7yDWZqB025g27MMbeNHsO/4vXZJLQyXTdQkHfTzskbqUTz1M2XFh/R3IjJwK0YFO2Asbfu04/sCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFqlDo/XB2iZQ0g6Sk8RF0BFPocKHXbSQG5c4fBUmc4=;
 b=MnsVpROBcRQe2IzMr6bj1PoQmhc1DuhCuWjWgl47LcJksT0QPkwxgddlrLzVDzQCxTAVBShF9QlGf6i3ZUEdIAqzItzQTrt18iYXL+pOsXeZSjNoUH/gsX9vKs5ZNjBTEVvWEOpArk3bePldLTMA8BIesOPoY++aw8gZ5Z7Iv+Q=
Received: from BYAPR02MB4280.namprd02.prod.outlook.com (2603:10b6:a03:5a::29)
 by BYAPR02MB5272.namprd02.prod.outlook.com (2603:10b6:a03:69::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 07:04:45 +0000
Received: from BYAPR02MB4280.namprd02.prod.outlook.com
 ([fe80::19f2:a0be:769f:44c4]) by BYAPR02MB4280.namprd02.prod.outlook.com
 ([fe80::19f2:a0be:769f:44c4%5]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 07:04:45 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Michal Simek <monstr@monstr.eu>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "helmut.grohne@intenta.de"
 <helmut.grohne@intenta.de>, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: RE: [PATCH v22 15/18] MAINTAINERS: Add PL353 SMC entry
Thread-Topic: [PATCH v22 15/18] MAINTAINERS: Add PL353 SMC entry
Thread-Index: AQHXXQW0S+SiR3Ddr062xAvqnfeE3qsM0nrA
Date: Thu, 10 Jun 2021 07:04:45 +0000
Message-ID: <BYAPR02MB428000401E741EF3983C02B2AF359@BYAPR02MB4280.namprd02.prod.outlook.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-16-miquel.raynal@bootlin.com>
In-Reply-To: <20210609080112.1753221-16-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be34c3cf-dd17-4fdb-3ef5-08d92bde0784
x-ms-traffictypediagnostic: BYAPR02MB5272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5272BD4304F58F2FC2FA9CF9AF359@BYAPR02MB5272.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZlh7TGx0wLgFlr5o7vP4MIjMII+34U3wvn/upwmTnMMW1MbCWmxV++35fARmXWi6bVkuR66/OgHGDypvhN60X2LdJ1VKLyBqLFbTKtluRTDNocPsL8jKEkqTE5ijwKDT8Dtv/F7j3bZMAwjqxSLiwW7I1J60oBQHCKFPHZZ5kD4FiJoTI3fZ42hCEg4zm8uDjFP4cGhy9gTTkGH9EeOLESSfef9PkBytKRo9LGaVOoWqEWF4iEgq7PBVJbF4aot7Cf8wLkMAE88GDiAc5pFbWGodE7+gx0htCHxZErl9rmF8JDUWt+wToccrBhYwHEW7GUZD6v7+K+0lbgrCkFs3puP8LmuBN7NvrbG4mCFILEvAwRZIuiXnX+C92W3uhh1E2t29AqBVuqW//D3VjD03OtBfpsDcIbAmsr+dvweN1Ox1RQU8bGlXJE+nT9Mrl0Rg6s9e2FJMQX8pRBhlZm61KCqibOX6nczUM+ERTHQ9Z1IrsOmy+FflMdLSSpnVt6gtYGT1WqvbS/3ExCcxPVekCGEvmTUjKjQqArhkM9uo8QI+qp51gF/ehL0bR/bNGQ/gDqFWwGTTAWY9nXFo6QVxi+UZgOfH+rghM2xYQkUpEA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4280.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(7696005)(478600001)(8936002)(6506007)(52536014)(5660300002)(7416002)(86362001)(66946007)(64756008)(33656002)(66476007)(26005)(66556008)(66446008)(9686003)(76116006)(53546011)(55016002)(8676002)(83380400001)(4326008)(2906002)(316002)(71200400001)(110136005)(186003)(54906003)(107886003)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEtkdVBkSlB6Y0t2YzZHWVpvZW04V0VOZVNnNGswZ1J0RThiVHdabk9sUEZT?=
 =?utf-8?B?YzhFZkJidzFqOUVwU0tPZ1ZobHcrN3NLSWJwM1BGQUlKbmgrSFRsRjgzMWdi?=
 =?utf-8?B?TGRPN2VBZHkrdytUMVUrUzQ2VUVSWFM0aVZBdDNOeWtKQXN0TkFXQUdsWGYv?=
 =?utf-8?B?bVh0dnNiRkF4NlZVREMvUzNkblp5bUVESnJpbVpwcDFxczRNWW9CdGZmSzVE?=
 =?utf-8?B?bGRPSXRKSHN4RVI5KytoNFlicHNQRDJpaFVBTEwvV2c3VWJybWtXQnV4YWx1?=
 =?utf-8?B?UW1YOS9VdHdMYVV1ZmhEWkltTDBOT29QZTRJakVQK0UwYnR4c3BCaUxPQ0x3?=
 =?utf-8?B?dW5kUW94OHZOeEF3MnVSMmZSdmJSc0k0Wkg1YXdDZXRjQ1k0SU5RaDZRYnJk?=
 =?utf-8?B?cjJNcnptd3JDR1dJWGpSMU0rZmJSSWVwYWk3M09YZDdnejlEdWVESFNuZDVD?=
 =?utf-8?B?UHRqK1FEaUJkYWhYVWtobkZBL0RoZE1Ncm5PZXJJeDlGYVN4OFBZMUdGY0E4?=
 =?utf-8?B?R2R0RGIvUHFQZ0dFQ0xnWHo2bEFNNlo2NFI3aGd6UHdQdGNZMndNbmJjMTZ6?=
 =?utf-8?B?UGdaZzhLREpqZWtZVCtkOHdSWEwwcUZPNllrL2wxTklQbFdURHZUVGZuZmhX?=
 =?utf-8?B?K0V1VWttdTZFRGlGVGN6T3pvWGFTc1BwUFh6NnNqYUdjc1RUWWJxdG9weDlN?=
 =?utf-8?B?RnhwWm5IWTA4cWQyZ0ZLcENRQ1pab0NaYlZ3L0Q3amQrK25VbHBJSkpiZk81?=
 =?utf-8?B?V2ZmSWwyai9JNHNRdFlKUGo2aEhsMjZkQ3F6dFdoTTBYYkpBK1dpMG45ckZB?=
 =?utf-8?B?dTFML3FGSHdZenVMZC8zc0FFcEV0ZFdZZ2R0R3RKY1dkMUhkcGtsNkNtdU14?=
 =?utf-8?B?SDgrS2g5c1BQRitFdXA3eEpWcUZMUUwrSHJzd2NHREM2ZU9qNG9FOTRmRm1H?=
 =?utf-8?B?aStEdUN1b1BVZVBndGJWNy9NQ0tYalNFdVl5THRVbnRHcTdYRmsrODlKemJB?=
 =?utf-8?B?MGdiVXV2aEVPc3l6SVovck5UcmxyajU5elVRNTZ1azViZi8zYXJRTGNGU1pG?=
 =?utf-8?B?VC9yc00rN2ZJd3VEaHQ3SFV3YTE4VmxQMkNURWpYOUpNRW04Qi8wS1QxUE5q?=
 =?utf-8?B?eExnY2VydVpvb3E5YjlPcldEZ2FvVjlLSlVDSGV0bW10KzZHMXhuUEF5eTN3?=
 =?utf-8?B?dVZpRC9XeFNXZm1SeU9lYVBTVFA1TFJsTjN0WTlVWlYyRHdCTzljY3ZSdms3?=
 =?utf-8?B?aG9SMHlGV2VoN1ErbDVYZENXcml5TERzQ2VvWWRHdDhmQ1FPekcySTBLeVhZ?=
 =?utf-8?B?bVlTTTN1MjlsWGo1VFlxdDQ4blVMbVF2aU1PN3F0eVBkYTFUTDh4Q09tbUlY?=
 =?utf-8?B?T1M2UGpRZ1ZCZ0Jad1hoVFA1c3ovQVpiSDVSeFpKVE1PakpZKzRFMFFQSFhY?=
 =?utf-8?B?Z2E4QWNVOXBRdjFyaUl4Vi8wbHd1WDI4RXRSdmsvN092VkZXZE5WN3AyUXlx?=
 =?utf-8?B?SGJ0Zms4Zkc4QUFZejlTZCtidGtsMUpBSlFXZVd2TzZMemFDMHdFdys2RHNK?=
 =?utf-8?B?MHBrdDYvTWZKcTRqQkpnbU9Qdi9tbVRlWU5FeWNHWnNwM1RIT1RTcjlZbE5v?=
 =?utf-8?B?TEx3UnlaS1pDaU12djY3OTlzUHNDRzdDUVE5RFlXTUE0L1lxdGVUWkhidnBx?=
 =?utf-8?B?d2I5U1hpSWIrVi9vRTR5YndsVUY4V3M4K1FTK0MzQnhmZEJtVERnZWR6SVlX?=
 =?utf-8?Q?nLiC54nQRXVRSvpyKuStRvwE9MQR0eC6ePEoO00?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4280.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be34c3cf-dd17-4fdb-3ef5-08d92bde0784
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 07:04:45.6818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQsSw22RmesmaFd2/x+vBAj9BcSLkemGbC9zGa8CNVlwPFYZ97Wo8fu8i9qwPvM5K1lKSNpXCL/JrM1qCj3WQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_000451_335538_D59B48A1 
X-CRM114-Status: GOOD (  15.12  )
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



> -----Original Message-----
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Wednesday, June 9, 2021 1:31 PM
> To: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; Tudor Ambarus <Tudor.Ambarus@microchip.com>; linux-
> mtd@lists.infradead.org; Rob Herring <robh+dt@kernel.org>;
> devicetree@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com>
> Cc: Michal Simek <monstr@monstr.eu>; Naga Sureshkumar Relli
> <nagasure@xilinx.com>; Amit Kumar Mahapatra <akumarma@xilinx.com>;
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> helmut.grohne@intenta.de; Srinivas Goud <sgoud@xilinx.com>; Siva Durga
> Prasad Paladugu <sivadur@xilinx.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>
> Subject: [PATCH v22 15/18] MAINTAINERS: Add PL353 SMC entry
> 
> Add Naga from Xilinx and myself responsible of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>

Thanks,
Naga Sureshkumar Relli
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..b4315b76645a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1452,6 +1452,14 @@ S:	Odd Fixes
>  F:	drivers/amba/
>  F:	include/linux/amba/bus.h
> 
> +ARM PRIMECELL PL35X SMC DRIVER
> +M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
> +M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/arm,pl353-smc.yaml
> +F:	drivers/memory/pl353-smc.c
> +
>  ARM PRIMECELL CLCD PL110 DRIVER
>  M:	Russell King <linux@armlinux.org.uk>
>  S:	Odd Fixes
> --
> 2.27.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
