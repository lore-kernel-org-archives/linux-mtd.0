Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA83BC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943092077B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FrnN+ahg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="tTeSs34T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943092077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9076BOAFYNXNyBrHC7EhOr/AA7B6aJILmFg7h2VPjo=; b=FrnN+ahgtLecWZ
	ZHIG2RQearC+G9O73SYBN5VyB1/ZFmcPNwzCD1UcH3I5TrzXjyzWU909JPJgk+GxAVmJoFdDusvTs
	MpfpbpOt1bFK9YodAHrR3uyAfpA5pVzC9LqeLBxXC9AEcwyStZQF8QgMc5smCSH5dGO6MvHiOJUHl
	hK5RNau0OJdW+ocVpxk5pnELItZz3Z9MSyNW14FkvlO4CvIwG7HiI++gtvx3XHXEVoT4nllJFMo5L
	q2/B1Vl/BIwhVY+YwrQEWZM83dV2cZcntJT9q8ucfAsI+nLVEb/US53h6E5VFVdtudo57SMoFWmvh
	apQuYJuBRaC/oFVxqaCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsBLA-0008UA-AZ; Fri, 08 Feb 2019 18:57:32 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsBL6-0008ST-17
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:57:30 +0000
Received: from mail.micron.com (bowex36e.micron.com [137.201.85.221])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x18IvMnq024597;
 Fri, 8 Feb 2019 11:57:22 -0700
Received: from bowex36a.micron.com (137.201.85.222) by bowex36e.micron.com
 (137.201.85.221) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 8 Feb
 2019 11:57:21 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36a.micron.com (137.201.85.222) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 8 Feb 2019 11:57:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i9GxSy7Ol96e0+h9TUTrvzJwHqcj6bWkVgqvee1Okk=;
 b=tTeSs34T4Ekv5AYQMEi6GaXZlQ7xE02zNtypMyRrkRN0zeFrIfTwms1XbgojiGP3PCQdrOQOj06/9LW7kbr1FrmmT+CPY8SyaMUDa9o5H9C4wIPqLJQJI0RBLPJKfSZAtawd/SLDAE4Ie7Op+VEY+MAX+FDbkbhStLL0YsFRUu0=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB4789.namprd08.prod.outlook.com (20.176.255.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Fri, 8 Feb 2019 18:57:18 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::911c:eb84:5e0d:c669%3]) with mapi id 15.20.1601.016; Fri, 8 Feb 2019
 18:57:18 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: RE: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Topic: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Thread-Index: AdS/uVD1jG3UvCBSRuC2oJ8LRRcc4gAA03cAAAFVpvAAAQltAAACntYgAAFvxgAAAWkB8AAAp7EAAABTneA=
Date: Fri, 8 Feb 2019 18:57:18 +0000
Message-ID: <BYAPR08MB453343DF172ED508C736C94CDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <298d18cf-094b-d5d0-45d1-39c7b75ba309@microchip.com>
 <BYAPR08MB45335415CC3690816C1FD603DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <a83a9655-0ce7-da15-ec17-80ef88764e21@microchip.com>
 <BYAPR08MB4533DB0A7F4E30543750C83FDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190208184718.3c488d0d@kernel.org>
 <BYAPR08MB453327FB53F7DFE50C55C1B4DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <7278fa87-bfe4-3d95-9a9a-5ef4c0277d78@gmail.com>
In-Reply-To: <7278fa87-bfe4-3d95-9a9a-5ef4c0277d78@gmail.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4789;
 6:Ot7ruJDqIJqOPvw9SI7kdpaOPsLH+A+0LgeuBLSreeP9tZEvULTlVI5pbHH2mQu2FwDE0r3WLoMW3Vt1IW0RzQDqS5DZQGLucAzflECulwhCILfDFBp1o0kChm8czB3knKjBxi2K3yaKaqbBtIwSvUfIeEanBXtQIqV4Ahmo9BLiwU0uqOEjHUUbtocMd1PTggoAg+mZ+LGcpDZVlOAmekpL6UVvQFXsBYnpuGB/y5U8BYpFoStxZrsFdwVWx+CAh17fuKCpo331Gl3G1y11hZR6xKF3vkGx1w1OlcPMA7xj9acy5KFO4vKrdE5zuG46rRyBlMWf3/38MigjsWLfiXmZfCKp/vKECpc6feHOLCI7Ldz4+YZpYRhR6CCp3e3SYpvtJvRJONZOoc2Qq/fQ+BOwFftxyuGaekZoz6Fov5l0mf1MvpOO/JAPCH3tn3pYl/M8EHWnxi3vzJpuUmcdJg==;
 5:bprCyfjDu/tHcmnNHpAW+TaAa6gbFvOmINGvZ8JhnLXHU/X2kDeTviiOHGrDRueyFK29EK6XxQUyNXC0RantN/5dgHVLmRfCPQRgTvorCa3Pi0Y/fpx/Mp0OIfLXmuL7vw8GQs9ziMehndOmwlZCOfQOvoz/2vsdmtvswt6wL+XRKDHkoUIpkMMol70+Z0YjYc4Uta8reF9uLMHi0qnadA==;
 7:mBZKwKLFEvfu9Bp0JHX7sbUoesESEolM117GA9A8dJIU0D7RIpmhk60F17n8qv6FSylPAfax8v71Ua3MGhOv7J9C5kHOQsbmxJjgPtfPpJ6bV6c+fYG2soyMePYaf64H0jU7H+pcAy+lnoRbQZ+XPg==
x-ms-office365-filtering-correlation-id: 4a84c007-5f58-4ecf-40e7-08d68df73fe9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4789; 
x-ms-traffictypediagnostic: BYAPR08MB4789:|BYAPR08MB4789:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR08MB47899719C4279BAC55420E5FDB690@BYAPR08MB4789.namprd08.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(81166006)(6306002)(53936002)(74316002)(478600001)(7736002)(2906002)(93886005)(305945005)(55016002)(229853002)(8676002)(4326008)(6246003)(9686003)(81156014)(86362001)(6916009)(66066001)(256004)(316002)(14454004)(68736007)(97736004)(76176011)(7696005)(71190400001)(71200400001)(11346002)(486006)(106356001)(476003)(105586002)(446003)(54906003)(102836004)(33656002)(99286004)(3846002)(25786009)(6116002)(4744005)(6436002)(8936002)(186003)(6506007)(55236004)(6346003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4789;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 74ClbcDFb5Z52ZQHa3k9zPf6/mWAFcy5lYJqisngMQRn7HxaSrXASiMz/uNJFvJN6Rv9kKChw71NEr1gI9k1SD4WC1Fs8lKCFn56IYp8h0+YAGMfHgRO8Gw4IC3n9SwgVosey/oH3/2G+DgWqm12Q9i5fA0iuAhUel0ZhnWmJi2GzzV8CO8bJWhJsdnIvmn4txIkSl3zGikGapNawRwWshAZf6RUUOmwhiGp33lWH6pndlDL8ExcihijOXG3Fx1wd2hsuR+fPVytcUDEg9WepLmRiAT1FSmPdpWO9fq9rpARzI4PTJCZyCGwUbcNAKUjnoOUkfdt7vUYyoO6KRvFfHbKJuMN+i48zdKOsp78dz/MM9nUsFKkVRjKSCXeDkNdoyVxNzZE8NYhPRVa8PQgrHop6h7/ZpTnHtsoidN8t/k=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a84c007-5f58-4ecf-40e7-08d68df73fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 18:57:18.7573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4789
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24416.005
X-TM-AS-Result: No--4.862000-0.000000-31
X-TM-AS-MatchedID: 150567-139010-780014-705178-703283-188019-702020-121574-7
 00107-700648-710970-701249-139704-700047-148004-148007-148020-148050-10018-
 20020-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_105729_345876_87D98655 
X-CRM114-Status: UNSURE (   3.49  )
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
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

>> git send-email 0001-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch
>> 0001-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch
>
>git send-email --annotate --to=... --cc=... --cc=... 000*patch
>
>This will likely make your life easier, rather than having to paste various email
>addresses to git send-email queries.
>
Yes, thanks.

>[...]
>
>--
>Best regards,
>Marek Vasut
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
