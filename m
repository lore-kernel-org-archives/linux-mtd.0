Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4A606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bd3ICI+R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEppJ0KV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vZ9IqYNf8RXCm6NQY1RW1Um1oXarvlIHtL0NNRLj0o0=; b=Bd3ICI+RG8s8yflN9f2PjT7SQx
	rnI4hyu23sNHf6eCcnwaS/iL/ePG2fO7nrJZZzUxy23+6C0VjUIrZ9OtrfCCmLzMXDtGJnvjQTlpz
	/NFTdDW3Qki6idIMRAQu2ebqhTO9Ty986vqaN4ubXKVPuWPxkOVWgF/uoYVpagbsGmpmoLYMjQOaB
	+DZeSbguaf0pKOJuYKLSNBeJyjSwt/1UXa0yxJ1rdCHZAx2Y+txlB9+fUBtTD0auC4LQO9rcT8oRG
	IgNNbNfMk6cvOfuj0Anx4/N5WYwgM1GDg1KS4EMw50wl5XPm1UyLj3JyumZyQ5jhsxLaAy/muJxcJ
	qSQfkhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPBw-00000006xP4-3sEL;
	Tue, 17 Nov 2026 19:50:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPBv-00000006xOm-2i1u
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:50:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F99043E9A;
	Tue, 17 Nov 2026 19:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965411F000C5;
	Tue, 17 Nov 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945007;
	bh=vQI7GD929CBlBO8gcJMVh7JjRZkByCf0c+RtdN+AYLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEppJ0KV6jF7T4jTpnqCZStOBpfG3ZpAiWnE5dYYcmFf2IOfV3gplESwhL4rW6ujW
	 MUvxSDKmtscrYlyqBMNlPbt9M3a1tF2IOIBgF3ZqcUIc4qrrn5vezewlAENkys33eT
	 cpR8ug0tonyAXsCkKIugJCvJ5BupkPpB4WcxD+ne9Qgv/deRFq6bVX3lwIyj2dfd5V
	 NdEE8QUs2pM0Cp5EMw6BebBuy4t1Zril+qt3XLfQK5hRebHgXmVnJ8vkA+Tp9tdUuB
	 xUhY6HfgFX3P+2IqL7ZzgMyZfleN+lGUn9FNlSp70cZf48MLx0cheCYznA97rRAZm8
	 8sxyTWzd6/iog==
Message-ID: <sashiko-outbox-219526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] nvmem: drain keepout and cell post-processing
 accesses
To: "James Hilliard" <james.hilliard1@gmail.com>, "Srinivas Kandagatla" <srini@kernel.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Michael Walle" <mwalle@kernel.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Paul
 Cercueil" <paul@crapouillou.net>, linux-mtd@lists.infradead.org
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
Date: Tue, 17 Nov 2026 19:50:06 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG52bWVtOiBj
b3JlOiByYWNlIGNvbmRpdGlvbiBpbiBfX252bWVtX3JlZ193cml0ZSgpIGR1cmluZwogIFdQIEdQ
SU8gdG9nZ2xpbmcgWzFdCi0tCgpjb21taXQgMWE1YTRmNWYzOGFlYWY2YjE0ODZhYjhhMjFlMTYy
ODVhNjc5NWFhZQpBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgoKbnZtZW06IGRyYWluIGtlZXBvdXQgYW5kIGNlbGwgcG9zdC1wcm9jZXNzaW5nIGFjY2Vz
c2VzCgpUaGlzIGNvbW1pdCBleHRlbmRzIFNSQ1UgcmVhZC1sb2NrIHByb3RlY3Rpb24gYW5kIG52
bWVtLT5vcHMgdmFsaWRhdGlvbiB0bwpjb3ZlciBrZWVwb3V0IHJlZ2lvbiBoYW5kbGluZyBpbiBu
dm1lbV9yZWdfcmVhZCgpIGFuZCBudm1lbV9yZWdfd3JpdGUoKSBhcwp3ZWxsIGFzIGNlbGwgcG9z
dC1wcm9jZXNzaW5nIGluIF9fbnZtZW1fY2VsbF9yZWFkKCkuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4gaW5kZXggODAyNjM3ZjM3
NWY4Yi4uNzNhYTUzMTQ1ZjBiNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL252bWVtL2NvcmUuYwo+
ICsrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCgpbIC4uLiBdCgo+IEBAIC0xNzMsNiArMTc3LDEw
IEBAIHN0YXRpYyBpbnQgbnZtZW1fcmVnX3JlYWQoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0s
IHVuc2lnbmVkIGludCBvZmZzZXQsCj4gIHN0YXRpYyBpbnQgbnZtZW1fcmVnX3dyaXRlKHN0cnVj
dCBudm1lbV9kZXZpY2UgKm52bWVtLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICAJCQkgICB2b2lk
ICp2YWwsIHNpemVfdCBieXRlcykKPiAgewo+ICsJZ3VhcmQoc3JjdSkoJm52bWVtLT5zcmN1KTsK
PiArCWlmICghc3JjdV9kZXJlZmVyZW5jZShudm1lbS0+b3BzLCAmbnZtZW0tPnNyY3UpKQo+ICsJ
CXJldHVybiAtRU5PREVWOwo+ICsKPiAgCWlmICghbnZtZW0tPm5rZWVwb3V0KQo+ICAJCXJldHVy
biBfX252bWVtX3JlZ193cml0ZShudm1lbSwgb2Zmc2V0LCB2YWwsIGJ5dGVzKTsKCltTZXZlcml0
eTogQ3JpdGljYWxdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNo
LCBidXQgY2FuIGNvbmN1cnJlbnQgY2FsbGVycyBvZgpfX252bWVtX3JlZ193cml0ZSgpIHJhY2Ug
b24gbnZtZW0tPndwX2dwaW8gWzFdPwoKZHJpdmVycy9udm1lbS9jb3JlLmM6X19udm1lbV9yZWdf
d3JpdGUoKSB7CgkuLi4KCXJldCA9IGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChudm1lbS0+d3Bf
Z3BpbywgMCk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgoJd3Jfb2sgPSBvcHMtPnJlZ193cml0
ZShudm1lbS0+cHJpdiwgb2Zmc2V0LCB2YWwsIGJ5dGVzKTsKCglyZXQgPSBncGlvZF9zZXRfdmFs
dWVfY2Fuc2xlZXAobnZtZW0tPndwX2dwaW8sIDEpOwoJLi4uCn0KCk5vdGhpbmcgc2VyaWFsaXpl
cyB0aGUgd3JpdGUtcHJvdGVjdCBHUElPIHRyYW5zaXRpb25zIGFjcm9zcyBjb25jdXJyZW50Cndy
aXRlczoKCkNQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQpfX252bWVt
X3JlZ193cml0ZSgpICAgICAgICAgICAgICAgICAgIF9fbnZtZW1fcmVnX3dyaXRlKCkKICBncGlv
ZF9zZXRfdmFsdWVfY2Fuc2xlZXAod3AsIDApCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAod3AsIDApCiAgb3BzLT5yZWdfd3Jp
dGUoLi4uKQogIGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcCh3cCwgMSkKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9wcy0+cmVnX3dyaXRlKC4uLikgIDwtLSBXUCBhY3Rp
dmUKCkNQVTAgcmUtYXNzZXJ0cyB3cml0ZSBwcm90ZWN0aW9uIHdoaWxlIENQVTEgaXMgc3RpbGwg
ZXhlY3V0aW5nCm9wcy0+cmVnX3dyaXRlKCksIHdoaWNoIGNhbiBjYXVzZSBkcm9wcGVkIHdyaXRl
cywgaGFyZHdhcmUgZXJyb3JzLCBvcgpzaWxlbnQgZGF0YSBjb3JydXB0aW9uLgoKWzFdIGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtZDdkODQ1ZGYtNzg2YS00MGNmLWI0M2MtZjRjZTJl
Mjk1YzgyCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYxMTE3LXN1Ym1pdC1udm1lbS1wcm92aWRlci1saWZldGltZS12MS12MS0wLTNj
ZmJkNDg4MTJiNUBnbWFpbC5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
