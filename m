Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34721C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Message-ID:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SpkuBoWMQzehtNB6KhLqlRPhXAjM3NdPsAJFwXzEQ4M=; b=20q+rZEQySOUqh
	UAvlKdG+qCInOJQRZjyIzBcNtDwoY4CRUL1LqDVtBx3gw06VNd4K2XH3bJ/KNvl7JEBkFV2WnupIi
	ZLUz0XR8Y7lBugCvwvmfIaLIBb1tMOZn9DZJ7IQVgZ49cDLEiI4ht5L+xVNq6LVH9T+VF5pLs4ioa
	r3V1qULh51KXX647EBMAwv4QefAbCb10UyvAg3cmDz6BFTJj/Qzaw0AjeyL7pvMAmkE72ukJI5xib
	fS06RePM8miGP7D8QA6AdX47e29cAJGPAVSR65YLy8OxZACZErl4BqAvO/ZhWYYgxE/aXr9ld2kRv
	l6+nGgYikqEH6Lyzzvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XH6-00C1A6-IY; Wed, 29 Jun 2022 12:58:32 +0000
Received: from sender11-op-o11.zoho.eu ([31.186.226.225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XGc-00C0p7-DG
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 12:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1656507466; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=g+U/Zi8rGFDy2JVAXgqR+hQw1131kIFYJ4LIjA5mI09mSzBk0MMlwoZ0C1Xd1P0Wg73N0dOU4TuEzOwy2dwq1PsqCv/R0pEWq1gSiH4zP1vU1etvnilWiVoNSp5zU0OfxnnPCXgrsExddB+cyzZwJg/itBADlbVd5YIKlTUKE8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1656507466; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=jd5EmsSka8mZXEbstWwZePiOzECLljr5+URCKuNvUOM=; 
	b=f9b/eQ0goMr47U+aTEQnFSy7+4O1UIII01+FbX2fhcZejwK0Kh7JuXwiaWbrdtNCueiCiWbwS8OUdSAv8i7ykQ0A5ZgnH9OQwxKN0mdpzXKzcjCXQl+20UsNaPkPvmAIsbGOzu5opOXsC0D7IQkP02x5Ju/lrGEz7U7ASTfRtm0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=kempniu.pl;
	spf=pass  smtp.mailfrom=kernel@kempniu.pl;
	dmarc=pass header.from=<kernel@kempniu.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656507466;
	s=zmail; d=kempniu.pl; i=kernel@kempniu.pl;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jd5EmsSka8mZXEbstWwZePiOzECLljr5+URCKuNvUOM=;
	b=DmyUTyq6XglneK+t7163HQ2YYDzWblLSjdriJhoKXRjUylkKAL0ghv/8yFdqN04b
	jocUOHEhpDg2oP4uhFZbhkN/yZSkjiJcQSsj7jknOpE69GQd8fz2YrN8xIUs4D/en3v
	Yh0bUiHqXoOoPymzmRHk/y5ubwQh1LVX5UUABKdw=
Received: from larwa.hq.kempniu.pl (212.180.138.61 [212.180.138.61]) by mx.zoho.eu
	with SMTPS id 1656507465222376.59903136972116; Wed, 29 Jun 2022 14:57:45 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220629125737.14418-1-kernel@kempniu.pl>
Subject: [PATCH v4 0/4] mtdchar: add MEMREAD ioctl
Date: Wed, 29 Jun 2022 14:57:33 +0200
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055802_864168_6E3CAB98 
X-CRM114-Status: GOOD (  11.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIG5ldyBtdGRjaGFyIGlvY3RsLCBNRU1SRUFELiAgSXRz
IHB1cnBvc2UgaXMgdG8Kc2VydmUgYXMgYSByZWFkIGNvdW50ZXJwYXJ0IG9mIHRoZSBNRU1XUklU
RSBpb2N0bCwgZXhwb3NpbmcgYSBicm9hZGVyCnNldCBvZiBjYXBhYmlsaXRpZXMgZm9yIHJlYWQg
b3BlcmF0aW9ucyAoZS5nLiB1c2Ugb2YgTVREX09QU19BVVRPX09PQiwKYWNjZXNzIHRvIEVDQyBz
dGF0aXN0aWNzKSB0byB1c2VyLXNwYWNlIGFwcGxpY2F0aW9ucyBtYWtpbmcgdXNlIG9mIE1URApk
ZXZpY2VzIHZpYSAvZGV2L210ZCogY2hhcmFjdGVyIGRldmljZXMuCgpDaGFuZ2VzIGZyb20gdjM6
CgogIC0gRml4ZWQgdHdvIGlzc3VlcyBmb3VuZCBieSBSaWNoYXJkIFdlaW5iZXJnZXIgWzFdOgoK
ICAgICAgLSBwcmV2ZW50IGludGVnZXIgb3ZlcmZsb3csCiAgICAgIC0gdXNlIGt2bWFsbG9jKCkg
Zm9yIHBvdGVudGlhbGx5IGxhcmdlIGFsbG9jYXRpb25zLgoKICAgIChJZGVudGljYWwgZml4ZXMg
aGF2ZSBhbHJlYWR5IGJlZW4gYXBwbGllZCB0byBtdGRjaGFyX3dyaXRlX2lvY3RsKCksCiAgICBp
LmUuIHRoZSB3cml0ZSBjb3VudGVycGFydCBvZiB0aGUgaW9jdGwgcHJvcG9zZWQgaW4gdGhpcyBw
YXRjaAogICAgc2VyaWVzLCBpbiBtdGQvbmV4dC4gWzJdIFszXSkKCkNoYW5nZXMgZnJvbSB2MjoK
CiAgLSBTcXVhc2hlZCBwYXRjaCAxLzUgaW50byBwYXRjaCA1LzUgdG8gcHJldmVudCBicmVha2lu
ZyBiaXNlY3RhYmlsaXR5CiAgICBkdWUgdG8gYW4gaW5jb21wYXRpYmxlIEFCSSBjaGFuZ2UgYmV0
d2VlbiB0aG9zZSB0d28gcGF0Y2hlcy4KICAgIFJldmlzZWQgY29tbWl0IG1lc3NhZ2VzIGFjY29y
ZGluZ2x5LgoKQ2hhbmdlcyBmcm9tIHYxOgoKICAtIEFkZGVkIHBhdGNoZXMgMi01IHdoaWNoIGVu
YWJsZSB0aGUgbmV3IE1FTVJFQUQgaW9jdGwgdG8gcmVwb3J0IEVDQwogICAgc3RhdGlzdGljcyBm
b3IgdGhlIHJlYWQgb3BlcmF0aW9uIGJhY2sgdG8gdXNlciBzcGFjZS4gIChUaGVyZSBhcmUKICAg
IG9idmlvdXNseSBkaWZmZXJlbnQgd2F5cyB0aGVzZSBjaGFuZ2VzIGNhbiBiZSBzcGxpdCB1cCBp
bnRvIHNlcGFyYXRlCiAgICBjb21taXRzOyBJIHdhcyBhaW1pbmcgZm9yIG1heGltdW0gZWFzZSBv
ZiByZXZpZXcuKQoKICAtIFRoZSAncmV0bGVuJyBhbmQgJ29vYnJldGxlbicgZmllbGRzIHdlcmUg
bm90IHNldCBpbiB0aGUgc3RydWN0CiAgICBtdGRfcmVhZF9yZXEgcmV0dXJuZWQgdG8gdXNlcnNw
YWNlLiAgVGhpcyB3YXMgZG9uZSBwcm9wZXJseSBpbgogICAgQm9yaXMnIG9yaWdpbmFsIGRyYWZ0
IHBhdGNoIFsxXSwgYnV0IEkgbWlzc2VkIGl0IGluIG15IHYxLgoKICAtIEludmFsaWQgSVNfRVJS
KCkgY2hlY2tzIHdlcmUgcmVwbGFjZWQgd2l0aCBOVUxMIGNoZWNrcy4gIFRoaXMgd2FzIGFuCiAg
ICBhcnRpZmFjdCBvZiBjb3B5LXBhc3RpbmcgbXRkY2hhcl93cml0ZV9pb2N0bCgpIGluIHYxOiB1
bmxpa2UKICAgIG1lbWR1cF91c2VyKCkgdXNlZCB0aGVyZWluLCBrbWFsbG9jKCkgYWx3YXlzIHJl
dHVybnMgTlVMTCBvbiBlcnJvci4KCiAgLSBNaW5vciBzdWJqZWN0IHByZWZpeCBhZGp1c3RtZW50
IGZvciBwYXRjaCAxLzUgKCJtdGQiIC0+ICJtdGRjaGFyIikuCgpbMV0gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIyLUZlYnJ1YXJ5LzA5MTI3Ni5odG1s
ClsyXSBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMjIt
SnVuZS8wOTM4MjkuaHRtbApbM10gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LW10ZC8yMDIyLUp1bmUvMDkzODI4Lmh0bWwKCk1pY2hhxYIgS8SZcGllxYQgKDQpOgog
IG10ZDogdHJhY2sgbWF4aW11bSBudW1iZXIgb2YgYml0ZmxpcHMgZm9yIGVhY2ggcmVhZCByZXF1
ZXN0CiAgbXRkOiBhbHdheXMgaW5pdGlhbGl6ZSAnc3RhdHMnIGluIHN0cnVjdCBtdGRfb29iX29w
cwogIG10ZDogYWRkIEVDQyBlcnJvciBhY2NvdW50aW5nIGZvciBlYWNoIHJlYWQgcmVxdWVzdAog
IG10ZGNoYXI6IGFkZCBNRU1SRUFEIGlvY3RsCgogZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5j
ICAgICAgICAgICAgIHwgICA4ICsrCiBkcml2ZXJzL210ZC9pbmZ0bGNvcmUuYyAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbXRkL210ZGNoYXIuYyAgICAgICAgICAgICAgICAgICB8
IDEzOSArKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAg
ICAgICAgICAgICAgICB8ICAgNSArCiBkcml2ZXJzL210ZC9tdGRzd2FwLmMgICAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyB8
ICAxNiArKy0KIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2JidC5jICB8ICAgMiAr
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgIHwgIDEwICsrCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3NtX2NvbW1vbi5jICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jICAgICAgICAgICAgIHwgIDEwICsrCiBkcml2ZXJzL210ZC9uZnRsY29yZS5jICAg
ICAgICAgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvbXRkL3NtX2Z0bC5jICAgICAgICAgICAg
ICAgICAgICB8ICAgNCArLQogZHJpdmVycy9tdGQvc3NmZGMuYyAgICAgICAgICAgICAgICAgICAg
IHwgICAyICstCiBkcml2ZXJzL210ZC90ZXN0cy9uYW5kYml0ZXJycy5jICAgICAgICAgfCAgIDIg
Ky0KIGRyaXZlcnMvbXRkL3Rlc3RzL29vYnRlc3QuYyAgICAgICAgICAgICB8ICAgOCArLQogZHJp
dmVycy9tdGQvdGVzdHMvcmVhZHRlc3QuYyAgICAgICAgICAgIHwgICAyICstCiBmcy9qZmZzMi93
YnVmLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIGluY2x1ZGUvbGludXgvbXRk
L210ZC5oICAgICAgICAgICAgICAgICB8ICAgNyArKwogaW5jbHVkZS91YXBpL210ZC9tdGQtYWJp
LmggICAgICAgICAgICAgIHwgIDY0ICsrKysrKysrKystCiAyMCBmaWxlcyBjaGFuZ2VkLCAyNzkg
aW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgotLSAKMi4zNy4wCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
