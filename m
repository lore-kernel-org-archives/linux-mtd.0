Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76762C2D0EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 04:44:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B455206F9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 04:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPm8jduC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZYY8byfE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BBmoLFip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B455206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oweuyg97lDNsTP+LlxRIRShmlTNFrTX7iLVMpAlxybI=; b=CPm8jduCu1rBfN
	VvHYqnKgqOf7kx3A96dibaZvKKvlOAAqsuVHnAhCsQ1DkDhIlf2CoZ2mNQgO6M18TW8cH8dSZw4Il
	fg5tm3Nb8wznfmlRvvFe3ZS6fzkSwpZJJyO73nMobwx/4onO12w+NR3wuGChV1G//3ipbPZgjRXWu
	+R02C5deaLPEbfRJLs4tYkpw3Ovu7FdwgjmHJQcCmzI7MeFRkFY7a1K2+JzYW+6+b7Ri4iw7fyiyO
	z3t9/2CVDN/dG5nHgUfq474XBrF4wQ9VDBSU6gMp5U8S+j3wv7jUTnl8ee0wJjppZ4QId9EwckM40
	f6R718pUUFRgqUOFJLOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOwNr-0003U6-3J; Thu, 16 Apr 2020 04:44:15 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOwNn-0003Tb-IX
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 04:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587012251; x=1618548251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KuJeRHaGEef9KLAv+BpehrlHkd+5NghFx7Hzv4wwVyk=;
 b=ZYY8byfE5dI9VnTMirq1McZI1RbOlGkV8ARkslP+YIYts/ytkF5E5Xdz
 0Kt4DlEF0g7Q9go7yWgpAc/UE64WamcM8CDvSlXfM3rNWv23sh3iP5n9v
 vNKl7K0D+JNdZdNmxh5GrHgVkdZZPrrpN1rzpGikU7cYoewcjCz2L5gYb
 WxeY1ujjffEfGf/1029D3Jq78QnUSDkL5JEeLH4sQ+r6PYzmdr9unMaSr
 yc2jg8FQlSm7otzHG2pIwk3SbwMnnRMvSClx8Vu9G+ILYYHjfv70ZnpCx
 piMyIwE2XPK1EDBrOkwK7lyY6bJWDyQ2wnXZjU0vr1r6RCKn57uAhdJEf A==;
IronPort-SDR: 1jp7SxFrGJ9PvLfr6FBJU13VtFLegV4htoGUMXMBC7017aQk/wbeK5NC5ZYuJGifjcofX8W5t5
 T+OFdBZqsHr0BO4muZUUnCZpjNBrHEr5TPBYtFq1iXh//wG5UhVQsdD5ZAeUWyMxBe7nIYK39s
 2P2g5i1ENNjPS3EYt8tlaSPk4Ektjt33vxeUy711v2EkSttW5PKbvWGgi87UaHCvP/xrqCy76V
 6kXC1h8R/Vq+gwauAXS+suN3Ag7f22aPDKhW9nibdjNjwYV2cJLosYI59W92Z3NV8Hc+4jhfiQ
 a+o=
X-IronPort-AV: E=Sophos;i="5.72,388,1580799600"; 
   d="scan'208";a="9345373"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2020 21:44:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Apr 2020 21:44:10 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 15 Apr 2020 21:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpfGI1q6ZiE3l7TJO8iC7MS4HeRfBbwjyIHJ3mwlszILLn76gSIPbj7vfu8mWl67Qh8Ocq1ujf6W03jJRdoWGe+mvOB1N4vqtoHKxnXZgCH8CEIARoGe9fiSi3OmJ2c+qgeGPZVb9hqusBO4gIfWMDRh09IEgZvxKd3SFUEJ/tGZgeE/Pd7jjX6A1y+rPVmvgEz14Ck19yIQvLO4QUIfM6NGdzw2IWcS+B+vgsBLgh6++sHzXXA2vtFOhg1lbdJyCE0D0fSKMDs/vFSpAWTWcRI5fPCNtWyJRQ/8k262ZMqz+SJMWrbjPjiAzeOhymiQZLiBD4c/eQPUvIBtOjoEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCcRf5HZLmZ01qzYlUkawFifGx/A+6fPyOQdcZRGEkw=;
 b=npydfHzm7cJ6ceZ8rI9foraXsshX9hG+bRJuyBqkxLsTmj3gAyd0mC6sjfKEmbchmrd+yQwT7AIDB9TFUbuVKHbtdr5F/PcrzPG8Z6i6OowVaXGMla34VWNQcirL0BTfUkChdDV9SbBx4PYjunNxj4qQT1LgJr2zRjvQ6pp7sgpvBnpJPUkmJUPASFDNpUKb8yVVyV2ulUuX3+M3pugTtte55qjkn8trMdko0oJo0lsxUCwsGMyTaIbHxAaGB1B7BBlCftlPSRoUL97FlZ/1OZUpKIB+d6GXUnrdfiB8z2dk055KUvkOh0okmJlSi1W9lKKbXhdT+jyK0ihTq6ULqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCcRf5HZLmZ01qzYlUkawFifGx/A+6fPyOQdcZRGEkw=;
 b=BBmoLFipVmYApj5G3AXApY9NlrL8bsMgDBlRoaTyBdhFbLNcIlAn06OdBZK5X9uWKxSeIWz3BlA6f5a03EZ+h3W7JV95mv1XhZoegwTjWMWG4N+BPq0gSjj4bgmfFahIdYAilWi9K+Pqeyy1cQbaQn9XjoTHbb4qOFxiLtTft7E=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4466.namprd11.prod.outlook.com (2603:10b6:a03:1c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 16 Apr
 2020 04:44:00 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 04:44:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Index: AQHWE6mk4hgYqXhoI02IBeWilZMz6Q==
Date: Thu, 16 Apr 2020 04:44:00 +0000
Message-ID: <14177410.GLmT6ekGmJ@192.168.0.120>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
 <8661b73d-bc4b-fa41-b5bf-6f3483d4148d@ti.com>
In-Reply-To: <8661b73d-bc4b-fa41-b5bf-6f3483d4148d@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4908540b-b3cf-490f-2f49-08d7e1c0c81b
x-ms-traffictypediagnostic: BY5PR11MB4466:
x-microsoft-antispam-prvs: <BY5PR11MB44666A8309E74CF184F6AEECF0D80@BY5PR11MB4466.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39860400002)(6506007)(86362001)(2906002)(5660300002)(71200400001)(8676002)(53546011)(26005)(81156014)(186003)(8936002)(91956017)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(6486002)(9686003)(6512007)(4326008)(316002)(14286002)(54906003)(6916009)(478600001)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TC9fpOEQP4u6YJzVXrpV3t7SP+K8B5rFvboUqJ1jVtyjhyOJe6h/WDuwqACMkNlfhkc2ubn/PIqjWF1YsehDzCoxHpPC7eFlrGF72TwxlyVejTgUrtgPO4rZWQJt23+Z0DaCyWvQH6nXr87z7DGYQNSXFVk4vmVofrhgMVUpq8gYlf10okoKQtxrgKcngeeo9Ka3ORJGbuc/nYpkpBShW3Fpmfaydc2ZY/nx8MRHZiPX2+3b6V2bd8XyikKLE7CbcFQBUgRZSXyxg4DyJiycZw5P/YQ4+FIP8HyXrmkfqWLOZh7O3xUpVgLdNPdq+VYBlyTnk0WkcUOuQzHskX9q2l6xm5ljhRgO5R9USkuhb36jMZChg08BEbUfA6Btyv3d8vbLpk+oQaC+oHb4xAsfapvV5wlcBmlI3B1cTtGpKiZWqttm56VPomtkT1kPnUvxlnOAa5XDi2SVt2S+qkM5GfhIQG2R5cPFjPyet8F/4cQ2h1e+7F4erA+YLXx1rDhYiGET9BiSFETGUbfyF4QABNzsi1cZXCoGWXUb3VumxooUv7CF5F1uB2NXPXECnhJGMmI6+PLreJ+F3PqEdoWwXXqxQDcAS8/tx4pzeGA9TdjDqxlMPvGIDYPcQPdRcwYIcTD0T6p3PGgyF3BMPC9Gey6grqBIKxfsyleMNL7SxhBAqvo8XjNYcGd3uy1NnWnO30uRqJPJNR/ArFUjcpvo6M0nt4bhSjdkBXk2U3GeViYm+luk4cZMxlx/4znaMaZGGEww1EuzXJ/b2hfg6u7bIyTWWb1J9qEt9/TcEqhTdEE=
x-ms-exchange-antispam-messagedata: tUuLNdLZR1kB1pEXTf3sLRg/D12ZBnWVM4vKCEl2BIgN/Zcmxy24fAjtHT4iCsj/PRKynGxK63jum7FGoyH7YfTndy2xFXAcZibAL6nf2qTK5Wddl04XKREPUffE+kLYFCjOK6Dz4CREeQrf8ACL7Q==
x-ms-exchange-transport-forked: True
Content-ID: <43DABA51D898AC4884176DD961B43737@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4908540b-b3cf-490f-2f49-08d7e1c0c81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 04:44:00.1810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhRIVZ+XdimiP3plvLzniKwLrZlBH5HYQeyTEpxdeQH8Qq1zSTGtDQJJBaT61IMoZ2S2brhFQv6SXNRz1BmVyvZLDeJO4uGBptIKIvfjj78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_214411_755790_41310258 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: richard@nod.at, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 15, 2020 8:28:36 PM EEST Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> On 09/03/20 2:10 pm, Sascha Hauer wrote:
> > The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> > Add support for them to the spi-nor driver.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> > 
> > Changes since v1:
> > - Instead of specifying 1024 sectors with a sector size of 512 specify
> > 
> >   512 * 1024 sectos with a sector size of 1. The device has no idea of
> >   sectors and is not erasable, so a sector size of 1 seems to better
> >   reflect reality.
> >  
> >  drivers/mtd/spi-nor/spi-nor.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 4fc632ec18fe..a5c1d684364c 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2335,6 +2335,9 @@ static const struct flash_info spi_nor_ids[] = {
> > 
> >       { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
> > 
> > +     /* Cypress */
> > +     { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
> > SPI_NOR_NO_ERASE) },
> This seems wrong
> 
> As the datasheet for the device says:
> 
> "Device ID
> The CY15B104Q device can be interrogated for its manufacturer, product
> identification, and die revision. The RDID opcode 9Fh allows
> the user to read the manufacturer ID and product ID, both of which are
> read-only bytes. The JEDEC-assigned manufacturer ID places
> the Cypress (Ramtron) identifier in bank 7; therefore, there are six
> bytes of the continuation code 7Fh followed by the single byte C2h.
> There are two bytes of product ID, which includes a family code, a
> density code, a sub code, and the product revision code."
> 
> I am not sure how are you reading 0x4 as the first byte. It should have
> been 6 bytes of 0x7F followed by 0xc2 right?

You're right, I skimmed too quickly through the id.

> 
> Also 0x7F is continuation code and not actual device ID (See JEDEC
> standard JEP106). You will have to extend spi_nor_read_id() function to
> take care of continuation code and read more bytes in order to get the
> actual Manuf/device ID

Right, thanks for the intervention, Vignesh!

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
