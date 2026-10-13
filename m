Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94046CC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GC7Ig9FGsj6SXt4TbjUEu8FSv/LQhKHyaH929pn8gRc=; b=pLz8hhhUM6fDZy
	LZ7BmLRLj1bNEykrqMGHqA4hH02eH8MrjDLbPyz2nNL50AYmyEozze6AsPrOaMrasduAKFfrTK29/
	MGMOdmZ8GGYkVePGvA7rzm1vD/vrI60ruW5S9EKxKaKDlohMQaED2agly+7TICQKxWEYldVeYNduZ
	c2FNeQKdN/Zo1t5nEi5iVTW6M/VyCfinUXUurjnZ9KFF/pde3Ab8q6RFpQwLUzBSOJvqbVmuM5qvo
	PqweTXj/3bV24OLZw2M4c3VhgIddUd+vK7XAdyGQncJhrkbmGxQLCihkSUkc5lSumzqloWLQq612z
	Ym56N8Stlk+PqcQ4r8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlQV-0000000ECst-36IU;
	Tue, 13 Oct 2026 22:56:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlQS-0000000ECsk-1Tsp
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8CED600CB;
	Tue, 13 Oct 2026 22:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A340B1F000FF;
	Tue, 13 Oct 2026 22:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932211;
	bh=gjkgxxinhqTDIQGP/ABYkBIuyO2cHEre5iS+nuSjUYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ok+BWzW8LTbJHjPWuh2+er1A+/R/lxIJ7ow13QTtxixuHzRI9G7BfQ2KfZngeepEP
	 +LQBLh2wQN8falGFtp17zZgWQjm+cKYDabUW8hLhYVMmz6U/XO0GptExn/p0pP31DL
	 szpp9BUUkniN3hM2HsaDdfw/u+CK7YFTtG7lbG5CCOdzYN9IeWFBPXfdXJZNBhRICW
	 imncxFIuwKTgSSLpzUSS4AEVdm+mT/kE5cp6JbpeDGOvVgXUSo4Gmd2OIp3KdcBS3k
	 6SjUDuP4PlpmeaW+oAFD8tRn2sTBNkWkiyzwAwj22wy1ZkNDN1F1Cr100NF22xcJgH
	 s/ophu6aLIzPg==
Message-ID: <sashiko-outbox-170611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] kobject: Require explicit initialization of
 struct kobj_type::release
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
In-Reply-To: <20261013223946.1836757-12-irogers@google.com>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-12-irogers@google.com>
Date: Tue, 13 Oct 2026 22:56:49 +0000
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHN5c2ZzOiBVc2UtQWZ0
ZXItRnJlZSBpbiBrb2JqZWN0IGRlbGF5ZWQgcmVsZWFzZSB2aWEgZGV2bS9tZW1zZXQKLSBbTG93
XSBzeXNmczogaW5jb3JyZWN0IGRvY3VtZW50YXRpb24gZm9yIGRzc19vdmVybGF5X2tvYmpfdW5p
bml0KCkgY2xlYW51cAotLQoKY29tbWl0IDI1YzBhOGM2OGU1YTExNTk4OTI1MmQ0MWEwZDQ3MzE4
Njc0MTVkNzkKQXV0aG9yOiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+ClN1YmplY3Q6
IGtvYmplY3Q6IFJlcXVpcmUgZXhwbGljaXQgaW5pdGlhbGl6YXRpb24gb2Ygc3RydWN0IGtvYmpf
dHlwZTo6cmVsZWFzZQoKQW5ub3RhdGUgc3RydWN0IGtvYmpfdHlwZTo6cmVsZWFzZSB3aXRoIF9f
cmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlvbgpzbyB0aGUgY29tcGlsZXIgZGlhZ25vc2Vz
IGFueSBzdHJ1Y3Qga29ial90eXBlIGluaXRpYWxpemVyIHRoYXQgb21pdHMKLnJlbGVhc2UuIEZv
ciB0aGUgcmVtYWluaW5nIGxlZ2FjeSBzdHJ1Y3Qga29ial90eXBlIGRlZmluaXRpb25zIHdoZXJl
IHRoZQprb2JqZWN0IGlzIHN0YXRpYywgcGVyLUNQVSwgb3IgZW1iZWRkZWQgaW5zaWRlIGEgZGV2
bS0gb3IgcGFyZW50LW1hbmFnZWQKc3RydWN0dXJlIHJhdGhlciB0aGFuIGZyZWVkIGJ5IGtvYmpl
Y3RfcHV0KCksIGV4cGxpY2l0bHkgaW5pdGlhbGl6ZQoucmVsZWFzZSA9IE5VTEwuCgpMaW5rOiBo
dHRwczovL2xwYy5ldmVudHMvZXZlbnQvMjAvY29udHJpYnV0aW9ucy8yMzkyLwoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEvaW9hdC9zeXNmcy5jIGIvZHJpdmVycy9kbWEvaW9hdC9zeXNmcy5j
Cj4gaW5kZXggZTc5NmRkYjUzODNmOC4uN2ZkZDBjYTM2Yjk4YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2RtYS9pb2F0L3N5c2ZzLmMKPiArKysgYi9kcml2ZXJzL2RtYS9pb2F0L3N5c2ZzLmMKPiBA
QCAtMTY3LDYgKzE2Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlICpjb25zdCBp
b2F0X2F0dHJzW10gPSB7Cj4gIEFUVFJJQlVURV9HUk9VUFMoaW9hdCk7Cj4gIAo+ICBjb25zdCBz
dHJ1Y3Qga29ial90eXBlIGlvYXRfa3R5cGUgPSB7Cj4gKwkvKiBpb2F0ZG1hX2NoYW4gaXMgYWxs
b2NhdGVkIHZpYSBkZXZtX2t6YWxsb2MoKSByYXRoZXIgdGhhbiBmcmVlZCBieSBrb2JqZWN0X3B1
dCgpLiAqLwo+ICsJLnJlbGVhc2UgPSBOVUxMLAoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMg
c2V0dXAgY2F1c2UgYSB1c2UtYWZ0ZXItZnJlZSB3aGVuIENPTkZJR19ERUJVR19LT0JKRUNUX1JF
TEVBU0UgaXMKZW5hYmxlZD8KCldoZW4ga29iamVjdF9wdXQoKSBpcyBjYWxsZWQsIGl0IHF1ZXVl
cyBhIGRlbGF5ZWRfd29yayB0byBleGVjdXRlCmtvYmplY3RfY2xlYW51cCgpIGxhdGVyLiBCZWNh
dXNlIHRoZSBzdHJ1Y3QgaXMgbWFuYWdlZCBieSBkZXZtX2t6YWxsb2MoKSwKdGhlIG1lbW9yeSBp
cyBmcmVlZCBpbW1lZGlhdGVseSBhZnRlciB1bmJpbmQsIGxlYXZpbmcgYW4gYWN0aXZlIGRlbGF5
ZWRfd29yawpwb2ludGluZyB0byB0aGUgZnJlZWQgbWVtb3J5LgoKWyAuLi4gXQoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvaGlzaWxpY29uL2t1bnBlbmdfaGNjcy5jIGIvZHJpdmVycy9zb2Mv
aGlzaWxpY29uL2t1bnBlbmdfaGNjcy5jCj4gaW5kZXggMGNjMjk1M2Q1OWE1NC4uNWQwODNkMmI3
MmNhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9oaXNpbGljb24va3VucGVuZ19oY2NzLmMK
PiArKysgYi9kcml2ZXJzL3NvYy9oaXNpbGljb24va3VucGVuZ19oY2NzLmMKPiBAQCAtMTAzOCw2
ICsxMDM4LDggQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmhjY3NfcG9ydF9kZWZhdWx0X2F0
dHJzW10gPSB7Cj4gIEFUVFJJQlVURV9HUk9VUFMoaGNjc19wb3J0X2RlZmF1bHQpOwo+ICAKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX3R5cGUgaGNjc19wb3J0X3R5cGUgPSB7Cj4gKwkvKiBo
Y2NzX3BvcnRfaW5mbyBpcyBhbGxvY2F0ZWQgdmlhIGRldm1fa2NhbGxvYygpIHJhdGhlciB0aGFu
IGZyZWVkIGJ5IGtvYmplY3RfcHV0KCkuICovCj4gKwkucmVsZWFzZSA9IE5VTEwsCgpbU2V2ZXJp
dHk6IEhpZ2hdCkNhbiB0aGlzIGRldm0gYWxsb2NhdGlvbiBjYXVzZSBhIHVzZS1hZnRlci1mcmVl
IGZvciB0aGUgZGVsYXllZF93b3JrPwoKU2ltaWxhciB0byB0aGUgaW9hdF9rdHlwZSBjYXNlLCB0
aGUgZGV2bV9rY2FsbG9jIGFsbG9jYXRpb24gbWVhbnMgdGhlIHN0cnVjdApjb250YWluaW5nIHRo
ZSBrb2JqZWN0IGlzIGZyZWVkIHVwb24gZHJpdmVyIHVuYmluZCBpbW1lZGlhdGVseSBhZnRlcgpr
b2JqZWN0X3B1dCgpIGV4ZWN1dGVzLCBsZWF2aW5nIGEgcGVuZGluZyBkZWxheWVkX3dvcmsgb24g
ZnJlZWQgbWVtb3J5LgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9vbWFwMi9vbWFwZmIvZHNzL2Rpc3BsYXktc3lzZnMuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
b21hcDIvb21hcGZiL2Rzcy9kaXNwbGF5LXN5c2ZzLmMKPiBpbmRleCBhZTkzNzg1NDQwM2IxLi4z
ZDc4NzI0NWY1YjUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21h
cGZiL2Rzcy9kaXNwbGF5LXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kc3MvZGlzcGxheS1zeXNmcy5jCj4gQEAgLTMwNCw2ICszMDQsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHN5c2ZzX29wcyBkaXNwbGF5X3N5c2ZzX29wcyA9IHsKPiAgfTsKPiAgCj4g
IHN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIGRpc3BsYXlfa3R5cGUgPSB7Cj4gKwkvKiBkc3NkZXYt
PmtvYmogaXMgZW1iZWRkZWQgaW4gc3RydWN0IG9tYXBfZHNzX2RldmljZSBhbmQgemVyb2VkIGlu
IGRpc3BsYXlfdW5pbml0X3N5c2ZzKCkuICovCj4gKwkucmVsZWFzZSA9IE5VTEwsCgpbU2V2ZXJp
dHk6IEhpZ2hdCkRvZXMgdGhpcyB6ZXJvaW5nIHBhdHRlcm4gY29ycnVwdCB0aGUgYWN0aXZlIHdv
cmtxdWV1ZSB3aGVuCkNPTkZJR19ERUJVR19LT0JKRUNUX1JFTEVBU0UgaXMgZW5hYmxlZD8KCkxv
b2tpbmcgYXQgZGlzcGxheV91bmluaXRfc3lzZnMoKSwgdGhlIGNvZGUgY2FsbHMga29iamVjdF9w
dXQoKSBmb2xsb3dlZAppbW1lZGlhdGVseSBieSBtZW1zZXQ6Cgp2b2lkIGRpc3BsYXlfdW5pbml0
X3N5c2ZzKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldikKewoJLi4uCglrb2JqZWN0X2Rl
bCgmZHNzZGV2LT5rb2JqKTsKCWtvYmplY3RfcHV0KCZkc3NkZXYtPmtvYmopOwoKCW1lbXNldCgm
ZHNzZGV2LT5rb2JqLCAwLCBzaXplb2YoZHNzZGV2LT5rb2JqKSk7Cn0KClNpbmNlIGtvYmplY3Rf
cHV0KCkgc2NoZWR1bGVzIGEgZGVsYXllZF93b3JrLCB3b3VsZG4ndCB0aGUgbWVtc2V0CnN5bmNo
cm9ub3VzbHkgZGVzdHJveSB0aGUgYWN0aXZlIHdvcmsgc3RydWN0IGJlZm9yZSBpdCBjYW4gcnVu
PwoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFw
ZmIvZHNzL292ZXJsYXktc3lzZnMuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L2Rzcy9vdmVybGF5LXN5c2ZzLmMKPiBpbmRleCAxZGE0ZmIxYzc3YjRhLi45YWExNmIzZGVlNWVm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9vdmVy
bGF5LXN5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3Mv
b3ZlcmxheS1zeXNmcy5jCj4gQEAgLTQyOSw2ICs0MjksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHN5c2ZzX29wcyBvdmVybGF5X3N5c2ZzX29wcyA9IHsKPiAgfTsKPiAgCj4gIHN0YXRpYyBzdHJ1
Y3Qga29ial90eXBlIG92ZXJsYXlfa3R5cGUgPSB7Cj4gKwkvKiBvdmwtPmtvYmogaXMgZW1iZWRk
ZWQgaW4gc3RhdGljIG92ZXJsYXlzW107IGRzc19vdmVybGF5X2tvYmpfdW5pbml0KCkgb25seSBj
YWxscyBrb2JqZWN0X2RlbCgpLiAqLwo+ICsJLnJlbGVhc2UgPSBOVUxMLAoKW1NldmVyaXR5OiBM
b3ddCklzIHRoaXMgY29tbWVudCBhY2N1cmF0ZT8KCkxvb2tpbmcgYXQgZHNzX292ZXJsYXlfa29i
al91bmluaXQoKSBpbiB0aGUgc2FtZSBmaWxlOgoKdm9pZCBkc3Nfb3ZlcmxheV9rb2JqX3VuaW5p
dChzdHJ1Y3Qgb21hcF9vdmVybGF5ICpvdmwpCnsKCWtvYmplY3RfZGVsKCZvdmwtPmtvYmopOwoJ
a29iamVjdF9wdXQoJm92bC0+a29iaik7Cn0KClRoZSBpbXBsZW1lbnRhdGlvbiBjb250cmFkaWN0
cyB0aGUgY29tbWVudCBieSBleHBsaWNpdGx5IGNhbGxpbmcKa29iamVjdF9wdXQoKS4KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEw
MTMyMjM5NDYuMTgzNjc1Ny0xLWlyb2dlcnNAZ29vZ2xlLmNvbT9wYXJ0PTExCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
