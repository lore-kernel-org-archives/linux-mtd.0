Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D86C38A2C
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050D92078B
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 15:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uPoeUb7R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Xi+N5fWX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DkyNYmkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050D92078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbbX8g5rf3LaNBCFV+LO5vME2cYDdv3EL7aG2dY4TTg=; b=uPoeUb7Rn2/iXV
	lmHsbA/44SeTY5+dQG5xXsyT4oGVXf2eBfwInoTLDT251WsWHoLwIl22qjyw5jBiStfoHe9spkeqJ
	lWSECf+AkCUMe+5mAvj83XZbNJ5dFSaATP9n1+Z0TUWYYEUj2VCmzzWfWBePX2bQsHVBPz2exuJ0A
	rN4R2ej5UZ5v8Zwml4ATf1VbBwzwbJQPD/RLQ7Bh+qTiwhdzotRCzqUHNiMbc1Rg4qw5M5mAoXIhO
	SCnUpzbh3frGpyFVBUYsfgVy8+aUm5KlwYE99FY2V1wYhAuYlzB0Gwq9WVdlVQu+Xe4jCyefBSk4C
	cfXAnT7TTy7mljNxqt5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOju8-0003un-0e; Wed, 15 Apr 2020 15:24:44 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOju5-0003uE-NP
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 15:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1586964281; x=1618500281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4uhdAjDrXKZuJ/DlS3I/IbZopReSsUTQe0s0/dwBLc0=;
 b=Xi+N5fWX1brxuc0jszpCvCht71QH7WQDI1cCxlO/fKC1KcXIA1N12YVg
 7wZB0L1Ek8qZG56j1fXAw4fIOC/qyfYCxxcMz4StHlCWUZsT4Fn/9226g
 ct3CnymEvYtXdVtAtkKmlQDrNsLZ2k/CKvL1BYY4iYeLZHZWH7fAw3Zou
 hvSTg/lwYoTrgmmPu78qrXQrLgkNb7n6Z1LJUP7crSDq08LS/L4HwjOvn
 Mo02RS2MRtDPYXpk7ODTn8VR3kRdCmyrkt6XROJa3pNUFRQnbSFsyqz6+
 XrT2HzeiHiBZpuCZKFh0orRDH51L2NhtTAtf1j0jKx+2edAJSerMvL6K6 Q==;
IronPort-SDR: 4LVkiDoHJ7JwcjSCW7ZtPeeQZg/I7R/xXN95BG1raDC9IKXbctnToBeo7FRyedUS8yu9xss99W
 jCUDzWKkcF9ZnLy1RGDUf3gDA/ea2J1ZXOFefsTtmd+kxqmQZfhqyKrV3iuECV1XRqAXud1Zru
 6agdcNKLBm47+l+lqOs0PeBbylWUmL4/v9x7229sjLUDcOPZDO8N3g1IPSo0htbqXkQyuwAF5S
 huRO0rFzokCmXP3AeN2cjGMgALdsAnRGQuKPqkDt84wdowIaa+9y1WWwwnd3qa3zrrCqzFr6w+
 nMA=
X-IronPort-AV: E=Sophos;i="5.72,387,1580799600"; d="scan'208";a="73432606"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2020 08:24:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 15 Apr 2020 08:24:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 15 Apr 2020 08:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgltjUEbZk8Jh69dsX+xftW0sN5Zauuk508MIOv5veMfe/KefaYlc/pdx156GgFfB5SfFSt0t1R9rkTYjTRdXctPf1Awv/aNxBgzr3I4XUdZSR0u8SlrzsAjmwz63eBSzbKRGzBsJnuaqMnfrm2ZUvl72XD467QDq2rC058lnJUkUUoR9ClqqGoxFDB6R56pNbkuwIF5WQjZ8D8Skr4mXIggkys52eTPoOjds9y20AzY3psus3TkhVvIuoed/ACmNgn3pvO3h+rcDVnoVEUVSWdx3YYYAz5tyk6C8GMLG4zOwFU6YyqkaOgx4C7747VOYkQUqfWfjaiKSCwat+xhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/erSMBZiYHR0svVkKlWuSb8yUTluNfmw+OeWBlgNuU=;
 b=Rx1hSxbrRpB0lQQAz3ASBUaJ2ZlbX5+V7y/RoOgTmGnuCwHe4sPvaqtToYgyD940p5S/9UqUz5sEcaXTxKtA7eYb0448raxD2Q6ekYQAfjNwMfKtTRoqAjkS/gH5+OWpYi0Qaod6+VJ1H7WKT+P6Xa4Rp3RukyaJkY/KOUGO1x8TeYi7LV2/oNxmTyBQ6WghlMXWCqIJazWsxZhOVB8bTJOcI9NWIF9q31B1gHn5zCmGfRQv7LrRnEXMg7tCLSZNtncN0DrQeBpqVN+wO9y9ZwkbqxNSaP8OaGRvP8oLL4ZUSAtdyXb562Yi16yKmNUryHdAiEyb1TaqYgngItucFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/erSMBZiYHR0svVkKlWuSb8yUTluNfmw+OeWBlgNuU=;
 b=DkyNYmkGdYM/zwKGgRpmCsjsxaHx9gG/uHeR560auHHTjK9GAVecbyxwAFcCqP1UjZyqwcvGb+pHvt0NVjxwB+VwuKk+Gm4oPcYdcK7o4+7/2Mym9/Gw9wNfbceFzdlmGftnPfdLP4j4+FU7Q5uI3qGo0QS8/DoCxAS+b2S9WT8=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4102.namprd11.prod.outlook.com (2603:10b6:a03:181::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20; Wed, 15 Apr
 2020 15:24:34 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 15:24:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
Thread-Index: AQHWEzn24hgYqXhoI02IBeWilZMz6Q==
Date: Wed, 15 Apr 2020 15:24:33 +0000
Message-ID: <5556114.QzrDNrOLmZ@192.168.0.120>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
In-Reply-To: <20200309084033.8752-1-s.hauer@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b47500e0-3ad0-4494-d43d-08d7e15119f6
x-ms-traffictypediagnostic: BY5PR11MB4102:
x-microsoft-antispam-prvs: <BY5PR11MB4102EBF48599ECA56F436700F0DB0@BY5PR11MB4102.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39860400002)(186003)(54906003)(64756008)(71200400001)(66946007)(14286002)(66476007)(76116006)(86362001)(2906002)(91956017)(4326008)(6512007)(316002)(6486002)(9686003)(26005)(66446008)(966005)(8676002)(81156014)(8936002)(66556008)(6506007)(5660300002)(6916009)(53546011)(478600001)(138113003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aQBHfsHKORRetYgLVBqNitNDii6IFrwkMfU0AslVLqnr4B+ufGrY4Sg+EGzDWfmsmsb4CLHAi4Wz4X4qPAaxfsc1iYphpH615fI7A8kumgcyr5fabvjOp1nipeONVHI9367zN8WhXinAFi5yiALZQr7DK5nf/N+5vk6gjjp/dM4d9VvRk/ec3bY+kMTt344G3aYzbIMOxmpCmxHTklpJHMYm8ei4RJfR9tJCK32deh3VBQAv5+svO5g8zCUY5xCu9z7GkD1Jhl8YzxHKkYEyVuDcd0fGxEDNLa+IWb4yeGMvpkntJsAyVsS7J7+vkrz9BI6sHt4Iodu9bOge3njxtZC3v40bXqECCzQGY+9ByVOdxVa8ZyxbTHzAshYAX8ACVxgy+uAlrWW6ewyPSouebpkeBQDnjXxvJKruohew7sK1C4UqgBMyYc5BaeCQTjr/8+JsNFW64n7tVI/kaS0sL29CE7SFo5twpqDTCBghKbtH5/diuYNfg99uGebXYcF0Fkctvc8H891XXiblMpHIRezVSUbf1b6dsij53aPa75hYcXlzMf0sE8ZFvvqTEK17mVLVe2pDDIWYeCNsXFwWkA==
x-ms-exchange-antispam-messagedata: +g5PNSQ11/GNLozrYkxZHuQfSCcUERSh2udyhMDhBrBwhAdBRVzh14zjw0xMWL91p2vmANx0FkwyH/uWwB82q29awtdiLekbOCsvPVdMbg3I/iBetDTePD4L8DFp3Kaw8GrhnE7A0mncDpNmBDETpA==
x-ms-exchange-transport-forked: True
Content-ID: <2508912531BACF42A6C9DE9C6104D842@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b47500e0-3ad0-4494-d43d-08d7e15119f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 15:24:33.9712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHROeVHiNPCkkxQ6Os7pRXw4Dp6gYDClyJjrwZhRnfJjX9STTYwrYCrmuq9AwxBGPbTJ8Lfer6iS6+UIMCd9sM6BCIyarxPPGVCUnvgUMWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_082441_773670_821188EC 
X-CRM114-Status: GOOD (  14.83  )
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

On Monday, March 9, 2020 10:40:33 AM EEST Sascha Hauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> Add support for them to the spi-nor driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Changes since v1:
> - Instead of specifying 1024 sectors with a sector size of 512 specify
>   512 * 1024 sectos with a sector size of 1. The device has no idea of
>   sectors and is not erasable, so a sector size of 1 seems to better
>   reflect reality.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4fc632ec18fe..a5c1d684364c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2335,6 +2335,9 @@ static const struct flash_info spi_nor_ids[] = {
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
> 
> +       /* Cypress */
> +       { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
> SPI_NOR_NO_ERASE) }, +

Shouldn't the id start with 0x03 instead of 0x04? Check [1]. Otherwise looks 
good. Also, would you please specify in the commit message on which platform 
did you test the flash, or with which controller? We usually don't add new 
flash_info entries solely by datasheet info, we've seen some nasty bugs and we 
try to avoid adding flashes that are broken since day one.

Cheers,
ta

[1] https://www.google.com/url?
sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwikvb6A2-
roAhUKjqQKHQRzAhEQFjAAegQIAhAB&url=https%3A%2F%2Fmedia.digikey.com%2Fpdf%2FData%2520Sheets%2FCypress%2520PDFs%2FCY15B104Q_CY15V104Q_RevB_2-3-20.pdf&usg=AOvVaw0BmuUvI2j3NR07ZN_Jd4bN 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
