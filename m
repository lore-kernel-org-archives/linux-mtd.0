Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BE6C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149902088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BwBw75+t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="R9ZC35KU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="eRrN+erc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 149902088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwJ/gXDnwqgjxqcbuHI/xdO1k3cy9A0vqll8ZERcy6w=; b=BwBw75+tdXo8hi
	TPrDMMXJ64mFJ6DWSInka+7NwYhoWR62ScTW2Psnndf66nZC61dstDezHMzPthTDz/Kzvv8FpiPL7
	bC+Ew98hqFekA2vKAbGG38ZDkL6pAtcCIX0b4h+3BPY6e0izQj0H8REl+5HaPHDSqtsCFmSG6WdRQ
	u5Klu9tQ7UsfHJxEA+/j/OtoBvtKpvMPjewCeRs1zDGNLNpOjmLzkMyyODZBoMTCyeLNs6mTHjDmq
	6v0ZTBgnQbaFx6CXZdBkxGw5RNopgbrS0C5vjaGW1sb9txE4uHA9MlAujeIANIPJ4Oo6MjXLnJduz
	KxOnvo3df6gyBwGVqr7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDee-0006Vv-CU; Thu, 28 May 2020 08:12:44 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDeD-00068X-WE
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590653537; x=1622189537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jH11CgHkfGjKAn5JCGlXZtld1ddDHv1/R4/msHHJWL4=;
 b=R9ZC35KUof1Wi/VQaSaw//F/Ijt2JvTx3I5e+ic4NB2u3htjbME14zcC
 ROeNoXrLvfGwHJ5hWxcUHLunga27cqeeBF+XVKWb0y0Cn2C2VZTJtPtZA
 NenPXSr9UB5L4ct0Jy5pAkRTGGGqiAOov2Zc0LZez7Qr7/euPtC7tw9pC
 ryyIpLKAGGulFZ0V8AsiFeMB9hSfPv7tgNlEVDOmP3gV7NdRk/5GKolCs
 3x1W0dyT9nb4evSRTC4tV5YVF/jp4gLBoulByGYRmawLUhiZTAiXI0d5V
 VtPSnmjsFE/RhvOo53cJ14OdwU8ZZAjMv4HqJgZ7IthaGjzfr71cPhkCQ g==;
IronPort-SDR: V682bN6PUWSjluajpY2hreno1hpAm74L60JRzdLlTnHac3HUtxmXmoHTvqnFsPjX+wIbGCT5kA
 AarjNrLqN1dGSu9sXbJLMACGkRP+hTyjOHU7VS2YDSI7Z+2Zmlkppm6KsRMto5EDA8eDPN6SNm
 It9Hf+7wBfvG9ANcoH5obCVy2dbRtCtn7G7zTdnTkrjEnIxFqogPWvEhI5sA6cQmrlZTuHx1AY
 iv4+mmCfxhkq/k5rdADw4OleNfnV2LOu8M9YOpGf2xKqhL3qqBazon/FWDBl0YbR7NQM81m/Z7
 H6U=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="78097976"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 01:12:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:12:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 28 May 2020 01:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dITjkHD43wtTqBCap1+DtrfIjjK0T6nqzR7lluxWFaIX/EVeaXUONVXQ0SDS93A9t/25DZUIQGNziFzMLV3HxBz+j5DWZUnl6cxHHl1B2EBNkDS7rirw07YNNRfQU7WKMJbMXQQbT/AhoNPPliszJPzf6Ai8STM51amYh3dcRO97xuU6YtofVFc1oz7JwWZNtrJVcbYgPW+UaZN3F1uriVNjojmCfAugh+CLhIeYAIJgxZa82p3W7Z3A6icwj1GrgfeX9FSR6ms1juUixXnyz2U0JFTdI+sO3YXNGZmnq0nLBm0bw7AA3YeSX/SsmMe1GLMOyLeUVM9w1xfyYn1TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH11CgHkfGjKAn5JCGlXZtld1ddDHv1/R4/msHHJWL4=;
 b=gROQOWkFcNUncF5gnSeJ9+fOZaftGCy6yNZ2fAFY1fq1/4gqQM4sr3kgZnb/uv3BZr0jVnpOVyH8sMHe6B9BB2r2ewkHSJS4vFkgoyZOMqUes+wVLViV0R2KMug8pcDn4xW2/I5N1rkL4H+16LykqcbFMiLLcdoVM+Xm182lDCiBiXb2QV4ISNZ6oRHRuwHjGOqHLHY6xfPzyRlYEB1keaaQHdRBXqtJ2TwWyGK1uaz+nu+zFdBf9qQmU2B60KGZNoEBqyoMetKh8DnuPsK5Zw93+76Xc96BvySQCLeJfY0uG0XCZxx5aH56LbbDuRgv0n0chIoPVC65dHG+sQ+++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH11CgHkfGjKAn5JCGlXZtld1ddDHv1/R4/msHHJWL4=;
 b=eRrN+ercV4D7s+54qO0SHPn0Wo1X2W8zW09oKFUXRmVBmQnkp8u6xIOfA9gOVAYGtp0lEX8cYq9kse/j/OVkqkPdo7nwrtLE0bUsiqD5P1uUNa4HonaNvKgxjpKCDtXGoiXXpw5phkEzL57Hv+kjaD0fFbgJRDuzPgGmO0h/P1k=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 08:12:14 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 08:12:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for Cypress cy15x104q
Thread-Topic: [PATCH v3] mtd: spi-nor: Add support for Cypress cy15x104q
Thread-Index: AQHWNMexPMZRFk2w6EixorchYsB1Ag==
Date: Thu, 28 May 2020 08:12:14 +0000
Message-ID: <13199742.Uhtxi0mpr9@192.168.0.120>
References: <20200424065626.8196-1-s.hauer@pengutronix.de>
In-Reply-To: <20200424065626.8196-1-s.hauer@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac31cc16-75d8-4957-e903-08d802ded481
x-ms-traffictypediagnostic: BY5PR11MB4134:
x-microsoft-antispam-prvs: <BY5PR11MB4134DAEC6FDE6894A086D1A6F08E0@BY5PR11MB4134.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8yFACVXHqnyfIFnJqfn2KoMKBqWWd1b5dy+2TCVSFmDQglKagWe3scyfI5dw9BpRjU1Fxsyh0WAyqeNmxJQTeO4wyg7MjIMs40+oCik1IQiJ9GjszY3oHcg2z94IOlBvFy/IuQRItLOl6tGYz5tiJtoxKAf4EeOL0HbKhekDnefqMtXD08M7raG5TUp4verFzUG/sSLOLWHJpTAT13zNUwAK7GJspWSKxbVH4D8KUTVQ/tlB7gqr622hP7VbSMT/AtFrHB3MmodljYaJFsbXZeDlbuZ9F/DXNxIB5npoUoS4VbAnjdz+I5WdmOTkQKYDmpjaLf6M88h/NLj2IHy2jWcZB7/sF+RB+JoRG/QirASNnIdnodZCjaIEoxYpoVIb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39860400002)(136003)(376002)(366004)(6916009)(26005)(53546011)(54906003)(316002)(6506007)(5660300002)(86362001)(71200400001)(2906002)(66476007)(66946007)(66556008)(64756008)(66446008)(14286002)(8676002)(6512007)(9686003)(186003)(91956017)(76116006)(6486002)(83380400001)(8936002)(4326008)(478600001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DNtW1OqVaTp1j7TraMRsXhYqt+bo96VnReLJiqZ48c5s+lcT6BSGfAjLHRk3NMzYmAeleGm6RwVjtpb7UF5U7B11n48u6lFcq3Qg7xufeUzQvlEioD5gXwf1l34oXdCfbGKsjRY8EyJEGMDtAdvhehZcKzylW6ZFd01ces+NMNu9XeC6Sn8hXmgJ6Xd8qIkQIQeKNuwPmS+98UUXHv9/50Sd5Z8v7ZwWxt37WfaE50xVt5+NhZpuzS1JX6i9dR3e+5ECDgy33RRh2X3L9STiUBtk19Alb1C9LGg6esQAaMTmeakw5pyXChjeKvqjA5x6t2lCRiv6ntklPKRluu9temY2vwJCE02KaNIk7qVEkqpNfQKClKy23sHR/r+QGnQ5nymtXLsULNb8waeDu0q1wmiI3Opmhmig/vyodNqoUq3fuE8y2GAfZwSOY13j7NV0ICI/sv6aSlM5QDkKmeXpR8rRBiY+ahJUWTDFJ7ikeeM=
x-ms-exchange-transport-forked: True
Content-ID: <CD78708E368AFA46BFD9B7E16075C15F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac31cc16-75d8-4957-e903-08d802ded481
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:12:14.2644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgdluLrUjWfXWz98sjF5n+3GYnH7+5suJ3UgyfM31S+4rXaVIMAIFlpiSdwTKGpvMJuuo6qh6i0Pq8Tn0PkCtxu1acYMR6zNVSMSJaxQRWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011218_059341_BBC950C6 
X-CRM114-Status: GOOD (  10.45  )
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
 kernel@pengutronix.de, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, April 24, 2020 9:56:26 AM EEST Sascha Hauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> Add support for them to the spi-nor driver.
> 
> The actual Device ID of this chip is 7f 7f 7f 7f 7f 7f c2 2c 04. That is
> six times the continuation code 7f followed by c2 for Ramtron.
> Unfortunately the chip sends the Device ID in reversed order, so the
> continuation code is not at the beginning, but instead at the end. Even
> more unfortunate is that when reading further the chip sends more 7f
> codes which means we are not even able to count the continuation codes.
> We can only hope that this reversed Device ID will never match any other
> devices ID.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Collisions are improbable as of now, the solution from above is good
enough. In case of future collisions one can introduce an INFO9 macro,
with the downsize that struct flash_info would grow and we have lots of
flashes. A more elegant solution would be to introduce dedicated
flash ID tables for each bank in JESP106BA.

Amended commit description with the above text and applied. Thanks.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
