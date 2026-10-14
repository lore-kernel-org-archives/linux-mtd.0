Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CECCC6B19
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9WXDce6aeUek2oq1RCss8bglONipvPiOUErQ4b4b8o=; b=SF+8JK02FT8wvz
	iJCpLVm1rLOmGAVnQCi+buvknqrjYnB0A9fIF02CHZwMM1nGwFVu+u2uGNXas9g+OimXhb41b16KD
	SMpNjYBoIzPVoIQz8bG5cHPpbpFXJFnJ36u21CWQVr+YudDmnCLhmtQ3ex12u2YfUVaVF7G7DnT10
	ephBr60Y73EZ9R/bz56VEocHxIkP3+oIHqjv4LnfXtSjxQFTpcYEU7WMFibN0D8qwGHKLDMxJzL0T
	YuezWS7GOVDnxaq9p4KDL8wbexOmTtPG6HJz3EbMdtKW17cBmBIhMpih46eHcS24OGbip/JlLO997
	w9PppfL+Q8jt5wofWOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsTt-0000000Ebrs-04dE;
	Wed, 14 Oct 2026 06:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsTr-0000000Ebrm-3s0q
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:28:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A6DB43C8F;
	Wed, 14 Oct 2026 06:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0971F000FF;
	Wed, 14 Oct 2026 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791959331;
	bh=2d1+tjbu3ffcA9hLJEUcOzmzk/CiNMxVlQoA804Vb/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EeEZNYOwABHe0PzUw1zHQj1lbbVos1wtkCxVqr06NvWT2gwMYZCVMxlYV9GY2VZdm
	 aPAvYQmsYK5HSOvMIRQJL7zgSV1TM8xjCRy69B1bDpOgUozeOcJY2L7b0QkFOqB+Wp
	 MAPuTiNXOtz+bf3TwxfgOD2tVphXehO8wvvG7iXXjzxOSY8OCT0YQnHPCuVQ/63uvo
	 EWQ+SS8t7KndZii8NLEGdNFI0Jbvpg6cu+vmBVUwv99Fmp5xQ8NM0qCD5Pm7NYrwm+
	 YPLfraTrgE7bvOTz/Y6MsUw9bdXlk9K07oL9Oh1RKzB3zOQpkHltJaeIWKPcHJ8r8n
	 cdNVtKtHMRcHA==
Message-ID: <sashiko-outbox-170861@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ubifs: tnc_delete: Don't free zero-branch znodes if
 memory allocation fails
To: "Zhihao Cheng" <chengzhihao1@huawei.com>, richard@nod.at, ext-adrian.hunter@nokia.com
Cc: linux-mtd@lists.infradead.org, yangerkun@huawei.com, yi.zhang@huawei.com
In-Reply-To: <20261014060252.3531356-2-chengzhihao1@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
 <20261014060252.3531356-2-chengzhihao1@huawei.com>
Date: Wed, 14 Oct 2026 06:28:50 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHViaWZzOiBhc3NlcnRp
b24gZmFpbHVyZSBvbiBsb29rdXBzIGR1ZSB0byB6ZXJvLWNoaWxkIHpub2RlIGFmdGVyIHRuY19k
ZWxldGUoKSBlcnJvcgotLQoKY29tbWl0IDVjMTg1NDQ4M2MyZDA2YjZmZDNmYzQ2NzkxYjQyMmZj
ZDk1ODk1NmYKQXV0aG9yOiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoK
dWJpZnM6IHRuY19kZWxldGU6IERvbid0IGZyZWUgemVyby1icmFuY2ggem5vZGVzIGlmIG1lbW9y
eSBhbGxvY2F0aW9uIGZhaWxzCgpUaGlzIGNvbW1pdCBkZWxheXMgdGhlIGZyZWVpbmcgb2YgemVy
by1icmFuY2ggem5vZGVzIGluIHRuY19kZWxldGUoKQp1bnRpbCBhZnRlciBhbGwgaW5zZXJ0X29s
ZF9pZHhfem5vZGUoKSBjYWxscyBzdWNjZWVkLiBJdCBpbnRyb2R1Y2VzIGEKbG9jYWwgc3RhY2sg
bGlzdCB0byB0cmFjayB6bm9kZXMgdG8gYmUgZnJlZWQsIGFpbWluZyB0byBwcmV2ZW50IGEKdXNl
LWFmdGVyLWZyZWUgcmFjZSBjb25kaXRpb24gd2hlbiB0cmF2ZXJzaW5nIHRoZSBUTkMgdHJlZS4K
Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3RuYy5jIGIvZnMvdWJpZnMvdG5jLmMKPiAtLS0gYS9m
cy91Ymlmcy90bmMuYwo+ICsrKyBiL2ZzL3ViaWZzL3RuYy5jClsgLi4uIF0KPiBAQCAtMjU0Miwx
NSArMjU0MywyMCBAQCBzdGF0aWMgaW50IHRuY19kZWxldGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IHN0cnVjdCB1Ymlmc196bm9kZSAqem5vZGUsIGludCBuKQo+ICAJCWF0b21pY19sb25nX2RlYygm
Yy0+ZGlydHlfem5fY250KTsKPiAgCj4gIAkJZXJyID0gaW5zZXJ0X29sZF9pZHhfem5vZGUoYywg
em5vZGUpOwo+IC0JCWlmIChlcnIpCj4gKwkJaWYgKGVycikgewo+ICsJCQl6biA9IGZyZWVfaGVh
ZC5mbmV4dDsKPiArCQkJd2hpbGUgKHpuKSB7Cj4gKwkJCQlzdHJ1Y3QgdWJpZnNfem5vZGUgKm5l
eHQgPSB6bi0+Zm5leHQ7Cj4gKwo+ICsJCQkJem4tPmZuZXh0ID0gTlVMTDsKPiArCQkJCXpuID0g
bmV4dDsKPiArCQkJfQo+ICAJCQlyZXR1cm4gZXJyOwoKW1NldmVyaXR5OiBIaWdoXQpJZiBpbnNl
cnRfb2xkX2lkeF96bm9kZSgpIHJldHVybnMgYW4gZXJyb3IgbGlrZSAtRU5PTUVNLCBkb2VzIHRo
aXMgZWFybHkgCnJldHVybiBsZWF2ZSB0aGUgemVyby1jaGlsZCB6bm9kZSBsaW5rZWQgaW4gdGhl
IFROQyB0cmVlPwoKQmVjYXVzZSB3ZSByZXR1cm4gYmVmb3JlIHJlbW92aW5nIHRoZSB6bm9kZSBm
cm9tIGl0cyBwYXJlbnQncyB6YnJhbmNoIGFycmF5LCAKdGhlIHRyZWUgcmV0YWlucyBhIG5vZGUg
d2l0aCBjaGlsZF9jbnQgPT0gMC4gSWYgYSBzdWJzZXF1ZW50IHJlYWQgb3BlcmF0aW9uIAood2hp
Y2ggaXMgcGVybWl0dGVkIGV2ZW4gYWZ0ZXIgdGhlIGZpbGVzeXN0ZW0gaXMgZm9yY2VkIHRvIHJl
YWQtb25seSBtb2RlKSAKdHJhdmVyc2VzIHRoaXMgem5vZGUsIGl0IHdpbGwgY2FsbCB1Ymlmc19z
ZWFyY2hfemJyYW5jaCgpOgoKZnMvdWJpZnMvdG5jX21pc2MuYzp1Ymlmc19zZWFyY2hfemJyYW5j
aCgpIHsKICAgICAgICBpbnQgYmVnID0gMCwgZW5kID0gem5vZGUtPmNoaWxkX2NudCwgbWlkOwog
ICAgICAgIGludCBjbXA7CiAgICAgICAgY29uc3Qgc3RydWN0IHViaWZzX3picmFuY2ggKnpiciA9
ICZ6bm9kZS0+emJyYW5jaFswXTsKCiAgICAgICAgdWJpZnNfYXNzZXJ0KGMsIGVuZCA+IGJlZyk7
Ci4uLgp9CgpXaXRoIGVuZCA9PSAwIGFuZCBiZWcgPT0gMCwgdGhpcyB3aWxsIHRyaWdnZXIgdGhl
IGFzc2VydGlvbiBmYWlsdXJlLCB3aGljaCAKY2FuIHBhbmljIHRoZSBrZXJuZWwgaWYgbW91bnRl
ZCB3aXRoIGFzc2VydD1wYW5pYy4gRG9lcyB0aGlzIGVycm9yIHBhdGggbmVlZCAKdG8gcmVtb3Zl
IHRoZSB6bm9kZSBmcm9tIGl0cyBwYXJlbnQncyB6YnJhbmNoLCBvciBvdGhlcndpc2UgbWFyayBp
dCB0byAKcHJldmVudCBsb29rdXBzIGZyb20gdHJpcHBpbmcgdGhlIGFzc2VydGlvbj8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEw
MTQwNjAyNTIuMzUzMTM1Ni0xLWNoZW5nemhpaGFvMUBodWF3ZWkuY29tP3BhcnQ9MQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
