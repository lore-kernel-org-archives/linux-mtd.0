Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45545C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D06206B9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYOSDA1+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LMZ9ot+0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="GS1Q43A3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D06206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0scyofuFTGuoqVfSgaF+KTa9K/fpM4Vo3GxkhS6vMA=; b=NYOSDA1+spxjsm
	t29NUNUhkh4CUVUVCeTpayJ5oTwW1ud+p5nKXiPJo/CiC3FcRmMKPZkQ780Sw++PuO6NKm+pIlA0h
	Xv6XGK2i4RKh8t4IRx9ErzIyKeD8zNWCJM6SM2qPcRaSxsBgbBAVpZvSIG962D6sDhIzh8X5QxGgT
	VVwEn+QpvPBo0qy67voG5u4nefq9sqtd1wJAk8kwDmS5Wg8AjPv6LiUqUJaPRUoTrJB5Lz672UX+B
	athk9ojHaDvUmptn1gWxB7xMA77vx0utPHYHu8dQ5RLLgbmxt1QV7AmCXeY9yvLAVYlEZUAX6bYe/
	jsrI+hT7q42zWtqS4fmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTKlP-0005eJ-8N; Tue, 28 Apr 2020 07:34:43 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTKlL-0005aQ-Tv
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 07:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588059279; x=1619595279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k4eeKqPFQR12T5FGgKy3paC/BNsVGAQMljRykPoL1u0=;
 b=LMZ9ot+0zDj6qPEqJp6cyTBZMy1F/SdL+XiYIESMfhUGKqzY2FyCivKI
 Vv4drBEQcl1nq0HlPVatjNMhgd4hASKUQjsswJA/ZucZ5+QF0Jhd/V2cO
 3i87ALf48+C0AErVvz7PpsbAR6hipd3ZhYptSQstqomBqGy2WvfeK3dZK
 Q2cK44mJzdGlcLOP0Hw0M9a6xOt5R4jITyP1irp7YxgXRRT1OEjBqEuwk
 9kO4O7ZPX5rOjVmDxvdlV7eoJFBFdztZLuNI9BoMHv2KEij5WwmS+4wfZ
 GcAifgmUJx21EOnw3zjqJfLJxktidFnlKp7EmFWSv1EH+Vt7NndWsECzV w==;
IronPort-SDR: TG/7TmTUJwc/63IjD4cRNRgzdt9M7tsHzOmGPm9J8JZKwwFuAS2xyHn4kjdtXgNWk09aXmVy+4
 FBJ768cGrBSwPwlYTaE8N/vRx0M46iQ9fxBGp6rpEDzSS5S0LoGK1wsPgmA3/AP77/jYn2cUPI
 fOh2YeSQnRxkV1exaKAfAKpnPhi49pg4/iqrNpDFxtPWadIHPovJiWZXv/K7mbONsasqfIpzeK
 A9t/ufeHKNAUOarx7JhnYf4efaQCT7a1NwJFnd3CNB908qF4I+QCAPBlHu/DjvDZjoF7nTIFYD
 cZM=
X-IronPort-AV: E=Sophos;i="5.73,327,1583218800"; d="scan'208";a="77527448"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 00:34:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 00:34:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 00:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNzyGYnHXCcarhK//sv67W2aGcnlsTi+R1excO8GttrdSylVon5OmKkcOB9QkQBshrmrR1LoohwtUpv9AYiGuiXJ/E9CxEz1TK+Now25uhVfClBvq2+RJVHHq4dySaSzo0Mder5Fbuimtu3MR5rYX6qh2+YNowBFP3GjqgLHaA45/cfcIOdoGJAWdbDbuW5FwAtAPIzniju01rfoyR4XuOh0Mg8BvRZbQOe6bOZM/ovimM+FlJBBC24wqYaSPaajB4B3zSWqINuMqiXSFcFOgyWd6CqhanXmq7efx4XeUjU+jlGrIYQ8tqWzthmRgT/YdUoHI7IxR8YolQhvkB6beQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4eeKqPFQR12T5FGgKy3paC/BNsVGAQMljRykPoL1u0=;
 b=P6d1wgy+1GBv1RXYlroMHGriEry3BbRthxNTnb7A+P8HaPnQ7KX+iu9fbLk6LXlsjzW+78aXXbmD7RgHbXFETylvsjcRjpH3Ss0oBEZck/U9d+7do1XH3XD1h+9CA2NKIyuFlfBQVg2XSkZYRpS9wAHC5e27DzJu6mWq1XOH7F5Xzr1RCX+MI5ur6mBHltRUOlPr22re48hgUG78arsJ1EZfuOyD5clpb0QTUOs2GN4nnv6pIqjTzWbZtO1m7uljiBpvNqJws0WE8CR+IICzC5SrAJPG3mJNKwYEOGDksVTwdKNCFQ5x7Kwn4unq0mHNm6zKSQhaOKy2h3BjFnXoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4eeKqPFQR12T5FGgKy3paC/BNsVGAQMljRykPoL1u0=;
 b=GS1Q43A3+cFVXCpUEmqjxdXnmsHy6Rn3GcRbDbchx0NLSolhlwsGlmA1/DRb+aLMpSfxSDgb0NyKdIXjEvzO7lZhYLyCJjTeulFRGG6tCO76Kuxu5N7RBAw6Zq5I7ZB/MyGozyaUb37bX6xpUa7aquFQcF2pKmyrcUaIzc6lHoA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4465.namprd11.prod.outlook.com (2603:10b6:a03:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 07:34:34 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 07:34:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00/n25q00a
Thread-Topic: [PATCH] mtd: spi-nor: Enable locking for n25q00/n25q00a
Thread-Index: AQHWHS92PmKHUd9KLEOhDzr8cmoAZA==
Date: Tue, 28 Apr 2020 07:34:34 +0000
Message-ID: <8977895.SZaA0p1QKD@192.168.0.120>
References: <CGME20200421063317epcas1p388256ada10113b38b92dca757cd11e41@epcas1p3.samsung.com>
 <20200421063313.32655-1-js07.lee@samsung.com>
In-Reply-To: <20200421063313.32655-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8998663-5c59-4f6a-39d7-08d7eb46993c
x-ms-traffictypediagnostic: BY5PR11MB4465:
x-microsoft-antispam-prvs: <BY5PR11MB4465DD802D456C2E8D89C893F0AC0@BY5PR11MB4465.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(4326008)(53546011)(54906003)(71200400001)(2906002)(6506007)(6486002)(26005)(86362001)(498600001)(4744005)(6916009)(9686003)(5660300002)(6512007)(186003)(66446008)(66556008)(66946007)(76116006)(66476007)(64756008)(81156014)(14286002)(8676002)(8936002)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdqKmSCA1J058HKemYg4K7L2rkkLNid821iG/gtiUMS9gVuf1uxNQ/JUfihJc5qGFKc+qvT+wBjaYTzzbHL0D3y+9cyJfrh0Jf8AO08QcwPo5oDFncjiLuo/foletF5Dnr9EZvNaQ2whX4gwbPFS0ytkeyMlP9gAC6HX43ZwVKdr1+TwCzmhbmXL0CCQFLwac6KdV3jyN5uNKJNt9DXNJkHbfbHAAPqmM2Vj2pLoy5G3uI5nEm8tg/qdA7FLDvATaj1VOG2p9+H9t3LznQpAdxmhg8rFEyD6Lue3roHsS3qI+i4vCs39SRia1p60Dsi02862DSL79r4RjtjJD5NvZUAiLjdw4xJggiU6ElVVZwy9UgZSz3TFXaQyQ0xoltRL0tI6CoUVvJlsQZmSD0q4QLF1Sin9EIyC6P2kIkkJaYuZ5G6Qp/ZkzW2wJn3TZlThpUDpelL149lK5J9Xkevif0WO2mnFXgLtiRlk3IeMLsm6LVBlbiWS4QPkYErDT7xr
x-ms-exchange-antispam-messagedata: +Np4Pbc9gHodIRMv5qmUZ3qNBtMdMXR/UMd60CcGVVqGWuXFPgoqaSqu2Q9YbrjYPMLa3wL2OEiDa/uvWZ3NhLI3F+CP3GmESMZuwZ2r65PJsL9e/r8lVTK/D2uIAThzIf18x8zQc7Mu9Vj7lO1ekbC+qLGmgciYhd28AY+rl77oj/jBv2ZNaJ//+FV2i5w1+AzGiNlI+ae8afG7DvnozFVG3xbR4Ok8r+WhLcy2DngHF5zaoRtqfu+kQNOBElmNcYRycxYLmSEqy3GaDg6q5GLvgDRgrkjenNnrxW4E3p33lJ52e2xSrmAa7Z+OH7cc2txl4UeolFwT2BiAKkrSAlOUhThCCuxImiY3Lb/p9MSrZ3/gX7mwyPy922kFCfY6/6cjqHiHkwe7SOea5Yx1uIsYJ1r/Zy0IiLlzHg9eMlHZS1Wo8Xotm9mPRwoVdx5NTy1H8SvMFLEEqxuq8QdRY7s0KrgyZRvWx5t+kSsExE7r4dFm9P+3ehsmuO8g3PFZMq2WflVno7vnkcdqcpN+TlM86VkRu0JPVz5z6HRd3OGljKLkj5OBJ9ht2lbdrnanQs5RdktHhdchQbM/9Uwe1RyhVFcygX4y5IqB03TJjid5TqagjzWRk4gtwj+mnALv2sI7Cfmg141zC1KmhzeOn60Lj4akQohzATHD7yjWQOpyAMjM6fMVReBr4Km03KIBzRZuYwXF4LxCZpIiWkKzNI7k6D3tLE8wfKEa/ZmRG/ysBu8utmptQhueCuSOFojvLmlGOEg7E5aZq2KXqNIHkiEGKcKqI/HF6/fuc1fPLJU=
x-ms-exchange-transport-forked: True
Content-ID: <F029BD5DEF92D94C9991F372B3D41AAE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8998663-5c59-4f6a-39d7-08d7eb46993c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 07:34:34.5794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEDq+fE2od45aNmYM7MgZYbGLnaayaWqhKsodlIfjnPQcW14eJboseGxlhAwTkqXBscAa3U/tNrNTqhPXbx8ys/y83IY6enaNMZcXNLMqmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_003440_074976_D7946891 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jungseung,

On Tuesday, April 21, 2020 9:33:13 AM EEST Jungseung Lee wrote:
> Tested on n25q00 with cirrus controller. The other is modified
> according to the datasheet.

What is the difference between n25q00 and n25q00a? I'm reluctant to add flags 
to flashes solely by datasheet info, without testing. I saw too many faults in 
the past.

Let me know if you're ok with applying just the changes for n25q00, they look 
fine.

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
