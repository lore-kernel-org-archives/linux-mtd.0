Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB8FC04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 14:23:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7126321530
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 14:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+EwqRMi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cYmGWPbr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7126321530
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1+aHALSJwzL7gmZVcTh5faO0Hyi95WiS2hE0yzX9Mk=; b=m+EwqRMifO79ER
	9+XUcOTAj2nyqywvqFVGtbgmeOmvyqgejyAV1sjiX8yP0fLd7sV9EX0xQOftNY9w/5gC1F4iZC3KL
	9pt5UBK3sokTISgVIrugcuVENdBX8LNoJGF/dhNZZ6pleUwpaAwgM0UcDIzN2/bQcXJ4WBP/DCVVB
	PTn6/qUDlerSWMr7X9DTQMo5EUclZlfiftJQKAbw6RUq1jhonRW8idWGTtYDRxM2iqeRy28KAQdvT
	XhNvLUGFwYZHCaMVRPnDk58mi7tatDSOB3dMQ63HhgY4bMb9VrUGzTykxG1UoergXb+Hc7+oXCUa4
	CciHK5Z+9XBnN6UTgzZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hONU4-0002Z6-ET; Wed, 08 May 2019 14:23:48 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hONU2-0002Ya-4v
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 14:23:47 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,446,1549954800"; d="scan'208";a="29641609"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 May 2019 07:23:40 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 8 May 2019 07:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHYb5k5906uC+A0DNc+YWJBVyi4v3wzZCu5sQL35eKo=;
 b=cYmGWPbrP+p0st8wfdyd0ULAt8Hv6fQNylMAFODxGsw/WtfvlT90MUX/F+joCWctY9hUxNOVtq9JonYGR0QcQG24dsI2OSEfNDBjDkUGb2iMt/SVw26nAeLoboskI3QjyCWxfJnutjCowYCPsSWioPfmtv4iqycHgqjkBHMWTm4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1412.namprd11.prod.outlook.com (10.173.32.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 14:23:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 14:23:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAIA=
Date: Wed, 8 May 2019 14:23:12 +0000
Message-ID: <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::52) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e73f0d3-7634-4a3b-db15-08d6d3c0b3fa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1412; 
x-ms-traffictypediagnostic: BN6PR11MB1412:
x-microsoft-antispam-prvs: <BN6PR11MB1412369079ED681F2B876F17F0320@BN6PR11MB1412.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(81156014)(54906003)(446003)(2906002)(486006)(8936002)(11346002)(68736007)(31686004)(476003)(2616005)(66066001)(81166006)(8676002)(7736002)(305945005)(36756003)(6246003)(6916009)(53936002)(4326008)(25786009)(86362001)(31696002)(478600001)(5660300002)(316002)(52116002)(386003)(99286004)(102836004)(76176011)(53546011)(6506007)(3846002)(6116002)(256004)(14444005)(71190400001)(6512007)(71200400001)(14454004)(6486002)(72206003)(6436002)(73956011)(66446008)(66946007)(186003)(229853002)(26005)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1412;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WpKlbIq2rvGv8GPSYb/vkZZ1g14J//gaXVA5yihQWIJX/+NXgaE/VpV8Zbwq+We45q63vApTnvgtqBqmLc+Gle8+Qx4pIuNLRXTwO9/3qVxqiEw31Ixw65LuAjMV940lIYtviNBYOhYT053uy0Qnvdh2I0yaKhOAkfV1LEfBycANTLL7QuTGEdiq8xgJo3xEKpBQi+BD8gq42W+NN8uNHXPxoO0mA1HxCHJ7WiRNdiwymVwu9eSkeGqTHf3RkG9nd4ZDuVJugfulWSf6ZjbmmbprzOjyBSmZI1DDmCuL0yx7sU3SunHBbxhgc8cqZEe63imQ5o9jRjfQ14q2U04BJpG/h5D7UsgNuUyoViRuiGAms+6UnVbkbFcd9Xy1ae/R61gjjDlxg91SJ8lCsMIdHgrlUC6UnbP3rkTmVLkW10w=
Content-ID: <BC5799178372444FBD8D96AFB544F645@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e73f0d3-7634-4a3b-db15-08d6d3c0b3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 14:23:13.0500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1412
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_072346_229587_86F5E85D 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: linux-renesas-soc@vger.kernel.org, jonas@norrbonn.se,
 linux-mtd@lists.infradead.org, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Geert,

On 05/08/2019 04:11 PM, Geert Uytterhoeven wrote:
> External E-Mail
> 
> 
> Hi Tudor,
> 
> On Wed, May 8, 2019 at 12:44 PM <Tudor.Ambarus@microchip.com> wrote:
>> Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
>> and after the operations in cause.
> 
> Thanks, giving it a try...
> 
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 73172d7f512b..20d0fdb1dc92 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/spi/flash.h>
>>  #include <linux/mtd/spi-nor.h>
>>
>> +#define DEBUG
> 
> Should be moved to the top of the file, before dev_dbg() is defined.
> 
> Result is:
> 
> m25p80 spi0.0: bfpt.dwords[1] = ffffffff
> m25p80 spi0.0: bfpt.dwords[2] = ffffffff
> m25p80 spi0.0: bfpt.dwords[3] = ffffffff
> m25p80 spi0.0: bfpt.dwords[4] = ffffffff
> m25p80 spi0.0: bfpt.dwords[5] = ffffffff
> m25p80 spi0.0: bfpt.dwords[6] = ffffffff
> m25p80 spi0.0: bfpt.dwords[7] = ffffffff
> m25p80 spi0.0: bfpt.dwords[8] = ffffffff
> m25p80 spi0.0: bfpt.dwords[9] = ffffffff
> m25p80 spi0.0: bfpt.dwords[10] = 00000000
> m25p80 spi0.0: bfpt.dwords[11] = 00000000
> m25p80 spi0.0: bfpt.dwords[12] = 00000000
> m25p80 spi0.0: bfpt.dwords[13] = 00000000
> m25p80 spi0.0: bfpt.dwords[14] = 00000000
> m25p80 spi0.0: bfpt.dwords[15] = 00000000
> m25p80 spi0.0: bfpt.dwords[16] = 00000000
> m25p80 spi0.0: failed to parse BFPT: err = -22
> m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
> m25p80 spi0.0: SR = 00000000
> m25p80 spi0.0: CR = 00000002
> m25p80 spi0.0: Erase Error occurred
> m25p80 spi0.0: timeout while writing SR, ret = -5
> m25p80 spi0.0: SR = 000000ff
> m25p80 spi0.0: CR = 000000ff

ff can mean that the lines are "in air", maybe the flash resets when we
write_sr(nor, 0)? How about adding a delay here to let the flash reset?

SR=0 and CR=2 after reset, both write_sr(nor, 0) and quad_enable can be avoided
-> read SR, clear BP bits only if they are set to 1, read CR -> set Quad Enable
bit only when it's zero.

Cheers,
ta

> m25p80 spi0.0: SR and CR before quad_enable:
> m25p80 spi0.0: SR = 000000ff
> m25p80 spi0.0: CR = 000000ff
> m25p80 spi0.0: Erase Error occurred
> m25p80 spi0.0: timeout while writing configuration register
> m25p80 spi0.0: SR and CR after quad_enable:
> m25p80 spi0.0: SR = 000000ff
> m25p80 spi0.0: CR = 000000ff
> m25p80 spi0.0: quad mode not supported, err = -5
> m25p80: probe of spi0.0 failed with error -5
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
