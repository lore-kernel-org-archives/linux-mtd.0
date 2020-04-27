Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30C0C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815692064A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V9bmnszS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815692064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2t8YORCJaqtif43DORFvb3+PyxA/FcL51AmMbGumHA=; b=V9bmnszSI7ayPB
	P8FcnrfXrTGk/Vx0EN6oKRJS+FinbC3uTgA3UQKCZgvu7puN9m9N7KLBrRVmmjM7jpXJod1B5KkfN
	yreCWRuaoluvACcrHE25bLqJC6yRZUAEhbS98sfDE0kOkVPfwqp3pQWshX4jA4AgJre0olzdxlIOy
	mRAbs4lqvXq8GQRne+Q1vxxIm0eP0qZoRnAuTX7xlTNHrMPp0/V/TtisfTcD2yVPC3TC5UVZRLj6y
	pMF3SshGWGZDlE/oj71ZmPlGQG6JjmZAWEKL4jdxMCqWrrkQR0PztONqzJVg5Jq7+xom5rpgCnhkP
	J1ungjsYB0QjxzYUrwbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT4CI-0004X4-L7; Mon, 27 Apr 2020 13:53:22 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT4CE-0004V2-F5
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 13:53:20 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F2974C0005;
 Mon, 27 Apr 2020 13:53:14 +0000 (UTC)
Date: Mon, 27 Apr 2020 15:53:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] mtd: physmap_of_gemini: remove defined but not used
 symbol 'syscon_match'
Message-ID: <20200427155313.43847da8@xps13>
In-Reply-To: <20200403081544.37061-1-yanaijie@huawei.com>
References: <20200403081544.37061-1-yanaijie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_065318_634290_E5A4DD22 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, tglx@linutronix.de, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFzb24sCgorIExpbnVzIFcuCgpKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+IHdy
b3RlIG9uIEZyaSwgMyBBcHIgMjAyMCAxNjoxNTo0NCArMDgwMDoKCj4gSXQncyBub3QgdXNlZCBi
eSBhbnlvbmUgbm93LCByZW1vdmUgaXQuIEZpeCB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nOgo+
IAo+IGRyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1nZW1pbmkuYzo0OTozNDogd2FybmluZzog4oCY
c3lzY29uX21hdGNo4oCZIGRlZmluZWQKPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZh
cmlhYmxlPV0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3lzY29uX21hdGNo
W10gPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+
IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4gLS0tCgpJIGFtIG5vdCBz
dXJlIHRoaXMgaXMgdGhlIHJpZ2h0IHNvbHV0aW9uLiBUaGlzIGNvbXBhdGlibGUgaGFzIGJlZW4K
YWRkZWQgaW4gdGhpcyBkcml2ZXIgYnkgTGludXMgaW4gOWQzYjUwODZmNmQ0ICgibXRkOiBwaHlz
bWFwX29mX2dlbWluaToKSGFuZGxlIHBpbiBjb250cm9sIikuIEkgYmVsaWV2ZSBoZSBoYWQgYSBn
b29kIHJlYXNvbiB0byBkbyBzbyBidXQgeW91CmFyZSByaWdodCB0aGF0IGl0IGlzIG5vdCB1c2Vk
LiBMaW51cywgYW55IGlucHV0PwoKPiAgZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWdlbWluaS5j
IHwgNSAtLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWdlbWluaS5jIGIvZHJpdmVycy9tdGQvbWFw
cy9waHlzbWFwLWdlbWluaS5jCj4gaW5kZXggYTI4OWM4YjVjYWJmLi5kNGE0NmUxNTlkMzggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWdlbWluaS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbWFwcy9waHlzbWFwLWdlbWluaS5jCj4gQEAgLTQ2LDExICs0Niw2IEBACj4gIAo+
ICAjZGVmaW5lIEZMQVNIX1BBUkFMTEVMX0hJR0hfUElOX0NOVAkoMSA8PCAyMCkJLyogZWxzZSBs
b3cgcGluIGNudCAqLwo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3lz
Y29uX21hdGNoW10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0gImNvcnRpbmEsZ2VtaW5pLXN5c2Nv
biIgfSwKPiAtCXsgfSwKPiAtfTsKPiAtCj4gIHN0cnVjdCBnZW1pbmlfZmxhc2ggewo+ICAJc3Ry
dWN0IGRldmljZSAqZGV2Owo+ICAJc3RydWN0IHBpbmN0cmwgKnA7CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
