Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F831C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Oct 2023 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IruKkou6nO8EfgtOj/4c0Da+jjnQqSrbQSTgqdT4Bh4=; b=UPNllV+4GEch/b
	LGdm7EuXWxHOUra6sopwRXKoiEE/XRu6pHg8xWCAUCPa9Tu8lbwSJuBIofO1gi8mkCpA5QY4V8U37
	cyFSu8D8PbI8Pybt9MvSz1E/EslaSY5ZBcHBAxNcciLZ+e3tNs3nAv03FNAVgSOx1GLz1XvzbJCls
	KnqgqYESGikoKtIokFsmTO30/8B5FlWyW+9QAnBtGjEc98b2dWnfa6/LFZj4L3pFGYWGV5/wwz8kJ
	6NIyciplseQSg0GvQKLuGiW3v5Af8k/c6151LJKdktc4Ood3C+PryLBKlYnSvOYtX0KixFwNZ87IG
	0ytY/pv9y23KGdfwfTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx6Bf-001nI4-2a;
	Sun, 29 Oct 2023 13:50:43 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx6Bc-001nH8-1r
	for linux-mtd@lists.infradead.org;
	Sun, 29 Oct 2023 13:50:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3E9A1C0002;
	Sun, 29 Oct 2023 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698587437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8GUOXz37gmy7V60xc0vXGGHZfnk3OdOvT79FlC7134=;
	b=mfONVS8KKgVpPDsG2UxTeARpH67UWrtTtpDs9R51IzEyfokr5ZYmAuLqDkavfv4X8e/5nz
	wOaBH1is4G/xKU0EFcN3IZmotkkPcfA0eSqBotus/a3cuqKBE1JbbXED3coiE4erZIUfQN
	uRP/IQcWCJxAGLAfpM9QZuv+sLSrA5NroZidmVrRGcU7eoRIsfFQJqV/m1lYU4gRAw8duG
	wu5UDvLEmLIZCORJUARuXrj7VV0iQ2Yx5w8HAZs1tLJQAZ7D0DcklrSTPlkqnvCzdnL04M
	ClCKzxNTC6eoXADbGVKEjE5vI9GF+iZtbir6EDd2uUT6Ya3Tzo5tfHowWzRMNw==
Date: Sun, 29 Oct 2023 14:50:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 dpervushin <dpervushin@embeddedalley.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by
 ftl notifier
Message-ID: <20231029145033.0ad2682a@xps-13>
In-Reply-To: <174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
	<20231027194026.1bc32dfe@xps-13>
	<174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_065040_755955_8D1CB719 
X-CRM114-Status: GOOD (  12.04  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIEZyaSwgMjcgT2N0IDIwMjMgMjI6
MzA6MTAgKzAyMDAgKENFU1QpOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiBWb246ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+ID4+
IERldGFpbGVkIHJlcHJvZHVjdGlvbiBpbmZvcm1hdGlvbiBhdmFpbGFibGUgYXQgdGhlIGxpbmtb
MV0sCj4gPj4gCj4gPj4gVGhlIHNvbHV0aW9uIGZvciB0aGUgZ2x1ZWJpIG1vZHVsZSBpcyB0byBy
dW4gamZmczIgb24gdGhlIFVCSQo+ID4+IHZvbHVtZSB3aXRob3V0IGNvbnNpZGVyaW5nIHdvcmtp
bmcgd2l0aCBmdGwgb3IgbXRkYmxvY2suWzJdLiAgCj4gPiAKPiA+IEkgYW0gc29ycnkgYnV0IGZ0
bCwgZ2x1ZWJpLCBtdGRibG9jaywgamZmczIgYW5kIHViaSBpbiB0aGUgc2FtZSByZXBvcnQKPiA+
IHNlZW0gYSBsaXR0bGUgYml0IGZ1enp5LiBBcmUgeW91IHN1cmUgYWJvdXQgdGhpcyBzZW50ZW5j
ZT8gIAo+IAo+IFpoYW9Mb25nIFdhbmcgZm91bmQgYW4gaW50ZXJlc3RpbmcgYnVnIHdoaWxlIHN0
YWNraW5nIHZhcmlvdXMgTVREIGNvbXBvbmVudHMuCj4gSSBzdWdnZXN0ZWQgdG8ganVzdCBkZW55
IG10ZGJsb2NrIG9uIHRvcCBvZiBnbHVlYmkgdG8gYXZvaWQgdGhlIHdob2xlCj4gcHJvYmxlbSBj
bGFzcyBpbnN0ZWFkIG9mIGFkZGluZyBtb3JlIGR1Y3QgdGFwZS4KCkFjay4gSSdsbCBxdWV1ZSB0
aGlzIG9uY2UgdGhlIGxvZyBmaXhlZCBhbmQgeW91ciBvZmZpY2lhbCBBY2stYnkKcmVjZWl2ZWQg
Zm9yIG10ZC9uZXh0IGFmdGVyIC1yYzEgaXMgb3V0LgoKVGhhbmtzLApNaXF1w6hsCgo+IAo+IFRo
YW5rcywKPiAvL3JpY2hhcmQKPiAKPiBUaGUgaXNzdWUgcmVtaW5kcyBtZSBvZiBvbmUgb2YgbXkg
ZmF2b3JpdGUgTW9udHkgUHl0aG9uIHNrZXRjaGVzLCBodHRwczovL3d3dy55b3V0dWJlLmNvbS93
YXRjaD92PUxGcmRxUVo4RkZjCj4gOy0pCgo6LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
