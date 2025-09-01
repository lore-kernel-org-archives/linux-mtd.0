Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D2DCA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpoCA6gHibBbp1TP8aQ9V+qwPB8V3EnyT16S+7zZyHk=; b=4gAsnsgAZwiIwo
	12VJblRAFxXZ2wow31zC5LuJOnlZFOYcShNp4cZjODCQztxvnkStR6aX+CEKIrkJglmlo2FQq3Mdr
	it49mdiV0rrhqrY/6IuhCWM37LghzCIZHAyGox1jhn9I4AFNAiQoGXKqi9sT8UH0h2gVEMebsmzkP
	g+bJc2m2eebKULGh4DQPHlYUZ4EWcil2jpbkyBYpgGYuNuSxg5jhe4F6KXwIsdX0c3wpn6JuGJb2b
	jCadCmaJGDrjEtIx80IzfIUn/cCrF7SpChf9ZDNWe/lTtPil0+vGpAiaEFXxHtivAKTtDSS8MR339
	Y4wXNFpfcHTxXvFIQxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Va-0000000DHDA-14XT;
	Mon, 01 Sep 2025 16:35:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3vl-0000000CaDN-43QU
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:46:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8905B1A0916;
	Mon,  1 Sep 2025 12:46:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6009160699;
	Mon,  1 Sep 2025 12:46:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E7961C22DB0A;
	Mon,  1 Sep 2025 14:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756730799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/05aT1f2Zg7MqMSxH8Ni4hn+jeFlAq/TGkX+O4StZLM=;
	b=bAFBxvNzUgAlizRVE3m7ZUcwfvS0BHIwOl86gCTdyAk79xMDzkDkJmn8fJbVi85m2Jj9gx
	szrLmxQIgAZSSMW3MuebodQX5XpAFBub26am2yn6es2cBGSg4+StiKewCWaMbtjyP/heKZ
	S2YVPjuRxNhi1Mg/2pVC5vVEcF8vqmDlb7d8ULIpZ0bkvi4g+dr6JsYhBo8NfFpBtSAWnh
	lSl444Zj8DJDg+eJ3VVfENiO0m4zbqIUYExGAE/nurX+OJpF46c1K4ApBWF/rWWGU8pj+B
	7+EQ8yWtd+KN0vL9J3j9emX0YoWVCz+w5UqZ+zjiGUC5wsLAXFuaRU0yNAsAFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  yi.zhang@huawei.com,  yangerkun@huawei.com,  chengzhihao1@huawei.com
Subject: Re: [bug report] mtd: bad block counter inflated when repeatedly
 marking the same block
In-Reply-To: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com> (Wang
	Zhaolong's message of "Mon, 1 Sep 2025 17:26:45 +0800")
References: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 01 Sep 2025 14:46:34 +0200
Message-ID: <87y0qynxw5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054642_139669_78782D15 
X-CRM114-Status: GOOD (  17.93  )
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

SGVsbG8sCgpPbiAwMS8wOS8yMDI1IGF0IDE3OjI2OjQ1ICswOCwgV2FuZyBaaGFvbG9uZyA8d2Fu
Z3poYW9sb25nQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6Cgo+IEhpIGFsbCwKPgo+IEnigJlkIGxp
a2UgdG8gcmVwb3J0IGEgbWlzbWF0Y2ggYmV0d2VlbiBiYWQtYmxvY2sgc3RhdGlzdGljcyBhbmQg
YWN0dWFsCj4gb24tZmxhc2ggc3RhdGUgd2hlbiByZXBlYXRlZGx5IGNhbGxpbmcgTUVNU0VUQkFE
QkxPQ0sgb24gdGhlIHNhbWUKPiBlcmFzZWJsb2NrLgo+Cj4gU3VtbWFyeQo+IC0gUmVwZWF0ZWRs
eSBtYXJraW5nIHRoZSBzYW1lIGJsb2NrIGJhZCAoZS5nLiwgNSB0aW1lcykgbWFrZXMKPiAgIC9z
eXMvY2xhc3MvbXRkL210ZFgvYmFkX2Jsb2NrcyBpbmNyZWFzZSBieSA1Lgo+IC0gQWZ0ZXIgcmVi
b290LCAgdGhlIHN0YXRpc3RpY2FsIHZhbHVlIHR1cmUgdG8gdGhlIGNvcnJlY3QgdmFsdWUgb2Yg
MS4KPiAtIFNvIHRoZSBydW50aW1lIGNvdW50ZXIgKGVjY19zdGF0cy5iYWRibG9ja3MpIGlzIGlu
ZmxhdGVkLgo+Cj4gUmVwcm8gKHdpdGggbmFuZHNpbS5rbykKPgo+IGBgYGJhc2gKPiAjIElEPSIw
eGVjLDB4YTEsMHgwMCwweDE1IiAjIDEyOE0gMTI4S0IgMktCCj4gIyBtb2Rwcm9iZSBuYW5kc2lt
IGlkX2J5dGVzPSRJRAo+ICMgfi9tdGQtdXRpbHMvbXRkX21hcmtiYWQgL2Rldi9tdGQxIDEwIDEg
IyBSZXBlYXQgNSB0aW1lcwo+IC4uLi4uLgo+ICMgfi9tdGQtdXRpbHMvbXRkX21hcmtiYWQgL2Rl
di9tdGQxIDEwIDEKPgo+ICMgLS0gSXQgY2FuIGJlIG9ic2VydmVkIHRoYXQgNSBiYWQgYmxvY2tz
IHdpbGwgYXBwZWFyIGluIHRoZSBzdGF0aXN0aWNhbCBpbmZvcm1hdGlvbi4KPiAjIGNhdCAvc3lz
L2NsYXNzL210ZC9tdGQxL2JhZF9ibG9ja3MKPiA1Cj4KPiAjIC0tIEluIGZhY3QsIHdlIGNhbiBv
bmx5IHNjYW4gMSBiYWQgYmxvY2suCj4gIyB1Ymlmb3JtYXQgLXYgL2Rldi9tdGQxICB8IGdyZXAg
ImJhZCBlcmFzZWJsb2NrIgo+IHViaWZvcm1hdDogMSBiYWQgZXJhc2VibG9ja3MgZm91bmQsIG51
bWJlcnM6IDEwCj4gYGBgCj4KPiBSb290IGNhdXNlIGFuYWx5c2lzIChrZXJuZWwtc2lkZSkKPgo+
IGBgYAo+IG10ZF9ibG9ja19tYXJrYmFkCj4gICBtdGQtPl9ibG9ja19tYXJrYmFkKCkKPiAgICAg
bmFuZF9ibG9ja19tYXJrYmFkCj4gICAgICAgcmV0ID0gbmFuZF9ibG9ja19pc2JhZAo+ICAgICAg
IHJldHVybiAwOyAvLyByZXQgPiAwCj4gICBtdGQtPmVjY19zdGF0cy5iYWRibG9ja3MrKzsgIC8v
IE5vIGJhZCBibG9ja3Mgd2FzIG1hcmtlZCBidXQgd2FzIGNvdW50ZWQuCj4gICBSZWxldmFudCBj
b2RlCj4gLSBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYzpuYW5kX2Jsb2NrX21hcmti
YWQoKQo+IC0gZHJpdmVycy9tdGQvbXRkY29yZS5jOm10ZF9ibG9ja19tYXJrYmFkKCkKPiBgYGAK
Pgo+IG5hbmRfYmxvY2tfbWFya2JhZCgpIHJldHVybnMgMCBib3RoIGZvciDigJxuZXdseSBtYXJr
ZWTigJ0gYW5kIOKAnGFscmVhZHkgYmFk4oCdLgo+IG10ZGNvcmUgY2Fubm90IHRlbGwgd2hldGhl
ciB0aGlzIGNhbGwgYWN0dWFsbHkgYWRkZWQgYSBuZXcgYmFkIGJsb2NrLAo+IGJ1dCBzdGlsbCBp
bmNyZW1lbnRzIGVjY19zdGF0cy5iYWRibG9ja3MuCj4KPiBQb3NzaWJsZSBmaXhlcyAoaGlnaCBs
ZXZlbCkKPiAtIENvcmUtc2lkZSBjb25zZXJ2YXRpdmUgZml4IChtaW5pbWFsIEFCSSBjaGFuZ2Up
Ogo+ICAgKiBJbiBtdGRfYmxvY2tfbWFya2JhZCgpLCBwcm9iZSBfYmxvY2tfaXNiYWQobWFzdGVy
LCBvZnMpIGJlZm9yZQo+ICAgICBjYWxsaW5nIF9ibG9ja19tYXJrYmFkKCksIGFuZCAoaWYgYXZh
aWxhYmxlKSBwcm9iZSBhZ2FpbiBhZnRlcgo+IHN1Y2Nlc3MuCgpTb3VuZHMgcmVhc29uYWJsZSB0
byBtZS4KCj4gICAqIE9ubHkgaW5jcmVtZW50IGVjY19zdGF0cy5iYWRibG9ja3MgaWYgdGhlIHN0
YXRlIHRyYW5zaXRpb25lZCBmcm9tCj4gICAgIOKAnGdvb2TigJ0gdG8g4oCcYmFk4oCdLgo+Cj4g
LSBUZWFjaCAqX2Jsb2NrX21hcmtiYWQoKSB0byByZXR1cm4gYSBkaXN0aW5jdCBwb3NpdGl2ZSBj
b2RlIGZvcgo+ICAg4oCcYWxyZWFkeSBiYWTigJ0gdnMg4oCcbmV3bHkgbWFya2Vk4oCdLCBzbyB0
aGUgY29yZSBjYW4gaW5jcmVtZW50IG9ubHkgb24KPiAgIOKAnG5ld2x5IG1hcmtlZOKAnS4KClRo
ZSBzdWJzeXN0ZW1zIGhhdmUgbm8gb3RoZXIgd2F5IHRvIHRlbGwgcmF0aGVyIHRoYW4gcHJvYmlu
ZyB0aGUgc3RhdGUKb2YgdGhlIG1hcmtlci4gSSBiZWxpZXZlIGl0IGlzIGJlc3QgdG8gZG8gaXQg
aW4gbXRkX2Jsb2NrX21hcmtiYWQoKSBpbgp0aGUgY29tbW9uIG10ZGNvcmUuYyByYXRoZXIgdGhh
biBpbiBlYWNoIGltcGxlbWVudGF0aW9uLgoKPiBXaGF0IEkgd2FudCB0byBrbm93IGlzOgo+IC0g
V291bGQgdGhlIGNvcmUtc2lkZSBwcmUvcG9zdCBfYmxvY2tfaXNiYWQgY2hlY2sgYmUgYWNjZXB0
YWJsZSBhcyBhIHNob3J0LXRlcm0gZml4Pwo+IC0gQW55IG9iamVjdGlvbnMgcmVnYXJkaW5nIHRo
ZSBleHRyYSBpc2JhZCBJTyBpbiB0aGUgbWFya2JhZCBwYXRoPwoKRmluZSBieSBtZSwgaXQncyBu
b3QgYSBob3QgcGF0aC4gSWYgd2UgZW5kIHVwIGhlcmUsIHdlIGFyZSBhbHJlYWR5IGRvaW5nCmRh
bWFnZSBjb250cm9sLjsKCj4gLSBMb25nZXItdGVybSwgaXMgdGhlcmUgaW50ZXJlc3QgaW4gYW4g
ZXhwbGljaXQgQVBJL3JldHVybi1jb2RlIHNlbWFudGljcwo+ICAgdG8gZGlmZmVyZW50aWF0ZSDi
gJxhbHJlYWR5IGJhZOKAnSB2cyDigJxuZXdseSBtYXJrZWTigJ0/CgpJZiB5b3UgbWVhbiB1c2Vy
c3BhY2UgQVBJLCBJJ2Qgc2F5IG5vdCBuZWNlc3NhcmlseS4gUXVlcnlpbmcgdGhlIHN0YXRzCmlz
IHByb2JhYmx5IHRoZSB3YXkgdG8gZ28uIEhvd2V2ZXIgaW4gdGhlIGtlcm5lbCwgd2hpbGUgSSB3
b3VsZCBpbgp0aGVvcnkgbm90IGJlIG9wcG9zZWQgdG8gaXQsIEkgZG9uJ3Qgc2VlIGhvdyBvbmUg
Y291bGQgaW1wbGVtZW50IHRoYXQgaW4KYSBtb3JlIGVmZmljaWVudCB3YXkgdGhhbiBwcm9iaW5n
IHRoZSBtYXJrZXIgYXMgZGlzY3Vzc2VkIGFib3ZlIGluIGEKY29tcGxleC1mcmVlIG1hbm5lci4K
Cj4gSeKAmW0gdmVyeSBpbnRlcmVzdGVkIGluIGhlbHBpbmcgcmVzb2x2ZSB0aGlzIGlzc3VlIGFu
ZCB3b3VsZCBiZSBncmF0ZWZ1bAo+IGZvciBhbnkgZ3VpZGFuY2Ugb3Igc3VnZ2VzdGlvbnMuCgpN
VEQgZm9sa3MgaW4gQ2MsIHlvdXIgZmVlZGJhY2sgaXMgYWxzbyB3ZWxjb21lIDstKQoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
