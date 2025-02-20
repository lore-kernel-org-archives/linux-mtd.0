Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B6C021B2
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOlKlUNxR8IfWEhe+hWLEn0Sm+hfbWZEt12AE8Hy33w=; b=2yNAPwLp6IzY3YZTTVCIp6H+wt
	SkqmMmkKpxX9brbVulKCmartPv0+xaQ/gy5WXLKpGMpWb6Qum3tLCFAxfw2PH2I3wg/tsLpZMos7i
	JW7hde8lXFB8JSfzahOq0pau7zf50VSfDQ/aDdt7nzRXdweynsu1KaIwVMuSxBBiEgLZpjR98Zknr
	5OItIQ6y+tDsrPRSiBRF4sOYqKuwFvFFg8/581jdkXcuVK/WwbzaZqB25V6rlMGkaeYp6bt1kXd/L
	itphBqyW+vWGa+SIfu1H/s5iNKNX9JsQOrxL4gjPKncQmdd/rh5cpiRT2JrxXYz4h0DvRkqtfyiml
	0FmzmCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2H0-0000000HScV-3rgR;
	Thu, 20 Feb 2025 08:51:10 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Ei-0000000HRya-1UEo
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 08:48:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Yz6MH2G4Pzd2gk
	for <linux-mtd@lists.infradead.org>; Thu, 20 Feb 2025 16:47:07 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 86FA118009E
	for <linux-mtd@lists.infradead.org>; Thu, 20 Feb 2025 16:48:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Feb 2025 16:48:39 +0800
Subject: Re: [PATCH mtd-utils v2] tests: add test_DATA to EXTRA_DIST
To: Michael Olbrich <m.olbrich@pengutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <20250220083836.1033367-1-m.olbrich@pengutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <206c0c41-21aa-298b-ba35-202a3613d8ed@huawei.com>
Date: Thu, 20 Feb 2025 16:48:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250220083836.1033367-1-m.olbrich@pengutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_004848_543388_C6C098A0 
X-CRM114-Status: GOOD (  15.40  )
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

1NogMjAyNS8yLzIwIDE2OjM4LCBNaWNoYWVsIE9sYnJpY2gg0LS1wDoKPiBPdGhlcndpc2UsIHRo
ZSB0ZXN0IGZpbGVzIGFyZSBtaXNzaW4gaW4gdGhlIHRhcmJhbGwgYW5kIGJ1aWxkaW5nIGZhaWxz
Cj4gd2l0aDoKPiAKPiBtYWtlWzFdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAndGVzdHMv
dWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzL2dvb2QuZ3onLCBuZWVkZWQgYnkgJ2FsbC1hbScuICBT
dG9wLgo+IAo+IHVubGVzcyAtLXdpdGhvdXQtdGVzdHMgaXMgdXNlcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIE9sYnJpY2ggPG0ub2xicmljaEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAK
PiBDaGFuZ2VzIGluIHYyOgo+ICAgLSBpbnRyb2R1Y2UgYSBuZXcgdmFyaWFibGUgZm9yIHRoZSB0
ZXN0IGZpbGVzCj4gICAtIGV4dGVuZCBFWFRSQV9ESVNUIGluIHRlc3RzL3ViaWZzX3Rvb2xzLXRl
c3RzL01ha2Vtb2R1bGUuYW0gaW5zdGVhZCBvZgo+ICAgICB0aGUgdG9wbGV2ZWwgTWFrZWZpbGUu
YW0KPiAKPiBJJ3ZlIHVzZWQgYSBkaWZmZXJlbnQgbmFtZSBmb3IgdGhlIG5ldyB2YXJpYWJsZSB0
byBtYWtlIGlzIGxlc3MgZ2VuZXJpYy4KPiAKPiAgIHRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL01h
a2Vtb2R1bGUuYW0gfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3ViaWZzX3Rvb2xzLXRlc3Rz
L01ha2Vtb2R1bGUuYW0gYi90ZXN0cy91Ymlmc190b29scy10ZXN0cy9NYWtlbW9kdWxlLmFtCj4g
aW5kZXggMTcxNTc1N2UzMTg4Li40Y2UzZjMzOTM0NDggMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvdWJp
ZnNfdG9vbHMtdGVzdHMvTWFrZW1vZHVsZS5hbQo+ICsrKyBiL3Rlc3RzL3ViaWZzX3Rvb2xzLXRl
c3RzL01ha2Vtb2R1bGUuYW0KPiBAQCAtMTAsNyArMTAsNyBAQCB0ZXN0X1NDUklQVFMgKz0gXAo+
ICAgCXRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL2ZzY2tfdGVzdHMvZnNja19iYWRfaW1hZ2Uuc2gg
XAo+ICAgCXRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL21rZnNfdGVzdHMvYnVpbGRfZnNfZnJvbV9k
aXIuc2gKPiAgIAo+IC10ZXN0X0RBVEEgKz0gXAo+ICtURVNUX0lNQUdFX0ZJTEVTID0gXAo+ICAg
CXRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL2ltYWdlcy9nb29kLmd6IFwKPiAgIAl0ZXN0cy91Ymlm
c190b29scy10ZXN0cy9pbWFnZXMvc2JfZmFub3V0Lmd6IFwKPiAgIAl0ZXN0cy91Ymlmc190b29s
cy10ZXN0cy9pbWFnZXMvc2JfZm10X3ZlcnNpb24uZ3ogXAo+IEBAIC02NCwzICs2NCw2IEBAIHRl
c3RfREFUQSArPSBcCj4gICAJdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzL2Rpcl9sb3N0
X25vdF9yZWNvdmVyLmd6IFwKPiAgIAl0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvcm9v
dF9kaXIuZ3ogXAo+ICAgCXRlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL2ltYWdlcy9lbXB0eV90bmMu
Z3oKPiArCj4gK3Rlc3RfREFUQSArPSAkKFRFU1RfSU1BR0VfRklMRVMpCj4gK0VYVFJBX0RJU1Qg
Kz0kKFRFU1RfSU1BR0VfRklMRVMpCgpFWFRSQV9ESVNUICs9ICQoVEVTVF9JTUFHRV9GSUxFUykK
QSB3aGl0ZXNwYWNlIGlzIG5lZWRlZCBoZXJlLgo+IAoKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
