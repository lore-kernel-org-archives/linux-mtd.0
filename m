Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6920FC77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0K1BorfUCID0gf1CQOXlOEuVCPS8QZpRyU4zOne/VP8=; b=qJ7qwxteztOkbVC6JDw30T3xAb
	fv3b6j2142pTZ0dw/c4s3bwu/ghSZG7vZ7WQeUFtncxOzlwq6P4k+BJvwxVMcgoNVyL20KKEgD1iy
	jBc5DLDplIK7VjCEE7kkyfRyq+QwspAouvtIBjxUSnZZWG04IlFkJ1hLzpAtT4wB/pMIsjfKvtkjO
	7QnYhLYH+gYlKL8L2P3I2Te/ONJ/r48KNeGOHGfmuZ9zPuLGaQUBjpzhyriyW9lTSd4nj8VA8BX/y
	xUm7O3g8mHfpzAnDl92z2KUyZXVzpANqURa0mw/PbUXF+gqHtd5+f2l3lDmENyl9nuEsAjc33f/Ho
	TTwQzO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ht2-00GsVo-2M;
	Mon, 05 Jun 2023 21:37:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Hsv-00GsSU-2x
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 21:37:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CF5486081100;
	Mon,  5 Jun 2023 23:37:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id o2Z4OgpbQyJk; Mon,  5 Jun 2023 23:37:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6443D63CC10C;
	Mon,  5 Jun 2023 23:37:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dphcjNX2YtIR; Mon,  5 Jun 2023 23:37:00 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 41445609D2C4;
	Mon,  5 Jun 2023 23:37:00 +0200 (CEST)
Date: Mon, 5 Jun 2023 23:37:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Message-ID: <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at>
In-Reply-To: <20230605165029.2908304-5-willy@infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org> <20230605165029.2908304-5-willy@infradead.org>
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Convert do_writepage() to take a folio
Thread-Index: dsWwczfD853kFS6dMFwnonvyX+Bcrw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_143706_101929_0B1BA095 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
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

TWF0dGhldywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJNYXR0aGV3
IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gLXN0YXRpYyBpbnQgZG9fd3JpdGVwYWdl
KHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgbGVuKQo+ICtzdGF0aWMgaW50IGRvX3dyaXRlcGFnZShz
dHJ1Y3QgZm9saW8gKmZvbGlvLCBzaXplX3QgbGVuKQo+IHsKPiAJaW50IGVyciA9IDAsIGksIGJs
ZW47Cj4gCXVuc2lnbmVkIGludCBibG9jazsKPiAJdm9pZCAqYWRkcjsKPiArCXNpemVfdCBvZmZz
ZXQgPSAwOwo+IAl1bmlvbiB1Ymlmc19rZXkga2V5Owo+IC0Jc3RydWN0IGlub2RlICppbm9kZSA9
IHBhZ2UtPm1hcHBpbmctPmhvc3Q7Cj4gKwlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZm9saW8tPm1h
cHBpbmctPmhvc3Q7Cj4gCXN0cnVjdCB1Ymlmc19pbmZvICpjID0gaW5vZGUtPmlfc2ItPnNfZnNf
aW5mbzsKPiAKPiAjaWZkZWYgVUJJRlNfREVCVUcKPiAJc3RydWN0IHViaWZzX2lub2RlICp1aSA9
IHViaWZzX2lub2RlKGlub2RlKTsKPiAJc3Bpbl9sb2NrKCZ1aS0+dWlfbG9jayk7Cj4gLQl1Ymlm
c19hc3NlcnQoYywgcGFnZS0+aW5kZXggPD0gdWktPnN5bmNlZF9pX3NpemUgPj4gUEFHRV9TSElG
VCk7Cj4gKwl1Ymlmc19hc3NlcnQoYywgZm9saW8tPmluZGV4IDw9IHVpLT5zeW5jZWRfaV9zaXpl
ID4+IFBBR0VfU0hJRlQpOwo+IAlzcGluX3VubG9jaygmdWktPnVpX2xvY2spOwo+ICNlbmRpZgo+
IAo+IC0JLyogVXBkYXRlIHJhZGl4IHRyZWUgdGFncyAqLwo+IC0Jc2V0X3BhZ2Vfd3JpdGViYWNr
KHBhZ2UpOwo+ICsJZm9saW9fc3RhcnRfd3JpdGViYWNrKGZvbGlvKTsKPiAKPiAtCWFkZHIgPSBr
bWFwKHBhZ2UpOwo+IC0JYmxvY2sgPSBwYWdlLT5pbmRleCA8PCBVQklGU19CTE9DS1NfUEVSX1BB
R0VfU0hJRlQ7Cj4gKwlhZGRyID0ga21hcF9sb2NhbF9mb2xpbyhmb2xpbywgb2Zmc2V0KTsKPiAr
CWJsb2NrID0gZm9saW8tPmluZGV4IDw8IFVCSUZTX0JMT0NLU19QRVJfUEFHRV9TSElGVDsKPiAJ
aSA9IDA7Cj4gLQl3aGlsZSAobGVuKSB7Cj4gLQkJYmxlbiA9IG1pbl90KGludCwgbGVuLCBVQklG
U19CTE9DS19TSVpFKTsKPiArCWZvciAoOzspIHsKClRoaXMgY2hhbmdlIHdpbGwgY2F1c2UgYSBm
aWxlIHN5c3RlbSBjb3JydXB0aW9uLgpJZiBsZW4gaXMgemVybyAoaXQgY2FuIGJlKSB0aGVuIGEg
emVybyBsZW5ndGggZGF0YSBub2RlIHdpbGwgYmUgd3JpdHRlbi4KVGhlIHdoaWxlKGxlbikgbWFk
ZSBzdXJlIHRoYXQgdXBvbiB6ZXJvIGxlbmd0aCBub3RoaW5nIGlzIHdyaXR0ZW4uCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
