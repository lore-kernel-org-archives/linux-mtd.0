Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB3FC07CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 06:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oidvr4hy8nQdrC++P8dEq9wNgBMHTUqyvgHm+Ik/WjU=; b=NZFCXPhkBCrEZs
	Wdt7OqmHL1Ks9Asq8PumObLan9S45GgbOlwXPo/AcyYg2oaJ2nHYoMciGagReZ8jx26V55fU/MauP
	zX0Qc/drwRb1rLfne/YGnWtTY9oKXd243o2qM0vF+1Zg+zHqbt2mLXyDCXFegufSI7tcYKNmDkaXe
	s2Ju3JPpICXmox55+/t/SMnQYQoUzbCIbuppVjdsiXg9OEt7P9dxepuoB1Dd8XY4R0ttB9fZCX/TM
	Ra2kOXd5bVwR/pxlKOc+2x1ePv3BfBPHQf4vxMxCYh/I9Ch4k4kLc3VJipl4fGp6n7GRMNZrA3JsL
	Va1EWwxW+257puRnNP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7rBh-004DNy-0h;
	Tue, 28 Nov 2023 06:03:13 +0000
Received: from mail-bn1nam02on20601.outbound.protection.outlook.com ([2a01:111:f400:7eb2::601] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7rBe-004DNL-0x
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 06:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjQNYlbI7hgRXEXIVPCErTiujEEgldF0p5NcHAHw3+ahyKD3ML1K5FujerajdCAQvjyJvzyr45PQsu2E3iciPGKPOHpyqaBDZUrOp4iDOuj0z7Qf3n6hhV30tKI+hGx7PEp09XcT+aPcCOvn2+qg9zGa9md/2hgwPCUZQbRitdKUo7p1ZaqONwm+Br5m8bklmQuy1mH5ynGGQoLRZZ4q91ook0ZceeLlXYDDnheqiHFzjN+V9pgKMstfWYFgtUMpg8qGyCmZgXot6+KOC0613GhqtlVp625zIHAt36QjrraJSeQk3VQp0PtxQ0c0/zQxn681rLkVOISdxA/NPAgXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DHrp/dDyHmP5K5nO1IUiF8l28fc0DfJaGeu1VYXJcU=;
 b=Phg7qIauZLBSatkN6NiugSdpABXlVEjRitKnn5pcndYZsMlyNZMG9OnWo/9u3G4a6/7ntA79DKKf//wNn481SX2yDEcN8iLpsHHNhcH9mP1WT9YpLVNGoPeKU7ZHxwjLa2NP/npcOSHCmunRHkDBiCuiN14uCXREJeQxXtRTD9QT30SZE1ngV8qTlkqP2ShxELLK0EM/2TE1ez4ea8vFUlC7ocVvzya/cCWZbgOAvUOU640ZkbpBErpgPJIgeCJl+ER8tkfz//bba1Y2yMtp36CJ0y8e9mc/3Cu4QcqAzHuIjB3QdVAk7Y/qXpSULLBJuD7/GuYGwbynj+E4j6tzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DHrp/dDyHmP5K5nO1IUiF8l28fc0DfJaGeu1VYXJcU=;
 b=plzlClgDvfyR+c1eg5vo1gNiHmkrr+9FCQx98fkNN3J4xXgW67ZH6clH/2t67COOfc8aoNqqPkgwhPAzobfNALb6qp1p95hex58NcHJK8zu77xCiICmxIbXpc0nNE55jLjNXGRd89fn7Gx7rzujxq4IRioVWPBsklT/99KuZoIs=
Received: from BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 06:02:59 +0000
Received: from BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::ddc2:f808:3cb3:2e7c]) by BN9PR12MB5196.namprd12.prod.outlook.com
 ([fe80::ddc2:f808:3cb3:2e7c%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 06:02:59 +0000
From: "Boyapally, Srikanth" <Srikanth.Boyapally@amd.com>
To: Pratyush Yadav <pratyush@kernel.org>
CC: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>, "michael@walle.cc"
	<michael@walle.cc>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
Thread-Topic: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
Thread-Index: AQHaHdCRoIA/OqSAv0G0P0pMPvY/Z7CJjvlXgAWzNsA=
Date: Tue, 28 Nov 2023 06:02:59 +0000
Message-ID: <BN9PR12MB51966705C3E306502ABABA6E9EBCA@BN9PR12MB5196.namprd12.prod.outlook.com>
References: <20231123054713.361101-1-srikanth.boyapally@amd.com>
 <mafs0jzq7dx8l.fsf@kernel.org>
In-Reply-To: <mafs0jzq7dx8l.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5196:EE_|DM4PR12MB5818:EE_
x-ms-office365-filtering-correlation-id: 0e021c1a-e66d-42c5-00e0-08dbefd7ac6b
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ipo65BjpkcynMiMwM9XMEKW/ibiF6k+ZSzsShzd1jCxCMZ0KY8Nnboz8HkTRYoOI31bkWyGGB2A3nkuIMN8xnmMYRKf6yrBxBuoTCGCmEQb77sAcTENsTKUoxYLoHPLmMYnrjfZCe5Zj0BNQBOZM4t8C9ztAY8rqnsfkbVAYdGVzeejWXhwd/12BinAhWOhhT2dwNsFsaDw4ySac5pBRUbWiTmUcdmTyLvqGgV3JQyg/Tgd43gx7suNwlJGPL1Y8Zl7y7yB2YjrQ80M5CV+5AnZplSN7WG0Dwpw4+w61e9JN0GNcpS5Z2qTD+32HOGYlIdWgrnhoSDSOBjIO9bo4yKJVquu/lY7boIcLdUPFd6UdOueDH2zIMIPtcxlQW3LT0K7VYM90SUCzqwKJ/v2xFZ1tKzbim2AED51CCrz6ziiw6rbnYoviE3+oo0YCK+dBof026MrfgN56Jk0KwyEicggnYyg7WG7TeqCJzMcsKCWs04p9j0oCNuD1vweoglZYUPqMijt6NWuIwOvDGD5mwPBffYkN/cGgPNpKGkdqxr0EiNVT4hDHGtSWEt5uG5iUVCWrZB29eAsEfrKWtax1lYKTcLr+aMhTkxC956oYX1dbN0/DqWANBbMfeBlnOSKGz5/OUb5ThOzklWBs2rT6V9l4Fpa1Nrx5R51M4gy4KWhQTYXtptI06OvEwEfmefR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5196.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(86362001)(38100700002)(122000001)(38070700009)(33656002)(478600001)(6916009)(64756008)(66556008)(76116006)(66946007)(316002)(54906003)(66446008)(66476007)(55016003)(26005)(7696005)(6506007)(53546011)(9686003)(5660300002)(4326008)(2906002)(966005)(71200400001)(41300700001)(8936002)(8676002)(52536014)(83380400001)(138113003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2nTFeLlis3MQ5JK6W3QujmDhjgFi6USnhq0YhCiR6/jrHllYybWV6nQNOun?=
 =?us-ascii?Q?LUT0oGImEU1PEOq9ziR7NOJD+Wg7dlwbDKU/1VRTS/VUOyaxM7/O7Pm91l5R?=
 =?us-ascii?Q?kxFney8S/aU6BgLpUs7W/TcdDXoFdWFXBrmcmvOZioOlnMgs6Wl1SSc460J6?=
 =?us-ascii?Q?45HgDC/NsJYM9nhQMaNi6Ot5gG72I/sejN/PYXzPfgXrl9FEZBgEyQXDG4Zv?=
 =?us-ascii?Q?pHF8wSinE0A/QHsJt++Fhd3i/JeE4tLvVIvEgIlp+GkS1AbtQ7NK2j7Sq4gY?=
 =?us-ascii?Q?dm5Zt+Uez69hrs+eQpW1q/Jbbmy6OJRpASPXxDECkZ+ITUE0K1vfhNPOqbiw?=
 =?us-ascii?Q?Hh3qVEokWUU4SjxoXtpJv9uG4AASy51iaCblBSmey8mOaWCSJDD5UKIp+Onm?=
 =?us-ascii?Q?cNGCmG8/1hmIvqFGHxOZUc8vosUX4cYZFuGh0dTElzvaopajALhV3V4ID0RU?=
 =?us-ascii?Q?bjXwbhd4i+xJ+6ejgNmtFfuuUJekBKyZG86FQX3XBdk4c9GA4Wy1omwkXut1?=
 =?us-ascii?Q?quCgNlcCFUSVwRnwp36WhLk2SVmWs45AMqbXyR6HKx7cSw8Bby1cNXrHWrBl?=
 =?us-ascii?Q?pXSy/F065sU6SSVm6wSQ7ZNHZaKi9T6Wp2oFpj+1GselIKqy0kbVfAL+MCHZ?=
 =?us-ascii?Q?0ao6qWpKbhalm0Zs0DxVful5r8Uwi+tn6r6ny3NQJ83Ls6u+pzU7cTmRzl5x?=
 =?us-ascii?Q?aBwnnhQh8piSy3YaYk8W4R/r37BHyrv5BJBpcfKydyugbzs94fkEAH9R/D1o?=
 =?us-ascii?Q?65dFz1SPHzUxT2MVGKbJCYGozYP4gguZL3+095Vf8ii3hqhzbteqB+k02y0R?=
 =?us-ascii?Q?R5cYvaepy78M3fKqsZnVjxGZwJPef7AOUunxkq084n416Qu43NFWiTjV3A6V?=
 =?us-ascii?Q?YF3K01Sg/7I2tXFg1KJAsVMiYaT04a22gXYoMPi/IqAoch0SM0laZGwe/RZu?=
 =?us-ascii?Q?5Zi+7Z96461Ej5rIQRyQmBR7Vo18T9gM69QG780LwdckCq0q3FJVQim6KBx+?=
 =?us-ascii?Q?ibz7aV//e/1VF+B7Ha6GhVmMhLcQ/8lcdD7yvFRdYSIBXDtXmfReund/Kyhu?=
 =?us-ascii?Q?3G4Ms2BnHshPvCTIvvELerKfmtzXNxGmfba403KXu6p7sft7P+1cbvFi7T58?=
 =?us-ascii?Q?gW1dafhktKB9zWSOYTgTMoNxLnZ4p7INXQTGrnPsYIrSwezDnNcm60l0VO1W?=
 =?us-ascii?Q?2RWZICnQgndaTHVsgcUezb/lZgYM0yuvUvK741y8uHtnDFDxd3RBcFiOwBF4?=
 =?us-ascii?Q?TbUQE6ZYc/DnxwpETx3chH00m/29hX9UJYY0OP5XZ0RNTg9fvwnoYefqlROm?=
 =?us-ascii?Q?OUeR6L7/JzeFEgmDB+jkoaeDQ61KqtHwPUuZz3uZlauLBZyA36r+hKup5G18?=
 =?us-ascii?Q?wpjWJfuFJop1acRVzrXVDYm6YfKk2VAfO5S4fHuqgMgkiIkkw8Hl3pNNV+ZN?=
 =?us-ascii?Q?7S3cxR87tAo2dokwClJy4tL+y2b+hbhaicw/qG1gUE8btmtprnkFPpcgYme+?=
 =?us-ascii?Q?A6vhX/h2zcxeKOKIoUX0la/y82Ovo7olWT8/mSymUC/mujF8iDymU9WGcH4a?=
 =?us-ascii?Q?+0GgZFNNdrAPYjSEECs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e021c1a-e66d-42c5-00e0-08dbefd7ac6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 06:02:59.2654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sajArJJrlk9oH6UZJNeBlkcb7XHnpV1kLL9NAg7K3raao7sUjAZhHUj6M8MgB5uNf6uQYK3r98dig7Cd57MyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_220310_364456_0239C7E8 
X-CRM114-Status: GOOD (  15.35  )
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

Hello Pratyush,

> -----Original Message-----
> From: Pratyush Yadav <pratyush@kernel.org>
> Sent: Friday, November 24, 2023 8:17 PM
> To: Boyapally, Srikanth <Srikanth.Boyapally@amd.com>
> Cc: tudor.ambarus@linaro.org; pratyush@kernel.org; michael@walle.cc;
> miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; git (AMD-Xilinx)
> <git@amd.com>
> Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
> 
> Caution: This message originated from an External Source. Use proper caution
> when opening attachments, clicking links, or responding.
> 
> 
> Hi,
> 
> On Thu, Nov 23 2023, Srikanth Boyapally wrote:
> 
> > Add support for issi is25lp02g.
> >
> > Verified on AMD-Xilinx versal platform and executed mtd_debug
> > read/write test.
> >
> > Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
> 
> Based on a datasheet [0] I found online, this flash seems to have SFDP.
> And since you do not add any flash specific fixups, it likely does not need an entry
> and would work fine with the generic flash driver. Did you try using that? See [1]
> for more info on contribution guidelines.
> 
> [0] https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
> [1] https://lore.kernel.org/linux-mtd/20231123160721.64561-2-
> tudor.ambarus@linaro.org/
> 
I ran mtd_debug read/write tests on this flash, without adding flash
entry, it worked fine for me. Please ignore this patch.

Regards,
Srikanth B
> --
> Regards,
> Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
