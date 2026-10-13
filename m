Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EC8CA9ED2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68o3PSi7RvaFDFniukxG0V6DubjyDz1NgP3D7yYu0lw=; b=CYQW1ogy4zZXJH
	0Zuv54JT24nAwHv6PBAmQDoXbU96+OoCq91RlfHe6ytUyXOt2qPu6j0/qBZLjgrKRBeI5jomO53G7
	KyWO3LA4uq85T+bEJKlj2hFR8vxoVtBHUTbj0fSU/Q6LjDhLoNDF6y95dokyEanTO+0qXhWXG4ddA
	rEZk1aj0tRuMkJDDgPQbwTA9729zDvs66ZD25AvRLIK/je8lIIKIUuq4IsmMb5cKpR4tWklmIb6M1
	vry/7Gy6kvGJpX5K32LiF8s8LEbmG49ReCkVjfV4WSYtt0kW+krRd3pRdGVgaPeReFtql+2rzXPaf
	73ZFkDKbcDWMTCU2TsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZwd-0000000Cbtj-0Wv6;
	Tue, 13 Oct 2026 10:41:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZwZ-0000000CbsL-3hzf
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 10:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D4C141863;
	Tue, 13 Oct 2026 10:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73961F000FF;
	Tue, 13 Oct 2026 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888075;
	bh=g/3nfpbkOWIF2Yo7UWNAbHAOaJRUf4pRXzrMf09AI4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fRHN6aOmYPN921FtOeeVH4fiTnl6QTeNJF+0ZwipW2JaFh9Kjwsvc3vDXUfORVwQ7
	 Jd45JrvrASwfSAeh6bOpbG1aIuuxqY0raPb/270w9ddO7qwCWB+mpa/DRN1AGnI1P9
	 rCG7b0wa8nUOjN/6S6loM/f9Hx+xGNGOMZ40uIDmma92A8YLYz141acXLCIh7J2yZb
	 /VUVnsMo7/mhPjm0/drLlfqVaV+aiSk/0Wb2xXu/Bj+v9C5nO5bMX7heXU7BLk/iIc
	 5E/0i/hqkshRweUTkwNPyvgHum6fq7s972fbjQ4SvMzUbsBga7SEdUhGvfWXr2rDGl
	 yFkYkcE0Zn9aA==
Message-ID: <sashiko-outbox-169529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: parsers: qcom: drop setting of partition's
 mask_flags
To: "Gabor Juhos" <j4g8y7@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
References: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
Date: Tue, 13 Oct 2026 10:41:14 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHFjb21zbWVtcGFydDog
aGVhcCBidWZmZXIgb3ZlcmZsb3cgdmlhIFNNRU0gVE9DVE9VCi0tCgpjb21taXQgOWEzMGU2ZTc0
NGVhNmE5M2FmNjA2OWNlOGFmZTZlNWUxZmY3NTA0MApBdXRob3I6IEdhYm9yIEp1aG9zIDxqNGc4
eTdAZ21haWwuY29tPgoKbXRkOiBwYXJzZXJzOiBxY29tOiBkcm9wIHNldHRpbmcgb2YgcGFydGl0
aW9uJ3MgbWFza19mbGFncwoKVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgYXNzaWdubWVudCBvZiBt
YXNrX2ZsYWdzIGZyb20gdGhlIHNtZW1fZmxhc2hfcGVudHJ5CnN0cnVjdHVyZSdzIGF0dHIgbWVt
YmVyIGluIHRoZSBRdWFsY29tbSBTTUVNIHBhcnRpdGlvbiBwYXJzZXIuIFRoZSBNVEQKbGF5ZXIg
ZG9lcyBub3QgZGVmaW5lIG1hc2thYmxlIGZsYWdzIGluIHRoZSBsb3dlciA4IGJpdHMsIGFuZCB0
aGUgZmllbGQgaXMKdW5kb2N1bWVudGVkLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI2MTAwNi1xY29tLXNtZW1wYXJ0LWlnbm9yZS1tYXNrX2ZsYWdzLXYxLTEtYTQ4ZDkzOTVi
MjFiQGdtYWlsLmNvbQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9xY29tc21l
bXBhcnQuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvcWNvbXNtZW1wYXJ0LmMKPiBpbmRleCAxNTkx
YWVhNDhiMjgwLi4zNTVlZmIyZTRlNDBjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNl
cnMvcWNvbXNtZW1wYXJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3Fjb21zbWVtcGFy
dC5jCj4gQEAgLTE0NCw3ICsxNDQsNiBAQCBzdGF0aWMgaW50IHBhcnNlX3Fjb21zbWVtX3BhcnQo
c3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAo+ICAJCXBhcnRzW2pdLm5hbWUgPSBuYW1lOwo+ICAJ
CXBhcnRzW2pdLm9mZnNldCA9ICh1NjQpbGUzMl90b19jcHUocGVudHJ5LT5vZmZzZXQpICogbXRk
LT5lcmFzZXNpemU7Cj4gLQkJcGFydHNbal0ubWFza19mbGFncyA9IHBlbnRyeS0+YXR0cjsKPiAg
CQlwYXJ0c1tqXS5zaXplID0gKHU2NClsZTMyX3RvX2NwdShwZW50cnktPmxlbmd0aCkgKiBtdGQt
PmVyYXNlc2l6ZTsKCltTZXZlcml0eTogSGlnaF0KQ291bGQgdGhpcyBsb29wIG92ZXJ3cml0ZSB0
aGUgcGFydHMgYXJyYXkgb3V0IG9mIGJvdW5kcz8KClNpbmNlIHB0YWJsZSBpcyBtYXBwZWQgaW4g
c2hhcmVkIG1lbW9yeSB2aWEgcWNvbV9zbWVtX2dldCgpLCB0aGUgY29udGVudHMKY291bGQgYmUg
bW9kaWZpZWQgYnkgYSByZW1vdGUgY29wcm9jZXNzb3IgY29uY3VycmVudGx5LgoKRWFybGllciBp
biBwYXJzZV9xY29tc21lbV9wYXJ0KCksIHRoZSBjb2RlIGNvdW50cyB2YWxpZCBwYXJ0aXRpb25z
OgoKCWZvciAoaSA9IDA7IGkgPCB0bXBwYXJ0czsgaSsrKSB7CgkJcGVudHJ5ID0gJnB0YWJsZS0+
cGVudHJ5W2ldOwoJCWlmIChwZW50cnktPm5hbWVbMF0gIT0gJ1wwJykKCQkJbnVtcGFydHMrKzsK
CX0KCglwYXJ0cyA9IGt6YWxsb2Nfb2JqcygqcGFydHMsIG51bXBhcnRzKTsKCklmIGEgcmVtb3Rl
IGNvcHJvY2Vzc29yIGNoYW5nZXMgcGVudHJ5LT5uYW1lWzBdIGZyb20gJ1wwJyB0byBhIG5vbi1u
dWxsCnZhbHVlIGJldHdlZW4gdGhpcyBmaXJzdCBjb3VudGluZyBsb29wIGFuZCB0aGUgc2Vjb25k
IHBvcHVsYXRpb24gbG9vcCwKd291bGQgdGhlIHNlY29uZCBsb29wIGZpbmQgbW9yZSB2YWxpZCBl
bnRyaWVzIHRoYW4gbnVtcGFydHM/CgpUaGlzIGFwcGVhcnMgbGlrZSBpdCB3b3VsZCBjYXVzZSB0
aGUgaW5kZXggaiB0byBpbmNyZW1lbnQgcGFzdCB0aGUgYWxsb2NhdGVkCnNpemUgb2YgcGFydHMs
IHJlc3VsdGluZyBpbiBhbiBvdXQtb2YtYm91bmRzIGhlYXAgd3JpdGUuCgpXb3VsZCBpdCBiZSBz
YWZlciB0byBhZGQgYW4gZXhwbGljaXQgYm91bmRzIGNoZWNrIGFnYWluc3QgbnVtcGFydHMgYmVm
b3JlCmFzc2lnbmluZyB2YWx1ZXMgdG8gcGFydHNbal0/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDEzLXFjb20tc21lbXBhcnQt
aWdub3JlLW1hc2tfZmxhZ3MtdjItMS0wMWI3ZTEzM2YyNzNAZ21haWwuY29tP3BhcnQ9MQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
