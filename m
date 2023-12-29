Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E077C46CD3
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Dec 2023 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AGKzeZ9PUIDx6Y9kUfXFhlN4dt+ab/+JZVU9BgvVCBE=; b=o+p/cSOep+EPfQGEelAH4Q7yu3
	+HB+/Wi86TncDA9UghI+LLpI+seEJ5JZe26FD+dscM9yaVmmA2G02NPbKME6TKDeVp1ed6I7fmasg
	JCUyESofeVVTYmGmBKV2/rcVdscocYFxy+xc+CiJkWMWpxxM3BXevuRfyhw8OQ+WMaLKQH/cLnYMs
	2ET05EabwHmTdmiDeuNPPxmpEi1yv1+gPeXNVGlhH0EO8dfJZ+CRF0+Q8GJgW9mhFwG/t2C0s/9/H
	0C13xEfYJerX7qKNqxePjJgT9EosmXEy56LoD3dNc3zs5bXXiG/CsQxgh27l8kHYnuSl6kGOrlmt2
	FZ61KpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ9kp-000aKg-1t;
	Fri, 29 Dec 2023 10:06:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ9kl-000aKC-1p
	for linux-mtd@lists.infradead.org;
	Fri, 29 Dec 2023 10:06:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8DB196343B36;
	Fri, 29 Dec 2023 11:06:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id W5C9DOrgUFB0; Fri, 29 Dec 2023 11:06:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B7F466343B3C;
	Fri, 29 Dec 2023 11:06:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W8mcbDZFkA7d; Fri, 29 Dec 2023 11:06:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8365E6343B36;
	Fri, 29 Dec 2023 11:06:02 +0100 (CET)
Date: Fri, 29 Dec 2023 11:06:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1145531757.175508.1703844362355.JavaMail.zimbra@nod.at>
In-Reply-To: <20231228014112.2836317-1-chengzhihao1@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Add filesystem repair support
Thread-Index: dDGyRRcFTNJRSeVoML57/54HOrx0FA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_020607_925513_A49AD7AA 
X-CRM114-Status: GOOD (  11.67  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiZGF2aWQgb2JlcmhvbGxlbnplciIgPGRhdmlk
Lm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
LCAiTWlxdWVsIFJheW5hbCIKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJTYXNjaGEg
SGF1ZXIiIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiwgIlR1ZG9yIEFtYmFydXMiIDxUdWRvci5B
bWJhcnVzQGxpbmFyby5vcmc+Cj4gQ0M6ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
Pgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAyOC4gRGV6ZW1iZXIgMjAyMyAwMjo0MDo1NQo+IEJl
dHJlZmY6IFtQQVRDSCBSRkMgMDAvMTddIHViaWZzOiBBZGQgZmlsZXN5c3RlbSByZXBhaXIgc3Vw
cG9ydAoKVGhhbmtzIGEgbG90IGZvciBzaGFyaW5nIHRoaXMuCkJlbG93IHlvdSBmaW5kIHNvbWUg
dGhvdWdodHMgdGhhdCBjYW1lIGludG8gbXkgbWluZCB3aGlsZSBza2ltbWluZyBvdmVyIHRoZQpw
YXRjaCBzZXJpZXMuCgo+IFVCSUZTIHJlcGFpciBwcm92aWRlcyBhIHdheSB0byBmaXggaW5jb25z
aXN0ZW50IFVCSUZTIGltYWdlKHdoaWNoIGlzCj4gY29ycnVwdGVkIGJ5IGhhcmR3YXJlIGV4Y2Vw
dGlvbnMgb3IgVUJJRlMgcmVhbGl6YXRpb24gYnVncykgYW5kIG1ha2VzCj4gZmlsZXN5c3RlbSBi
ZWNvbWUgY29uc2lzdGVudCwganVzdCBsaWtlIGZzY2sgdG9vbHMoZWcuIGZzY2suZXh0NCwKPiBm
c2NrLmYyZnMsIGZzY2suZmF0LCBldGMuKSBkby4KCkkgZG9uJ3QgZnVsbHkgYWdyZWUuIFRoZSB0
b29sIG1ha2VzIFVCSUZTIG1vdW50IGFnYWluIGJ1dCB5b3Ugc3RpbGwgaGF2ZSBsb3N0IGRhdGEK
YW5kIGxhdGVyIHVzZXJzcGFjZSBtaWdodCBmYWlsIGJlY2F1c2UgZmlsZSBubyBsb25nZXIgY29u
dGFpbiB3aGF0IHRoZSBhcHBsaWNhdGlvbgpleHBlY3RlZC4KU28gbXkgZmVhciBpcyB0aGF0IHdl
J3JlIGp1c3Qgc2hpZnRpbmcgdGhlIHByb2JsZW0gb25lIGxheWVyIHVwLgoKVUJJRlMgbmV2ZXIg
aGFkIGEgZnNjayBmb3IgcmVhc29ucy4gVUJJRlMgdHJpZXMgaGFyZCB0byBub3QgYmVjb21lIGlu
Y29uc2lzdGVudCwKYnkgbWFpbnRhaW5pbmcgYSBkYXRhIGpvdXJuYWwgZm9yIGV4YW1wbGUuCkl0
IGNhbiBmYWlsIG9mIGNvdXJzZSBieSBoYXJkd2FyZSBpc3N1ZXMuIGUuZy4gaWYgdGhlIHVuZGVy
bHlpbmcgTVREIGxvc2VzIGJpdHMsCmJ1dCB0aGVyZSBpcyBub3RoaW5nIFVCSUZTIGNhbiBkbyBl
eGNlcHQgc29tZXRoaW5nIGxpa2Ugc3RvcmluZyBkdXBsaWNhdGVzCm9mIGRhdGEgbGlrZSBCVFJG
UyBkb2VzLgoKQW5kIGZpbmFsbHksIHRoZSBiaWdnZXN0IHBhaW4gcG9pbnQsIGl0IGNhbiBmYWls
IGR1ZSB0byBidWdzIGluIFVCSUZTIGl0c2VsZi4KSW4gbXkgb3BpbmlvbiBidWdzIHNob3VsZCBn
ZXQgYWRkcmVzc2VkIGJ5IGltcHJvdmluZyBvdXIgdGVzdCBpbmZyYXN0cnVjdHVyZQppbnN0ZWFk
IG9mIHdvcmtpbmcgYXJvdW5kLgoKPiBBYm91dCB3aHkgZG8gd2UgbmVlZCBpdCwgaG93IGl0IHdv
cmtzLCB3aGF0IGl0IGNhbiBmaXggb3IgaXQgY2FuIG5vdAo+IGZpeCwgd2hlbiBhbmQgaG93IHRv
IHVzZSBpdCwgc2VlIG1vcmUgZGV0YWlscyBpbgo+IERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMv
dWJpZnMvcmVwYWlyLnJzdCAoUGF0Y2ggMTcpLgoKVGhpcyBuZWVkcyB0byBnbyBpbnRvIHRoZSBj
b3ZlciBsZXR0ZXIuCiAKPiBUZXN0aW5nIG9uIFVCSUZTIHJlcGFpciByZWZlcnMgdG8KPiBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODMyNwo+IAo+IFdoYXRl
dmVyLCB3ZSBmaW5hbGx5IGhhdmUgYSB3YXkgdG8gZml4IGluY29uc2lzdGVudCBVQkZJUyBpbWFn
ZSBpbnN0ZWFkCj4gb2YgZm9ybWF0dGluZyBVQkkgd2hlbiBVQklGUyBiZWNvbWVzIGluY29uc2lz
dGVudC4KCkZpeCBpbiB0ZXJtcyBvZiBtYWtpbmcgbW91bnQgd29yayBhZ2FpbiwgSSBmZWFyPyBB
cyBJIHNhaWQsIG1vc3QgbGlrZWx5CnRoZSBwcm9ibGVtIGlzIG5vdyBvbmUgbGF5ZXIgYWJvdmUu
IFVCSUZTIHRoaW5rcyBldmVyeXRoaW5nIGlzIGdvb2QgYnV0CnVzZXJzcGFjZSBzdWRkZW5seSB3
aWxsIHNlZSBvbGQvaW5jb21wbGV0ZSBmaWxlcy4KCldoYXQgSSBjYW4gdGhpbmsgb2YgaXMgYSB0
b29sIChpbiB1c2Vyc3BhY2UgbGlrZSBvdGhlciBmc2Nrcykgd2hpY2gKY2FuIHJlY292ZXIgY2Vy
dGFpbiBVQklGUyBzdHJ1Y3R1cmVzIGJ1dCBtYWtlcyB2ZXJ5IGNsZWFyIHRvIHRoZSB1c2VyIHdo
YXQKdGhlIGRhdGEgaXMgbG9zdC4gZS5nLiB0aGF0IGlub2RlIFhZIG5vdyBtaXNzZXMgc29tZSBi
bG9ja3Mgb3IgYW4gb2xkIHZlcnNpb24Kb2Ygc29tZXRoaW5nIHdpbGwgYmUgdXNlZC4KQnV0IHRo
aXMgaXNsIG5vdGhpbmcgeW91IGNhbiBydW4gYmxpbmRseSBpbiBwcm9kdWN0aW9uLgoKVGhhbmtz
LAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
