Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46B9C04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88222082F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lfvt5ai4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Rd7imP3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A88222082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzkgwMF2HLXgviOpV5h4L2A8iJ1F9+nLrNfKx3yOqxg=; b=Lfvt5ai4BG5bvD
	gQnaS7R+etY5Qm1L29yonqfWoF0AdIuCL1TntiL+8KacqV6B+1OSfziH/0BV7GKBsLHnWpm1ArUHN
	22X+6Xqj+iulg6fxWuZ8Jr7hLeZowv4JI1yrDVP1wwTbwUIqHcEOJdeUy4vheJzydEm92UtPkdnGB
	ZJrU1ImUmJUJMBxcGRlljFpyrHY4eOVqN2P0azFNKpZ578vlk4UarVTHLw1KCjBqwZW0UgYYXdh/T
	0e6O7E5IrasPq9+4X+PLS6zvyQ/ZqwrzMReRyVJx3uLS4arhj32XH3k8LGRQ5BkVjpLHfDxKvrgtu
	p8dnq7cp16XsBzgFLrVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZ0N-0007EV-Od; Mon, 06 May 2019 08:29:47 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZ0G-0007Cw-Fk
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 08:29:46 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,437,1549954800"; d="scan'208";a="30206449"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 06 May 2019 01:29:38 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 6 May 2019 01:29:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7HgdMYaS+09qNHK03RnCxzLU1ZKB/LSpUaeJIWddeY=;
 b=Rd7imP3mKsbTQkLeGXK9Io/39Ju73cCCB6lrDRq/X1m57nt0tyRnvEU/ECkT1aeO7GtVuE7DeW7Zatu475VZMvm+ceLeaeTRDMoH6Me0KQgoCD4cyWABY4GD5lHzw88hz7HjcwBp64Vs9t3NlW/5keLbKt7zZsc/xjp/DuJfWfE=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1459.namprd11.prod.outlook.com (10.172.21.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Mon, 6 May 2019 08:29:34 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 08:29:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Add support for Intel Comet Lake
 SPI serial flash
Thread-Topic: [PATCH v2] spi-nor: intel-spi: Add support for Intel Comet Lake
 SPI serial flash
Thread-Index: AQHU9DSrcvtU/MzDT0+FpYhm1cERaqZd4zoA
Date: Mon, 6 May 2019 08:29:33 +0000
Message-ID: <25971484-e033-d1b0-f96b-e1fbce1f4c35@microchip.com>
References: <20190416091110.42503-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20190416091110.42503-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0273.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::40) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a3340a5-3bc9-453a-6c6f-08d6d1fcf758
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1459; 
x-ms-traffictypediagnostic: BN6PR11MB1459:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB14595FCF541D7B832F1CE2C4F0300@BN6PR11MB1459.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(39860400002)(366004)(346002)(189003)(199004)(446003)(476003)(2616005)(68736007)(31696002)(11346002)(14454004)(72206003)(186003)(36756003)(966005)(53546011)(6506007)(386003)(6246003)(229853002)(478600001)(26005)(6512007)(102836004)(31686004)(6306002)(25786009)(7736002)(6116002)(3846002)(2906002)(53936002)(71200400001)(71190400001)(486006)(305945005)(4744005)(66066001)(86362001)(256004)(4326008)(14444005)(73956011)(8676002)(99286004)(6486002)(52116002)(81156014)(76176011)(81166006)(110136005)(64756008)(66446008)(66556008)(6436002)(66476007)(66946007)(54906003)(316002)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1459;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YbZ55ceIIz4VnCnLej0YfYY4YhVV6/9WDuBzR9l8u8arKvu4iLTIWxAGAQklZNzqjbj5eZN8zYpsjyDswQ1Rq+mTmmQ5OKeBYvJ45Cq7G2qi8jR0JvX9T0c2+oAFSWMlgIH2X7e9IYcx923I2X3bI/gj2bVsGZPtenHRTqtSE7ccEDJyI8LVkC41jSqZT3/xqNCZhKvUGeXN2KKrZfQM8HPY4ztQi7sWfilbjtZBzZSrBtPwKhP0wtBEQ06BhTxlC3iz6D3oa8uGScG0EFEtQPoaqfiUT5S1YLF048wj0NtbKJ6CF0xIabSk0POLTeL1e5j8FSd/oT2sbFqbFfvRVuw9SWHFWbCffS3PPL/FYMWAjVyDlEpJpPB2n6ntqzRu/T/JdG8SY5o7arAZhQTWsAWCIePb3i6RnVvFJL8ggVE=
Content-ID: <6EE1201C8EB52644831679E63EA24C8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3340a5-3bc9-453a-6c6f-08d6d1fcf758
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 08:29:33.8991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1459
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_012940_646315_467C18C3 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/16/2019 12:11 PM, Mika Westerberg wrote:
> External E-Mail
> 
> 
> Intel Comet Lake has the same SPI serial flash controller as Ice Lake.
> Add Comet Lake PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Changes from v1:
> 
>   * Updated commit log according Tudor's comments
>   * Added tag from Tudor
> 
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
