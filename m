Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB30C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 15:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5AB2086C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 15:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCqAX3DM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JaJfwvk4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5AB2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KU6v4P7cOIg7zlz6Z0wYaRc2a37bGcMvtoRt8FmS7E=; b=lCqAX3DMu61a7E
	KQnZ6IgfhJdVL2goY9CKs3R22vqDTG8hG8YbEE/uRf9EyQlG4cNDddVGqnT5AJhWSwRPXmhavsbt+
	msjljcOElB0smRbqDpotQeax204Cc6fgfm21i9ByEqW5JOh7E2RfS+l0KVPrdm0bqW36QEx0HQlvL
	zo0oI0bZjVA0Rcd5u+PBpVvsCd7Fk71OIK6jMfWuRfcAKq3wsTTWzLZy57Nvq+AUWsI1n7V4Qunx9
	VMcMoCNVcNIzgt6XJ1DRxSDWPRvMwz6R+Bpv3en0mi49oUGAodexyAEm64W6eISSQ064ipx3GiYMy
	Rp/ltvfROXlSGdQzjqRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs8R4-0004t3-Ef; Fri, 08 Feb 2019 15:51:26 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs8R1-0004sE-AG
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 15:51:24 +0000
X-IronPort-AV: E=Sophos;i="5.58,348,1544511600"; d="scan'208";a="26293556"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 Feb 2019 08:51:20 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 8 Feb 2019 08:51:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUIvTS25OUh6PjlvznElb0t5SwFwEiR/rz2bPyZjvjQ=;
 b=JaJfwvk4oPWRrMNvodzDW03qZLUQT8BjoyH6/AO5MjNubpnZ8y0jJKuF2YEUxY1lwhGoy4JsHAHJGDLaW/PhO1J5+/Vst59wvsQFQz5OfzfY91P7n8lvRry8tUyEQXBftOF2Vhc6zfCZHduVqVSy/BZpv3hlCdCjouM5pQmK1jQ=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1284.namprd11.prod.outlook.com (10.173.32.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.20; Fri, 8 Feb 2019 15:51:16 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 15:51:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <beanhuo@micron.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/uVD1jG3UvCBSRuC2oJ8LRRcc4gAA03cAAAFVpvAAAQltAA==
Date: Fri, 8 Feb 2019 15:51:16 +0000
Message-ID: <a83a9655-0ce7-da15-ec17-80ef88764e21@microchip.com>
References: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <298d18cf-094b-d5d0-45d1-39c7b75ba309@microchip.com>
 <BYAPR08MB45335415CC3690816C1FD603DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB45335415CC3690816C1FD603DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::19) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1284;
 6:OckLUVGouwqqLWegrTibfWQjDSyEwxOH0yvymOLk3vfMs6NzIO4tb1O9RvIuPvOrifrw6QbEibbViqemfEQlDbNzTVS1HmDD8tG2X5d+rFdU6rb7uFO17t//5e6ErWd5HyisLQjfTf27QCp/1t0r6da6Z5fIFDbRwEyIpsY5McJ3dQWUCDOTg8WWf/Ro7mZpk6OulTvuz+E2HRx1uaL7rnIsLwNtGXBJ/2CNjBvhnP8tGqVmwdAqaRKe6DFiQ50q1SnWDHUu3fPydgwiR1lLfe69NxgvJZH8s2ErLrdppSUmEYkpKUd5fXPN6RbcMs22Jh2eB0nJRAyfMLjOpK3lg2wJ8di2QllDQwpaPQNLbmMtriB+/r3tnSJvlo8YiCD7CxLnyGc+0KIeMVKIHe9dy54IKs8ug6ZvAc54ijYdKGI1KmtQhCnzhgAwpsEkHz+9k/2fHOt2e6uEbEh9cfWKJg==;
 5:MO4wAK/yzWZbTa9e3RxXR/E9ByajHBUjGASqmwACHF2ZY88BIt/wxsrYHquhdLHhXtRX6DJHzY6mGHjmeIh8H63JfbpsukF9eTsaKifs7BMNbHPHcCD39ITB4fvOUPiufymFrn0W5HYJpZrQfu6APZkOhE5kw3mXgd4HzisbiizSXguStkeUSHCxqdtlCLCwgC57CiLsXAXaaZzjSxMgPg==;
 7:mglJugKZ1vOvia+Hva+42DPh7+A51nO9xTkybm+hZHoZ2Cs3sIe6JD1NjmHhdPup0XkrtXwQRwFmJlJLNbc9ykESX4SMrIZGvYSueqNN78wDUmseWRFBZkwwBownB4QQWUFvkPoReRW5u9c2aLng1A==
x-ms-office365-filtering-correlation-id: 35b975f5-f478-48b2-ce7f-08d68ddd4234
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1284; 
x-ms-traffictypediagnostic: BN6PR11MB1284:
x-microsoft-antispam-prvs: <BN6PR11MB12843105A771EB6750B52957F0690@BN6PR11MB1284.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(72206003)(2501003)(71190400001)(229853002)(316002)(71200400001)(99286004)(25786009)(31686004)(7736002)(305945005)(106356001)(53936002)(105586002)(478600001)(19627235002)(6246003)(52116002)(6436002)(486006)(6116002)(8676002)(2616005)(26005)(14454004)(31696002)(36756003)(6486002)(76176011)(386003)(102836004)(3846002)(86362001)(186003)(68736007)(97736004)(2906002)(110136005)(14444005)(2201001)(256004)(6506007)(54906003)(81156014)(81166006)(6512007)(66066001)(8936002)(4326008)(446003)(11346002)(476003)(53546011)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1284;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /vN2MVTfbbpast3RIha2Ak/cL6iR0NruxtvCqcPVIFYr3o86UAiDIorGgdw/buDZPABLw+2AbqDqUUZRK2AFRkSGaPTfb0DmNc2F3xYkOcOWiuDAP03VZEVFLebtCagqeZzJbZ2gHoE+ob+dRwted4shhvcdBL3KPo1qw9IcWl3lwdAg21wo+++JWmS+vRmO9QdJf1x08IhJdlzmOO1yA651ES8fqLqnuMSgTLZUvXyCM5E4qk90j1gluvp4Xem/XhBdo+5ivk3S8kFeLb3saJyCjzA2vHehLu13RbppKm6j2qFJlXvPbRfHtPZwjo3QLcwTbJHBIuO1Ieidae3gdZ6OzdsLQ9TrQhUUIcB+lMHCIF0UU+FnhPLB2r3qTX1DFQdeZVbwRh3o8cEfeCXFaygKYJEMsn7jhaPqZJxTi8A=
Content-ID: <2ED8E5929B965A4798BEBCA066930722@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b975f5-f478-48b2-ce7f-08d68ddd4234
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 15:51:14.4108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1284
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_075123_451405_8DD13FCC 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 bbrezillon@kernel.org, richard@nod.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Bean,

On 02/08/2019 05:27 PM, Bean Huo (beanhuo) wrote:
> Hi, Tutor
> 
>> $ ./scripts/checkpatch.pl --strict
>> v2-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch
>> WARNING: Missing Signed-off-by: line by nominal patch author 'Bean Huo
>> (beanhuo) <beanhuo@micron.com>'
>>
> I think, this is because of our email system, it always adds '(xxx)' between user name 
> and email address.
> If you are convenient, please help fix since it is not such hug change.

I'm on a funny email server too, it keeps overwriting my email header "from
field". I have a workaround that might work for you too. Here's part of my
.gitconfig:

[user]
        name = Tudor Ambarus
        email = tudor.ambarus@microchip.com
[sendemail]
        from = Tudor X Ambarus <tudor.ambarus@microchip.com>

Because my [sendemail] from field is different than my [user] name and email,
git send-email will add in the body of the patch the [user] name and email:

From: Tudor Ambarus <tudor.ambarus@microchip.com>

When the patch is applied, it takes the author name from the patch body. Even if
the server overwrites the from field from the header, it will be ignored.

Let me know if this works for you.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
