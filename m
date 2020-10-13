Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC719C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 15:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4313B248F3
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 15:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MaWN6RFu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="Xu3NMQsk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4313B248F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sn/pKUGrbzqYjaLPmviamo0Iip/KcTVthbxUPOI9lf4=; b=MaWN6RFuKHrA7LCk6y+WRntvXf
	21cSjzgx61TA3848lDTXsVAjBRVdr4SZPptg+ue2iML1sLf7Tt3erGSrGDBFkwN1e5RIGjJ1+I0Sm
	49WgXGLMubnPUXaA3VDcdmclpUO6ACZvQ1rhRT5VWyO7DnWchx9q5H0S/Spfg/ZmP0QRQCi7EaBKI
	fvF0AmSNqwLxfK4yyzWBc16GhdLuLo07hMEmAKROGo4Cey4ah0rpLPf8gfSQklBt2M9M9obF1R3/W
	upq+HeYlC1F4QkBUPX8Hq75ceDetXkQixZfMfs3UgHz2vF0oDor+YT5tpLUqZp8tmXAeNp7PcHCLW
	xPk18qOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSLxa-0001Kl-IF; Tue, 13 Oct 2020 15:11:30 +0000
Received: from mail-eopbgr700041.outbound.protection.outlook.com
 ([40.107.70.41] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSLxW-0001Jp-M4
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 15:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL4rNsMMxZyT8YptlvNOqeac1T1dbDZ1h4NNpGRfcY7rs++V7GW/q89EZm33vxBSkO5WmhvOSXqlv1RVIQN5P++9/E1CrjLBXFDw0Vg1Y/MTvs7/HJudrqP+yZs8smWO08gAyMzbmJmhKefXoJb4nbJLFYoHieZsK+8ZzAcnnYH7k4UzETq71VjnOEG1QY0m3gzAuBFQAAbMeD3iKtsdDi2zcrALBomlSxTcjGr4x7K0IVlPZ/12iVYcrf2bi//Oma0qaBj3IBrNxgE6JcxlfYToDFkLbMcQPU0cczoUI+JDIPkPDdoRRmesuhBRBxKlD132RdsuwF/YoSequIKabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18hQRRjxIbulWdNXkO2T23toxfpPYDMeg6XQCMpBvNY=;
 b=F1jvVYYfqbZGolXbWUpR6Wi3ZPrrdAo+MnooPKHXqt3l3B2AYfGx+keTuHo6G7vT9vOY+Sq6MpOUmHjxg2Ib0m9O9emiP0YG+T9Qpx5y4wMEzHnaA20/SiZhyElk/m6wrt13IMppSgsttZnD/AOu46qJM7PfjY08Te/kVAHbdKovlt0UsZ76SEWbtQ3Z3Fxu+deTH5SyXcE+Dwwj0Jc5Lvbkk35YoK9ymvJrR7wPIkMjRjXxUZPguy/s2FIRJIFFiDCdQEcHgObCWWqYwcUGADSmBs3776d2J5Yseb9+bQ3FKVYQxeo6ICn3uuRyDdTcTHIQ6RcTGykGdiRJIfxBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18hQRRjxIbulWdNXkO2T23toxfpPYDMeg6XQCMpBvNY=;
 b=Xu3NMQsk30p58K4ybXHEl0AyW/UM3QUvsZJfQKBm0PxMr8uSXFRzmZLhBRUxAhHqeFWvhX8vxLQ9pvzWPPx16RXbxWmxNB+rmkk6gyPDbQ+yOJw+tuRE6m6bIpK6jCFlgs9G3sDfnIiWGMvQuluzd0Gtd9tewHxEBk3c5NH+UDs=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1320.namprd10.prod.outlook.com
 (2603:10b6:903:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 15:11:23 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 15:11:23 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2: INFO: task touch:2827 blocked for more than 120 seconds.
Thread-Topic: JFFS2: INFO: task touch:2827 blocked for more than 120 seconds.
Thread-Index: AQHWoXMcwb84P5toAkGrbI3oKILL7A==
Date: Tue, 13 Oct 2020 15:11:23 +0000
Message-ID: <50936dea01571575bce58d985730fb533bf340f3.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de341a8-9030-4014-06d1-08d86f8a3f64
x-ms-traffictypediagnostic: CY4PR10MB1320:
x-microsoft-antispam-prvs: <CY4PR10MB1320E70C58526DB305C81BAFF4040@CY4PR10MB1320.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ojeBZOnZRJYSxt6+3Q1nVJTTLtHHJqVA/AWEUMLaRoqZnrQYU0etEYS2kV08lW3tvpYV0iOycR5BKSsKCRrjZiSj0FMOCkyrGSKDy3i/6mSsZ+FVXunOU4xvRyWG2OOoC1HcXMSNy1bfflgxnGjBPMliZFFnY/JYILxheMiJl+HoRX+9vdUVOEkWLQ4CJMSmy4B3X3SIMsHajwC9ss3XIrMW0SxXHkkHD0xjSo6/SJnZrEMkvRAemloNEDuRh75RkNa0HXvGmvKZt45TwE/pDkUj0PUhWyMXfRk7QAqYEPlkcjeFyxIrWrjT0EIl4euTPkVPfzK/pwvN4MuO7cMSdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(15650500001)(83380400001)(36756003)(6486002)(6506007)(316002)(8936002)(71200400001)(6916009)(8676002)(64756008)(66446008)(66556008)(86362001)(66476007)(66946007)(91956017)(76116006)(6512007)(26005)(186003)(2616005)(5660300002)(2906002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fjrivnlJdGiJ18w4HY6+qsFxrvzJj3V0r3a8peOlAgghy+F9WprHhFGE9BcryHlDmQGHeEgKPuFl30yIoPOZ7vWphm2JCuRHNURlKa0msRyUS5wFXyJ8Ri+Zl1L29D31txSzY5KM0Ha2WV9CTCucYnZBsLSUx+hK0jlKIxKin0ZAZz0vnmcM7kYelyiVWsVYt+z3ho4Tq23nVuBJtUaePjCxBK3cYFQlyg9Gy7a5kX9ppreh77gBbSZAlyDqtUDgF+nUCIZlu9APAMiEfBHgc686h2i6rSdB4uWmGXijlYLWEmviOIeVJpPNo0iFvgLn6L3QG4dw4MgqjCuuO1+tVsbVzkcT9Bncv1zEZCpKaYTmr8e5UgSIU+RrKWAHCZq/qLW1T+PBfPSAwwb8V2qMtoMhDNa6yLC0BzQLJjIBquFkFp50ZGYHGzPsTLh9GoluFCm9I/zmA4GwhyYq7PXlRyS9NLvHQx1oiwikNPVKP79KZno4KN27TBcuCJwwx/9d8b3m+FTSOhaUlQIHeT3Fbsap/HTli9ln0fGDrEcDJncze0JxGniyzP4V5oePTNAxs64EaAsmv7ba/9ygk/w2kCv4CWWY0R/9ypUvcL+9oJ/Zeh4tNAswhLWo2Tc3IWfb9t9l+z+cznjJSmkXXFKz1g==
x-ms-exchange-transport-forked: True
Content-ID: <7BD7A2DA2BAC984BA515D52E4C78AB46@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de341a8-9030-4014-06d1-08d86f8a3f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 15:11:23.1765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+87cXm422vC+0vHvjIvnRq+WBjAwvUkbH1eLswqMwA9XB2hwWqot6F0cxssq8dfAg2M0DLqX5r+Xw18TSQ3ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_111126_751902_610A4F40 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

R290IHRoaXMgb24gNC4xOS4xMjc6DQpbIDczOC42MDIwNjNdIFdhaXRpbmcgZm9yIGNoaXAgdG8g
YmUgcmVhZHkgdGltZWQgb3V0Lg0KWyA3MzguNjA3Mjk0XSBqZmZzMjogTmV3bHktZXJhc2VkIGJs
b2NrIGNvbnRhaW5lZCB3b3JkIDB4MTEwODExNGMgYXQgb2Zmc2V0IDB4MDEwYWUwMDANClsgNzM4
LjYwOTM3Ml0gamZmczI6IEhlYWRlciBDUkMgZmFpbGVkIG9uIFJFRl9QUklTVElORSBub2RlIGF0
IDB4MDBkZTAxZTQ6IFJlYWQgMHgxMTQ4MTEwOCwgY2FsY3VsYXRlZCAweGY0MjFkN2Y0DQpbIDk2
Ny43NTgwOTldIElORk86IHRhc2sgdG91Y2g6MjgyNyBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIw
IHNlY29uZHMuDQpbIDk2Ny43NjQ0NjVdIFRhaW50ZWQ6IEcgTyA0LjE5LjEyNysgIzQNClsgOTY3
Ljc2OTk1NV0gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2Vj
cyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdlLg0KWyA5NjcuNzc3ODA3XSB0b3VjaCBEIDAgMjgyNyAy
NzU0IDB4MDAwMDAwMDANClsgOTY3Ljc3NzgxMl0gQ2FsbCBUcmFjZToNClsgOTY3Ljc3NzgxOF0g
W2Q5NzhmYmEwXSBbMTAwODQ4NmNdIDB4MTAwODQ4NmMgKHVucmVsaWFibGUpDQpbIDk2Ny43Nzc4
MjddIFtkOTc4ZmM2MF0gW2MwMzg2YTI4XSBfX3NjaGVkdWxlKzB4MTcwLzB4NDQwDQpbIDk2Ny43
Nzc4MzJdIFtkOTc4ZmNhMF0gW2MwMzg2ZDJjXSBzY2hlZHVsZSsweDM0LzB4OWMNClsgOTY3Ljc3
NzgzN10gW2Q5NzhmY2IwXSBbYzAzODZmNDRdIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHgx
MC8weDIwDQpbIDk2Ny43Nzc4NDNdIFtkOTc4ZmNjMF0gW2MwMzg3YjQwXSBfX211dGV4X2xvY2su
aXNyYS4xMisweDE3NC8weDJmNA0KWyA5NjcuNzc3ODUxXSBbZDk3OGZkMDBdIFtjMDEzYjEwMF0g
amZmczJfcmVzZXJ2ZV9zcGFjZSsweDM4LzB4Mjk4DQpbIDk2Ny43Nzc4NTZdIFtkOTc4ZmQ2MF0g
W2MwMTNlMTcwXSBqZmZzMl9kb19jcmVhdGUrMHgzOC8weDMyNA0KWyA5NjcuNzc3ODYwXSBbZDk3
OGZkYTBdIFtjMDEzODJlOF0gamZmczJfY3JlYXRlKzB4YTgvMHgxNjQNClsgOTY3Ljc3Nzg2OF0g
W2Q5NzhmZGMwXSBbYzAwZTA1YThdIHBhdGhfb3BlbmF0KzB4YWIwLzB4ZjhjDQpbIDk2Ny43Nzc4
NzNdIFtkOTc4ZmU1MF0gW2MwMGUxYWM0XSBkb19maWxwX29wZW4rMHhhYy8weGZjDQpbIDk2Ny43
Nzc4NzhdIFtkOTc4ZmYwMF0gW2MwMGNlYzA4XSBkb19zeXNfb3BlbisweDE1NC8weDIxYw0KWyA5
NjcuNzc3ODg1XSBbZDk3OGZmNDBdIFtjMDAwZjFkOF0gcmV0X2Zyb21fc3lzY2FsbCsweDAvMHgz
Yw0KWyA5NjcuNzc3ODkwXSDigJQgaW50ZXJydXB0OiBjMDEgYXQgMHhmZjQ3ZDJjDQpbIDk2Ny43
Nzc4OTBdIExSID0gMHhmZmVjYTc4DQoNClRoaXMgInJlYWR5IHRpbWVkIG91dCIgaXMgbGlrZWx5
IGFuIEVyYXNlIHJlc3VtZShub3Qgc3VyZSB0aG91Z2gpIHRoYXQgdGltZXMgb3V0IGFuZCBpbmRp
Y2F0ZSB0aGF0IHRoZSBmbGFzaCBpcyBzb21ld2hhdCBidWdneS4NCldoYXQgc3VycHJpc2VzICBt
ZSBpcyB0aGF0IGl0IGh1bmcgInRvdWNoIiBhbmQgbG9zdCBzb21lIGZpbGVzIGluIGEgZGlyZWN0
b3J5LCBzZWVtcyBsaWtlIGVycm9yIHJlY292ZXJ5DQppbiBqZmZzMiBpcyBzb21ld2hhdCBsYXgs
IGEgdG1vIGhlcmUgc2hvdWxkIG5vdCBoYW5nL2xvb3NlIGZpbGVzIEkgdGhpbmsuDQoNCiBKb2Nr
ZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
