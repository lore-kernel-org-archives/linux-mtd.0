Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF2DE909C4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Feb 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AIQ6FyPWDZkkZ4qpW2NV217Q0pVy6xx0O0FGEnByk9E=; b=ofBUuFG1nwJ0CX
	ZFqymaqk80xVLcpeUW5Ytd7qZNnN08O1e7oKj3eQmhLS3236/1ktiEjnnVY7kNhyS3EZorM9u9/p4
	wI8/LggAqUWxWpKbn3wJmav3mDwJDYRYYOYBMwzEl3siPjc3QAfDHpsIM4HAlmiGN8r/wSnjNzDiu
	JLJZtn9rvEvBrebPr48zY7m/k2E/pRfPzzRvJgmG89YdNlR5e/3yPF+5uzB//8MSeMFPqOE3QtSc9
	8/lWEhyy4CiF4gFoBuCo9w9Epsm1moODHICc2xT4K3Q8O2OR3Mn4reh4WDDnOpVLDtipJ/dkbsWs7
	7TnHNyaD3cQ/FbulfuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNQE-00000008WrJ-3veU;
	Tue, 17 Feb 2026 15:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNQ8-00000008WqY-0wvX
	for linux-mtd@lists.infradead.org;
	Tue, 17 Feb 2026 15:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B46E940D77;
	Tue, 17 Feb 2026 15:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C1DC4CEF7;
	Tue, 17 Feb 2026 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771343726;
	bh=L35H+GtnkTeyAXIt5VKWZipstf0JFx3wlvaCD9nuMjc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hHeAwEQh5pggpZi66sbFrursUDExIHmjWVEl22QsQLdKORuAtxb7kgVW1D0u/UW1O
	 Qq+pSU/KRGwGSQNstMk9cyjQYSzwMBBZwr7eBPxF4pKe0RQA6Looii+F2dM8yvYbKI
	 rmyqW1w52d48uucOwHQrbTlBD0dlYpVyLmfYx13AjLt7I5DHYoAl8Cfukq2hthY1Fp
	 cp5GhuBhzbEnRsR5KPJQ3Tqq/9DV1QfOcHIEoK6V4LuUlCwKTmQf5wu8JVjO86mUM/
	 wZerxaiKWTvEXH6PQRFyY9Rnh8eb2nIOQI2OKRUE2FlEb7jeHOcXBTj9A99dOuJyTo
	 1v4tVut66hKxw==
Date: Tue, 17 Feb 2026 09:55:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: cafe: Use generic power management'
Message-ID: <20260217155525.GA3377374@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_075528_583245_C915A872 
X-CRM114-Status: GOOD (  21.15  )
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

T24gTW9uLCBGZWIgMTYsIDIwMjYgYXQgMDk6MDI6NDRBTSArMDAwMCwgVmFpYmhhdiBHdXB0YSB3
cm90ZToKPiBTd2l0Y2ggdG8gdGhlIGdlbmVyaWMgUENJIHBvd2VyIG1hbmFnZW1lbnQgZnJhbWV3
b3JrIGFuZCByZW1vdmUgbGVnYWN5Cj4gY2FsbGJhY2tzIGxpa2UgLnJlc3VtZSgpLiBXaXRoIHRo
ZSBnZW5lcmljIGZyYW1ld29yaywgdGhlIHN0YW5kYXJkIFBDSQo+IHJlbGF0ZWQgd29yayBsaWtl
Ogo+IAktIHBjaV9zYXZlL3Jlc3RvcmVfc3RhdGUoKQo+IAktIHBjaV9lbmFibGUvZGlzYWJsZV9k
ZXZpY2UoKQo+IAktIHBjaV9zZXRfcG93ZXJfc3RhdGUoKQo+IGlzIGhhbmRsZWQgYnkgdGhlIFBD
SSBjb3JlLgo+IAo+IFRoaXMgZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQgb25seSBjYWZlX25hbmQg
c3BlY2lmaWMgb3BlcmF0aW9ucyBpbiBpdHMKPiBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcmVzdW1l
LgoKTG9va3MgZ29vZCB0byBtZSwgdGhhbmtzIGZvciBkb2luZyB0aGlzIQoKSSB0aGluayB0aGUg
Y29tbWl0IGxvZyBpcyBhIGJpdCBvdmVybHkgc3BlY2lmaWMgc2luY2UgdGhpcyBkcml2ZXIKbmV2
ZXIgZGlkIGFueSBvZiB0aGUgUENJLXJlbGF0ZWQgd29yayBpdCBtZW50aW9ucy4gIElNTyBzb21l
dGhpbmcgbGlrZQp0aGlzIHdvdWxkIGJlIHN1ZmZpY2llbnQ6CgogIFN3aXRjaCBmcm9tIFBDSSBw
b3dlciBtYW5hZ2VtZW50IHRvIHRoZSBnZW5lcmljIHBvd2VyIG1hbmFnZW1lbnQKICBmcmFtZXdv
cmsgc28gdGhlIHBjaV9kcml2ZXIgaG9va3MgY2FuIGV2ZW50dWFsbHkgYmUgcmV0aXJlZC4KClJl
dmlld2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgoKPiBTaWduZWQt
b2ZmLWJ5OiBWYWliaGF2IEd1cHRhIDx2YWliaGF2Z3VwdGE0MEBnbWFpbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIHwgNyArKysrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y2FmZV9uYW5kLmMKPiBpbmRleCA2NjM4NWM0ZmI5OTQuLmFmNzcxYzM3OWVjMSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gQEAgLTgzNyw5ICs4MzcsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGNhZmVfbmFuZF90YmxbXSA9IHsKPiAgCj4gIE1PRFVMRV9E
RVZJQ0VfVEFCTEUocGNpLCBjYWZlX25hbmRfdGJsKTsKPiAgCj4gLXN0YXRpYyBpbnQgY2FmZV9u
YW5kX3Jlc3VtZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiArc3RhdGljIGludCBjYWZlX25hbmRf
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJdWludDMyX3QgY3RybDsKPiArCXN0
cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+ICAJc3RydWN0IG10ZF9pbmZv
ICptdGQgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4gIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
ID0gbXRkX3RvX25hbmQobXRkKTsKPiAgCXN0cnVjdCBjYWZlX3ByaXYgKmNhZmUgPSBuYW5kX2dl
dF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gQEAgLTg3NywxMiArODc4LDE0IEBAIHN0YXRpYyBp
bnQgY2FmZV9uYW5kX3Jlc3VtZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+ICtzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKGNhZmVfbmFuZF9vcHMs
IE5VTEwsIGNhZmVfbmFuZF9yZXN1bWUpOwo+ICsKPiAgc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVy
IGNhZmVfbmFuZF9wY2lfZHJpdmVyID0gewo+ICAJLm5hbWUgPSAiQ0FGw4kgTkFORCIsCj4gIAku
aWRfdGFibGUgPSBjYWZlX25hbmRfdGJsLAo+ICAJLnByb2JlID0gY2FmZV9uYW5kX3Byb2JlLAo+
ICAJLnJlbW92ZSA9IGNhZmVfbmFuZF9yZW1vdmUsCj4gLQkucmVzdW1lID0gY2FmZV9uYW5kX3Jl
c3VtZSwKPiArCS5kcml2ZXIucG0gPSAmY2FmZV9uYW5kX29wcywKPiAgfTsKPiAgCj4gIG1vZHVs
ZV9wY2lfZHJpdmVyKGNhZmVfbmFuZF9wY2lfZHJpdmVyKTsKPiAtLSAKPiAyLjUzLjAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
