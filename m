Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87419C001DE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A6DaDEaN53E+xisw1JIfaKwnXJw2GRN127f/Pxaa6uw=; b=CQN0GZnx1HsLL+L0Uc/juLHcrr
	a/T+sNNO6VTaSAjS26cWwJdy4oHfO8ZAUEL3C2LLCQUIuuhsVb0pws85i3LEREz4MLNjvxhLrNlnM
	nafwzZBm/j+EYM41nmYHc2Ky8XKODEAqTCOFgyFZrWniqUV64WYfSLhGVwx9m029VfLNbxayj8oIS
	1nPhIn0588kZgLwM6NqRv6QlRXJclV0l7w0aj6ptGleObpBX3RFiDgs6TJarkdqqljd/5BZVs8W3E
	kBWYh8hNRtTukmMec8zpzzoi73DB+YyAgJwKKN4zOMCPZSb54+BUKVdgsAlskF7Uq2t9XI5KcDB4r
	FuNB1SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTruO-0060pd-0h;
	Wed, 09 Aug 2023 22:44:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTruL-0060ok-1S
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 22:44:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A2B1F635D29E;
	Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id v_JwZWmfHdUG; Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4E2D4635D29D;
	Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jfzWTASF6VHD; Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2EA2A635D28F;
	Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
Date: Thu, 10 Aug 2023 00:43:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>, 
	linux-block <linux-block@vger.kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Johannes Eigner <johannes.eigner@a-eberle.de>
Message-ID: <533238598.5052964.1691621039144.JavaMail.zimbra@nod.at>
In-Reply-To: <20230809223703.GA10719@lst.de>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <1293911429.1782934.1691445776353.JavaMail.zimbra@nod.at> <20230809135308.GA32214@lst.de> <ZNOec8JmndA63Mnh@PC-LX-Wurm> <20230809141542.GA32614@lst.de> <366198994.5052941.1691620484888.JavaMail.zimbra@nod.at> <20230809223703.GA10719@lst.de>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiblock: null pointer dereference using scatterlist in work_queue
Thread-Index: r+jP0Y2+YKP9h0H5tuoMD33XwrLVCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_154401_666188_BBDF6676 
X-CRM114-Status: UNSURE (   6.52  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE9uIFRodSwgQXVnIDEwLCAyMDIzIGF0
IDEyOjM0OjQ0QU0gKzAyMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4gV2lsbCBkbyBz
byEgU28gZmFyIEkgbWFuYWdlZCB0byBnZXQgVUJJYmxvY2sgd29yayB3aXRoIHNjc2lfa21hcF9h
dG9taWNfc2coKS4KPj4gU2FkbHkgbm93IHdpdGgga21hcCdlZCBtZW1vcnkgYSBib3VuY2UgYnVm
ZmVyIGlzIG5lZWRlZCBzaW5jZSBJTyBpbiBVQkkvTVREIGNhbgo+PiBzbGVlcC4KPj4gSXMgdGhl
cmUgYSBzdHJvbmcgcmVhc29uIHdoeSBzY3NpX2ttYXBfYXRvbWljX3NnKCkgbmVlZHMgSVJRcyBk
aXNhYmxlZD8KPiAKPiBJIGRvbid0IHRoaW5rIGl0IG5lZWRzIGlycXMgZGlzYWJsZWQuICBBbHNv
IGlmIHlvdSBzd2l0Y2ggZnJvbSB0aGUKPiBkZXByZWNhdGVkIGttYXBfYXRvbWljIHRvIGttYXBf
bG9jYWwgZmlyc3QgeW91IGNhbiBzbGVlcCBhbmQgZG9uJ3QKPiBuZWVkIGJvdW5jZSBidWZmZXJz
LgoKWWVwLCBmb3IgdXBzdHJlYW0ga21hcF9sb2NhbCB3aWxsIGRvIHRoZSB0cmljaywgYnV0IEkg
bmVlZCBhbHNvIHNvbWV0aGluZwpmb3IgdGhlIHN0YWJsZSB0cmVlcy4KQW55d2F5LCB0aW1lIHRv
IGdldCBzb21lIHNsZWVwLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
