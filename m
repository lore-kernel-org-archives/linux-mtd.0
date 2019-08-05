Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C4AC433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:38:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D34942086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHRBhUGZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tBIp4NOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D34942086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpMt1LuRksjUig6dphLZw8tWIA4WjCbyVQ9oj+LnWe4=; b=fHRBhUGZsEjSeq
	CMSX40lxsuZ1Vxa6aw0y2/5LHrBj9TQ4AM39fTd++q+7/fp0B2y2+cG0V4tCJemlcZOuU676BN9I/
	E1cv7echTBQpOJBNBSXZ8EEoOWM28j2Ao7dkOEeJFLE7SyBgFrhmWzcAyIUWZmx5rLHetZTOAWNnu
	uAVqKbJ7TUBEQeXp6vFlMd3FAMV/TywOGJVJGoOwYbFndWXyOAyDLJkTND33NO8arRrrqhjiN/sqV
	iZ5pjhuSRxoo2+KoeCmZKD66VL+LFwCeRkQ7edtjw+O1+xUHhlQA1YAaIacFj1pUV+Q/qGiJyDy0x
	YhCais1AjE487nA8sw4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huWct-0000Ph-5Y; Mon, 05 Aug 2019 06:37:47 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huWcr-0000PI-3S
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 06:37:46 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /SpkFaKxc73hQs2yWYDUxmiUjTQkEfkhoq6MhY/vY/sTVg1r4jhAEd5zSu4/2jdVuC/KvK2Xv6
 42rnuHTlE26HhwN0d+g0E4S0BJujxolvAMDgtbTXE175Tliqx4BKWbySeGIdcVIF2AHvMEPW6y
 CPQWnvkuiktLq/8ahZq9X8T3PsL1XMCxuvVeRjACYsk4kdNFVAUOjZxcRHyK+Z5fKHPxnm1yKB
 DuvoWoQ5rBzyFCHaoc0yLfReuWjpaGktI7UyJ5ykQN0h+yo1+DWcNu7dZ+Dks1JhtC4Ns8zTPU
 Ok8=
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="43148865"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2019 23:37:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 4 Aug 2019 23:37:44 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 4 Aug 2019 23:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrUAIqxGEt1Quo5bmf0U7BOdelsd0BttJDZrnPq+PeyS0ONPiThRjkVVVVgAK7DnlZ0fEC6kEm1TluNxENWa1Y/g44XufH/IQb3WbmcdoAMnHoHzQwNSeaG9RIVFdHu7BmVu+tE1I+9pIzWedT13SgEMtDkno+HWtPRxAGvksrxOLfad873bJgUex9DDHC/ITA+/UwFBZp7a02ddOW7Ky3weNK9bLraKe3r93hxI8b9gfpJpADQpb1Vn3Kl1ejvjl8mnfAWQIQ0yOqFr/qE33KlqLxSnVjizfMJXPNIAxaO1KiFN9296XdhceSL6mdcIqqzqwEsMeR2Jo2MH8nhKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HqayNpbL+Mo/Bgyp+B0IIWeBXxQlSZ7oaIZkr0WFgA=;
 b=ZV7LKSDmXGlJTrtc2JFdPPb4ZtWn42eHpyodkeQf1pLfGKPSh/LhCoiNW/+ppJ8pl5jnh54iVK00m+JRzZhhIvj/wmClwGTU5rIiiKkjlv45fMVZaUDkWhq9pygFl/6u4ERUn/vldYKdm8SzP8TvIEleTHTEZlSLlRaWQD+aFX9tr9fgpl8uUB1Yt24Z5YCFkt3Lhb6UfWsyW4GABOvSka4a0qjlNiEXg6p/1L31t8lwOG6JuU/EyCxqCiCZdk+etJhiFZ3Am7LWBIff2mx4DLrO66hrvE7c76kOto6nzP6uOmILtoglW8+RjCVYAuBidkQq3t6WnFcd6ItpA2NLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HqayNpbL+Mo/Bgyp+B0IIWeBXxQlSZ7oaIZkr0WFgA=;
 b=tBIp4NOl1EdYGBD9QTxKCcr11KcASwFPGsb3A+ZAlfk18vwaf7BANzynRQ4zrQXejLDPxDT1U5VAcuLtbcHDaAKSUWNz7uiZ9tRAHdcAsJp20bAC+muwL4g8O8TN0clgZf3nvuKOWeAS+DTD5B8gD/efj0KP/6y8bNJeWIwY5jM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4207.namprd11.prod.outlook.com (52.135.37.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 06:37:42 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 06:37:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH 4/6] mtd: spi_nor: Add nor->setup() method
Thread-Topic: [PATCH 4/6] mtd: spi_nor: Add nor->setup() method
Thread-Index: AQHVR4ALK9UubUwcZ0C4sWQF3dBcI6bl2AEAgAZJhgA=
Date: Mon, 5 Aug 2019 06:37:42 +0000
Message-ID: <a3a41a83-0726-0aea-bb92-db6ef1a465b2@microchip.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-5-tudor.ambarus@microchip.com>
 <20190801083652.52bffef5@collabora.com>
In-Reply-To: <20190801083652.52bffef5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0060.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::49) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cac3420-1959-422f-06fd-08d7196f6b23
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4207; 
x-ms-traffictypediagnostic: MN2PR11MB4207:
x-microsoft-antispam-prvs: <MN2PR11MB42075AB7D6553DDC2940FC87F0DA0@MN2PR11MB4207.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(346002)(376002)(136003)(39860400002)(189003)(199004)(5660300002)(53936002)(6486002)(66946007)(6512007)(86362001)(66476007)(66556008)(64756008)(8936002)(81166006)(66446008)(31696002)(26005)(81156014)(8676002)(6116002)(3846002)(68736007)(316002)(6916009)(2906002)(4744005)(6246003)(53546011)(102836004)(2616005)(14454004)(11346002)(446003)(229853002)(54906003)(14444005)(386003)(476003)(6506007)(486006)(186003)(66066001)(99286004)(36756003)(71190400001)(7736002)(478600001)(256004)(52116002)(4326008)(76176011)(31686004)(25786009)(305945005)(71200400001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4207;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xhT1j1I8sRJU6AuTd+tc+feQuv9iuhxJxht0jbWaPwINlUy/YqHIEUMBOcELAyoL12t9gJLDPeDQodRG32b5TCUdrkJlxj3B12YAsE9wlsbiwQxh3oVrTuBJaMi95jXEXGI1ZlpSkAVR7oXO3adekQtdCa4upxohYY9v/oxjTUJwh23H2XVWtRekiPDyrhB4SrsPpDtRh3QrjVOpl6y+3DoSzzQuhBUe+rM8BgRe1pRrR2fi16+Ert1nf6KzbvaCMH6fT4HeyzzJD/VcsfwrLsnnNKNVmF1hKeqyCsITD/NMdqSADLw51gUK24kaMPEZ1K+UXdOFK9B99bA0DYpj3JBDtr4nkA8DSUXcljAI38q1QeTWK1Obmk/I9A2qt86HYDjUAYz/7P1Bh9p6uQ/bl5OD5Ty79qdUz/yD0YfYJAs=
Content-ID: <00FE7F1AA871C04D996DC153907D67D5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cac3420-1959-422f-06fd-08d7196f6b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:37:42.8654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_233745_187016_7CBD9AE8 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 09:36 AM, Boris Brezillon wrote:
> On Wed, 31 Jul 2019 09:12:14 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
> 
>>  static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
>>  {
>>  	return !!(proto & SNOR_PROTO_IS_DTR);
>> @@ -384,6 +522,7 @@ struct flash_info;
>>   *                      useful when pagesize is not a power-of-2
>>   * @disable_write_protection: [FLASH-SPECIFIC] disable write protection during
>>   *                            power-up
>> + * @setup:		[FLASH-SPECIFIC] configure the spi-nor memory
> 
> Might be worth giving a example of the type of configuration that can
> be done here.

will do

> 
> The patch looks good otherwise.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
>>   *			completely locked
> 
> Looks like this 'completely locked' is a leftover from a previous move
> (lock functions were move to a separate _ops struct IIRC). Can you fix
> that?

there's already a patch on ML for this, I'll apply it.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
