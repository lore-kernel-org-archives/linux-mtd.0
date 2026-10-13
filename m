Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E0DCC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDci9y2uRESpztB3lSpcxTMHDmBDi/55nZ8pPMDebDE=; b=bUh2M/h45PnZ5z
	JM4Jg686EMt+KeWgZGAmBa2SjXG97bEbIGmyvcvzJY3qmjNVHB2YG8f62TFns3m0L4uFMuAvDWkjZ
	3noB+ITTOavcqk6eLujAWNKq7diokZ64gl4UC4iCifcFnr4xto+R8HGQbzi0pz7+AjIDBQe61wZUG
	pcDYppoLvgRKV8Dj2z38GWvrj1W5JjN3PefCe1kRwGKCsqfZerkubQqZ6k4ps5G/b9UXTzYWPU+F5
	tBclul/FsoyPN/ao0VN5LDn5KntgumNXyP8smZnans17+OKfJVEGZpG1AB5kP9nAKz47EuA7itUPf
	uFpJPqJFsnYtWGnTEnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlIv-0000000EAmx-1JId;
	Tue, 13 Oct 2026 22:49:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlIl-0000000EAmZ-3DzU
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:48:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E90F1600CB;
	Tue, 13 Oct 2026 22:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFDA1F000FF;
	Tue, 13 Oct 2026 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791931734;
	bh=ibUJfB+28hW2wFJOdBo62K8n0F6KK/rS4kc37W5zLBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QofMp/S6l1viXok7/kmWXfSCGFmg8+OvFHV67BiwaduHvVVlpcoV57iEk029f3sUs
	 p3QtkUgUGsQX4xtpGk5sywHXAfPiPH7BJKmMjYKxxgx/p64P3g7gdpqqzruvXul7ya
	 m+g4SPp2+DggyosWEPj7IVymEPoBVvPHxgj/YAyhYdvxEMvEsf/qFAAShgJTE1VBc3
	 5RIrZqHe5mXzxWyp4rpR3KStP1hiLUznpnuA5vJVEUH/nVe3754QG8sPw+z8Xsd8Pr
	 f7ZFOPDo/EFhrgHcR+pRJd3LAzDouUZaK/FSA2CJqE5nSb6rBKKRrGb/e0sz/F+Rk3
	 i+rhY5oKx4DlA==
Message-ID: <sashiko-outbox-170599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] s390/sclp_mem: Allocate struct sclp_mem
 dynamically and add kobject release
To: "Ian Rogers" <irogers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael
 J . Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Kees Cook" <kees@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy" <chleroy@kernel.org>, "Nayna
 Jain" <nayna@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "David Teigland" <teigland@redhat.com>, "Alexander
 Aring" <aahringo@redhat.com>, "Juergen Gross" <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, "Richard Weinberger" <richard@nod.at>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Felix Kuehling" <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261013223946.1836757-9-irogers@google.com>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-9-irogers@google.com>
Date: Tue, 13 Oct 2026 22:48:52 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHN5c2ZzOiBrb2JqZWN0
IG1lbW9yeSBsZWFrIG9uIGluaXQgZXJyb3IgcGF0aHMgYW5kIGdyb3VwIGNyZWF0aW9uIHJhY2UK
LSBbTWVkaXVtXSBzeXNmczogbWlzc2luZyBjbGVhbnVwIG9mIHByZXZpb3VzbHkgYWxsb2NhdGVk
IGtvYmplY3RzIGluIGluaXRpYWxpemF0aW9uIGxvb3BzCi0tCgpjb21taXQgMTkxNzk4OTM3YmFk
MGYyNzJiMGY3MmY0YWUyODU3OWNhYjg2NzJmOApBdXRob3I6IElhbiBSb2dlcnMgPGlyb2dlcnNA
Z29vZ2xlLmNvbT4KCnMzOTAvc2NscF9tZW06IEFsbG9jYXRlIHN0cnVjdCBzY2xwX21lbSBkeW5h
bWljYWxseSBhbmQgYWRkIGtvYmplY3QgcmVsZWFzZQoKc2NscF9pbml0X21lbSgpIGFsbG9jYXRl
ZCBhIHNpbmdsZSBhcnJheSBvZiBzdHJ1Y3Qgc2NscF9tZW0gd2l0aApremFsbG9jX29ianMoKSBh
bmQgcmVnaXN0ZXJlZCBlYWNoIGVtYmVkZGVkIGtvYmplY3QgdXNpbmcgYSBrb2JqX3R5cGUKd2l0
aG91dCBhIC5yZWxlYXNlIGNhbGxiYWNrLiBBbGxvY2F0ZSBlYWNoIHN0cnVjdCBzY2xwX21lbSBp
bmRpdmlkdWFsbHkKd2l0aCBremFsbG9jX29iaigpIGluc3RlYWQgYW5kIGFkZCBzY2xwX21lbV9y
ZWxlYXNlKCkgdG8gZnJlZSBpdC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9jaGFyL3Nj
bHBfbWVtLmMgYi9kcml2ZXJzL3MzOTAvY2hhci9zY2xwX21lbS5jCj4gaW5kZXggNzhjMDU0ZTI2
ZDE3Ny4uNDBhN2Y5MjcyOTc1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3MzOTAvY2hhci9zY2xw
X21lbS5jCj4gKysrIGIvZHJpdmVycy9zMzkwL2NoYXIvc2NscF9tZW0uYwpbIC4uLiBdCj4gQEAg
LTMyMiwzNiArMzI1LDQwIEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIHNjbHBfbWVt
X2F0dHJfZ3JvdXAgPSB7Cj4gIAkuYXR0cnMgPSBzY2xwX21lbV9hdHRycywKPiAgfTsKPiAgCj4g
LXN0YXRpYyBpbnQgc2NscF9jcmVhdGVfbWVtKHN0cnVjdCBzY2xwX21lbSAqc2NscF9tZW0sIHN0
cnVjdCBrc2V0ICprc2V0LAo+IC0JCQkgICB1bnNpZ25lZCBpbnQgaWQsIGJvb2wgY29uZmlnLCBi
b29sIG1lbW1hcF9vbl9tZW1vcnkpCj4gK3N0YXRpYyBpbnQgc2NscF9jcmVhdGVfbWVtKHN0cnVj
dCBrc2V0ICprc2V0LCB1bnNpZ25lZCBpbnQgaWQsIGJvb2wgY29uZmlnLAo+ICsJCQkgICBib29s
IG1lbW1hcF9vbl9tZW1vcnkpCj4gIHsKPiArCXN0cnVjdCBzY2xwX21lbSAqc2NscF9tZW07Cj4g
IAlpbnQgcmM7Cj4gIAo+ICsJc2NscF9tZW0gPSBremFsbG9jX29iaigqc2NscF9tZW0pOwo+ICsJ
aWYgKCFzY2xwX21lbSkKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgCXNjbHBfbWVtLT5tZW1tYXBf
b25fbWVtb3J5ID0gbWVtbWFwX29uX21lbW9yeTsKPiAgCXNjbHBfbWVtLT5jb25maWcgPSBjb25m
aWc7Cj4gICNpZmRlZiBDT05GSUdfS0FTQU4KPiAgCXNjbHBfbWVtLT5lYXJseV9zaGFkb3dfbWFw
cGVkID0gY29uZmlnOwo+ICAjZW5kaWYKPiAgCXNjbHBfbWVtLT5pZCA9IGlkOwo+IC0Ja29iamVj
dF9pbml0KCZzY2xwX21lbS0+a29iaiwgJmt0eXBlKTsKPiAtCXJjID0ga29iamVjdF9hZGQoJnNj
bHBfbWVtLT5rb2JqLCAma3NldC0+a29iaiwgIm1lbW9yeSVkIiwgaWQpOwo+IC0JaWYgKHJjKQo+
ICsJcmMgPSBrb2JqZWN0X2luaXRfYW5kX2FkZCgmc2NscF9tZW0tPmtvYmosICZrdHlwZSwgJmtz
ZXQtPmtvYmosCj4gKwkJCQkgICJtZW1vcnklZCIsIGlkKTsKPiArCWlmIChyYykgewo+ICsJCWtv
YmplY3RfcHV0KCZzY2xwX21lbS0+a29iaik7Cj4gIAkJcmV0dXJuIHJjOwo+IC0JcmV0dXJuIHN5
c2ZzX2NyZWF0ZV9ncm91cCgmc2NscF9tZW0tPmtvYmosICZzY2xwX21lbV9hdHRyX2dyb3VwKTsK
PiArCX0KPiArCXJjID0gc3lzZnNfY3JlYXRlX2dyb3VwKCZzY2xwX21lbS0+a29iaiwgJnNjbHBf
bWVtX2F0dHJfZ3JvdXApOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGNhbGxpbmcgc3lzZnNfY3Jl
YXRlX2dyb3VwKCkgYWZ0ZXIga29iamVjdF9pbml0X2FuZF9hZGQoKSBpbgpzY2xwX2NyZWF0ZV9t
ZW0oKSBleHBvc2UgdGhlIHN5c2ZzIGRpcmVjdG9yeSB0byB1c2Vyc3BhY2UgYmVmb3JlIGl0cwph
dHRyaWJ1dGVzIGFyZSBwb3B1bGF0ZWQ/IFdvdWxkIGl0IGJlIHNhZmVyIHRvIGF2b2lkIHRoaXMg
c3RydWN0dXJhbCBzeXNmcwpyYWNlIGNvbmRpdGlvbiBieSBhc3NpZ25pbmcgdGhlIGF0dHJpYnV0
ZXMgdG8ga3R5cGUuZGVmYXVsdF9ncm91cHMgaW5zdGVhZD8KCj4gKwlpZiAocmMpIHsKPiArCQlr
b2JqZWN0X3B1dCgmc2NscF9tZW0tPmtvYmopOwo+ICsJCXJldHVybiByYzsKPiArCX0KPiArCXJl
dHVybiAwOwo+ICB9ClsgLi4uIF0KPiBAQCAtMzk1LDcgKzQwMSw3IEBAIHN0YXRpYyBpbnQgX19p
bml0IHNjbHBfY3JlYXRlX3N0YW5kYnlfbWVtc19tZXJnZWQoc3RydWN0IHNjbHBfbWVtICpzY2xw
X21lbXMsCj4gIAkJZ290byBza2lwX2FkZDsKPiAgCWZvciAoYWRkciA9IHN0YXJ0OyBhZGRyIDwg
c3RhcnQgKyBzaXplOyBhZGRyICs9IGJsb2NrX3NpemUpIHsKPiAgCQlpZCA9IGFkZHIgLyBibG9j
a19zaXplOwo+IC0JCXJjID0gc2NscF9jcmVhdGVfbWVtKCZzY2xwX21lbXNbaWRdLCBrc2V0LCBp
ZCwgZmFsc2UsCj4gKwkJcmMgPSBzY2xwX2NyZWF0ZV9tZW0oa3NldCwgaWQsIGZhbHNlLAo+ICAJ
CQkJICAgICBtaHBfc3VwcG9ydHNfbWVtbWFwX29uX21lbW9yeSgpKTsKPiAgCQlpZiAocmMpCj4g
IAkJCWJyZWFrOwo+ICAJfQoKW1NldmVyaXR5OiBNZWRpdW1dCklmIHNjbHBfY3JlYXRlX21lbSgp
IGZhaWxzIGFuZCBicmVha3Mgb3V0IG9mIHRoaXMgbG9vcCBpbgpzY2xwX2NyZWF0ZV9zdGFuZGJ5
X21lbXNfbWVyZ2VkKCksIGFyZSB0aGUga29iamVjdHMgY3JlYXRlZCBpbiBwcmV2aW91cwppdGVy
YXRpb25zIGxlZnQgcmVnaXN0ZXJlZD8gU2hvdWxkIHRoZXJlIGJlIGEgY2VudHJhbGl6ZWQgZXJy
b3IgY2xlYW51cApwYXRoIHRvIHVud2luZCBhbmQgZnJlZSB0aGVzZSBwcmlvciBhbGxvY2F0aW9u
cz8KCj4gIHNraXBfYWRkOgo+ICAJZmlyc3Rfcm4gPSBybjsKPiAgCW51bSA9IDE7Cj4gIAlyZXR1
cm4gcmM7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgX19pbml0IHNjbHBfY3JlYXRlX3N0YW5kYnlf
bWVtcyhzdHJ1Y3Qgc2NscF9tZW0gKnNjbHBfbWVtcywgc3RydWN0IGtzZXQgKmtzZXQpCj4gK3N0
YXRpYyBpbnQgX19pbml0IHNjbHBfY3JlYXRlX3N0YW5kYnlfbWVtcyhzdHJ1Y3Qga3NldCAqa3Nl
dCkKPiAgewo+ICAJc3RydWN0IG1lbW9yeV9pbmNyZW1lbnQgKmluY3I7Cj4gIAlpbnQgcmMgPSAw
Owo+ICAKPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkoaW5jciwgJnNjbHBfbWVtX2xpc3QsIGxpc3Qp
IHsKPiAgCQlpZiAoaW5jci0+c3RhbmRieSkKPiAtCQkJcmMgPSBzY2xwX2NyZWF0ZV9zdGFuZGJ5
X21lbXNfbWVyZ2VkKHNjbHBfbWVtcywga3NldCwgaW5jci0+cm4pOwo+ICsJCQlyYyA9IHNjbHBf
Y3JlYXRlX3N0YW5kYnlfbWVtc19tZXJnZWQoa3NldCwgaW5jci0+cm4pOwo+ICAJCWlmIChyYykK
PiAgCQkJcmV0dXJuIHJjOwo+ICAJfQoKW1NldmVyaXR5OiBIaWdoXQpXaGVuIHNjbHBfY3JlYXRl
X3N0YW5kYnlfbWVtc19tZXJnZWQoKSByZXR1cm5zIGFuIGVycm9yLCB0aGlzIGxvb3AgaW4Kc2Ns
cF9jcmVhdGVfc3RhbmRieV9tZW1zKCkgcmV0dXJucyBkaXJlY3RseS4gQ291bGQgdGhpcyBsZWFr
IGFsbCB0aGUKc3RhbmRieSBrb2JqZWN0cyB0aGF0IHdlcmUgc3VjY2Vzc2Z1bGx5IGNyZWF0ZWQg
aW4gZWFybGllciBpdGVyYXRpb25zIG9mCnRoZSBsb29wPwoKPiAtCXJldHVybiBzY2xwX2NyZWF0
ZV9zdGFuZGJ5X21lbXNfbWVyZ2VkKHNjbHBfbWVtcywga3NldCwgMCk7Cj4gKwlyZXR1cm4gc2Ns
cF9jcmVhdGVfc3RhbmRieV9tZW1zX21lcmdlZChrc2V0LCAwKTsKPiAgfQo+ICAKPiAgc3RhdGlj
IGludCBfX2luaXQgc2NscF9pbml0X21lbSh2b2lkKQo+ICB7Cj4gLQljb25zdCB1bnNpZ25lZCBs
b25nIGJsb2NrX3NpemUgPSBtZW1vcnlfYmxvY2tfc2l6ZV9ieXRlcygpOwo+IC0JdW5zaWduZWQg
aW50IG1heF9zY2xwX21lbXM7Cj4gLQlzdHJ1Y3Qgc2NscF9tZW0gKnNjbHBfbWVtczsKPiAtCXN0
cnVjdCBzY2xwX21lbV9hcmcgYXJnOwo+ICAJc3RydWN0IGtzZXQgKmtzZXQ7Cj4gIAlpbnQgcmM7
Cj4gIAo+IC0JbWF4X3NjbHBfbWVtcyA9IHJvdW5kdXAoc2NscC5ybm1heCAqIHNjbHAucnptLCBi
bG9ja19zaXplKSAvIGJsb2NrX3NpemU7Cj4gLQkvKiBBbGxvY2F0ZSBtZW1vcnkgZm9yIGFsbCBi
bG9ja3MgYWhlYWQgb2YgdGltZS4gKi8KPiAtCXNjbHBfbWVtcyA9IGt6YWxsb2Nfb2JqcyhzdHJ1
Y3Qgc2NscF9tZW0sIG1heF9zY2xwX21lbXMpOwo+IC0JaWYgKCFzY2xwX21lbXMpCj4gLQkJcmV0
dXJuIC1FTk9NRU07Cj4gIAlrc2V0ID0ga3NldF9jcmVhdGVfYW5kX2FkZCgibWVtb3J5IiwgTlVM
TCwgZmlybXdhcmVfa29iaik7Cj4gIAlpZiAoIWtzZXQpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4g
IAkvKiBJbml0aWFsIG1lbW9yeSBpcyBpbiB0aGUgImNvbmZpZ3VyZWQiIHN0YXRlIGFscmVhZHku
ICovCj4gLQlhcmcuc2NscF9tZW1zID0gc2NscF9tZW1zOwo+IC0JYXJnLmtzZXQgPSBrc2V0Owo+
IC0JcmMgPSBmb3JfZWFjaF9tZW1vcnlfYmxvY2soJmFyZywgc2NscF9jcmVhdGVfY29uZmlndXJl
ZF9tZW0pOwo+ICsJcmMgPSBmb3JfZWFjaF9tZW1vcnlfYmxvY2soa3NldCwgc2NscF9jcmVhdGVf
Y29uZmlndXJlZF9tZW0pOwo+ICAJaWYgKHJjKQo+ICAJCXJldHVybiByYzsKCltTZXZlcml0eTog
SGlnaF0KSWYgZm9yX2VhY2hfbWVtb3J5X2Jsb2NrKCkgZW5jb3VudGVycyBhbiBlcnJvciBkdXJp
bmcgbWVtb3J5IGJsb2NrCmNyZWF0aW9uIGluIHNjbHBfaW5pdF9tZW0oKSwgcmV0dXJuaW5nIGRp
cmVjdGx5IGhlcmUgbGVhdmVzIHRoZSBwcmV2aW91c2x5CmNyZWF0ZWQga3NldCBhbmQgYW55IHN1
Y2Nlc3NmdWxseSBjb25maWd1cmVkIG1lbW9yeSBrb2JqZWN0cyByZWdpc3RlcmVkLgpEb2VzIHRo
aXMgcmVzdWx0IGluIGEgcGVybWFuZW50IG1lbW9yeSBsZWFrIG9mIHRoZXNlIHN0cnVjdHVyZXM/
Cgo+ICAJLyogU3RhbmRieSBtZW1vcnkgaXMgImRlY29uZmlndXJlZCIuICovCj4gLQlyZXR1cm4g
c2NscF9jcmVhdGVfc3RhbmRieV9tZW1zKHNjbHBfbWVtcywga3NldCk7Cj4gKwlyZXR1cm4gc2Ns
cF9jcmVhdGVfc3RhbmRieV9tZW1zKGtzZXQpOwo+ICB9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2lt
aWxhcmx5LCBpZiBzY2xwX2NyZWF0ZV9zdGFuZGJ5X21lbXMoKSBmYWlscyBsYXRlciBpbiBzY2xw
X2luaXRfbWVtKCksCnJldHVybmluZyBpdHMgZXJyb3IgY29kZSBkaXJlY3RseSBsZWF2ZXMgdGhl
IGtzZXQgYW5kIHRoZSBpbml0aWFsCmNvbmZpZ3VyZWQgbWVtb3J5IGJsb2NrcyBsZWFrZWQuIElz
IGFuIGVycm9yIGhhbmRsaW5nIHBhdGggbWlzc2luZyBoZXJlIHRvCmNsZWFuIHVwIHRoZSBrc2V0
IGFuZCBhbGwgY2hpbGQga29iamVjdHMgb24gZmFpbHVyZT8KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTMyMjM5NDYuMTgzNjc1
Ny0xLWlyb2dlcnNAZ29vZ2xlLmNvbT9wYXJ0PTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
