Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1641C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 04:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F23206A3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 04:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ylq+Omnk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="hLlUL1oF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F23206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAp3Dnw7LArlVhep4eWX0NhvojhAaG7KjnqwMBFJkVs=; b=Ylq+OmnkTq2wH1
	PyNsMBmO3ZaLlYbf0VFnTgshTNTCXsnOIz+LBpcA2gH0uz0yu7plid2jOmTQUN07Ht0C1+QEbK7IT
	SZDOHiBKXGmkhGKhOOTUbdA++T3knc28Cw/d5JTvOtmuOgFl3/YfsO2M6CSILRpOn3Ult0hiHXFyM
	X80Ufh3R0obiiTB5eOeaUxi79DhzLI9+HiBXvK1DxH6EsLQay4hTrrtZ7Em/0mKXa2DIy3ogONQ2B
	0tG1eY2eMPxW7A74zK9mkbTDOgVEcRiWmlXLXrBDgi9TwrGKRNPjo0cfoniyW5eqBRO9IjtHV/frv
	S15BvfUGNHlgUL0qlJ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht30M-00047O-0F; Thu, 01 Aug 2019 04:47:54 +0000
Received: from mail-eopbgr780087.outbound.protection.outlook.com
 ([40.107.78.87] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht30I-00046x-MG
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 04:47:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWlO0EbTWBPq9Dbj+MTGjgzYUUu/TtI+7upsuSat01HoX/0I9fwgltwrLcNBWA/xVlWVxb8RQZVioFpih1SDRUhALejlIq5VbUbqSdsvqJJCrQz7c2WtYSF9utDpSkzna6G9cjLTazKZgywlY1cZ6VHdk46DmWPQ/znOYKYQz3eB+domSUK80YzwF/lo1sXcEV0IdAhkPXUEWTyJtDNTie5OYLFfdM2rfMiiJcGY0X3NXayVkNe24ImGDg/Z6larL2QWoVsfLFgqTJTGyFN2n49YWDi80xdb/cxuFrmFhIRLFahIVDyVAQvl9OIHU35jNN2eoljb0ds8pcj5XgVATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1y+Jdl3MkxZH/3zC2FhtVaDMVrBgMw0986z/p+FNSo=;
 b=F9BAlp8yBdeAKnWjZaq+Cb5ZyMV/5sea8lYm5c/7lcLLYccQgUKUdwcmo+Nx2w7isHYUZ5RTr4ruUGLHCUpKdiasL1akzHkFdadEF42mrLfUE28N+hfH0fojOOsYOAEgpebn0RsR2W6OQdKhq3pRd6t8sXWPoQBnLYmY4AHKKOCmxojreQlHzy9oDnkqzvIeN/RkQu62iI/uycGq7vIfnQCYe3EWXapV4UeOyxKGovMdwPfVLBEd0gkB8Im7kV8qR7LAKUpVFkcZeI9ogf2Zy7eucx5RRUAkPvrjfMVCYy3LdSF/fMwxGNN/GJINQDToMmI3OqqnUx3tR1xiaeF5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=xilinx.com;dmarc=pass action=none
 header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1y+Jdl3MkxZH/3zC2FhtVaDMVrBgMw0986z/p+FNSo=;
 b=hLlUL1oF0Ul9FCiwHwejJgF+44RDmBOMteYY/90F7ST5RjaU0rxPHBR6hOCY/o8jFV/M8WGdREVObWVoPuj1p16r4hdXyXjLatR6J8ZN0sqdeen5eXxAkoPXYgDS0/0WMIbKzCIjrhVCuXsrm7VoEocr5xdJ41t1+dlCQuZzl34=
Received: from MN2PR02MB5727.namprd02.prod.outlook.com (20.179.85.153) by
 MN2PR02MB7102.namprd02.prod.outlook.com (20.180.27.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 1 Aug 2019 04:47:48 +0000
Received: from MN2PR02MB5727.namprd02.prod.outlook.com
 ([fe80::3873:a3ea:1f66:fc89]) by MN2PR02MB5727.namprd02.prod.outlook.com
 ([fe80::3873:a3ea:1f66:fc89%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 04:47:48 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "vigneshr@ti.com"
 <vigneshr@ti.com>
Subject: RE: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Thread-Topic: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
Thread-Index: AQHVR4AuPtwOhxyzBUKoXu06OueqLabkpU9AgAANTICAAQbGMA==
Date: Thu, 1 Aug 2019 04:47:48 +0000
Message-ID: <MN2PR02MB5727B99A02E915AEFE89D318AFDE0@MN2PR02MB5727.namprd02.prod.outlook.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-6-tudor.ambarus@microchip.com>
 <MN2PR02MB5727FF8617B1A2FC89739601AFDF0@MN2PR02MB5727.namprd02.prod.outlook.com>
 <cfe63aee-2c48-c321-53b7-3997c97dc215@microchip.com>
In-Reply-To: <cfe63aee-2c48-c321-53b7-3997c97dc215@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1214451-18f6-48ae-0b15-08d7163b675e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR02MB7102; 
x-ms-traffictypediagnostic: MN2PR02MB7102:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR02MB71026829BF43E6E66CE0EC41AFDE0@MN2PR02MB7102.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(13464003)(189003)(199004)(26005)(33656002)(66066001)(6246003)(52536014)(54906003)(110136005)(316002)(6436002)(229853002)(8676002)(71190400001)(71200400001)(186003)(53936002)(102836004)(81156014)(7696005)(305945005)(99286004)(256004)(8936002)(7736002)(81166006)(5660300002)(76176011)(6116002)(3846002)(476003)(66946007)(2906002)(446003)(9686003)(6306002)(55016002)(4326008)(74316002)(14454004)(11346002)(478600001)(7416002)(2501003)(68736007)(53546011)(2201001)(6506007)(966005)(486006)(25786009)(86362001)(64756008)(66556008)(76116006)(66476007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB7102;
 H:MN2PR02MB5727.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ziD/EEI4Y3TcIrW1D9+IrkevZxaNA1W2qLEKFAYKyXoDZs3f8c+9dpK+h50ZdRo9U1Hawr9fnxKvED+8dr5Zs5qxMO2G7eIXADcsRyUnWW8Mg4mvvKxPEk0LH6qbcS4DtveGq45bL/iu3Qe/hhemZn1FJ60BBO/5WHd1QsqPV/t3Wr1lgD/Rbhzf5sZFPrIRJRnMf1fyyRJE7QcdJ+tDDFjbGiQ0S0XTvpbuLJgMtS3wMRNAMcWbdoeomfZYAbwKxmg0KRGckbDZ06Yn5+QiHoCVwk9sSQ6IgE+/nTnHFJ6WIqVsacYWhU+3G86Zqwj8cWZ1AtqfIDqDYeUVUKbx9+ZV6FO+NKFhO/4NzraxYKaul4NKjNnCdDta0q2Jdxjr1kawkITxTmywoNlO/XWxfD1/VOdrC1TceOd9cfvRURc=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1214451-18f6-48ae-0b15-08d7163b675e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 04:47:48.8443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_214750_723919_EDE0F288 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: Wednesday, July 31, 2019 6:37 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; boris.brezillon@collabora.com;
> marek.vasut@gmail.com; vigneshr@ti.com
> Cc: richard@nod.at; linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org;
> miquel.raynal@bootlin.com; computersforpeace@gmail.com; dwmw2@infradead.org
> Subject: Re: [PATCH 5/6] mtd: spi-nor: Add s3an_post_sfdp_fixups()
> 
> Hi, Naga,
> 
> On 07/31/2019 03:31 PM, Naga Sureshkumar Relli wrote:
> >> +	if (nor->info->flags & SPI_S3AN)
> >> +		s3an_post_sfdp_fixups(nor);
> >>  }
> >>
> > Instead of checking the flags, why can't we call directly the nor_fixups?
> > like Boris implementation nor->info->fixups->post_sfdp()
> > https://patchwork.ozlabs.org/patch/1009291/
> 
> This check will vanish and nor->info->fixups->post_sfdp() will be called directly once I'll
> respin the manufacturer driver part. post_sfdp() will set just flash parameters. Check Boris'
> patch at https://patchwork.ozlabs.org/patch/1009295/
> 
> I'll try to respin the rest of Boris' patches sometime at the beginning of the next week.
Ok, Thanks.

Regards,
Naga Sureshkumar Relli
> 
> Cheers,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
