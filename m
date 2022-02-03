Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B4C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 09:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VB+13FGJtmCA9biNSobD3ptaEuQtLRjm9ig7sDXe6d4=; b=e1lxYbiuVfKEb3MFWQWcBSPDsc
	NWK1fHwZ6fnLhm1ua2+jKct7rQoZfDQpm+zQ86i49RJHeKpml5WEbIY6uCmMaT+AMrG2Tl656DxTd
	Tz8DzhNSEO1vRbT90Qw0qjKPefa3Vgnpesus6FbKGe0TDtBDRk9FQKkYFa5CbKGDISm9iCYgn479q
	iAIJVXOWVw271GUi4t02uVLBxt4ruDIlZq4EN9fzDWuPWyh9POSAuvNZfIZlbU6Ta6MeFH/LJmAVG
	xiUcMzQFpPQoBQKLmcjBnqLqDInQyJwy7jhnQ0RyKU740+IJrImZiY9iN52y2X1pSU3NntzzrzhHg
	IyKhh0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYGm-000V6D-Ek; Thu, 03 Feb 2022 09:19:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYGj-000V49-J1
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 09:19:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CB4CE614E2C9;
 Thu,  3 Feb 2022 10:18:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ig2hg8HhEsea; Thu,  3 Feb 2022 10:18:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 21F80613AFDF;
 Thu,  3 Feb 2022 10:18:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6NhwpoOldHN9; Thu,  3 Feb 2022 10:18:57 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EEED3613AFD6;
 Thu,  3 Feb 2022 10:18:56 +0100 (CET)
Date: Thu, 3 Feb 2022 10:18:56 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
In-Reply-To: <20220125104822.8420-5-kernel@kempniu.pl>
References: <20220125104822.8420-1-kernel@kempniu.pl>
 <20220125104822.8420-5-kernel@kempniu.pl>
Subject: Re: [PATCH v3 4/4] mtdchar: add MEMREAD ioctl
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: add MEMREAD ioctl
Thread-Index: 4v2g4Z4lx0v5vFZ8+gLXLp2J71QhHg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_011909_809719_ADF4CD16 
X-CRM114-Status: UNSURE (   2.65  )
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

TWljaGHFgiwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJNaWNoYcWC
IEvEmXBpZcWEIiA8a2VybmVsQGtlbXBuaXUucGw+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4KPiBDQzogIkJvcmlzIEJyZXppbGxv
biIgPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIKPiA8bGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRGllbnN0YWcsIDI1LiBKYW51YXIgMjAyMiAxMTo0
ODoyMgo+IEJldHJlZmY6IFtQQVRDSCB2MyA0LzRdIG10ZGNoYXI6IGFkZCBNRU1SRUFEIGlvY3Rs
Cgo+ICsJaWYgKHJlcS5zdGFydCArIHJlcS5sZW4gPiBtdGQtPnNpemUpIHsKCkkgdGhpbmsgdGhp
cyBjYW4gb3ZlcmZsb3cgc2luY2UgYm90aCByZXEuc3RhcnQgYW5kIHJlcS5sZW4gYXJlIHU2NC4K
U28gYW4gZXZpbC1kb2VyIG1pZ2h0IGJ5cGFzcyB0aGlzIGNoZWNrLgoKPiArCQlyZXQgPSAtRUlO
VkFMOwo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiArCWRhdGJ1Zl9sZW4gPSBtaW5fdChzaXpl
X3QsIHJlcS5sZW4sIG10ZC0+ZXJhc2VzaXplKTsKPiArCWlmIChkYXRidWZfbGVuID4gMCkgewo+
ICsJCWRhdGJ1ZiA9IGttYWxsb2MoZGF0YnVmX2xlbiwgR0ZQX0tFUk5FTCk7CgpJZiBtdGQtPmVy
YXNlc2l6ZSBpcyBsYXJnZSAod2hpY2ggaXMgbm90IHVuY29tbW9uIHRoZXNlIGRheXMpIHlvdSBt
aWdodApyZXF1ZXN0IG1vcmUgZnJvbSBrbWFsbG9jKCkgdGhhbiBpdCBjYW4gc2VydmUuCk1heWJl
IGt2bWFsbG9jKCkgbWFrZXMgbW9yZSBzZW5zZT8KCj4gKwkJaWYgKCFkYXRidWYpIHsKPiArCQkJ
cmV0ID0gLUVOT01FTTsKPiArCQkJZ290byBvdXQ7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCW9vYmJ1
Zl9sZW4gPSBtaW5fdChzaXplX3QsIHJlcS5vb2JsZW4sIG10ZC0+ZXJhc2VzaXplKTsKPiArCWlm
IChvb2JidWZfbGVuID4gMCkgewo+ICsJCW9vYmJ1ZiA9IGttYWxsb2Mob29iYnVmX2xlbiwgR0ZQ
X0tFUk5FTCk7CgpTYW1lLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
