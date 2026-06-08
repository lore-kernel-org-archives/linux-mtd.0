Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8417CD8C92
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 04:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGkDcTufcZVG3s7aIfr6JbOdwA3RZspF40T90nxSLKA=; b=xH2dYSIkNiRKzt2Woa7YWp6601
	z4S14vzHzwIhO/L/LLjVEhRFHFQKSqH5KCZxi76fukhTr2YOuC2aUUj26bf7onT4tasry449EgFH4
	VBoNrdhs6JxHHtDEF706K40IB3b2k1AwN5x41Ypn6avT4emYeoNm9dv2jYXoUaO883n4RRC9eYou5
	6o7qgcas/0xdp3HLdpGWZaRNV0DXNgAFqWq/BJodWGBKbgmnr455yQ1QxslIj0ITAMIATMv95t1nu
	j6b1c0XuehVJHoKlhrdWOA74Ik5Oku89Yv3LaNeoJwXYz5k7NDKbsNEFrYKPOyr/LtaQg10Ko2KYD
	H4Zc8i2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRrc-00000002nuQ-0hdW;
	Mon, 08 Jun 2026 04:45:28 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRrY-00000002nti-1a9x
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 04:45:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GPBQVFiZqsGhvAZlvcHfu4qK7Re0Y1M+TiyS11nNpL0=;
	b=uWvOZujX7vQs3FFyvLnOK83h2Je6WdPkFWDyhZnsDxuH281eLEKbrI6jffgzi1xJ9+7dXbgGV
	cpLh2ViQHH1l/wMU/Lg7JWSZRIi2RnHTIVH9FDD1q6TrG1z4t9eYZwIHsXWHcABnTqLhXr8e1ZB
	NFz8dL0LquVHNOa3nzU0i7s=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gYfQb3xhlz12LGP;
	Mon,  8 Jun 2026 12:37:11 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 80D5F40561;
	Mon,  8 Jun 2026 12:45:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Jun 2026 12:45:03 +0800
Subject: Re: [PATCH v1] mtd: ubi: Fix rollback for explicit UBI device numbers
To: Yuho Choi <dbgh9129@gmail.com>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260608040639.2616638-1-dbgh9129@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <52a0fcca-57ab-12b4-63d1-cdd648bf8254@huawei.com>
Date: Mon, 8 Jun 2026 12:45:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260608040639.2616638-1-dbgh9129@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_214524_883921_A09BE9C6 
X-CRM114-Status: GOOD (  16.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi82LzggMTI6MDYsIFl1aG8gQ2hvaSDQtLXAOgo+IHViaV9pbml0X2F0dGFjaCgpIHJv
bGxzIGJhY2sgbW9kdWxlIGluaXRpYWxpemF0aW9uIGZhaWx1cmVzIGJ5IHNjYW5uaW5nCj4gdWJp
X2RldmljZXNbMC4uaS0xXSwgd2hlcmUgaSBpcyB0aGUgbXRkPSBwYXJhbWV0ZXIgaW5kZXguIFRo
YXQgYXNzdW1lcwo+IHRoZSBwYXJhbWV0ZXIgaW5kZXggbWF0Y2hlcyB0aGUgVUJJIGRldmljZSBu
dW1iZXIuCj4gCj4gVGhhdCBhc3N1bXB0aW9uIGlzIG5vdCB0cnVlIHdoZW4gbXRkPSBzcGVjaWZp
ZXMgYW4gZXhwbGljaXQgdWJpX251bS4gQQo+IHN1Y2Nlc3NmdWxseSBhdHRhY2hlZCBkZXZpY2Ug
Y2FuIGJlIHN0b3JlZCBhdCBhIGhpZ2hlciB1YmlfZGV2aWNlc1tdCj4gc2xvdCwgYW5kIGEgbGF0
ZXIgZmFpbHVyZSBjYW4gbWlzcyBpdCBkdXJpbmcgcm9sbGJhY2suCj4gCj4gU2NhbiB0aGUgZnVs
bCB1YmlfZGV2aWNlc1tdIGFycmF5IGFuZCBkZXRhY2ggYnkgdGhlIGFjdHVhbCBhcnJheSBpbmRl
eCwKPiBtYXRjaGluZyB0aGUgd2F5IFVCSSBkZXZpY2VzIGFyZSBzdG9yZWQuCj4gCj4gRml4ZXM6
IDgzZmY1OWEwNjY2MyAoIlVCSTogc3VwcG9ydCB1YmlfbnVtIG9uIG10ZC51YmkgY29tbWFuZCBs
aW5lIikKPiBTaWduZWQtb2ZmLWJ5OiBZdWhvIENob2kgPGRiZ2g5MTI5QGdtYWlsLmNvbT4KPiAt
LS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDY3NGFkODc4
MDlkZi4uOTBjNWM4M2Q5MGUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTMxNywxMCArMTMxNywxMCBA
QCBzdGF0aWMgaW50IF9faW5pdCB1YmlfaW5pdF9hdHRhY2godm9pZCkKPiAgIAlyZXR1cm4gMDsK
PiAgIAo+ICAgb3V0X2RldGFjaDoKPiAtCWZvciAoayA9IDA7IGsgPCBpOyBrKyspCj4gKwlmb3Ig
KGsgPSAwOyBrIDwgVUJJX01BWF9ERVZJQ0VTOyBrKyspCj4gICAJCWlmICh1YmlfZGV2aWNlc1tr
XSkgewo+ICAgCQkJbXV0ZXhfbG9jaygmdWJpX2RldmljZXNfbXV0ZXgpOwo+IC0JCQl1YmlfZGV0
YWNoX210ZF9kZXYodWJpX2RldmljZXNba10tPnViaV9udW0sIDEpOwo+ICsJCQl1YmlfZGV0YWNo
X210ZF9kZXYoaywgMSk7Cj4gICAJCQltdXRleF91bmxvY2soJnViaV9kZXZpY2VzX211dGV4KTsK
PiAgIAkJfQo+ICAgCXJldHVybiBlcnI7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
