Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8076DC001DE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hAYwYeVzqheWU+86/FVLdLbSQXHcvi46MeGUwUfzX5U=; b=tKCsxU+9sI4Db7rxvPC++W/Wzg
	fZwdBDBTPyA0+Ru8izHqS6i54NZXei+Qu0Bl7f6BE/55Y1fU2Gl2dDKbjJl3GvOD5A91+Kzql1ieI
	+8KwJnPMuzIuVIwQA9ALEpzuPKrKjaJy4YaUH6VvuoamqmFVA8H6NdAHF12+ol+K7xtU7YZ7mAcxa
	y1Md60vBmqJQ8ys6A7AhYXeQHUixqN9KVj7HHSpixWPFdisC58fvuwTIxs502KRf8lAmKulQzdgvi
	VchOCqsDdJKTBdMtlRNlZ8inCJv8VQHiBOjYVTZttQIXoZ6DCQajfoo7Qt6pLwL8k5m4T73mOxwZ8
	jK70A/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlW-005zou-0N;
	Wed, 09 Aug 2023 22:34:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlS-005znL-2s
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 22:34:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8EDBF635D288;
	Thu, 10 Aug 2023 00:34:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6b55IotJG3xt; Thu, 10 Aug 2023 00:34:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2A724635D292;
	Thu, 10 Aug 2023 00:34:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1iNohkyg2VBA; Thu, 10 Aug 2023 00:34:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0691C635D288;
	Thu, 10 Aug 2023 00:34:45 +0200 (CEST)
Date: Thu, 10 Aug 2023 00:34:44 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>, 
	linux-block <linux-block@vger.kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Johannes Eigner <johannes.eigner@a-eberle.de>
Message-ID: <366198994.5052941.1691620484888.JavaMail.zimbra@nod.at>
In-Reply-To: <20230809141542.GA32614@lst.de>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <1293911429.1782934.1691445776353.JavaMail.zimbra@nod.at> <20230809135308.GA32214@lst.de> <ZNOec8JmndA63Mnh@PC-LX-Wurm> <20230809141542.GA32614@lst.de>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiblock: null pointer dereference using scatterlist in work_queue
Thread-Index: PSfkdM2AA1GzDUjTP1lykwQuXd+vkA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_153451_083823_17E4FC97 
X-CRM114-Status: UNSURE (   6.72  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gWWVzLiAgU28gdGhlIGNvZGUgbmVlZHMgdG8gc3RvcCB1c2luZyBzZ192aXJ0IHRvIHdvcmsg
b24gaGlnaG1lbQo+IHNldHVwcyBhbmQgZG8gdGhlIGVxdWl2YWxlbnQgb2Ygc2NzaV9rbWFwX2F0
b21pY19zZy4gIEJlc3Qgd2F5Cj4gZm9yd2FyZCBpcyBwcm9iYWJseSB0byBtb3ZlIHNjc2lfa21h
cF9hdG9taWNfc2cgdG8gbGliL3NjYXR0ZXJsaXN0LmMKPiAoYW5kIGFsc28gY29udmVydCBpdCB0
byBrbWFwX2xvY2FsIGluc3RlYWQgb2Yga21hcF9hdG9taWMgd2hpbGUgeW91J3JlCj4gYXQgaXQp
IGFuZCB0aGVuIHVzZSB0aGF0IGluIHViaWJsb2NrCgpXaWxsIGRvIHNvISBTbyBmYXIgSSBtYW5h
Z2VkIHRvIGdldCBVQklibG9jayB3b3JrIHdpdGggc2NzaV9rbWFwX2F0b21pY19zZygpLgpTYWRs
eSBub3cgd2l0aCBrbWFwJ2VkIG1lbW9yeSBhIGJvdW5jZSBidWZmZXIgaXMgbmVlZGVkIHNpbmNl
IElPIGluIFVCSS9NVEQgY2FuIHNsZWVwLgpJcyB0aGVyZSBhIHN0cm9uZyByZWFzb24gd2h5IHNj
c2lfa21hcF9hdG9taWNfc2coKSBuZWVkcyBJUlFzIGRpc2FibGVkPwoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
