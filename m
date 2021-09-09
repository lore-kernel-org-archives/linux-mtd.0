Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF68C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 08:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ADAC6109E
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 08:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ADAC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=abaco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odgAPxxKrMgQitfkTxslsrpH/Rv5OHPecZVMQSGimZg=; b=xw1AFfqMm8N0ge
	p928veLgf+7513E+94L+N8PW+j81oLPh6p4AsZBYkkM4oGo/s44t8W417Ll7XnkmZaMaPbo26f8Z2
	aBhUSSJAKxJSpnO6XJ0Q39Df/oRmmcKJnI9O9frLHK+xacOYkN4K3eRu6zwedsJVqd/a09RdH5vL3
	2HRFwVB7ylDHcSfeI+LnYyncqwm0GGaV90PVxhrdX77KUm0tjZdX4T3iFlyQxzknmnC+/ZfV8huIV
	izX6ogYyFjdBJZzqWnJlwkkpuPAI7S1Z81/EnhbhIeIXgYeWv6g10isw96SrYnXQNEmuy6kcTAL/C
	YEC7VVeBXO+7JizREL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOFZL-008aKg-Sx; Thu, 09 Sep 2021 08:38:04 +0000
Received: from mail-dm6nam11on2100.outbound.protection.outlook.com
 ([40.107.223.100] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOFZJ-008aJf-36
 for linux-mtd@lists.infradead.org; Thu, 09 Sep 2021 08:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoKSeMR6pF2/SqD7lgcRnLLf8RPF4QQWdlpFAT+XlVMQVxnET/7o4XGxmorLuTUtntNjsbLT1IVZ30LeEoHX7ALoerOXQDCT8UpANsQac8OBAdG+tpUKTLK2vIPg0t5YG2eqiPx1CL67TZkLP/4JslJWcyysRwR+dS67GLdKKQK1c/x7KDsagX52gIwKTh5DR/OiZyvqIBYiTl94c6Lx8+TsbFt4NBC3jR+mBTlNlFV//BvdeiMzMZDHP6MlRTLr5P3BLYvUSKKjPauoDfTdGnsEnMQODI7LKygk4DKPmLqtQ/WWLyWjNKYJSaOKTuLAbYxy5MBnytQNlYvDAlIVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KN8H7l0k3IXWKDcXmMsOhjCf65JbV/4wafCrSNSSDHc=;
 b=GmT7pcr3sp+bn8LTk42JwGgxWGBsUhslMo+pc1Wh1TQCF5iunB42foAB9srOKPih0ycvz0NsNL9UHQ5UVof1/M7jW1Ml/Pj7i+44DTaJy32YOqzYHEP/rzxFrCw1HQY98qHc7Q2LXtnfiPyAYrtf1Cu6f/4CVzHNLgrKipnULD1HslVmgazkBfBgSb852Un4h8lyC9Vzzcex41M01GnLdwcsSoS5sqeEONXk0zMy+682gi5sI1hWprW3kxmsfHGoxgxYxsvwmwANbROqZIrIGEoSz5czTDAIQxPPW0ldaLpyAwmiugXk54pjnr42tKbqICYVxyngz3gbCGWc1kfjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abaco.com; dmarc=pass action=none header.from=abaco.com;
 dkim=pass header.d=abaco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abaco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN8H7l0k3IXWKDcXmMsOhjCf65JbV/4wafCrSNSSDHc=;
 b=VD3OSTiXGWNvJoAe7Coe/caZed5nsKFm+SSaQMRQMUIu2RrYxcCL55Dbl91bUgt/TQRLrOcFXi4vEi1ZuB1vrbGlJlcakPdOna5eqvAXUAXapPCkVt3loT2G9j5KoS4dwk7Cx046kcH3lPLnAdBU8D5TH26QNpmXMG9N2/EKUspTMXisDF0Zs9vuoa0vLrWWk6a16iEc7CgV0Rp25z1WsBY8az88gtgCWQ2cCVC1zsReJQqIQBHDi0cIFmLudUJKksrXTOX4KAiP5h5gOdQCKtgBmohxZpd128Zu2cHy1q3h1g/D1QvNi3TMdv5T5CSiIKYcU6VPAJY8VoozsLLSYg==
Received: from MN2PR16MB3135.namprd16.prod.outlook.com (2603:10b6:208:153::31)
 by MN2PR16MB3086.namprd16.prod.outlook.com (2603:10b6:208:13e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 08:37:57 +0000
Received: from MN2PR16MB3135.namprd16.prod.outlook.com
 ([fe80::75bb:ea2d:9ab8:b38b]) by MN2PR16MB3135.namprd16.prod.outlook.com
 ([fe80::75bb:ea2d:9ab8:b38b%7]) with mapi id 15.20.4478.026; Thu, 9 Sep 2021
 08:37:57 +0000
From: "Barbier, Renaud" <renaud.barbier@abaco.com>
To: Michael Walle <michael@walle.cc>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: S25FL512 vs S25FS512
Thread-Topic: S25FL512 vs S25FS512
Thread-Index: AdefTssbJZFggj2ZRgCkCCRr1Q2RSAFuvgoAABKUkxA=
Date: Thu, 9 Sep 2021 08:37:57 +0000
Message-ID: <MN2PR16MB31351FBE06F4D9383F02480D91D59@MN2PR16MB3135.namprd16.prod.outlook.com>
References: <MN2PR16MB313511219F7BFB2692C4C8B191CD9@MN2PR16MB3135.namprd16.prod.outlook.com>
 <a0388e5c6676b9cf4a5decc00a8da6f5@walle.cc>
In-Reply-To: <a0388e5c6676b9cf4a5decc00a8da6f5@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=abaco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6588d99d-7c0c-4e80-fc44-08d9736d1fd9
x-ms-traffictypediagnostic: MN2PR16MB3086:
x-microsoft-antispam-prvs: <MN2PR16MB30867C8F28F6E9E9AEC200B191D59@MN2PR16MB3086.namprd16.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1MVjSgaZ8/O06jf3ArhS/XVFvRvXA0z3Dawipi152tSnJsRLiDJaZVVhQ5nBwb3/8wRpEaOr3oTT6I9zqXFsfu4fZRzUNV1LDz65ocE3oeueJjBaYsXP5ZEw6vHqZHuszbJg5EZ52Wwx5BipLuak1KNs6mn1eqa1/cUWmdN15CnvjD8Cuz9tqYjoY44/H47hIas8XydeQBX2muh0XrFg6FGuLJND3CFEGN16z2+siR5O7LxLL4n97Mq++dqzZ3ViZk5wfDf+jBM1mkRWf6CMEg2yA80Fcf6MM+cOFitFmgBe/9XFrJZXKdgUuFzlYDdoXDS2+ryzVjJeppUV/WaeOk45pjL2AcUPKRR8exaqwcRns2O0sQCZ1SLfUcs+2Hqgec1mcIlrO5p4f06WThoVtCztQWgDMaUybD8Gq64um+iUVh5EI5pPAJAQYzOu3PxUvOZsMpF9LyIQxF7sLARanPyyvEKtybZkZG41TR6Qb9YlPSCJsteHSePIPojREW7uwVEIICSLIs99li3fkaoPvvw34FIgDMeNuxi0/8yYLbLzn+7QZ4bXyVB9/SpQitm4McRXzn+IRNo2+dIdPy/6bC0KRJ7maRuZRntgjvDTfT9rERfenfUtkRITOqHrKWMBSWblg7hWXfwmmK7UOHsHazkOFx9/txgp49c+Nl2TRXsxha9aKfpTVH20x2xFgJPoyN1TQK0C2I6d97cU8CnTmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR16MB3135.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39850400004)(366004)(6506007)(8936002)(6916009)(83380400001)(38100700002)(316002)(7116003)(7696005)(33656002)(5660300002)(2906002)(52536014)(55016002)(64756008)(66556008)(9686003)(66946007)(76116006)(186003)(4326008)(26005)(8676002)(4744005)(38070700005)(478600001)(122000001)(86362001)(71200400001)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qDJoF5GcWKfFQIqb1vboVEa3fPO7ClJEQyo6P92wiipWIXgNF/FwlwJeMhDW?=
 =?us-ascii?Q?t4UtP1OKfHo7Ud5TVeJLaNwhLAY8F8lDzFSFdxIzPxOFLAvK6g32/rc5iKqv?=
 =?us-ascii?Q?CkZS+dL+nOFq9+5Yk4dCoEHuHeoW3NgAY/Prsl7MUjjX4FdpzF4H+iJoSWbO?=
 =?us-ascii?Q?rEpb5TpglBElSaAVteqikwhy7evs3XA/MXhgioohX6ANCyYlOUW6PNKMiEtS?=
 =?us-ascii?Q?iTEngH5aUKNnRazgNc9Eg+5jf9oK3E0HrXQnsfxfGW4d0u5ughonDdNzKrFR?=
 =?us-ascii?Q?NBii+KOHJtQoApt1dQWuwEuU03sYZhmlDA2E19qU2KRQ50AxxGO0TNatl32u?=
 =?us-ascii?Q?9UXSstA+5i4nknOCjz4aXxahp1uAHlGadb5i+8QXCQKJgji9Ix17SiB1rUTT?=
 =?us-ascii?Q?/6jjJBq6NpeqVWu7M0INx9XagIGdwS+A5uaaIL/BQF2/LT0bRzb8EqCeTFN6?=
 =?us-ascii?Q?UOYz6KVOr6+81FuG09OsnMp40kJdCnnOqPoTZT8sNZhYrVDxtNuxMASBWE7z?=
 =?us-ascii?Q?IwCj4mVkcPpYMBzjFxOI7im6eGEDS3TcdoWBhl0Yreq31j6RqevBoz7NKd91?=
 =?us-ascii?Q?8b3+KxXDDozp5gGxjebInK7ZfGzg3Zf8Tbh9eg3KPgoe1C/x6lDRk+jH5gje?=
 =?us-ascii?Q?dFAlx2RqIhqdpFI4YtUti2pxTQSpUIG73H61/RcO87AIf6h0blBqJ8TajqLS?=
 =?us-ascii?Q?kKkqe3cmZ0LrEowCM+CZNPpKywWYB+XxPoZK7hSnZfi3BJ7PO65C15wKn5ac?=
 =?us-ascii?Q?1AxiOeUjMZFLB97iWvuSxxyR1j5dcVo6lY42WjYuQ0louVVtJ5rIGHxgQhZV?=
 =?us-ascii?Q?Nfy1SvG5jE8K58ERs/R3iWxQ04mJSTfKfEqqVrwopfb5DP/gwrZZ9mZq1E0B?=
 =?us-ascii?Q?kRR2TcLrNgPsYTDgXm5BcQRRWRPxAUtI2P6sce/bC6c9Ti111D8z65zVUMi/?=
 =?us-ascii?Q?UpeJopJ1sSZF5ys9FxEpVEr1JT8GrXHLiMITbPpozQ26StKY/tp8vOlxvZe6?=
 =?us-ascii?Q?8F1MV4q7vzkQioXYLhw32Vh8O2G9b8e7yWD7gOv4O946d9/Ccpo0dkvVaEXJ?=
 =?us-ascii?Q?DUJ+PcD+FJwFltEoRycTOknEOcoz5vIdc+JV2h2OBPph6YSHmODBA3WU8Ik8?=
 =?us-ascii?Q?f2uNfFZHpz/GHRjQb4FZMKrn5vu20Fi1QGcjOvFIFsMwKcTOmP8f6dB4sdPS?=
 =?us-ascii?Q?i8zMEFb6fi5P+mQLu4zs1M2TzNiE5c5qPP7CGbhhQLYvWw7UA9AEPN3pzfLS?=
 =?us-ascii?Q?kCHPgws/acezH03BDeqmvJ+Uq/R4Il/+s6nLpmYRHYelCePUUoG3uC4s3+Zf?=
 =?us-ascii?Q?6bOfJsjqdelpX6YnYeTllU8T?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abaco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR16MB3135.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6588d99d-7c0c-4e80-fc44-08d9736d1fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:37:57.1045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e6f27451-899d-4d0d-b8fa-88baafa551a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztDBcD5wMuL7x0g026OBACVyTZli4KErNNiurPCUI79B6iKvE/isb/PfjyUB9t/hCxw2fPLWnnlMLXa6R15Ch4Oukw6HSTX57U5iZU2QW3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR16MB3086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_013801_320439_76F8419A 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

>You lost me here. According to Table 52. The device id is 02h.
I was looking at Table 40 page 68. Hence, the confusion.


>> Is the SPI support for S25FS512 in Linux 5.14 disabling the bottom 
>> boot feature? I have not found it in the code. Only something related 
>> to page size.

>What is a bottom boot feature? Are you talking about locking?
This flash S25FS512 is configured by default  to have the first 256KiB sector divided into 8*4KiB + 224KiB.
This could be the top sector or disable with the configuration register.
Erasing 8 4KiB sectors requires a different command than erasing the 256KiB sectors.

I have now found the code in U-boot supporting those 8 sectors. 

Thanks for your answer.




-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
