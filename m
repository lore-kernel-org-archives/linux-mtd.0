Return-Path: <SRS0=g+G+=7N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8D0C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2020 06:06:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B54120707
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2020 06:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sh3tDDK7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sudfivKA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KWTFOIvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B54120707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JMNtYp6GtSGYzOmhxnbd7vrTErXm/lljnplDOVVn/U=; b=Sh3tDDK7kcIWuy
	F6O8b9aY4DFiapLusyGdFkuB9eeCDBlOdctYrETzLyYzlz0Jfd2nlrkvdFtRtLtTjrzA+XFoyhGmJ
	XJgeRjDfEHAEV0Wxt/x+3EZDnWpnX69mTIK0woB2LQf25XtVg4I7wROSCJsPQXf+8Ag1axqJvvceJ
	zkzU5Dz3mS28+s1Uj/PNdWhkKuaZ5FvtoAhkUDLOPAEbWE0u2tXJUwp7p0atWoyHDtdds3KoShhGj
	g+PCV5saY03P04luEmVoJrLGx2gAfNzzP5ploi246ucEjT3ZxXokAczXm+Ls1egunGRUi/ZJGYJBt
	FhqKMc0orFANk64BlJXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfH6h-0004dj-MD; Sun, 31 May 2020 06:06:03 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfH6f-0004dF-PI
 for linux-mtd@lists.infradead.org; Sun, 31 May 2020 06:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590905162; x=1622441162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6SkZ6oZskHuhtiJ9NDDyJkGUckinDNIs67PiT/F7D4A=;
 b=sudfivKAhEZefY3R7syxVqntChIdGauSa8x/aZfHCw9FMkhdySXCfRBP
 wLpE1gZe1jJNq1Dx7CWRc+Dyz444K+TfFI6S9RMvWwWnBA8VexOHd/gME
 Hte3PS/Dlle1U6d4CTX6jAkfIeCak1bi48mPg6t9z5WY1jRuvTj5xU3Iy
 S22TYCWmtt8yuvvofj+RoTfv9jjgwUqyyEfBwLf/dlk9UDjILDuFcQxjH
 Xm0ZHLuQnqqqXrZmlkNn5FLorw5tlXm6Q1JMhCPQWR0wz0BEWBf3QoMbg
 zx/OSpO2BlTpGK36l3rFghr4HmSr6KXdGu/qSEaFYpVKydfUHzABiYT+D A==;
IronPort-SDR: G9n1QTC1Q3bNYKjJCazCLuwU3mXYvfOVuMcXff+d5KTz9TjT87c4VlP3HMG8YeFgftk4UA666+
 CrQcrhb8BIBi0+5YaQhUWrhErn9L5w4bzMx1CfaZYa7Woqtb36kDC+SKNWYdIADTJExYwMvVwg
 4NGHWTwMn7etW0RKLrTqgmuinFjo9Alu+n25OjsnFMFTORv9hDP61WhvohHbtlDqG80PAik96o
 q+XjrEbO7hws9BlA5ugIBoEM4LEWL2QIDUZTp3/yXAJE1hClgWZbBwzLdmKHns8lYdMGs29pqj
 aW4=
X-IronPort-AV: E=Sophos;i="5.73,455,1583218800"; d="scan'208";a="77655508"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 May 2020 23:05:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 30 May 2020 23:05:56 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 30 May 2020 23:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFYIeg6Aas+sEzo4UAWSq4aqNRS0BBQ1RLeVBaPEdpHI4Xah7Uokp+8o1CNRY3ZCDPORgQxisKo85v6mzJ19hhqrt6JTIcC7q+wdC4EbSMSqcpX3mDD4o+yux0BCP3We85Zzvdxvl07B2kV1un0CNtnoVmX5uPKA8mYGxzrxNVWcQa33OxNVnXNcnX8oZu9c0+l58ZO/ul4DX+WE17ZHYd8RxxTBN590s/v0lvi7IE1Zr3A9a44e2n2r8ZZQUY9m9ST/Yowqyfih3NhANGiyhkwzSwYfn4W/17BkrePv12HzCBfvL3sEV0ITiO3y3ckkeoPkVMUGplF7sIzDnQ3gNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r55K8zd0DhsjFKRhs5BzlXAujBz/z5nKeBYlmhjewrc=;
 b=dGs+3iZnEL1d5jOcjEENsydb9JJ0hfnpvWPcUx2NSuMXo0FvumtVjVkR5QyQSlUd8IeILdLHzcCxySh0tWghvLkmtwd6zpC6zQ9M8sjyYbUJFONBvrn6GBUPEa0uTTVDvupkT0jehp96W0EYAsqkNU/oWW6hRNahnYSRiID1o7nRSRn33DFx/om2DubO2qDDBeaKD2Dwrr1fvYPAPiL7wt2J7CMPNbWBq7iG7MS73g+VKm9yo1zYmNTrkSgCbElApSFpncMyjwiE1KIloNCMbJXSrKRFsEMavc1rWQAWQ5C2zx4nk6tJWkkZQ9Iup8OmwOHZWtYhvxWFpgwAckp+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r55K8zd0DhsjFKRhs5BzlXAujBz/z5nKeBYlmhjewrc=;
 b=KWTFOIvK85tR6nAo3FEh6V9glUyuDBJrbMfSc1BcH9EjBPmlmVad066IXjmxs1tzgtLsaIobJ3FSHesPKPPDaJYVnPIbW6W+8QiNP6NuFI7dyKCJ9nUqKH2c6+TOiVCx7WmWBQJtjNI6sjhLWcJGVScHLeoLmfdS/Fd8xTlRgoA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4257.namprd11.prod.outlook.com (2603:10b6:a03:1ca::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Sun, 31 May
 2020 06:05:55 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Sun, 31 May 2020
 06:05:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: add/use local variable in
 spi_nor_parse_bfpt()
Thread-Topic: [PATCH] mtd: spi-nor: sfdp: add/use local variable in
 spi_nor_parse_bfpt()
Thread-Index: AQHWNxGLFiCsAJKFPkWwOn/xQ1Yiww==
Date: Sun, 31 May 2020 06:05:54 +0000
Message-ID: <2747286.U1ayOil8tb@192.168.0.120>
References: <1fb857ca-a299-30f3-06e7-ce860e44ff3c@cogentembedded.com>
In-Reply-To: <1fb857ca-a299-30f3-06e7-ce860e44ff3c@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cfb97f3-cd0e-4334-9c36-08d80528ae0d
x-ms-traffictypediagnostic: BY5PR11MB4257:
x-microsoft-antispam-prvs: <BY5PR11MB4257BD14C2ADCAA0D98584F1F08D0@BY5PR11MB4257.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+PoboBKjlS5zKSLNwRjrfXKGIUVN75JkU5VmOYp5CLx0qS6V8mgqJntfpL4jSQMI1A6iJAJTDyIMzIjV3bi4Sk34Oa/BPYd++bHSe96uNHA0qMdSn6Udbb4yk6OhTNACs7hdonZQX4R12BkXHcZIKOFbympqrk7tuo8edtKoIchZ4bSA63+Lv4zvqiTUEuOO6M4L3lqX7Ni6gdyy+bb+6rT1GgUZ26aMk2Q0UX2VAgDmlhB8lS+sH/mDhoRFmTAPeKiJjpviurDoBZ7nsr7C6IsrQmK9DV33yLqjohkfHpwh7XIcSMKl0KxhDBMClxWaC3zJQrcorKyPWLetAdMot+VeimTTrtCpu93C7AOuMS/QwM6wFWbSymDvJ87hwX0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(376002)(136003)(39850400004)(366004)(66476007)(64756008)(66556008)(66446008)(76116006)(66946007)(2906002)(6916009)(4326008)(83380400001)(14286002)(4744005)(91956017)(86362001)(5660300002)(6486002)(8676002)(6512007)(9686003)(186003)(316002)(26005)(54906003)(53546011)(6506007)(71200400001)(8936002)(478600001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BYy/s1LVx+aZ9QAjvyzDb8G+1hNdwTbT6cM9Sr2daGSFVT6a0eJmt288ynHjLeT6l+ozTkTWn/+znK2ONdZItFOM2CmMUmRwVlqYwISEfXzrXBL/S+/XyeLX3lCYCu/m8Xa02wKQTHyzchqRBN+pwLhbFEaGvQgrg/7ceTt5J+EvAUnw2HrdMJQobcMax/3yzpytY6x/y1PG+byL+v+6/B+lDBcGJJPzTJvStYByeYkLh0Isk0QpctxX8EghP+lc/+nai38G2rSHtn/5lyQ5L2A5L30+9IjXTSWD5yEEbxxx0PMlMuvWQX2Nc54YiRdYILvgnF18wKIlG1urqMP9RoTBcAuKWQIFWLJA0m1tiaEbJs6YXIaMPhs944B40asYGaAK9XoQJRbGq05Log5KUwrH8MhMNuzZmmiSjIl7qUCogV+PIcrvdnf6q2zh/jKKVuXKVAgcT4pdwzZDQdMTLNG0pUpXNiomlXNIRM/1wIc=
x-ms-exchange-transport-forked: True
Content-ID: <32832EBE9935194DA6F5AF5925C1B7C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfb97f3-cd0e-4334-9c36-08d80528ae0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 06:05:54.8963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXPU3N829Sro2pTeM1joGr5QR4GYppLw/2/eKheNq12FDb8L/hamZCXv2N4oH2bFN4ZyXHggMXJhxu8fiE60x2JIzHN4JExykYFL7T90ZMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_230601_828224_3D6569AB 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 22, 2020 10:00:18 PM EEST Sergei Shtylyov wrote:
> Despite of how spi_nor_parse_bfpt() abuses the structure fields during
> their calculation, gcc manages to make some decent code out of that. 
> Yet adding a local variable to store the BFPT DWORDs during calculations
> still saves 12 bytes of the object code (AArch64 gcc 4.8.5)...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo.
> 
>  drivers/mtd/spi-nor/sfdp.c |   22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Applied, thanks.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
