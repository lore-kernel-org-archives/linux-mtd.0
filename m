Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC7BC35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 16:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DBE220702
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 16:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJYnMd1J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="COp9qQIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DBE220702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZBUllhsh2j4iICAEt1gv/o/sEV19Tvox+rRz8nlYzI=; b=WJYnMd1JFmz/6V
	MibCO9Q57RJRoSyUO561pqt6FppF3kh3MwiHKAJrqLtLj1scrmM+dyunQdxs57W2lv7if2qIjPJJL
	De6TvQzKeDdCh5Lrp3+2uuRrxfiNnbwDTSoBCudc9xlv42tQqpUkfYc2h/RZDFz1GCn09GwHnOO/E
	AUCAmNwaOLi3U3Uf+tEBMF2j5xjJdHnSHvz7BSOkPGD/D2cXJUYZlnI90wXyb1RPcoUFrcoYD5tB8
	o6cAUPeWpGRjU5dDO7ATBngFGcUITz6reCgyjFFTH5n8EU9piH8BhByPdhOw64tZQy4NDdaritfWg
	8fd2G/DewSa6G+Lqgu2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izN9g-0001pu-41; Wed, 05 Feb 2020 16:03:56 +0000
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izN9c-0001pI-Qx
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 16:03:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUQDSKUPIfYYlTA9A3g2AQD6ifaaSmnEC6P7kC9jxtqPIljTvvVTin/yiiY/Lcpmt73T5FbV4+BgAyjLSql1zWUElROYqtjU61f+AWCvgyqb3FbOLi9bo/vHaeSz61135Q8Nkd5jg7Sn790Uxt8tKnkOmOv1wI7OXYX3kQ0C7KvOXMVDbxF6PxwH8fhxJxQtUcaXWzGDr6mGQ7ly6+rV6urVUtPCH38mYfFtKFVomfWrnQDofXE5q8HIY3axhxWQ7gZJMOuD0KBI+PWhaD4XsoYvKFH7b6ER1p0Q0UdwfSafZQVQcCTLoYaAJQCZsPT/kn08Y46kvZd80qfCmY5KPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5xgmJ0HT8+vo4v7DxGFVMzsF8J+wi2D79JmlWH1P2g=;
 b=Vw2mT53ajzwGijGSOQWTSlPlrUxuJIsLfyhMMFdV/9bAxjLDjl9eYdisgizmb6SZ5Be2dZfEpH/+8suTHeRJGzKLxUK/fW7KxETohu68tQFdqWc7UCp7maarpcgmVzaGeomAPAhuBPaoO15/ClN+CopDL5tUPbLErNOHeeQKObgjII2g/rY/Qz6h7eip47gwPlVN3850CP3GldijVUFl/8GSkgTTKqOaIrotxztuYMDy6It5dGMPj2aR8nfROmJUqSUr7+JQJ74fJsCTwMqanfRsHEMCOxaOAyV4/A0Y0WWQsWMeIOsRifRCuxEtAcoa8z4ZVfO+Di0MyZHfrIXeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5xgmJ0HT8+vo4v7DxGFVMzsF8J+wi2D79JmlWH1P2g=;
 b=COp9qQImzKaLmWlOFxZdHMRfbIbay4J0j4knqPGxcDhwhG7zgDcjXn9cOijUPNjxqOu8BXpGO5rhAqe3H23NCImmHb2aKUM88gwOYXgTTSy9tI6ySWEQhk9h1as+4eeaPy53h398k7iGFdM8HhNTC0wl9+kaRhlO7ZdNXIswsjs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB6014.eurprd07.prod.outlook.com (20.178.123.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.15; Wed, 5 Feb 2020 16:03:48 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::20c4:7ce8:f735:316e]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::20c4:7ce8:f735:316e%2]) with mapi id 15.20.2707.011; Wed, 5 Feb 2020
 16:03:47 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size for S25FS-S
To: John Garry <john.garry@huawei.com>, linux-mtd@lists.infradead.org
References: <20200114134704.4708-1-alexander.sverdlin@nokia.com>
 <2759888e-0a88-cf76-d2c0-3f0f5141f8cd@huawei.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <b376b949-67b1-b3cf-38cd-9f5e5622057d@nokia.com>
Date: Wed, 5 Feb 2020 17:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <2759888e-0a88-cf76-d2c0-3f0f5141f8cd@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0257.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::33) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
Received: from [0.0.0.0] (131.228.32.167) by
 HE1PR05CA0257.eurprd05.prod.outlook.com (2603:10a6:3:fb::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.32 via Frontend Transport; Wed, 5 Feb 2020 16:03:46 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a878cee-13fb-4513-e8fc-08d7aa54fbf8
X-MS-TrafficTypeDiagnostic: VI1PR07MB6014:
X-Microsoft-Antispam-PRVS: <VI1PR07MB6014A2D5A661E02C71C0224188020@VI1PR07MB6014.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(956004)(2616005)(44832011)(16576012)(26005)(31696002)(86362001)(8936002)(2906002)(316002)(8676002)(53546011)(6666004)(478600001)(66556008)(31686004)(66476007)(186003)(66946007)(16526019)(81156014)(81166006)(4326008)(6486002)(5660300002)(52116002)(54906003)(6706004)(36756003)(78286006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB6014;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQiz9spku56vIeTM14wytEOL9iDif7jdblsmyMBuoKQht34b7wugJZiT1DawekCNX2x7LSCKRWhQYdunVYuQVVGJqAq22FK9VYGxWjCmm1vDSdXBR9q5TkfoaJa9GEGA9UpdP92y0/SqVYhSy2eZw2odF31oEdjWIvy1u62zNGLF4iDlyeuHJus/kl2tQbFvnj1+nyFZhutTeFqy1JFHHbnkrbEmipck5TAStpCP6zEHRQ9FA9wbTuK/lTYJuF7SvSg3KJEx69ua2CEWUESPOLKABhyzrVe6IGFXkvXg/SbWXlXuRDxcPDIMNf62/oM115aJ6uZJ8pmubthoZDYB33BxYsLLQ6ytg5LRQU1EqKqW9mO7hHvCYZEwV2aCYQ7LvuTgF/qPbwAsqFgkVwhryNPBpRFDFT+H5tba4rmi8k0uy7jVPskHuOzsmvC8RzZ42NH0EAx+7wMpEhjqoiB2z56T0ZZgGWyK3utDMzpy9qUjmD9ilj0w6HpBM/x142ipA+dKr4DUG2v+1rboj+etPQ==
X-MS-Exchange-AntiSpam-MessageData: SwnJgDwlYxc5g7UNC3vx8VcTwsQI7tqcIDtTnztx/h4qWH6eYaArwXY7C986BPO0nnb+RzmuwTVTg27bQhO+AT5/xW9ZGZn1KRoIXfwOV7GWb2CM9cUIdQ10iPwr175ZYnLE2lspLFoKc7UZ/NJbBA==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a878cee-13fb-4513-e8fc-08d7aa54fbf8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 16:03:47.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RjiipjT2oVkpybvfNngt1YOm83+w49qUmkgYyTTf4EprNtH1JRlw7uMzy1g99eax/FuMH8mJGVIY9geEWxMQk+9W1d2vqJX0ZVbEl3wc/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_080352_931421_3134CCBE 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8hCgpPbiAwNS8wMi8yMDIwIDE2OjMyLCBKb2huIEdhcnJ5IHdyb3RlOgo+IE9uIDE0LzAx
LzIwMjAgMTM6NDcsIEFsZXhhbmRlciBYIFN2ZXJkbGluIHdyb3RlOgo+PiBGcm9tOiBBbGV4YW5k
ZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBub2tpYS5jb20+Cj4+Cj4+IFNwYW5zaW9u
IFMyNUZTLVMgZmFtaWx5IGhhcyBhbiBpc3N1ZSBpbiBCYXNpYyBGbGFzaCBQYXJhbWV0ZXIgVGFi
bGU6Cj4+IERXT1JELTExIGJpdHMgNy00IHNwZWNpZnkgd3JpdGUgcGFnZSBzaXplIDUxMiBieXRl
cy4gSW4gcmVhbGl0eSB0aGlzCj4+IGlzIGNvbmZpZ3VyYWJsZSBpbiB0aGUgbm9uLXZvbGF0aWxl
IENSM05WIHJlZ2lzdGVyIGFuZCBldmVuIGZhY3RvcnkKPj4gZGVmYXVsdCBjb25maWd1cmF0aW9u
IGlzICJ3cmFwIGF0IDI1NiBieXRlcyIuIFNvIGJsaW5kIHJlbHlpbmcgb24gQkZQVAo+PiBicmVh
a3Mgd3JpdGUgb3BlcmF0aW9uIG9uIHRoZXNlIEZsYXNoZXMuCj4+Cj4+IEFsbCB0aGlzIHN0b3J5
IGlzIHZlbmRvci1zcGVjaWZpYywgc28gYWRkIHRoZSBjb3JyZXNwb25kaW5nIGZpeHVwIGhvb2sK
Pj4gd2hpY2ggZmlyc3QgcmVzdG9yZXMgdGhlIHNhZmUgcGFnZSBzaXplIG9mIDI1NiBieXRlcyBm
cm9tCj4+IHN0cnVjdCBmbGFzaF9pbmZvIGJ1dCBjaGVja3MgaXMgbW9yZSBwZXJmb3JtYW50IDUx
MiBieXRlcyBjb25maWd1cmF0aW9uCj4+IGlzIGFjdGl2ZSBhbmQgYWRqdXN0cyB0aGUgcGFnZV9z
aXplIGFjY29yZGluZ2x5LgoKWy4uLl0KCj4gT25lIG9mIG15IGRldiBib2FyZHMgaGFzIHBhcnQg
czI1ZmwxMjlwMSwgc28gSSB3b3VsZCBsaWtlIHRvIHRyeSB0aGlzIHBhdGNoLiBIb3dldmVyIGl0
IGRvZXMgbm90IGFwcGx5LiBBbnkgY2hhbmNlIHlvdSBjb3VsZCByZXNlbmQ/CgpJdCB3YXMgYmFz
ZWQgb24gc3BpLW5vci9uZXh0IGJyYW5jaCBvZiBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9sMi1t
dGQuZ2l0IGFuZCBhcyBJIGNhbgpzZWUsIHRoaXMgYnJhbmNoIGlzIHVuY2hhbmdlZCBmcm9tIHRo
ZSBsYXN0IHBhdGNoIHN1Ym1pc3Npb24uCkkgY2FuIHJlLXNlbmQgaWYgb25lIG9mIHRoZSBtYWlu
dGFpbmVycyBjb25maXJtcyB0aGlzIHdhc24ndCB0aGUgY29ycmVjdCBicmFuY2gKdG8gYmFzZSBv
bi4KClsuLi5dCgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBGaXhlczogZjM4NGIz
NTJjICgibXRkOiBzcGktbm9yOiBwYXJzZSBTZXJpYWwgRmxhc2ggRGlzY292ZXJhYmxlIFBhcmFt
ZXRlcnMgKFNGRFApIHRhYmxlcyIpCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxp
biA8YWxleGFuZGVyLnN2ZXJkbGluQG5va2lhLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tCj4+IMKgIGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaMKgwqAgfMKgIDUgKysrKysK
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYwo+PiBpbmRleCA3MzE3MmQ3Li4xOGY4NzA1IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+PiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL3NwaS1ub3IuYwo+PiBAQCAtMTcxMSw2ICsxNzExLDM5IEBAIHN0YXRpYyBzdHJ1
Y3Qgc3BpX25vcl9maXh1cHMgbXgyNWwyNTYzNV9maXh1cHMgPSB7Cj4+IMKgwqDCoMKgwqAgLnBv
c3RfYmZwdCA9IG14MjVsMjU2MzVfcG9zdF9iZnB0X2ZpeHVwcywKPj4gwqAgfTsKPj4gwqAgKy8q
IFNwYW5zaW9uIFMyNUZTLVMgU0ZEUCB3b3JrYXJvdW5kcyAqLwo+PiArc3RhdGljIGludCBzMjVm
c19zX3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwKPj4gK8KgwqDCoCBjb25z
dCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPj4gK8KgwqDCoCBj
b25zdCBzdHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0LAo+PiArwqDCoMKgIHN0cnVjdCBzcGlfbm9yX2Zs
YXNoX3BhcmFtZXRlciAqcGFyYW1zKQo+PiArewo+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBmbGFz
aF9pbmZvICppbmZvID0gbm9yLT5pbmZvOwo+PiArwqDCoMKgIHU4IHJlYWRfb3Bjb2RlLCBidWY7
Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIC8qIERlZmF1bHQgaXMgc2FmZSAq
Lwo+PiArwqDCoMKgIHBhcmFtcy0+cGFnZV9zaXplID0gaW5mby0+cGFnZV9zaXplOwo+PiArCj4+
ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogQnV0IGlzIHRoZSBjaGlwIGNvbmZpZ3VyZWQgZm9y
IG1vcmUgcGVyZm9ybWFudCA1MTIgYnl0ZXMgd3JpdGUgcGFnZQo+PiArwqDCoMKgwqAgKiBzaXpl
Pwo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCByZWFkX29wY29kZSA9IG5vci0+cmVhZF9vcGNv
ZGU7Cj4+ICsKPj4gK8KgwqDCoCBub3ItPnJlYWRfb3Bjb2RlID0gU1BJTk9SX09QX1JEQVI7Cj4+
ICvCoMKgwqAgcmV0ID0gbm9yLT5yZWFkKG5vciwgU1BJTk9SX1JFR19DUjNWLCAxLCAmYnVmKTsK
PiAKPiBzdHJ1Y3Qgc3BpX25vciBoYXMgbm8gbWVtYmVyIC5yZWFkIEFGQUlDUy4KPiAKPj4gK8Kg
wqDCoCBpZiAoIXJldCAmJiAoYnVmICYgQ1IzVl8wMkhfVikpCj4+ICvCoMKgwqDCoMKgwqDCoCBw
YXJhbXMtPnBhZ2Vfc2l6ZSA9IDUxMjsKPj4gKwo+PiArwqDCoMKgIG5vci0+cmVhZF9vcGNvZGUg
PSByZWFkX29wY29kZTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgczI1ZnNfc19maXh1cHMgPSB7Cj4+
ICvCoMKgwqAgLnBvc3RfYmZwdCA9IHMyNWZzX3NfcG9zdF9iZnB0X2ZpeHVwcywKPj4gK307Cj4+
ICsKPj4gwqAgLyogTk9URTogZG91YmxlIGNoZWNrIGNvbW1hbmQgc2V0cyBhbmQgbWVtb3J5IG9y
Z2FuaXphdGlvbiB3aGVuIHlvdSBhZGQKPj4gwqDCoCAqIG1vcmUgbm9yIGNoaXBzLsKgIFRoaXMg
Y3VycmVudCBsaXN0IGZvY3Vzc2VzIG9uIG5ld2VyIGNoaXBzLCB3aGljaAo+PiDCoMKgICogaGF2
ZSBiZWVuIGNvbnZlcmdpbmcgb24gY29tbWFuZCBzZXRzIHdoaWNoIGluY2x1ZGluZyBKRURFQyBJ
RC4KPj4gQEAgLTE5MDMsNyArMTkzNiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5m
byBzcGlfbm9yX2lkc1tdID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9S
X0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sCj4+IMKgwqDCoMKg
wqAgeyAiczI1ZmwxMjhzMSIsIElORk82KDB4MDEyMDE4LCAweDRkMDE4MCwgNjQgKiAxMDI0LCAy
NTYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJ
X05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwKPj4gLcKgwqDCoCB7ICJzMjVmbDI1NnMwIiwg
SU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgsIFVTRV9DTFNSKSB9LAo+PiAr
wqDCoMKgIHsgInMyNWZsMjU2czAiLCBJTkZPKDB4MDEwMjE5LCAweDRkMDAsIDI1NiAqIDEwMjQs
IDEyOCwgVVNFX0NMU1IpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmczI1
ZnNfc19maXh1cHMsIH0sCj4+IMKgwqDCoMKgwqAgeyAiczI1ZmwyNTZzMSIsIElORk8oMHgwMTAy
MTksIDB4NGQwMSzCoCA2NCAqIDEwMjQsIDUxMiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9S
X1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LAo+PiDCoMKgwqDCoMKgIHsgInMyNWZsNTEycyIswqAg
SU5GTzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAyNTYgKiAxMDI0LCAyNTYsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfAo+
PiBAQCAtMTkxMyw3ICsxOTQ3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNw
aV9ub3JfaWRzW10gPSB7Cj4+IMKgwqDCoMKgwqAgeyAiczI1c2wxMjgwMCIsIElORk8oMHgwMTIw
MTgsIDB4MDMwMCwgMjU2ICogMTAyNCzCoCA2NCwgMCkgfSwKPj4gwqDCoMKgwqDCoCB7ICJzMjVz
bDEyODAxIiwgSU5GTygweDAxMjAxOCwgMHgwMzAxLMKgIDY0ICogMTAyNCwgMjU2LCAwKSB9LAo+
PiDCoMKgwqDCoMKgIHsgInMyNWZsMTI5cDAiLCBJTkZPKDB4MDEyMDE4LCAweDRkMDAsIDI1NiAq
IDEwMjQswqAgNjQsIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0Vf
Q0xTUikgfSwKPj4gLcKgwqDCoCB7ICJzMjVmbDEyOXAxIiwgSU5GTygweDAxMjAxOCwgMHg0ZDAx
LMKgIDY0ICogMTAyNCwgMjU2LCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFE
IHwgVVNFX0NMU1IpIH0sCj4+ICvCoMKgwqAgeyAiczI1ZmwxMjlwMSIsIElORk8oMHgwMTIwMTgs
IDB4NGQwMSzCoCA2NCAqIDEwMjQsIDI1NiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FV
QURfUkVBRCB8IFVTRV9DTFNSKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZml4dXBzID0g
JnMyNWZzX3NfZml4dXBzLCB9LAo+PiDCoMKgwqDCoMKgIHsgInMyNXNsMDA0YSIswqAgSU5GTygw
eDAxMDIxMizCoMKgwqDCoMKgIDAswqAgNjQgKiAxMDI0LMKgwqAgOCwgMCkgfSwKPj4gwqDCoMKg
wqDCoCB7ICJzMjVzbDAwOGEiLMKgIElORk8oMHgwMTAyMTMswqDCoMKgwqDCoCAwLMKgIDY0ICog
MTAyNCzCoCAxNiwgMCkgfSwKPj4gwqDCoMKgwqDCoCB7ICJzMjVzbDAxNmEiLMKgIElORk8oMHgw
MTAyMTQswqDCoMKgwqDCoCAwLMKgIDY0ICogMTAyNCzCoCAzMiwgMCkgfSwKPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaS1u
b3IuaAo+PiBpbmRleCBiM2QzNjBiLi4yMjJlZWU5IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L210ZC9zcGktbm9yLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCj4+
IEBAIC0xMTQsNiArMTE0LDcgQEAKPj4gwqAgLyogVXNlZCBmb3IgU3BhbnNpb24gZmxhc2hlcyBv
bmx5LiAqLwo+PiDCoCAjZGVmaW5lIFNQSU5PUl9PUF9CUldSwqDCoMKgwqDCoMKgwqAgMHgxN8Kg
wqDCoCAvKiBCYW5rIHJlZ2lzdGVyIHdyaXRlICovCj4+IMKgICNkZWZpbmUgU1BJTk9SX09QX0NM
U1LCoMKgwqDCoMKgwqDCoCAweDMwwqDCoMKgIC8qIENsZWFyIHN0YXR1cyByZWdpc3RlciAxICov
Cj4+ICsjZGVmaW5lIFNQSU5PUl9PUF9SREFSwqDCoMKgwqDCoMKgwqAgMHg2NcKgwqDCoCAvKiBS
ZWFkIEFueSBSZWdpc3RlciAqLwo+PiDCoCDCoCAvKiBVc2VkIGZvciBNaWNyb24gZmxhc2hlcyBv
bmx5LiAqLwo+PiDCoCAjZGVmaW5lIFNQSU5PUl9PUF9SRF9FVkNSwqDCoMKgwqDCoCAweDY1wqDC
oMKgIC8qIFJlYWQgRVZDUiByZWdpc3RlciAqLwo+PiBAQCAtMTQ5LDYgKzE1MCwxMCBAQAo+PiDC
oCAvKiBTdGF0dXMgUmVnaXN0ZXIgMiBiaXRzLiAqLwo+PiDCoCAjZGVmaW5lIFNSMl9RVUFEX0VO
X0JJVDfCoMKgwqAgQklUKDcpCj4+IMKgICsvKiBVc2VkIGZvciBTcGFuc2lvbiBmbGFzaGVzIFJE
QVIgY29tbWFuZCBvbmx5LiAqLwo+PiArI2RlZmluZSBTUElOT1JfUkVHX0NSM1bCoMKgwqDCoMKg
wqDCoCAweDgwMDAwNAo+PiArI2RlZmluZSBDUjNWXzAySF9WwqDCoMKgwqDCoMKgwqAgQklUKDQp
wqDCoMKgIC8qIFBhZ2UgQnVmZmVyIFdyYXAgKi8KPj4gKwo+PiDCoCAvKiBTdXBwb3J0ZWQgU1BJ
IHByb3RvY29scyAqLwo+PiDCoCAjZGVmaW5lIFNOT1JfUFJPVE9fSU5TVF9NQVNLwqDCoMKgIEdF
Tk1BU0soMjMsIDE2KQo+PiDCoCAjZGVmaW5lIFNOT1JfUFJPVE9fSU5TVF9TSElGVMKgwqDCoCAx
Ngo+Pgo+IAo+IAoKLS0gCkJlc3QgcmVnYXJkcywKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
