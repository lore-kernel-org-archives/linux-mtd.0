Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A89C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F91D2053B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVpXIwdA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oU23cSyB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Garzaohi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F91D2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSMHxXNV361XHVRcAoHQW4xN0Kenk+HWJj0IBzJCfhg=; b=LVpXIwdA/tnqer
	mdVnGxaWo6ukoF2cVH+n8vWZOqzUfJiu9epzPa4PukrTA8oe4Q9upOH03z+v9Q5MbagVrvJefuvJ4
	canMAlX85ISJUCzu7mG8LeV3Bj4t9Qw4FdXf/mJsVGdnf3kfY48RIt5GBD2oGthCXakm41fLgH5rR
	ZBgYoSLD+4rS07TAI9PV5tseKUv/XAGYcrzAVnA8SxhuuhG3GLBwlTpQ4FbwPsa8FDBScEylxWbE7
	w7aR3JUPVGFxYwMnhIwP7PoJQ/IUXXV4FNnHmGqjyT/Htk+uTPWLeEWldGKSS2Dda8qkQls6T0y4l
	wZc6LxVwH6rPVkdkCpfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTLi5-0008F4-A5; Tue, 28 Apr 2020 08:35:21 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTLi0-0008E7-75
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588062916; x=1619598916;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CQvmQ89Zev6zx2chl0SX+spqBm5a7RpYk2jAtxGg5qg=;
 b=oU23cSyBK1ydVtUAoPTHIHYyEtd1Vkqzmtxb9G2KzwES7KYoMez826MD
 hxkRmM2KIwrIvG9R4Zc/8ZIs8Y9CdoNUJE5WMobtSXHNPXPxfHK0pfq6m
 zzSLXQxDgrsf4O02YYNY/MNYCilmUbuVTbnLNSapJLDN0Ler1HKxCY+mW
 29mFNhvoxBmD/mCH0pZThUwUv2rFeW24bpT4AYPIoJK/tnQbbIESTHnrL
 ZLsvq2fPBC0zP5ST6yau0EhOE9peQuTY9FBJhpVxqwhGhpWd+SvOLRpeh
 mhJrWDTCWLhL0a+5Imoo5gIJnfNAlORqoj26Jw1p+ViHV+jf9ixz3MFeV Q==;
IronPort-SDR: Xd/UAr3GbZyV9xh0bXyNm6cAdV1bW6aazvik9sO1whgihyTkhqxMtnwhUbSSwpfxebU4OkJ+9m
 1ujV5YOllknPyJ+ay+R84Sm4ABbdDsc+79gLOo5NZ160ruejQaj1uqusWtQnDTRCUnP3qi1dOS
 OS/ZYssG5VQoi8qOYgxHlym81iMym1mZU3wdgsJYMnqG7QjYN+EG+JSwZQp5/vpeFdmKBzQlfg
 wFF8NSTbErdxLWW0Dhng/TZE/u41hpMGh13pfpQPy8W/NaqLLShr8zMTZ/lwvkfcPhjmNZU0Zv
 CgE=
X-IronPort-AV: E=Sophos;i="5.73,327,1583218800"; d="scan'208";a="73533831"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 01:35:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 01:35:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 28 Apr 2020 01:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEHnTDblzP7UQeIKonVIda7Z9vvKVb7vZ5KZQUuloKrgB0+z2FnTNrHxSepxLDA0mo0xjXvMNcIZP1zLD1QPKTf8g82ZkwoeGfyKp3QZ6nW+DIvCK+DHplSpf7EszYNUYls1RKjjHDnjDvN8miJY5Spb31u1qzs2B2bq1Gtf/2mSnKds1RHZKJvwCbZSCPCIomH/vZ9PlhdtlYTfDCnciCJyAqSrmKEOj88PPWkHjeZzUirq8dYoCERqox6pM1tzVQQ1BDP5nG4XVnv1281x3eyJy7rComXwsOVonpB7Q+1lsmxkg/fuwdIhuXi3ne/JtOcEw26iKeqLl+VEXLETVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQvmQ89Zev6zx2chl0SX+spqBm5a7RpYk2jAtxGg5qg=;
 b=SM/Yac2DwRzarKwvN361nuryplHi6JDsZgtZGe3qR69wcZXK1kb8MG1du3miv1wr+w6ewdcNOsPBewqDL7Z4FXY7mSuxGVpI9DwyFeto8eTqSQ5q9p5puQpAhefywLPqzTMB6J7xlKMfZmTNZmn1V6BOF34OqDvc6Jk1bLCi+TvsU6w3sWEDrkS3Q3jDN6RshQO6NAlSnpolOmwTOmWsP2ZW7j4U9XHcG7oXdJKrpcc6sDWG6mhlgK3TzguCSrKVSJB9G0AnSEzMAdsQ23s3DFJEk1/rbA2AemjSS5lg65omv0h74i18XhagwunkN3RNO5JtNSBUsxTZHVD6a2fbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQvmQ89Zev6zx2chl0SX+spqBm5a7RpYk2jAtxGg5qg=;
 b=GarzaohiDMQQndwkWqu9h+/JPKDjWQWymu3d9sP44xmeX/HVilw4/vSVlGHDXWcIIyyzdJyY8aiQkSunwAQ5cmZREJcSpgqwbOxr9fZaGKqnazd4HK2B/Alu29iz0HyfpF5h8RUM4fGYMhYqwzI5ZPZpCdcFkWSxeMjlvpgEP1o=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3925.namprd11.prod.outlook.com (2603:10b6:a03:182::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Tue, 28 Apr
 2020 08:35:06 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 08:35:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 0/5] Fix kernel-doc comments for 'struct spi_nor'
Thread-Topic: [PATCH v2 0/5] Fix kernel-doc comments for 'struct spi_nor'
Thread-Index: AQHWHTfr4xFx0Wnx8UuacHeE+DzauQ==
Date: Tue, 28 Apr 2020 08:35:06 +0000
Message-ID: <2604434.NqclOjlLZl@192.168.0.120>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
In-Reply-To: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e7bb3e5-ca2b-4d4d-864d-08d7eb4f0dcd
x-ms-traffictypediagnostic: BY5PR11MB3925:
x-microsoft-antispam-prvs: <BY5PR11MB39254A86B0A5F906E3AE98EFF0AC0@BY5PR11MB3925.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(136003)(346002)(396003)(39860400002)(64756008)(76116006)(6512007)(66476007)(66446008)(9686003)(66556008)(4326008)(66946007)(2906002)(14286002)(4744005)(5660300002)(6916009)(186003)(6486002)(71200400001)(54906003)(316002)(81156014)(8936002)(6506007)(86362001)(53546011)(26005)(8676002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NyehRw2wPKQvBRPyZ9OiTAW4wtXkVac2Yo5SlsaOiQ4tfhInra2qlWN6aG7rSDgX+ak1gUJ4ajaXvCWsq2AhoG6zE95AUY8hNAE+yAPBycV36yLYZ+K7IBkGcBLHcvgeAXAY1gmPCEnNrbYEr45p5AljUiH4XKnSJIq+O8bMucB4JR6ikRJIUDNPh+YdVaBjGuLPUW5/D6fIcHT7gVgvDvI7ORXF6ZP9U72AF0mr53J55YwxZ+jBFrZQoi/ZzBY5YE25aJGh1MTmzCrJ7jIqmSngeizIqVKM7YvgnmRMmPcnUUMgz+i3X3hKW2uN2p31ZpEpx64KmvofMzpWBevf2Iir/YXJLFPALZk1EDRlkZ8uZoRZugl1cDlBvaNw/i6GAW2uQq7K3Lnop4DeHlZHRLkT3CnIVOB8dnzH6sG16qVvcZ/JbwlXWoC02OEZQEh2
x-ms-exchange-antispam-messagedata: tKGslc/Vx+Z8/FGZ87gshoVyqG0WGNC+QbTCGH0t7VbtSH4Z178jLIsWo2zfrbXFyRfdVSe33TUOoAju6q4fI87JHLreYE5FUkVdDN/6nE3ZhkeJHMcYrscO5c7GRvBDRi0LkAQptCJPoiKbZzsOuf9KZEwoFRwvJfPTxesyITEwTZyMPjz3sr0d6vQjcuNX72yH9DNNZSUzemVr7UNNVSjgmPvuZ9RrVqEWQVMe5T9JIbVsriIHeWoE1LZxo1HSqSF0qzVBfxgFSTqFwdf13T26ugFugWaBRoucufaL4ceg51tkeGB3Qjh0qdvS2KmNhMa9NAk6YVNzLUf7C0kEQ/62fOzvX8gBjTYu4UgUgD6yiRazuojPfI96DFTquUKHEL/4X9aOkXggwbITGDvlj4J6SphnOpWU6YTB3f5nkMHTbbeNhfVpxrNr6saK9jTorpElQ75+0NBBTMDecgzamLlhw0gqS2yng5in2BkXf2Xm5xXxdmVmiP1q3ual7eFN8muhPQXhFK6syYTxVG4UG6D9HOolR4a2DpVfGEOiaHLAsMt+rjCf48qjzqlL+/0WfUU/4/oHdAFdixnSzZBkAl0NB1s8ZmwytnmPyAkjF5izO4C3CwD/et0zN4zStB27uF42Nz3+cy2x/Lah1k8NFCRrZ/5qsRr8BaxgOnUAjarSO/GgcIusB92A8sUQQJbo6hOV9h+J16DJP5DkrYRNaBFQJpzV5cKfp1H27zBkHS9sTCkP4f5uRT7hplnNg9J50/Jtx/ZQpBVMQDUb133BqjLPQn3u/TCEu7o1McN61bU=
x-ms-exchange-transport-forked: True
Content-ID: <BF04BF5D62429742A9D31FB93D70C7FF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7bb3e5-ca2b-4d4d-864d-08d7eb4f0dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 08:35:06.1032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDBZcrYfRfRFtUEOaKaTamMx1k40E6GtKBL8I4erg4Dka+i/YioRzf/jPqISf4Nykl9WAB2AdqP4mLAWgp58oRj5cDFH9DIOj2RgTvJZbus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_013516_876395_2904B982 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, April 3, 2020 11:39:25 PM EEST Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hello!
> 
> Here's a set of 5 patches against the 'spi-nor/next' branch of the MTD
> 'linux.git' repo. I'm fixing a number of issues in the kernel-doc comment
> to 'struct spi_nor' accumulated since its creation. Instead of a single
> patch, I'm fixing the kernel-doc comment with several patches, each fixing
> its own broken commit -- this simplifies porting to the stable kernels (if
> that ever happens). :-)
> 
> [1/5] mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
> [2/5] mtd: spi-nor: fix kernel-doc for spi_nor::mtd
> [3/5] mtd: spi-nor: fix kernel-doc for spi_nor::reg_proto
> [4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
> [5/5] mtd: spi-nor: fix kernel-doc for spi_nor::spimem
> 
> MBR, Sergei

s/SPI-NOR/SPI NOR in 4/5. All applied, thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
