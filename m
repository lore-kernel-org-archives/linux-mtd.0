Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5388C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 01:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zik+/n17ceqNEe03y7BQNz+rEwoJZysFiDjavcGd4o=; b=MJ1eikBreUzZagoW9nevicUy5e
	vDJ4SIiEOzGGN9tXnA1joLXF8ocjMBK6GqCQUEnYXvRlF53IhO1D0OeGQ9EGKJ8jFTYBcMQLkQJiJ
	hgT1ubgS73XJjKfausm8zTg67RdKMJrF1KJ8J0N2+MV3MOkzm6ojZoNtOwG32E2lD/2AGhKxSODaB
	mXKq86taUrcp6ny9nBb9t/H06W75Juo6iTX+SCh8Fit/V9rQndF4F2O0B7JeMUZqlpSkG1tqMIFNA
	WHdp9IQygUctbD9L58n0azryL3KAR7qypYvWoeM/CJZfEx9qf9euUPm3uuXQG54vc4UeSxA1F+qTm
	ZPwuq6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUexN-00Eevr-Qe; Thu, 17 Mar 2022 01:29:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUexJ-00Eeuc-S7
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 01:29:35 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KJqJm1D3pzfYpf;
 Thu, 17 Mar 2022 09:27:52 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 09:29:19 +0800
Subject: Re: [PATCH -next] jffs2: fix use-after-free in
 jffs2_clear_xattr_subsystem
To: Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, christian brauner
 <christian.brauner@ubuntu.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, yukuai3 <yukuai3@huawei.com>,
 stable <stable@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, Baokun Li
 <libaokun1@huawei.com>
References: <20211228125430.1880252-1-libaokun1@huawei.com>
 <8a175ec6-1555-8575-1f03-0002efac1740@huawei.com>
 <1891491465.152789.1647468069089.JavaMail.zimbra@nod.at>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <2eb626fe-3ab2-2830-12b7-0de74ddd9258@huawei.com>
Date: Thu, 17 Mar 2022 09:29:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1891491465.152789.1647468069089.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_182934_281078_1101143F 
X-CRM114-Status: GOOD (  11.88  )
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

5ZyoIDIwMjIvMy8xNyA2OjAxLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAibGliYW9rdW4iIDxsaWJhb2t1bjFAaHVh
d2VpLmNvbT4KPj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiRGF2aWQgV29vZGhv
dXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJjaHJpc3RpYW4gYnJhdW5lciIKPj4gPGNocmlz
dGlhbi5icmF1bmVyQHVidW50dS5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+PiA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz4KPj4gQ0M6ICJ5dWt1YWkzIiA8eXVrdWFpM0BodWF3ZWkuY29tPiwgInN0YWJsZSIgPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+LCAiSHVsayBSb2JvdCIgPGh1bGtjaUBodWF3ZWkuY29tPiwg
ImxpYmFva3VuIgo+PiA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4+IEdlc2VuZGV0OiBEb25uZXJz
dGFnLCAxMC4gTcOkcnogMjAyMiAwOTozNToxOAo+PiBCZXRyZWZmOiBSZTogW1BBVENIIC1uZXh0
XSBqZmZzMjogZml4IHVzZS1hZnRlci1mcmVlIGluIGpmZnMyX2NsZWFyX3hhdHRyX3N1YnN5c3Rl
bQo+PiBBIGdlbnRsZSBwaW5nLCBzb3JyeSBmb3IgdGhlIG5vaXNlLgo+Pgo+PiDlnKggMjAyMS8x
Mi8yOCAyMDo1NCwgQmFva3VuIExpIOWGmemBkzoKPj4+IFdoZW4gd2UgbW91bnQgYSBqZmZzMiBp
bWFnZSwgYXNzdW1lIHRoYXQgdGhlIGZpcnN0IGZldyBibG9ja3Mgb2YKPj4+IHRoZSBpbWFnZSBh
cmUgbm9ybWFsIGFuZCBjb250YWluIGF0IGxlYXN0IG9uZSB4YXR0ci1yZWxhdGVkIGlub2RlLAo+
Pj4gYnV0IHRoZSBuZXh0IGJsb2NrIGlzIGFibm9ybWFsLiBBcyBhIHJlc3VsdCwgYW4gZXJyb3Ig
aXMgcmV0dXJuZWQKPj4+IGluIGpmZnMyX3NjYW5fZXJhc2VibG9jaygpLiBqZmZzMl9jbGVhcl94
YXR0cl9zdWJzeXN0ZW0oKSBpcyB0aGVuCj4+PiBjYWxsZWQgaW4gamZmczJfYnVpbGRfZmlsZXN5
c3RlbSgpIGFuZCB0aGVuIGFnYWluIGluCj4+PiBqZmZzMl9kb19maWxsX3N1cGVyKCkuCj4+Pgo+
Pj4gRmluYWxseSB3ZSBjYW4gb2JzZXJ2ZSB0aGUgZm9sbG93aW5nIHJlcG9ydDoKPj4+ICAgID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+Pj4gICAgQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4gamZmczJfY2xlYXJf
eGF0dHJfc3Vic3lzdGVtKzB4OTUvMHg2YWMKPj4+ICAgIFJlYWQgb2Ygc2l6ZSA4IGF0IGFkZHIg
ZmZmZjg4ODEyNDMzODRlMCBieSB0YXNrIG1vdW50LzcxOQo+Pj4KPj4+ICAgIENhbGwgVHJhY2U6
Cj4+PiAgICAgZHVtcF9zdGFjaysweDExNS8weDE2Ygo+Pj4gICAgIGpmZnMyX2NsZWFyX3hhdHRy
X3N1YnN5c3RlbSsweDk1LzB4NmFjCj4+PiAgICAgamZmczJfZG9fZmlsbF9zdXBlcisweDg0Zi8w
eGMzMAo+Pj4gICAgIGpmZnMyX2ZpbGxfc3VwZXIrMHgyZWEvMHg0YzAKPj4+ICAgICBtdGRfZ2V0
X3NiKzB4MjU0LzB4NDAwCj4+PiAgICAgbXRkX2dldF9zYl9ieV9ucisweDRmLzB4ZDAKPj4+ICAg
ICBnZXRfdHJlZV9tdGQrMHg0OTgvMHg4NDAKPj4+ICAgICBqZmZzMl9nZXRfdHJlZSsweDI1LzB4
MzAKPj4+ICAgICB2ZnNfZ2V0X3RyZWUrMHg4ZC8weDJlMAo+Pj4gICAgIHBhdGhfbW91bnQrMHg1
MGYvMHgxZTUwCj4+PiAgICAgZG9fbW91bnQrMHgxMDcvMHgxMzAKPj4+ICAgICBfX3NlX3N5c19t
b3VudCsweDFjNS8weDJmMAo+Pj4gICAgIF9feDY0X3N5c19tb3VudCsweGM3LzB4MTYwCj4+PiAg
ICAgZG9fc3lzY2FsbF82NCsweDQ1LzB4NzAKPj4+ICAgICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVy
X2h3ZnJhbWUrMHg0NC8weGE5Cj4+Pgo+Pj4gICAgQWxsb2NhdGVkIGJ5IHRhc2sgNzE5Ogo+Pj4g
ICAgIGthc2FuX3NhdmVfc3RhY2srMHgyMy8weDYwCj4+PiAgICAgX19rYXNhbl9rbWFsbG9jLmNv
bnN0cHJvcC4wKzB4MTBiLzB4MTIwCj4+PiAgICAga2FzYW5fc2xhYl9hbGxvYysweDEyLzB4MjAK
Pj4+ICAgICBrbWVtX2NhY2hlX2FsbG9jKzB4MWMwLzB4ODcwCj4+PiAgICAgamZmczJfYWxsb2Nf
eGF0dHJfcmVmKzB4MmYvMHhhMAo+Pj4gICAgIGpmZnMyX3NjYW5fbWVkaXVtLmNvbGQrMHgzNzEz
LzB4NDc5NAo+Pj4gICAgIGpmZnMyX2RvX21vdW50X2ZzLmNvbGQrMHhhNy8weDIyNTMKPj4+ICAg
ICBqZmZzMl9kb19maWxsX3N1cGVyKzB4MzgzLzB4YzMwCj4+PiAgICAgamZmczJfZmlsbF9zdXBl
cisweDJlYS8weDRjMAo+Pj4gICAgWy4uLl0KPj4+Cj4+PiAgICBGcmVlZCBieSB0YXNrIDcxOToK
Pj4+ICAgICBrbWVtX2NhY2hlX2ZyZWUrMHhjYy8weDdiMAo+Pj4gICAgIGpmZnMyX2ZyZWVfeGF0
dHJfcmVmKzB4NzgvMHg5OAo+Pj4gICAgIGpmZnMyX2NsZWFyX3hhdHRyX3N1YnN5c3RlbSsweGEx
LzB4NmFjCj4+PiAgICAgamZmczJfZG9fbW91bnRfZnMuY29sZCsweDVlNi8weDIyNTMKPj4+ICAg
ICBqZmZzMl9kb19maWxsX3N1cGVyKzB4MzgzLzB4YzMwCj4+PiAgICAgamZmczJfZmlsbF9zdXBl
cisweDJlYS8weDRjMAo+Pj4gICAgWy4uLl0KPj4+Cj4+PiAgICBUaGUgYnVnZ3kgYWRkcmVzcyBi
ZWxvbmdzIHRvIHRoZSBvYmplY3QgYXQgZmZmZjg4ODEyNDMzODRiOAo+Pj4gICAgIHdoaWNoIGJl
bG9uZ3MgdG8gdGhlIGNhY2hlIGpmZnMyX3hhdHRyX3JlZiBvZiBzaXplIDQ4Cj4+PiAgICBUaGUg
YnVnZ3kgYWRkcmVzcyBpcyBsb2NhdGVkIDQwIGJ5dGVzIGluc2lkZSBvZgo+Pj4gICAgIDQ4LWJ5
dGUgcmVnaW9uIFtmZmZmODg4MTI0MzM4NGI4LCBmZmZmODg4MTI0MzM4NGU4KQo+Pj4gICAgWy4u
Ll0KPj4+ICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+Pj4KPj4+IFRoZSB0cmlnZ2VyaW5nIG9mIHRoZSBCVUcgaXMg
c2hvd24gaW4gdGhlIGZvbGxvd2luZyBzdGFjazoKPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiBqZmZzMl9maWxsX3N1cGVy
Cj4+PiAgICAgamZmczJfZG9fZmlsbF9zdXBlcgo+Pj4gICAgICAgamZmczJfZG9fbW91bnRfZnMK
Pj4+ICAgICAgICAgamZmczJfYnVpbGRfZmlsZXN5c3RlbQo+Pj4gICAgICAgICAgIGpmZnMyX3Nj
YW5fbWVkaXVtCj4+PiAgICAgICAgICAgICBqZmZzMl9zY2FuX2VyYXNlYmxvY2sgICAgICAgIDwt
LS0gRVJST1IKPj4+ICAgICAgICAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgPC0t
LSBmcmVlCj4+PiAgICAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgICAgIDwtLS0g
ZnJlZSBhZ2Fpbgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4+Cj4+PiBBbiBlcnJvciBpcyByZXR1cm5lZCBpbiBqZmZzMl9k
b19tb3VudF9mcygpLiBJZiB0aGUgZXJyb3IgaXMgcmV0dXJuZWQKPj4+IGJ5IGpmZnMyX3N1bV9p
bml0KCksIHRoZSBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBkb2VzIG5vdCBuZWVkIHRv
Cj4+PiBiZSBleGVjdXRlZC4gSWYgdGhlIGVycm9yIGlzIHJldHVybmVkIGJ5IGpmZnMyX2J1aWxk
X2ZpbGVzeXN0ZW0oKSwgdGhlCj4+PiBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBhbHNv
IGRvZXMgbm90IG5lZWQgdG8gYmUgZXhlY3V0ZWQgYWdhaW4uCj4+PiBTbyBtb3ZlIGpmZnMyX2Ns
ZWFyX3hhdHRyX3N1YnN5c3RlbSgpIGZyb20gJ291dF9pbm9oYXNoJyB0byAnb3V0X3Jvb3QnCj4+
PiB0byBmaXggdGhpcyBVQUYgcHJvYmxlbS4KPj4+Cj4+PiBGaXhlczogYWE5OGQ3Y2Y1OWI1ICgi
W0pGRlMyXVtYQVRUUl0gWEFUVFIgc3VwcG9ydCBvbiBKRkZTMiAodmVyc2lvbi4gNSkiKQo+Pj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEJhb2t1biBMaSA8bGliYW9rdW4x
QGh1YXdlaS5jb20+Cj4gQXBwbGllZC4gVGhhbmtzIGZvciBmaXhpbmchCj4KPiBUaGFua3MsCj4g
Ly9yaWNoYXJkCj4gLgoKClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchCgotLSAKV2l0aCBCZXN0
IFJlZ2FyZHMsCkJhb2t1biBMaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
