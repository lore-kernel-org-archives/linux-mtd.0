Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A43CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 11:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcUkM9RlQC39+xb2mGywv0/8kKBZApgvNnLlavH6yRM=; b=F1ZpxH/uS7xYNXRfeNjpq5lgb7
	xfuwkSzoemOJa6ETqRqPp+PamHqWmC68kPCcSVVou8rUUB+tTMOtvjb1AcW8RCUm49F9kxIf3fHQd
	X9WETz7ieKXHCsGMeMjz/RNOttwt7tj4wGmxEkALEEgxWuzefusQDHywZPC8oMM2VxTVAf9icwdZK
	BM3EiisslrHze31u/vuF8IDzjIHCH3pKhi67pykak5yqTRF2XDTTKLcNkWWT0GObRxuDzkJ+ALOH9
	w3+MwBVgpC/qocbrLJenTGbqm6oBobghUIuF0DtcYk+78S+lwZ89UxoAPAEGQVETVpz4O9TEjiMAH
	aIAIh0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxWH-0000000FNjZ-2Z1f;
	Wed, 14 Oct 2026 11:51:41 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxWC-0000000FNiz-1PJS
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 11:51:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xVlOyYaOJuVGaDfnk3Cn8S4up3VyrQrAPSaBBvMWJK4=;
	b=NRQ2Wyi38AJGPQbJ80NuIBLnWk6SwO8PaLyJaV87efjwedpEJ9wjoxegROCOJ8+sMuMWLGkWu
	Rm4/b05wv/F91TtAb5MycVTFxtVEUQvci6R9jyHnyeOMNTzXjiNJSTCZN3PILjcWfI1v2zeSqLV
	B62e3eM4uUujj0AqiqJDPNY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j4Tkr1HPxz12LD9;
	Wed, 14 Oct 2026 19:39:32 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 24D014056E;
	Wed, 14 Oct 2026 19:51:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 14 Oct 2026 19:51:21 +0800
Subject: Re: [PATCH 09/11] ubifs: sysfs: Use kset_create_and_add() for
 ubifs_kset
To: Ian Rogers <irogers@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees
 Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jonathan Corbet
	<corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, Yoshinori Sato
	<ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar
	<viresh.kumar@linaro.org>, David Teigland <teigland@redhat.com>, Alexander
 Aring <aahringo@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
	<driver-core@lists.linux.dev>, <llvm@lists.linux.dev>,
	<linux-hardening@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<gfs2@lists.linux.dev>, <xen-devel@lists.xenproject.org>,
	<linux-s390@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-10-irogers@google.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3f6e7a0d-ba41-89dd-012f-9ac24e12da9d@huawei.com>
Date: Wed, 14 Oct 2026 19:51:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20261013223946.1836757-10-irogers@google.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_045138_257512_A3A96AFF 
X-CRM114-Status: GOOD (  18.47  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjYvMTAvMTQgNjozOSwgSWFuIFJvZ2VycyDlhpnpgZM6Cj4gdWJpZnNfa3NldCB3YXMg
YSBzdGF0aWMgc3RydWN0IGtzZXQgdXNpbmcgYSBjdXN0b20gdWJpZnNfa3R5cGUgdGhhdAo+IGhh
ZCBubyBkZWZhdWx0X2dyb3VwcyBhbmQgbm8gLnJlbGVhc2UgY2FsbGJhY2suIFdpdGgKPiBDT05G
SUdfREVCVUdfS09CSkVDVF9SRUxFQVNFPXksIHVubG9hZGluZyB0aGUgdWJpZnMgbW9kdWxlIHdo
aWxlIGRlbGF5ZWQKPiBrb2JqZWN0IHJlbGVhc2UgaXMgcGVuZGluZyBjYXVzZXMgYSB1c2UtYWZ0
ZXItZnJlZSBvbiB0aGUgc3RhdGljIGtzZXQuCj4gCj4gUmVwbGFjZSB0aGUgc3RhdGljIHViaWZz
X2tzZXQgYW5kIGVtcHR5IHViaWZzX2t0eXBlIHdpdGggYSBkeW5hbWljYWxseQo+IGFsbG9jYXRl
ZCBrc2V0IHZpYSBrc2V0X2NyZWF0ZV9hbmRfYWRkKCkuCj4gCj4gRml4ZXM6IDIwM2E1NWYwNGY2
NiAoInViaWZzOiBGaXggbWVtb3J5IGxlYWsgaW4gdWJpZnNfc3lzZnNfaW5pdCgpIikKPiBBc3Np
c3RlZC1ieTogQW50aWdyYXZpdHk6Z2VtaW5pLTMuMS1wcm8KPiBTaWduZWQtb2ZmLWJ5OiBJYW4g
Um9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9zeXNmcy5jIHwg
MjQgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKClRlc3RlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N5c2ZzLmMgYi9mcy91Ymlm
cy9zeXNmcy5jCj4gaW5kZXggZGJmOTY3ZGNmMjZlLi5lMjA5MzFlM2E2MmYgMTAwNjQ0Cj4gLS0t
IGEvZnMvdWJpZnMvc3lzZnMuYwo+ICsrKyBiL2ZzL3ViaWZzL3N5c2ZzLmMKPiBAQCAtODAsMTMg
KzgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX3R5cGUgdWJpZnNfc2Jfa3R5cGUgPSB7
Cj4gICAJLnJlbGVhc2UJPSB1Ymlmc19zYl9yZWxlYXNlLAo+ICAgfTsKPiAgIAo+IC1zdGF0aWMg
Y29uc3Qgc3RydWN0IGtvYmpfdHlwZSB1Ymlmc19rdHlwZSA9IHsKPiAtCS5zeXNmc19vcHMJPSAm
dWJpZnNfYXR0cl9vcHMsCj4gLX07Cj4gLQo+IC1zdGF0aWMgc3RydWN0IGtzZXQgdWJpZnNfa3Nl
dCA9IHsKPiAtCS5rb2JqCT0gey5rdHlwZSA9ICZ1Ymlmc19rdHlwZX0sCj4gLX07Cj4gK3N0YXRp
YyBzdHJ1Y3Qga3NldCAqdWJpZnNfa3NldDsKPiAgIAo+ICAgaW50IHViaWZzX3N5c2ZzX3JlZ2lz
dGVyKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgewo+IEBAIC0xMDcsNyArMTAxLDcgQEAgaW50
IHViaWZzX3N5c2ZzX3JlZ2lzdGVyKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgCQlnb3RvIG91
dF9mcmVlOwo+ICAgCX0KPiAgIAo+IC0JYy0+a29iai5rc2V0ID0gJnViaWZzX2tzZXQ7Cj4gKwlj
LT5rb2JqLmtzZXQgPSB1Ymlmc19rc2V0Owo+ICAgCWluaXRfY29tcGxldGlvbigmYy0+a29ial91
bnJlZ2lzdGVyKTsKPiAgIAo+ICAgCXJldCA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKCZjLT5rb2Jq
LCAmdWJpZnNfc2Jfa3R5cGUsIE5VTEwsCj4gQEAgLTEzOSwxOCArMTMzLDE0IEBAIHZvaWQgdWJp
ZnNfc3lzZnNfdW5yZWdpc3RlcihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIAo+ICAgaW50IF9f
aW5pdCB1Ymlmc19zeXNmc19pbml0KHZvaWQpCj4gICB7Cj4gLQlpbnQgcmV0Owo+ICsJdWJpZnNf
a3NldCA9IGtzZXRfY3JlYXRlX2FuZF9hZGQoInViaWZzIiwgTlVMTCwgZnNfa29iaik7Cj4gKwlp
ZiAoIXViaWZzX2tzZXQpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiAtCWtvYmplY3Rfc2V0
X25hbWUoJnViaWZzX2tzZXQua29iaiwgInViaWZzIik7Cj4gLQl1Ymlmc19rc2V0LmtvYmoucGFy
ZW50ID0gZnNfa29iajsKPiAtCXJldCA9IGtzZXRfcmVnaXN0ZXIoJnViaWZzX2tzZXQpOwo+IC0J
aWYgKHJldCkKPiAtCQlrc2V0X3B1dCgmdWJpZnNfa3NldCk7Cj4gLQo+IC0JcmV0dXJuIHJldDsK
PiArCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gICB2b2lkIHViaWZzX3N5c2ZzX2V4aXQodm9pZCkK
PiAgIHsKPiAtCWtzZXRfdW5yZWdpc3RlcigmdWJpZnNfa3NldCk7Cj4gKwlrc2V0X3VucmVnaXN0
ZXIodWJpZnNfa3NldCk7Cj4gICB9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
