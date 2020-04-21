Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8890EC2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F952087E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 09:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoRftzXO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="13xLrboM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="t+fcmAyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F952087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3E8ve8xQZRMZCFC1INkkFE1yphMXBh8eltt89U2gzDY=; b=FoRftzXOVSqplY
	kSfYGTioafOWkofb8K1fvdtEWar4b67vUp+XBamQ48i01/uZ60xt6BB7ANqgzdCwFykw6NZs8pB41
	/sKpG5FrowbhHjUH6I9AAiUUWuXOnWxMitRXgyrzUD9gEz0p0y4CHVbwtlkmUqT5CbnH4PX9aoJLo
	PQmvLAFycI0ywIy7dVt7C9zIamQDtw/d4LxwvWs5l1CwtuI7dBiYbL6FAlAD7Vl9zl7gJiP/8YFGw
	IOn73AcqIRvKN3kVwGYnswvu//GCd6R5NAy0lOXEXvhqZAzZ/Hbhzj1qlOi0LaCb9sZqofcvkMt79
	GdXQrkWA26A1PQywsIgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQpfU-0000hx-RK; Tue, 21 Apr 2020 09:58:16 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQpfQ-0000ZH-G6
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 09:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587463092; x=1618999092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jZ2OIeVinnGS4a1ADx6XTqaXgnsztOnA72p6Jm5YBlw=;
 b=13xLrboM19r9qpSIDKpgEbVepoTncpur5OGixITzQX5j97ZCnRNPJWpj
 oZTe9Cd8ulvjjNMO2XvcPul4VEV6ViWsWPTrpK64J52m6wjsJvcxRnYIk
 16+4EMcM1TrpIQsQw/F6dp8KHcAk4CF27ngh4xTwUDlwJnMewx2VATKon
 B4sbpUWCU1NodsSvL0ZRs/P6AxwUWNoGR/nLaxQK3Db6JSHkiHmYvB2OG
 P0aEGFPPVGqxu0mn3CGJj91nqf2sj/Gkfc+GT/H2S5Rdct2/BKLSp3199
 lqhU+CF7eRyW7Kts/wxncJYG747+CVinxNPXpJDhBG0tb2wSSl190Z6Su g==;
IronPort-SDR: rcHkIKd9c6u11Tc5gS8Mt3tX3oUe0nOyRBVR0k7rNBMZR9ihcRS2LmJfwCuUKpTrwqP4oMTwvm
 ba+XRj2oZL/peEgIDbYJs4xkM28IoQIclBJYkklIvYD32Hl1OZcI0T0k7fDPcf297tKDeBVjma
 1GgyhQTcVSzWaT+DQeS5Lwh4GEHTtE8cTFZBRYzmIWJmKd+QBpLk0NBtGApMbDoct8YOTaRGpL
 DZTtKZYX/F040RlTiIYgw/bAFAYjpjYdNhpIitMxxaOhEMTIOKWzCU6T/ZNFEok74mqotB0aL+
 FiY=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; d="scan'208";a="71011495"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2020 02:58:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 21 Apr 2020 02:58:03 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 21 Apr 2020 02:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEu8RTOBdePUQalCJeFMTiL0yR2YfzJibU5FMbpBF0OE7P2MO3MCijp4UUTl4nSDynO+S6XOnEkE/yY+yUgdHH0u9B5bwXPGX12Fq7YyCwzrol5bWhGzBQ9X4B7mfspwKbxsN7M4aHLtUMYmr6Ij5F++R3pYcpMcU5eOfSVwFJEfc4ztzzEE6rK0rk//qGszlQhkLKrqcdaBGTEU9kt9yFObCHGdu9aIuXRvTKB0SVMzcg55U6Mj7IDhBsjOk9RYz13nEywklZtRxUZ0kjd/x7BUt/TyilEo6i0kA7hEFpzJS5ICrVHkel2Rsh9e7D4HvvELVREgRp0vCgOiJIhKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ2OIeVinnGS4a1ADx6XTqaXgnsztOnA72p6Jm5YBlw=;
 b=HZhBzLUnkajhUdrPQIoaTB8tsUrouiTz76trSDj9vfNOMFUD/B9pya/CPVH6E0Oe4y+b3KzGNQafDZkQ912qZXFHxQOQT6D2+i9RFHQfbf43HZpzm5wi313pAaRKAeCItCbzJ4L7VGQiYvl7lvVG5tymRen/86N8bCQkYyMQbEbsLtIP+7/paBrmpBu+kS0uiLHyO/vM0UzzKUX3jZLitRUFo+oVAZoS6MZWsuSvfqYgH2jKYqhl/7/HLYNSHFK/JjYSvEsoIuRoauJxRjJPXnrOD+dwmNzKNpmlGciiKPjVjhFuZlIhr//7unA60UHL7QYnG57WzpK4rSndQeHWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ2OIeVinnGS4a1ADx6XTqaXgnsztOnA72p6Jm5YBlw=;
 b=t+fcmAyT+yDvwfjlPSn/pi5++wW+TtYH1Wg/psnA25/q4DLejbOFq2DibncjLyffsZtc9o1323K8vENT77Sj3hOUfE0AGQ8rilbLqZwxR4OfIpYbt0caeQM/bU+n/ThOMsaFNQP/ldNInDF9zcjpkQSjYcYJc3hOnoDSkqV9Hxc=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3973.namprd11.prod.outlook.com (2603:10b6:a03:185::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 09:58:01 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 09:58:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Thread-Topic: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Thread-Index: AQHWF7Im0s9aEwk5J0uVFa7stfIhR6iDV0kA
Date: Tue, 21 Apr 2020 09:58:01 +0000
Message-ID: <5032403.BAliFFt8qx@192.168.0.120>
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
 <f893b8d4-03e8-bce8-b14e-1584802c6d53@nokia.com>
In-Reply-To: <f893b8d4-03e8-bce8-b14e-1584802c6d53@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ecfa2cd-512f-42eb-fada-08d7e5da7a8c
x-ms-traffictypediagnostic: BY5PR11MB3973:
x-microsoft-antispam-prvs: <BY5PR11MB3973D9AF2446AF1DB01CA856F0D50@BY5PR11MB3973.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(396003)(366004)(39860400002)(136003)(376002)(346002)(8676002)(26005)(6486002)(81156014)(8936002)(53546011)(86362001)(6506007)(4326008)(478600001)(91956017)(5660300002)(2906002)(296002)(316002)(71200400001)(9686003)(4744005)(6512007)(6916009)(186003)(14286002)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5maZGBCvtwABB/W1XMChrS98o05qWHgHpYYKVj8jbc3P48Cs+/pr/3nWUn0hw1rvVUahUxLcP4FojFbbSpGjs7uxF19d9JvEBc1G8Lb7khB6lqh0FTUzxrCOi747HBynYDSEUwWjQJVK/Clsn43COlLu5nt+KozWCCc1WRioB/+7cyqYbyEKFcRwf0w0ywontvmmth52MWDQuoB0YpD9ZIktJryTde6X+3InmGZqM9lvnWVlYEw2hH5Sz64u07BcjqWaECTWtL/zTZ2ydocqXnrOdiMQ1T8+IqmIaVvt2Yv2WANujGQblk2r/eJWEVFFnNgJSKd1QghFvmiMIiMjIqtgIJWHLA7TaoFh7VE7SN8E9k1Jt6v9SBovLEGf0Qv7hItO6nJIOVJCeEAJn4jjCA/oxdxFkyCsltdk8xwhWPGIeqM+5YwPxrp2ZERqhmLx
x-ms-exchange-antispam-messagedata: Np/IPg2xew7GErQQy0J9mvhIxCvWhWxJRGA3mqAAIX27nsN566JXteNIHP9J6tC+BrVJe+paLvJz2gZQHFWVLJkzVIAZ+zQa58OQkeKJ1E99XnK0WKxtAMAThsabeEESSE8lq8ALa3GRtblygCl9aQ==
x-ms-exchange-transport-forked: True
Content-ID: <56FD0C7E2A68FF42B12F1508BB0C514A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecfa2cd-512f-42eb-fada-08d7e5da7a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 09:58:01.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ngm4W+qAwCyxr+vZd8WnLagdAKebg+NTj9yRe7O/CC5AJ1sx5nllcEQGojmt3NYmiVjAUcoQJOiWPeEbuAD63i3Eu8VPNUEQGfx9cFhtbcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_025812_682527_E69F3DAB 
X-CRM114-Status: UNSURE (   6.75  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 21, 2020 10:54:45 AM EEST Alexander Sverdlin wrote:
> Well this will work and as the maintainers ignore the proper and even
> recommended by them solution,

There will be no patch left behind or ignored. Your patch is still pending in 
the review state because I need some time to study the problem and I couldn't 
allocate time for this yet. But I will address it in a week or so.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
