Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D59C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFE520578
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7DBsHG1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Wv4olbq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFE520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RWTuHdNzT8dzNCdXJCDqTvB4A84v79cqSfDrvy4SRk=; b=V7DBsHG1ddn5+S
	81p2S5uwDLjW2KKNlC+2gO1E5sX378m8mNABfk4SUGaetNYe74JWNDMrOFQBy+T/mGOhv63iIJP/M
	42j2fDR7K7c6kueHbxnywLOSlDJmh4liXExXj/h+BKBWOWpl8UNMIxnpYMqXhskRDTEDkhvs76hd4
	15O0Odf6KmP6ngPAsh/bMLHKbvhv/od4Um//ruqegR/hkaceHaxYR1INvBFQf7PSeaWLuzLy+Itxc
	UCIqvYdfs8duKZScT579Nb3CxUZIFjDywcF/k7ZLer0ju1YxELRFhbNkZMx3hf3gALx/iLylN9g7c
	gR2yZbOtpYk6Exnes2QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05wi-0001pc-4S; Tue, 20 Aug 2019 15:21:16 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05we-0001p6-3Y
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 15:21:13 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: q9yX6nh1/3wsN8a3gg9/GjKNM/u/CZS9rJBZ9rE3+X1cxMgx9kZxA8xyyhnC1N/hLct5QsR3og
 KuLUMFSGIud5ZTO4PaorN8JAaUVw0ImnCCCULir30pcwwYkWX+iNmvMV2ucvkedCPvjjbeHY27
 LbEQji3Pwc62RBIrIKbZUriNgzWhiuNuSn64c6d2FfRRSIIkEocG4K83U84evDs94rTu78j3B3
 H+MKk6LBYYWPViTepwmhoSQOYtp346VoDffSxqfVtZvNewDC6/tPMXZNnQ33gLJd2dssWe5AsV
 Xb0=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="45942237"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 08:21:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 08:21:08 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 20 Aug 2019 08:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkH4VKUxWj8qFT0Qneq8oBhmHHnXKN9E79GpYdPzwT79nYFcyi7Ogd8YM8a7RXzIK9uQPKmEo+mNbSN0aHsqzRms5uxbhesMzGY/pA1MtwaQdb2myEDYAGcC7tynDZ1pKEwmvRv0myqcegceaDirhGKBkdUe8IoLgL1SN2iuMSQndxqGjIjgQC7jkcAwyyku8jXXHkQfRzMRn1c64knLssaQYE9w7J5ElAuofNtqixU2Md3VbBFWjUfWgU0mfEThV9zeGFumB+HkrTsXEdcfDySDPDKvIkrtAN7sRCxAm4mjCXpaTS/dx26ici7JTDt44BgCxLPVG/7vWIbTs5JMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpmkLoFm3bFPCMcigk28Tm+0tZD9hpCXgPPWIVb8kfk=;
 b=HxrW2PIYi8U7fM0Mi1bC60SJZ3qX+aboe1vAzxVR7DI5jihMbS8BXidcOn6KAPnTpKKr05zRmyw+kOc8vEE3EKGVW4hF1XUbp6wh7PdKpXpTS8vDlFA4UC1ZvAa4u9sW/hG4W1xzinIDNtLrHzS0OF2n5NcCGQLxz1GmG65Gvj2Ftrl7zj9Fph4WymnrFOY/uiXWvrFYvi4a7oDVYrniYmQJUoCNYnrUjTibcmEwrwUsVghCTFCusl4PxOexYLT600/fPesE3jOmrLXrri0fSfya+MzQjR2Hh80voHTrde12M0w44iRXXIpSNxiQDmOhW5gwpHewPovJ5mDU1mL/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpmkLoFm3bFPCMcigk28Tm+0tZD9hpCXgPPWIVb8kfk=;
 b=Wv4olbq5+nXmCLWgxFg6muO8aP5MtYT+h6n4PkWY9RFiNKXS8TauZfMMj9XCeFfLQClEWjcNT2S2ovvX4WpwFm/UCT1A+SffnDUBql8NUSMADJw3b2TygqJDpX2AwNWiiIrbDI9ZL6Sxyj6tOz7EOSaKgCE7riQlbed9euoHv8E=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3838.namprd11.prod.outlook.com (20.178.252.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 15:21:08 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:21:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Tiger Lake
 SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Tiger
 Lake SPI serial flash
Thread-Index: AQHVURd2BCJQgb1WkkCz65MN4q3UtacEM5EA
Date: Tue, 20 Aug 2019 15:21:08 +0000
Message-ID: <a3a1c3b2-7d95-230c-9d6a-4eb5b296bddc@microchip.com>
References: <20190812140354.42991-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20190812140354.42991-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::20) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3b3e9f5-92e9-4b6d-a9f1-08d725820678
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3838; 
x-ms-traffictypediagnostic: MN2PR11MB3838:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3838B19DB5CF10C57E949AA9F0AB0@MN2PR11MB3838.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(39860400002)(346002)(376002)(199004)(189003)(14444005)(81156014)(6306002)(8936002)(81166006)(8676002)(305945005)(6512007)(2906002)(7736002)(6116002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(99286004)(54906003)(6436002)(229853002)(6486002)(966005)(478600001)(14454004)(76176011)(31686004)(53936002)(6246003)(4326008)(6506007)(2616005)(386003)(476003)(53546011)(102836004)(446003)(11346002)(186003)(26005)(486006)(86362001)(66066001)(31696002)(36756003)(110136005)(4744005)(5660300002)(52116002)(316002)(256004)(71200400001)(71190400001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3838;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: chdZ9irCZJjFBeRhWMnvPyCJn4gJHLjMnOW2YHOJgfJ6Ko+C0hwzJnwPqgNT75qGt6dA1Z/dDBou/5lfBvluijU4vu6wl7ZnuMt/xQd/IpThrUhGvYhfdrVbH5iaiRbYn4Q6WkxLVs+IUi8VGOYIEMZZtzdVIMyX51qyWysYCket4JahrSSMcfWwafH8pXpqc1A1vzMqPJBndxLW3/Vsis4FEf7vk/X/4zjCGTXDAHEE21dij6WOWL2k6NVhQep1caLO212OPwJcT6g73TbK1JbxrMMtdVnT7n56vwMJUKrrTRuooEeOgsJQ3HRckawQExXeosBMSJ0tJA1hAq5WZcavXotii26vfUT5f5aIpVRN6HSUhsB/FOeXaANTXsRTD/8qzSGLkSIZ6TtWRbCgrYSFNwVBAQrmD7zv/rRFoUI=
x-ms-exchange-transport-forked: True
Content-ID: <1C2BEA1C06216C439F29DA4387C3B77A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b3e9f5-92e9-4b6d-a9f1-08d725820678
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:21:08.1981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06DnYp+RowLObBdU+6/KwPbWotsyrHuLcirLQsiw8sp2TPTO/IBm5MKLochIcQmSZj5BFQiEburGoWRpybMd8xOFDMwGwtLcQG+9C6lbTR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_082112_279448_3521BADB 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/12/2019 05:03 PM, Mika Westerberg wrote:
> External E-Mail
> 
> 
> Intel Tiger Lake has the same SPI serial flash controller as Ice Lake.
> Add Tiger Lake PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
