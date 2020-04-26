Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED313C54FCB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 15:15:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD262070A
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 15:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wcfm+8B8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kZ0xjSpW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DnXi0BJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD262070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CpiIojwdRRGrTqRIJj23znpl22XhLrf9Xp9rPhfPPg=; b=Wcfm+8B8Gr6CpI
	eXgk8AHkUB1sEHoGhUczgxR8yScfB4cZ62eHwCuznd1MZqTqU6PViGDMkU9m1RBgYgDXbHbDZ6Wwd
	BwFW9yCPBYyOSLMuOCe1B7vA5z6/WZqv5xFSOGf9GI0ZlOzI83VgO1CjeKp+X+IYciyaNtaijckuF
	Mmathk+btgbAYu4EoNjxDkVUS4nrFFCmNzLn3KQHgaZAsoiTBkeSlkvVRh7peAoyf3oMFLsnJyxnp
	Z4NeFELe2aLmyx/BdkKdVUH0bVahIsdGqTvHbrdyPFzSXu1LrekIr1ohurmX5rFEkuI40477/WovO
	I4baEncx1OTUGF+av7BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSj0J-0001lZ-EH; Sun, 26 Apr 2020 15:15:35 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSj0G-0001kR-96
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 15:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587914132; x=1619450132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DXJILhrCRXz3W4BRFU8aqfVikaSDX932QZqqKM7V1A0=;
 b=kZ0xjSpW+fj+GtArUs2pjGPRj8wXba0GlU0v1sCwTXPPrEgpPt++Iuy7
 djypui3apBXeiHKohA7ZcYAXa13X1fjQTZDqMYzR8SKyTiMOIP6ZtVsLW
 izz2O3jpLB1zhfrtZzq7OYREjxMC5eMT4I2eHpUwG1oZkizXUryyuWKjo
 b7TXVivpa/U3g+Hlg0EQCAj7rWX6+IPuZUH18nb3RoEx8q44auuKHF0KT
 q0cBuLGS8zJWoKzjAbFCFkWuntDiaQxSrQNefS4kNpq6CD4zVRMdAccog
 NCwDSAVgKJ8kxtE23rHxU+5EVATU4RbwWnegqNsX5NgLsXzjRHDHccsbN w==;
IronPort-SDR: 10/Ptq41MXvNr/R7hSc27OfesP4ne0FqoI5FIUlyfKEFiUp436NGmXrIwz3SqTEbevMm1NHkwn
 iywDeyY+/f2j+2Re6KI8ZfFawNUbQ2fE7tnB2mCS00gwyq3AwCvS4m1W24lP5qvMcvzVi4ni6X
 jMcDnIwGF72hfovfXPfl+YhVmPnH4CEpxPM5KDF7BLYKcb9I+TF1tkonOZqQv41aArEdtMfKyt
 6T4dcLpyusGg5wEjErJSOpob0Rqr08FXqug9qV61q727PB9XFf7PFuWUHsdUYUafPauvy92MBL
 Fg4=
X-IronPort-AV: E=Sophos;i="5.73,320,1583218800"; d="scan'208";a="71556192"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Apr 2020 08:15:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 26 Apr 2020 08:14:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 26 Apr 2020 08:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnOac57ZG8i+F20Vzt+5zfiEBUErGzy18eTOK55Ww6oZnS8GueUq3NvX/kBS49GkaRwEYk2Axcki0o/s/ZS8YkrDbzMQ+eSSwA0JPxUMmNicw9DCW15SwzzDdgsHYp8oIEY6RTlAXytvTw+C/Sy85dTc2voybNB1WgWh3xKXSC900/wUVRuzMVqmeCH0f1yVq7VJ9rUpWY/uf/uykuaLbkj6WCXtNpCUHTz+9kNJUOqY2YSz+cWozuFw3Y9gL0mW9weJryZfcO4wU/FJ5eDZXc5SYE9Pxyw2V8FYhE8ZQSVn3N/t3DZTy5n9G6//5v3WjXfcujU6AdR3KLbYXxuQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsdq+6R+iXAHjyr6dBJIvOmvHg+TG8JFzcrz6kQWX5s=;
 b=GcIrlXBO0bR0HtmLG7JGMHjBAo3//iroQbL0AmReIHA6UY+CgP+EzvIKkCg3lJal5g9M9TMxw8Rdk4DIFXmMh1dd54Cd+VZ/fUvm/UQqcm/n6PonjKFJLR9D6qM6IpBgDlCwudOajXPg7bZMX/riSbzYX0x17+ygQYbZf04OP4qziJ4eS+Toaskwr0MuHica1pRgApCO3VoLf8i/NTx78XsLJxHHIfgBOkXfOd0ehairyEg/YPubrV6n7mjeTZPI2CIBggmS7LFWJC3eJmBY9qBjVw9Vg2sRloYNuuh8FeRZ3cjUqLK/symnsBF/HhVpn1An6oFHgVnYeYL+eVYpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsdq+6R+iXAHjyr6dBJIvOmvHg+TG8JFzcrz6kQWX5s=;
 b=DnXi0BJc4AVod0f78Cim9N7TdI/yL8jxZwEaBd5lcOxgzuwoLJMtejpyjOnLqeYfku4nr9gLDjClxGRd/DlIRuIFmfHXMDzZfYSH5f87exCLpb2cgXUqlXCx3yCxWnNWJHW0Sg4L5nAQH5WTE/oNHIdcqlh/ajqSzJh2vMQTlFM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sun, 26 Apr
 2020 15:15:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 15:15:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Topic: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Index: AQHWG92CIWpaopvk8EurQ9gTxEc0wA==
Date: Sun, 26 Apr 2020 15:15:24 +0000
Message-ID: <2955278.kW1ZWP0GTs@192.168.0.120>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
 <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
In-Reply-To: <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78ff8a7d-1d0b-4077-4c92-08d7e9f4a557
x-ms-traffictypediagnostic: BY5PR11MB4500:
x-microsoft-antispam-prvs: <BY5PR11MB45006D1690700F2FEA377B6CF0AE0@BY5PR11MB4500.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03853D523D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(376002)(366004)(39850400004)(396003)(346002)(136003)(6506007)(53546011)(2906002)(26005)(316002)(71200400001)(54906003)(478600001)(14286002)(8676002)(81156014)(8936002)(6916009)(6486002)(5660300002)(9686003)(4326008)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(186003)(6512007)(7416002)(86362001)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JF+kOBjY8KAB1mENA8JtgS5oLEG5S8Ud97Xumo/qZZva1m+1uagaKrc7CSzliZMdo+ZJ6JOONtKlZ+U+kU0ZRTqq6QBnv7uRJVXGA8JZUKXJUzeaDhqiWjFcAriGaQuSGUuiLziwkIN9lsYNJX687T65ZIhMk7baiPLkFIO01gdyRoHh3QJfI+pMLldn2+uUkJBXxHdtkuTHzqaWPgmq1lmXSDX04hZr3VCrW4N6btWMgTgs8UlFd2eMoWDVEAwNUstxzPpSF6xNp+VxznknICqA+oKFCtShCNQyO8XGOZFWT/4MCNNGq3lOy7dbEdSal5hnW2aQVD8NrIbOGve2yBseRxdxTY9H4lXwm1OWg2bDUpM5HRJYPEWNJ1QUKBhUI/upKcbSianOHtJLozd6FiC4DdJrKmPUQNlYSPokCEDFWTCyCycnm40YewOdSABOvYE8y2gnkl/7s/9Zmj6cRqSxhXsFyMr9t3L3saxG50T2jEibA9pRzaXEEKwt/X7u
x-ms-exchange-antispam-messagedata: MbyUhF7DiD4TCA6dzEt5q5eDUycl9dqr+GsK6+WJpcQe+YgSFb/hSuT8dMR8DE9/FLiVeGHrLxqSmmbw8lgXQwVYo3X+ahU6iC1V4+bkMZ2iZ60JgU7xZohTv5iPN3OcGwvjr1yt1eAlw0VYKCWvV1G0V3IxxN19pxFQiJ6Vx45NPD3WmaVhXUKbRtn6UDtGCfWPLmlCh8hIrxt4ayWpJGzSkvJOsZ/iHMfsvluvy/QtF8JtHFqqZNRMSWoNrKzutWF4YehQou+V/e5M9hTStFlLEsKwMKM/tudlyTuWS7pKP0riAtrvIa8LO68kctStq11UBMPa5OF6h7sc8pflN+eQnjVdvDxt4wZIChWDRSOlfk5uB0WnIEMgQGC+pe5r0j1sKpo/HbQ5yRy8uUM590sV1d9bUx5hBXHBNmxnlHZToaki87DSX/n1mmKcHmFNzbU/y4aqjCG0dHkVHJgnjSIcC4V1rFEqRYyosxqm0a8FW/x3HgUiCI7aAm56T/Hw7Y/SR6NdtBSwYgT0w6uXFN0C8hf1qsTeQv7DiuZpX8i9uWKzaA3cEpolFMzkVdgeehxCkrndL/Qty8blR3uxDNPlTWJC1tDkaHTFS9Y+fL2Z1QVoT5dq3m7uxdHv2MjjXFGz9iF58txcABqHoj3+0Xicc8MvqLZ4g4Q/illnmsNSdbAsKv1RNt6X3xHOYUkzfWzRX9wZb4grDSbdldd7Ljt+h7y+f+69+8BD/OwWm+I/ytTdP65c6dUmPSx8w58FpYlRA6Opf++vGWG2iqT63TznsIL+Yuu2rTIiKSempD0=
x-ms-exchange-transport-forked: True
Content-ID: <2E7938CCF41FD944A9A90FD9BB7E8B78@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ff8a7d-1d0b-4077-4c92-08d7e9f4a557
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2020 15:15:24.9379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kt3Oa02on6VBj/ijDJiCCYydX5GBENR8OE1kmgsMg46Mr2ZBtXkGr4N9vx7j9nprNaMaGkV2XA29ddbcrhmTCqs7QxAJghTODprqkFiADE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_081532_569808_83C6AD31 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: chenxiang66@hisilicon.com, richard@nod.at, bbrezillon@kernel.org,
 stable@vger.kernel.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 alexander.sverdlin@nokia.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, John,

On Monday, March 2, 2020 8:25:48 PM EEST John Garry wrote:
> So do you know how we can tell if the part is s25fl129p1 or S25FS128S?
> Is it based on family id? For the part of my board, it has the same id
> according to "s25fl129p1" entry in the spi-nor driver, yet the SFDP
> signature is not present (signature reads as 0x4d182001 vs expected

 0x4d182001 looks like the flash id, but in reversed order.

> 0x50444653). I printed the family id, and it is 81h, which seems to
> align with S25FS (which should support SFDP). Confused.
> 

We can differentiate between flashes by the family id:  80h for FL-S and 81h 
for FS-S. If I understood correctly your flash id is 0x01, 0x20, 0x18, 0x4d, 
0x01, 0x81. According to the spansion datasheets, this should identify with a 
s25fs128s1 entry. Please check the patch from below, let me know if it's ok.

> What's more, the spi-nor probe is failing for this part since I enabled
> quad spi. So I am interested to know if there is some differences
> between these part families for that.

In which conditions is it failing? Please open a separate thread.

Cheers,
ta

Author: Tudor Ambarus <tudor.ambarus@microchip.com>
Date:   Sun Apr 26 17:59:23 2020 +0300

    mtd: spi-nor: spansion: Add support for s25fs128s1
    
    The old s25fl129p1 flash uses just five bytes for manufacturer and
    device identification, while newer spansion flashes use six bytes.
    s25fs128s1 was incorrectly identified as s25fl129p1. Use INFO6
    to differentiate between them.
    
    Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 88183eba8ac1..ea72f0e5be73 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -22,6 +22,9 @@ static const struct flash_info spansion_parts[] = {
        { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
                              SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
                              USE_CLSR) },
+       { "s25fs128s1", INFO6(0x012018, 0x4d0181,  64 * 1024, 256,
+                             SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+                             USE_CLSR) },
        { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128,
                             SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
                             USE_CLSR) },



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
