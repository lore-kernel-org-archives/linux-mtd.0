Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D99AC2D0F8
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 07:12:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19ED0206F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 07:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uO9PHBWH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=datarespons.no header.i=@datarespons.no header.b="T8Z1e3Z5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19ED0206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=datarespons.no
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8aX406eF51MJ5NaL3y2BF26R48BAiZlZTsOR2Xsir1M=; b=uO9PHBWHlpoCel
	KccszkcXrtzO+afm2NFFaVQucVCd/AmQg7Krtgt/5DMSg8jaMXFkl9kOovUPRFcpz6Wc+7QAZddqC
	N45vMs0meooZXRpmRTTBs7srLwMeij/0FqD1RyCQFMNwAqPYIBoMqMnNtlLYDsn/+28Vo7LEfpHx9
	5VqFALjopLDdVUtycc+9cbXlAtw2ZxPepyWTMUD0v+6FEBKwhQBRV57XLgAntcRtnczjcWBK9rm7x
	YHGwI3Jk1gZZ65bCZuhzUy9Cz2IKZaKQlGcPl0PsXN7TP2OQYNDjdwmIL1P0NthC313/4UvzYAiF8
	crcNeA0V+sPLMPG7CC6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYlYo-0004I7-7L; Wed, 13 May 2020 07:12:10 +0000
Received: from esa1.hc776-43.c3s2.iphmx.com ([216.71.156.243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYlYk-0004Gv-62
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 07:12:07 +0000
IronPort-SDR: 9ZCXRqPHyPGAMEnd/Dclnyf2yLIk/1B9vtvyynPWMaJLds9sw4Y9rNT+v0Kls369GRHQHyBNYe
 V7yPiMDnu5+Pgo8HI8MK0PRld+VgImF7d/v7I3ENViF5D9RxTLjU+nhVPYcEMM9p+mLypVKIb5
 Q54db1BVGFwtBlA3rRxi7iwmE5EGXYy1efl9KCiQOn+7FPbpIDgJ2tSuxPbqMGdJ2ijJoccjS7
 6u0tvrr2Nv8jteyeDEJounokzcAfIddW2lQjO98lVmvpp8Pt1Vooni/Fm8uhCf8DqCzS5Epb3B
 /A4=
Received: from mail-he1eur01lp2059.outbound.protection.outlook.com (HELO
 EUR01-HE1-obe.outbound.protection.outlook.com) ([104.47.0.59])
 by esa1.hc776-43.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2020 09:12:01 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRb453m3IhfZ1eiumoCEVOJNf9SDngoKy63lCdZs37yQC0EzOLyRANDxE5DY1kiVx9qBffj4cKcVBAfTSfwxE3fFGraTLNVaV8pbMyexI3enapmm6oRyhKrJ28Qg/6p6ZRyEsfzYOx8pMaqIuK8PBrlRVQq3E3geH8cMZeLFh8oSLsSWGS4KaM7uFSmTjb9yC5IBGUpRpsuHHua7UimmOmo+4JO064Hs8GiSZcOMXs4MxM1D/acd0+aqXJya7hWMOKb56hbSmATtWq/eXXf4MOdlnq0bHlNtFFCZ7b7aXbhszwkOkNYfFdMo+4yBt+NMuYTLo1fXu+5m0Oc/XgULpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQkOgtjhPZnFKHRE+6+MjIy6/72nAIIqndN1Mf51ncs=;
 b=KqCZcBq16EyHQ8HY7GFF+TSJtU7xMa/voc5jTzIOdE3/To/npAx4Kd3eLnnwpmLwrcc3xy/w+mrsYqkKisqvr76OUjskop+p2wZkmqTtnY2vL9SfhHmMbsC4tfLctXQvulskZbxhqKktaHOtgXZnJAKfpDvq0KJNcUzwNys6zgxhVZkc/BCHY++8ElEQA9k1WizVQbUgZ2GEKBZkHxEjqt/7fW0hX7Y6WpLa4uwhMj+7xVYzMsKMG1V4M+TeG5157Nn2zo3KucDyun48JVNSp67y2coxa8iRPR+t3P79MrmYubyqpoxEzXS94uPp7agcJysDrKiyc8DarptzUR+JuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=datarespons.no; dmarc=pass action=none
 header.from=datarespons.no; dkim=pass header.d=datarespons.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datarespons.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQkOgtjhPZnFKHRE+6+MjIy6/72nAIIqndN1Mf51ncs=;
 b=T8Z1e3Z5w7EBj4WHJPhXdob1Fl2JWkLv5SyZvhD65/1oMN2u2QHXdnXi32VIfYjsB1AP+v8u2HY7FwadRsrPBXJWGGafHDcR0rgNNcTmcAJQHVERgUaLe+rONpzcqbsxq/ZLCHw9XrX0A4IDWxzBPGEZ4nQInlh1ND/l2HGBdwo=
Received: from AM6PR03MB4165.eurprd03.prod.outlook.com (2603:10a6:20b:8::23)
 by AM6PR03MB5380.eurprd03.prod.outlook.com (2603:10a6:20b:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 13 May
 2020 07:11:59 +0000
Received: from AM6PR03MB4165.eurprd03.prod.outlook.com
 ([fe80::f4d1:78b8:a31f:a424]) by AM6PR03MB4165.eurprd03.prod.outlook.com
 ([fe80::f4d1:78b8:a31f:a424%5]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 07:11:59 +0000
From: =?iso-8859-1?Q?Hans_Christian_L=F8nstad?= <hcl@datarespons.no>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Subject: [PATCH] Fix const definition without initialization
Thread-Topic: Subject: [PATCH] Fix const definition without initialization
Thread-Index: AQHWKPWlWv8g8ydaO0i9ZP7NDbdCDw==
Date: Wed, 13 May 2020 07:11:59 +0000
Message-ID: <AM6PR03MB416574D2D264C136BA63C4C5C4BF0@AM6PR03MB4165.eurprd03.prod.outlook.com>
Accept-Language: nb-NO, en-US
Content-Language: nb-NO
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=datarespons.no;
x-originating-ip: [95.130.216.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1b3014e-aa45-4484-4833-08d7f70ceda1
x-ms-traffictypediagnostic: AM6PR03MB5380:
x-microsoft-antispam-prvs: <AM6PR03MB5380F22ED4C60354239BFC74C4BF0@AM6PR03MB5380.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cAbwe88sLRM9LHyyR0VLkjaseXSmh+Y5dRV4DePiksa6QYzZYJuNxCr9Hkiw02QU35Yrmt6lknmu6ynJYvXfP53vSHwVcOjLthnkHffs3RskhxXmb0yuGhQC3wwBm9xznMqc9JLDJ5mSXqi1sL5aZIkbUnxOAasBaGA0JIiyePtgh3EuwgJQYvXvCE7xopFrTeL7m93pmwVsC5vGss6xvGcjdXWKUnTEny8ATPmjOF7DKUx0ECSRvb/uwjYN0T6VHRWjAaj5OtpjdkcyqO86pwpr+jD82RmWDhsvxjHwUbcgTTJ76VFYnukoa3DyaZBlLglC/n3oDeAt1vix+Ur2PSo6yYZD5TKC5+inoObcQMoqPmDjYVHmD5Q3pNk6C2JAk92aLlHNchrFS5PIGVBUOkvWi1qVr7m2uBEaMe8JdFyfYASvCk5/YxBuGn+eUSiOLkNLePKRKEyDe3zbW5ttNIchpD36SC8LuKakyMKwMo87Yj6qt75S0WQVmqoGz/CJkXlzdT6YFJyesEm35e/AQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB4165.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(136003)(396003)(39840400004)(376002)(33430700001)(478600001)(7696005)(33656002)(76116006)(55016002)(8676002)(91956017)(86362001)(33440700001)(6916009)(66946007)(8936002)(9686003)(4744005)(2906002)(64756008)(66446008)(186003)(66556008)(66476007)(5660300002)(71200400001)(53546011)(316002)(6506007)(52536014)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bzqWt+FwuTqxOgdciKWc4zocuXlbNxhL4efclu9pLjt1K3JJMM8DQObjEtSkf4272/3DeGR8HP1DPDUha0AVMCBJl9Bzp+Lo7jG0NukOCdwe0nnOpGHSSawzTiJR00FSb7XguxPaGCe5Pa6D1hMzb8CZv02F6vp7jokZ0LI9zEpgk5oWLbGcTfd3C9u1N3MYj7TkSPGb3jl3orO8YQwHos1QKgJ6gm3WpvuaAJtfDjYbUdC0dcIZ+527q4DKYn3O7UKXYRltwv6Cd4HsxCwPQPkmYmodYghuzYt/f9bmGrxtYBDOiINy8dYtd9p191SzEdpGIOMwedvB3GNI4glwhZYEDHI42aZrhrUUV4qUzE0nMq1WDo6nyP5c0qHgcg6abL7EI6hRZF9nUWS3NKKfzUIywPh+0pNjhr+vD6YmkAP6MmX1/uZ9OQQNh70jHe649rIDOCDwzoxCFbBvgmbqFjMPUIpzuACP3tC7kKvXURE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: datarespons.no
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b3014e-aa45-4484-4833-08d7f70ceda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 07:11:59.4143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2c6b4bf-37db-40c2-ae4f-9fd06f3f8b9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzZI9YhScdipglbs+vf1q/A6RZb3kzdPl4E5Wwy6H6Pt1dHgK4SwxF23gH0H4aJ7nrCZ/C8vBOBt4po1KQwQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_001206_497509_8EA03181 
X-CRM114-Status: UNSURE (   6.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Hans Christian Lonstad <hcl@datarespons.no>
Date: Tue, 12 May 2020 15:58:40 +0200
Subject: [PATCH] Fix const definition without initialization

Compile error using g++ 9.3. Remove const specifier given the structure is filled in run-time.
---
 include/libmtd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index cc24af8..dc339d1 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -77,8 +77,8 @@ struct mtd_dev_info
  int major;
  int minor;
  int type;
- const char type_str[MTD_TYPE_MAX + 1];
- const char name[MTD_NAME_MAX + 1];
+ char type_str[MTD_TYPE_MAX + 1];
+ char name[MTD_NAME_MAX + 1];
  long long size;
  int eb_cnt;
  int eb_size;
--
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
