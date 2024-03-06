Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA12DC54E41
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlJq1gWkhg5Z61AMWx5NLaP7P20FekW8INGL8Hi0wHQ=; b=Ql0wDbOZPTJ/mb
	RrTXIj5TE+Ef5rhJITG4VHUszmp8yZk9PamI9U11k1tMdnuJSTi9fTZUkC3nejR0UampvDq0jrMaP
	EXcGNddEdbn+H93675BUoNAFV5RQ3zVhJukQfagnzZqrLv/tEFHn6lcxYYbBOCTZe5ZUDzF2RRqYw
	urfeLXHzrM5DwRTuOhsRg5uqP9ueqjQKdI/eE5ljkYyM0mwlHe9r22z14aTQuGil/NXWxfb/B+/jY
	n+9pzwrBwqNxSi0rny1ngLx6RcWwxvHtb7lbe8oEuehnUTyAozK7f+8hXTjmmI5lb8pszC/gFurqC
	cD4/Tjr+OaaWb7xJoM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtVY-00000000qX9-40s5;
	Wed, 06 Mar 2024 15:48:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtVV-00000000qWU-0lZr
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 15:48:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF22360006;
	Wed,  6 Mar 2024 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709740113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEOdzOBUr0WjDYq1EsFLRmuHaeXeVKpnjrYhZumWSoY=;
	b=FuUw0xViG3lOaqo8K0khqMdjuEJkKhWsTlZRVgouI1do0kSU1DKGfXs5nFNZHW1yGpH9Uo
	PEQjvcE2Re4bOI+mkSQKdT/h9NIxLO8tJB9xqFohVt5izWYPxDWUoUUTJqyQbq/MyIotEb
	DanxzGkhZeY6Ug7rJLmkWD3+jHgG7KGOoT+ObXPHU8mLvHW/dFJKvmgYIR+ku3+Pw7OtzP
	b3wsAa6DttaVZuLIeCscvTvYQTKjrfksKdjQgCqnplp8l8Myu2mfSAOgoEmZEQhIocMnjL
	5f3B+JveaOEy7QAyV+21G/CsKFSySXEXPNHeZI0uMSuWa29QVc6UgoQFXRMADw==
Date: Wed, 6 Mar 2024 16:48:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240306164831.29eed907@xps-13>
In-Reply-To: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
References: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_074837_511442_CB5BE140 
X-CRM114-Status: GOOD (  32.19  )
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

SGkgQWxleGFuZGVyLAoKYWRhQHRob3JzaXMuY29tIHdyb3RlIG9uIFdlZCwgNiBNYXIgMjAyNCAx
NTozNjowNCArMDEwMDoKCj4gSGVsbG8gZXZlcnlvbmUsCj4gCj4gSSB0aGluayBJIGZvdW5kIGEg
YnVnIGluIG5hbmRfb25maV9kZXRlY3QoKSB3aGljaCB3YXMgaW50cm9kdWNlZCB3aXRoCj4gY29t
bWl0IGMyNzg0MmU3ZTExZiAoIm10ZDogcmF3bmFuZDogb25maTogQWRhcHQgdGhlIHBhcmFtZXRl
ciBwYWdlCj4gcmVhZCB0byBjb25zdHJhaW50IGNvbnRyb2xsZXJzIikgYmFjayBpbiAyMDIwLgoK
SW50ZXJlc3RpbmcuIEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBkaWQgYnJva2UgYW55dGhpbmcs
IGFzCmNvbnN0cmFpbmVkIGNvbnRyb2xsZXJzIHdvdWxkIGp1c3Qgbm90IHN1cHBvcnQgdGhlIHJl
YWRfZGF0YV9vcCgpIGNhbGwKYW55d2F5LgoKVGhhdCBiZWluZyBzYWlkLCBJIGRvbid0IHNlZSB3
aHkgdGhlIGF0bWVsIGNvbnRyb2xsZXIgd291bGQKcmVmdXNlIHRoaXMgb3BlcmF0aW9uLCBhcyBp
dCBpcyBzdXBwb3NlZCB0byBzdXBwb3J0IGFsbApvcGVyYXRpb25zIHdpdGhvdXQgbGltaXRhdGlv
bi4gVGhpcyBpcyBvbmUgb2YgdGhlIHRocmVlIGlzc3Vlcwp5b3UgaGF2ZSwgdGhhdCBwcm9iYWJs
eSBuZWVkcyBmaXhpbmcuCgo+IEJhY2tncm91bmQgb24gaG93IEkgZm91bmQgdGhpczogSSdtIGN1
cnJlbnRseSBzdHJ1Z2dsaW5nIGdldHRpbmcgcmF3Cj4gbmFuZCBmbGFzaCBhY2Nlc3MgdG8gZmx5
IHdpdGggYW4gYXQ5MSBzYW05eDYwIFNvQyBhbmQgYSBTMzRNTDAyRzEKPiBTcGFuc2lvbiBTTEMg
cmF3IE5BTkQgZmxhc2ggb24gYSBjdXN0b20gYm9hcmQuICBUaGUgc2V0dXAgaXMKPiBjb21wYXJh
YmxlIHRvIHRoZSBzYW05eDYwIGN1cmlvc2l0eSBib2FyZCBhbmQgY2FuIGJlIHJlcHJvZHVjZWQg
d2l0aAo+IHRoYXQgb25lLgo+IAo+IE5BTkQgZmxhc2ggb24gc2FtOXg2MCBjdXJpb3NpdHkgYm9h
cmQgd29ya3MgZmluZSB3aXRoIHdoYXQgaXMgaW4KPiBtYWlubGluZSBMaW51eCBrZXJuZWwuICBI
b3dldmVyIGFmdGVyIHJlbW92aW5nIHRoZSBsaW5lICdyYi1ncGlvcyA9Cj4gPCZwaW9EIDUgR1BJ
T19BQ1RJVkVfSElHSD47JyBmcm9tIGF0OTEtc2FtOXg2MF9jdXJpb3NpdHkuZHRzIGFsbCBkYXRh
Cj4gcmVhZCBmcm9tIHRoZSBmbGFzaCBhcHBlYXJzIHRvIGJlIHplcm9zIG9ubHkuICAoSSBkaWQg
bm90IGFkZCB0aGF0Cj4gbGluZSB0byB0aGUgZHRzIG9mIG15IGN1c3RvbSBib2FyZCBmaXJzdCwg
dGhpcyBpcyBob3cgSSBzdHVtYmxlZCBvdmVyCj4gdGhpcy4pCj4gCj4gSSBoYXZlIG5vIGV4cGxh
bmF0aW9uIGZvciB0aGF0IGJlaGF2aW91ciwgaXQgc2hvdWxkIHdvcmsgd2l0aG91dCBSL0IjCj4g
YnkgcmVhZGluZyB0aGUgc3RhdHVzIHJlZ2lzdGVyLCBtYXliZSB3ZSBpbnZlc3RpZ2F0ZSB0aGF0
Cj4gaW4gZGVwdGggbGF0ZXIuCgpJIGRvbid0IHNlZSB3aHkgYXQgYSBmaXJzdCBsb29rLiBUaGUg
ZGVmYXVsdCBpcyAibm8gUkIiIGlmIG5vIHByb3BlcnR5CmlzIGdpdmVuIGluIHRoZSBEVCBzbyBp
dCBzaG91bGQgd29yay4gVHJhY2luZyB0aGUgd2FpdCByZWFkeSBmdW5jdGlvbgpjYWxscyBtaWdo
dCBoZWxwLgoKPiAgSG93ZXZlciB0aG9zZSBhbGwgemVyb3MgZGF0YSByZWFkcyBoYXBwZW5zIHdo
ZW4KPiByZWFkaW5nIHRoZSBPTkZJIHBhcmFtIHBhZ2UgYXMgd2VsbCBlcyBkYXRhIHJlYWQgZnJv
bSBPT0Ivc3BhcmUgYXJlYQo+IGxhdGVyIGFuZCBJIGJldCBpdCdzIHRoZSBzYW1lIHdpdGggdXN1
YWwgZGF0YS4KClJlYWRpbmcgZGF0YSB3aXRob3V0IG9ic2VydmluZyB0V0IgKyB0UiBtYXkgbGVh
ZCB0byB0aGlzLgoKPiBUaGlzIHJlYWQgZXJyb3IgcmV2ZWFscyBhIGJ1ZyBpbiBuYW5kX29uZmlf
ZGV0ZWN0KCkuICBBZnRlciBzZXR0aW5nCj4gdXAgc29tZSB0aGluZ3MgdGhlcmUncyB0aGlzIGZv
ciBsb29wOgo+IAo+ICAgICBmb3IgKGkgPSAwOyBpIDwgT05GSV9QQVJBTV9QQUdFUzsgaSsrKSB7
Cj4gCj4gRm9yIGkgPSAwIG5hbmRfcmVhZF9wYXJhbV9wYWdlX29wKCkgaXMgY2FsbGVkIGFuZCBp
biBteSBjYXNlIGFsbCB6ZXJvcwo+IGFyZSByZXR1cm5lZCBhbmQgdGh1cyB0aGUgQ1JDIGNhbGN1
bGF0ZWQgZG9lcyBub3QgbWF0Y2ggdGhlIGFsbCB6ZXJvcwo+IENSQyByZWFkLiAgU28gdGhlIHVz
dWFsIGJyZWFrIG9uIHN1Y2Nlc3NmdWwgcmVhZGluZyB0aGUgZmlyc3QgcGFnZSBpcwo+IHNraXBw
ZWQgYW5kIGZvciByZWFkaW5nIHRoZSBzZWNvbmQgcGFnZSBuYW5kX2NoYW5nZV9yZWFkX2NvbHVt
bl9vcCgpCj4gaXMgY2FsbGVkLiAgSSB0aGluayB0aGF0IG9uZSBhbHdheXMgZmFpbHMgb24gdGhp
cyBsaW5lOgo+IAo+ICAgICBpZiAob2Zmc2V0X2luX3BhZ2UgKyBsZW4gPiBtdGQtPndyaXRlc2l6
ZSArIG10ZC0+b29ic2l6ZSkgewo+IAo+IFRob3NlIHZhcmlhYmxlcyBjb250YWluIHRoZSBmb2xs
b3dpbmcgdmFsdWVzOgo+IAo+ICAgICBvZmZzZXRfaW5fcGFnZTogMjU2Cj4gICAgIGxlbjogMjU2
Cj4gICAgIG10ZC0+d3JpdGVzaXplOiAwCj4gICAgIG10ZC0+b29ic2l6ZTogMAoKSW5kZWVkLiBX
ZSBwcm9iYWJseSBuZWVkIHNvbWUga2luZCBvZiBleHRyYSBjaGVjayB0aGF0IGRvZXMgbm90IHBl
cmZvcm0KdGhlIGlmIGNsYXVzZSBhYm92ZSBpZiAhbXRkLT53cml0ZXNpemUuCgo+IFRoZSBjb25k
aXRpb24gaXMgdHJ1ZSBhbmQgbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKSByZXR1cm5zIHdp
dGgKPiAtRUlOVkFMLCBiZWNhdXNlIG10ZC0+d3JpdGVzaXplIGFuZCBtdGQtPm9vYnNpemUgYXJl
IG5vdCBzZXQgeWV0IGluCj4gdGhhdCBjb2RlIHBhdGguICBUaG9zZSBhcmUgcHJvYmFibHkgaW5p
dGlhbGl6ZWQgbGF0ZXIsIG1heWJlIHdpdGgKPiBwYXJhbWV0ZXJzIHJlYWQgZnJvbSB0aGF0IE9O
RkkgcGFyYW0gcGFnZT8KPiAKPiBSZXR1cm5pbmcgd2l0aCBlcnJvciBmcm9tIG5hbmRfY2hhbmdl
X3JlYWRfY29sdW1uX29wKCkgbGVhZHMgdG8KPiBqdW1waW5nIG91dCBvZiBuYW5kX29uZmlfZGV0
ZWN0KCkgZWFybHksIGFuZCBubyBPTkZJIHBhcmFtIHBhZ2UgaXMKPiBldmFsdWF0ZWQgYXQgYWxs
LCBhbHRob3VnaCB0aGUgc2Vjb25kIG9yIHRoaXJkIHBhZ2UgY291bGQgYmUgaW50YWN0Lgo+IAo+
IEkgZ3Vlc3MgdGhpcyB3b3VsZCBhbHNvIGZhaWwgd2l0aCBhbnkgb3RoZXIgcmVhc29uIGZvciBu
b3QgbWF0Y2hpbmcKPiBDUkNzIGluIHRoZSBmaXJzdCBwYWdlLCBidXQgSSBoYXZlIG5vdCBmYXVs
dHkgTkFORCBmbGFzaCBjaGlwIHRvCj4gY29uZmlybSB0aGF0LgoKVGhhbmtzIGZvciB0aGUgd2hv
bGUgcmVwb3J0LCBpdCBpcyBpbnRlcmVzdGluZyBhbmQgc2hvdWxkIGxlYWQgdG8gZml4ZXM6Ci0g
d2h5IGRvZXMgdGhlIGNvbnRyb2xsZXIgcmVmdXNlcyB0aGUgZGF0YWluIG9wPwotIHdoeSBuYW5k
X3NvZnRfd2FpdHJkeSBpcyBub3QgZW5vdWdoPwotIGNoYW5naW5nIHRoZSBjb25kaXRpb24gaW4g
bmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKQoKQ2FuIHlvdSB0YWtlIGNhcmUgb2YgdGhlc2U/
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
