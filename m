Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67065C27C4F
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RYL3LKjHdp1ywyj5+NDEudhcWddKZY5LGK8LksIGQYQ=; b=Z+CmRwrcs5ubSRIEcHSDU0REs0
	d232RtKJmmIceSZv8p8C6seqJeuUPfW5ewaUpv1TCI7iZLCHePlc+nBJh+xJwxZkuf/2UuIE4BMir
	xXhZmYnbfMjlqBdUsjsKe1nT6poGBA8eUcohbXe7ReMhy3AFMaHhCeHRlNoOC80i/euuZES9eGla9
	0joIzEA25/aLbj9AL8sCcGwF03VPDPCvgv8q+Ho8SE6POeo9bye2kcj0HDi2PuWj3a04VoEkvpnIc
	e/kxdYn5n7/8D7vRoPYpa7xEQd2/1XB5jIw2Zgf1sHMzetIbOJUpmFmnKuVWBHJeq09H3CwU55p31
	Jw6M1IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYZI-0000000GUSQ-2Y8h;
	Sat, 29 Jun 2024 13:56:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYZF-0000000GURg-3uuW
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 13:56:44 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC4A164943D7;
	Sat, 29 Jun 2024 15:56:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iVOF2YrmPjNl; Sat, 29 Jun 2024 15:56:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0DD8B61966A2;
	Sat, 29 Jun 2024 15:56:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bK8l-YBEmizS; Sat, 29 Jun 2024 15:56:29 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D0FFB61966A1;
	Sat, 29 Jun 2024 15:56:29 +0200 (CEST)
Date: Sat, 29 Jun 2024 15:56:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Ryder Wang <rydercoding@hotmail.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <84530892.9887.1719669389649.JavaMail.zimbra@nod.at>
In-Reply-To: <f9c0f1f3-5fbf-c86d-4056-b75ee368df76@huawei.com>
References: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM> <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com> <MEYP282MB3164701A51B29DB61B106566BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM> <MEYP282MB3164987D45E3CFC61B3E7CECBFD02@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM> <f9c0f1f3-5fbf-c86d-4056-b75ee368df76@huawei.com>
Subject: Re: ubifs: why ubifs doesn't support 2 copied of super blocks for
 better fs reliability
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: why ubifs doesn't support 2 copied of super blocks for better fs reliability
Thread-Index: OlFq1NTmBOsRIXmIIhGPnFOlmd5eOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_065642_291851_886CD2CB 
X-CRM114-Status: GOOD (  11.46  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiUnlkZXIgV2FuZyIgPHJ5ZGVyY29kaW5nQGhv
dG1haWwuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwg
InJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBHZXNlbmRldDogU2Ftc3RhZywgMjkuIEp1bmkg
MjAyNCAxMzoyMjozNAo+IEJldHJlZmY6IFJlOiB1Ymlmczogd2h5IHViaWZzIGRvZXNuJ3Qgc3Vw
cG9ydCAyIGNvcGllZCBvZiBzdXBlciBibG9ja3MgZm9yIGJldHRlciBmcyByZWxpYWJpbGl0eQoK
PiDlnKggMjAyNC82LzI4IDEwOjI4LCBSeWRlciBXYW5nIOWGmemBkzoKPj4gSGVsbG8sCj4+IAo+
PiBJdCBsb29rcyB1YmlmcyBoYXMgb25seSAxIHN1cGVyIGJsb2NrLiBTdXBlciBibG9jayBtYXkg
YmUgY29ycnVwdGVkIGJ5IHBvd2VyLWN1dAoKTm8uIFRoZSBzdXBlciBibG9jayBtdXN0IG5vdCBn
ZXQgY29ycnVwdGVkIGJ5IGEgc3VkZGVuIGxvc3Mgb2YgcG93ZXIuCklmIHlvdSdyZSBmYWNpbmcg
dGhpcywgc29tZXRoaW5nIGVsc2UgaW4geW91ciBzdG9yYWdlIHN0YWNrIGlzIGJyb2tlbi4KCj4+
IHdoaWxlIE5BTkQgZXJhc2luZyBvciB3cml0aW5nLCBFQ0MgZXJyb3IgYW5kIGV0Yy4gV2hlbiBz
dXBlciBibG9jayBpcwo+PiBjb3JydXB0ZWQsIHViaWZzIG1vdW50IHdpbGwgYWx3YXlzIGZhaWwu
Cj4+IAo+IAo+IEhhdmUgeW91IG1ldCB0aGUgcHJvYmxlbSBjYXVzZWQgYnkgY29ycnVwdGVkIHN1
cGVyYmxvY2s/IEkgb25seSBzYXcgb25jZQo+IGluIG91ciBwcm9kdWN0LCBpbiB3aGljaCB0aGVy
ZSB3YXJlIG1hbnkgcHJvYmxlbSBlcmFzZWJsb2NrcyBpbiB0aGUgZmxhc2guCj4gCj4+IEkgYW0g
YXNraW5nIHdoeSB1YmlmcyBkb2Vzbid0IHN1cHBvcnQgMiBjb3BpZWQgb2Ygc3VwZXIgYmxvY2tz
IGZvciBiZXR0ZXIgZnMKPj4gcmVsaWFiaWxpdHk/IEFzIHdlIGtub3csIGJvdGggdWliZnMgbWFz
dGVyIGJsb2NrIGFuZCB1Ymkgdm9sdW1lIHRhYmxlIGhhdmUgMgo+PiBjb3BpZXMsIHNvIHRoZXkg
YXJlIHZlcnkgc3Ryb25nZXIuIElzIHRoZXJlIGFueSBkZXYgcGxhbiB0byBzdXBwb3J0IGl0IG9u
IHN1cGVyCj4+IGJsb2NrPwo+IAo+IEkgaGF2ZSBubyBpZGVhcyBhYm91dCB0aGlzIHF1ZXN0aW9u
IGVpdGhlciBhZnRlciBsb29raW5nIHRocm91Z2ggdGhlCj4gaGlzdG9yeSBhbmQgd2hpdGVwYXBl
clsxXS4gVGhlIHN1cGVyYmxvY2sgaXMgdXBkYXRlZCBpbiBhIHZlcnkgbG93Cj4gZnJlcXVlbmN5
KGVnLiBhdXRvLXJlc2l6ZSksIGFuZCBpdCBpcyB1cGRhdGVkIGJ5IGF0b21pYyBjaGFuZ2luZy4g
U28gSQo+IGd1ZXNzIHRoYXQgY29ycnVwdGVkIHN1cGVyYmxvY2sgaXMgaGFyZGx5IGdlbmVyYXRl
ZCBmcm9tIHRoZSB2aWV3IG9mCj4gVUJJRlMgbGF5ZXIuIEhvd2V2ZXIsIHRoZSBVQkkgd2lsbCBk
byB3ZWFyLWxldmVpbmcsIHdoaWNoIGNvdWxkCj4gYXRvbWljYWxseSBleGNoYW5nZSB0d28gTEVC
cyhtYXkgY29udGFpbiBzdXBlcmJsb2NrKSwgdGhlbiB0aGUgdXBkYXRpbmcKPiBmcmVxdWVuY3kg
b2Ygc3VwZXJibG9jayBjb3VsZCBiZSBpbmNyZWFzZWQuIFRoZSBmaW5hbCBwcm9iYWJpbGl0eSBv
Zgo+IGNvcnJ1cHRlZCBzdXBlcmJsb2NrIGlzIGhhcmQgdG8gc2F5LiBTbywgSSdtIG5vdCBzdXJl
IGl0J3MgYSB2ZXJ5Cj4gdmFsdWFibGUgdGhpbmcgdG8gbWFpbnRhaW4gdHdvIHN1cGVyYmxvY2tz
IGluIFVCSUZTLCBhZnRlcmFsbCwgaXQgd2lsbAo+IGNoYW5nZSBkaXNrIHN0cnVjdHVyZS4KClVC
SUZTIHJlbGllcyBvbiB3b3JraW5nIGZsYXNoIG1lbW9yeSwgc28gaGF2aW5nIG11bHRpcGxlIGNv
cGllcyBtYWtlcyBubyBzZW5zZQpzaW5jZSBvbmUgb2YgVUJJRlMnIGdvYWxzIGlzIGFsc28gYmVp
bmcgc3BhY2UgZWZmaWNpZW50LgpUaGVyZSBpcyBvbmUgZXhjZXB0aW9uOiBpdCBoYXMgdHdvIG1h
c3RlciBMRUJzLiBGb3IgaGlzdG9yaWMgcmVhc29ucywKaXQgbmVlZHMgdG8gZXhjaGFuZ2UgdGhl
aXJzIGNvbnRlbnRzIGF1dG9tYXRpY2FsbHksIGF0IHRoZSB0aW1lIHdoZW4gVUJJRlMKd2FzIHlv
dW5nLCBVQkkgaGFkIG5vIGF0b21pYy1sZWItY2hhbmdlIGZlYXR1cmUuCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
