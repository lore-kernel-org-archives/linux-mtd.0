Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FC8C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 16:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2D72081B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 16:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/Smddtn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2D72081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=383vvwayeLyKPjbDzuR5kGYNVJUzwI9JuMcEe2NY/oQ=; b=K/SmddtnUWfm4w
	6UvkD0/3J7hPDnqQhCgmBy7O8au0HmeSdHJd/FpWDREALNWKN0nUO2YAaqykDH2Es5op8ggDjIa1P
	TfetKuy3srsbMaxqNMPepRJsX+wQfRacz224ryfXmnEbrTsib44kA5+kQwl7sjzwrOMxln53XMs2a
	oP+tVyOAgSX+7QBs+Sa9SgFnxy7f58NIpEKhZ05JafN7OXKXx9SNvofZtiuz8U/Cr1h4swy+lRkuf
	B6bx34DZKzaCU9s1FQCrzuMfunfJPhnve1mX5Gcne47Z9r/Jcxk4X0M3E0Frg9LyKh78UkMt3v/fV
	4c0hpQDrp46ZJQIY+UpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1vpn-0002PJ-UU; Thu, 07 Mar 2019 16:25:27 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1vpk-0002LU-6U
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 16:25:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id D8E864D99
 for <linux-mtd@lists.infradead.org>; Thu,  7 Mar 2019 17:27:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw91O6w8YnSp for <linux-mtd@lists.infradead.org>;
 Thu,  7 Mar 2019 17:27:19 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id B8D814DAC; Thu,  7 Mar 2019 17:27:19 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: atmel nand bindings vs. actual dts files
Date: Thu, 07 Mar 2019 17:25:17 +0100
Message-ID: <4099561.5sHrvDXGx3@ada>
In-Reply-To: <1823900.qPX5mxbl1h@ada>
References: <1823900.qPX5mxbl1h@ada>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_082524_414863_BEA274AB 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpBbSBNaXR0d29jaCwgNi4gTcOkcnogMjAxOSwgMTU6MDc6NTIgQ0VUIHNjaHJpZWIg
QWxleGFuZGVyIERhaGw6Cj4gU28gaW5zdGVhZCBvZiAiYWx3YXlzIDB4ODAwMDAwIiB0aGF0IG5v
ZGUgaGFzIDB4MiBhcyB0aGlyZCBlbnRyeSBmb3IgdGhlCj4gJ3JlZycgcHJvcGVydHkuIFdoeSBp
cyB0aGF0PwoKSSBkaWRuJ3QgaW52ZXN0aWdhdGUgdGhhdCBmdXJ0aGVyIHlldCwgYnV0IEknbSBj
dXJpb3VzLCBzbyBpZiBhbnlvbmUga25vd3M/Cgo+IEJvbnVzIHF1ZXN0aW9uOiBpZiB0aGUgUi9C
IGxpbmUgaXMgbm90IGNvbm5lY3RlZCwgaG93IGlzIHRoYXQgZXhwcmVzc2VkIGluCj4gZHRzPyBB
cyBmYXIgYXMgSSB1bmRlcnN0b29kIHRoYXQgaXMgcG9zc2libGUsIGlmIHRoZSBkcml2ZXIgcG9s
bHMgc29tZQo+IHN0YXR1cyByZWdpc3RlciBpbnN0ZWFkIG9mIHRoYXQgbGluZSBsZXZlbCwgcmln
aHQ/CgpPciBqdXN0IHdhaXRzIHVudGlsIGEgY2VydGFpbiB0aW1lb3V0IOKApgoKRm9yIHY0LjE5
LjI1ICh0aGlzIGlzIHRoZSBjdXJyZW50bHkgbGF0ZXN0IGJhc2UgZm9yIFBSRUVNUFQgUlQgcGF0
Y2hlcykgSSAKZm91bmQgdGhpczoKCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y0
LjE5LjI1L3NvdXJjZS9pbmNsdWRlL2xpbnV4L210ZC8KcmF3bmFuZC5oI0wxMTk1CgpJdCBzYXlz
OiAKCiAqIEBkZXZfcmVhZHk6CQlbQk9BUkRTUEVDSUZJQ10gaGFyZHdhcmVzcGVjaWZpYyBmdW5j
dGlvbiBmb3IgYWNjZXNzaW5nCiAqCQkJZGV2aWNlIHJlYWR5L2J1c3kgbGluZS4gSWYgc2V0IHRv
IE5VTEwgbm8gYWNjZXNzIHRvCiAqCQkJcmVhZHkvYnVzeSBpcyBhdmFpbGFibGUgYW5kIHRoZSBy
ZWFkeS9idXN5IGluZm9ybWF0aW9uCiAqCQkJaXMgcmVhZCBmcm9tIHRoZSBjaGlwIHN0YXR1cyBy
ZWdpc3Rlci4KCkhvd2V2ZXIgSSBzZWUgbm8gd2F5IHRvIGV4cGxpY2l0bHkgc2V0IHRoaXMgdG8g
TlVMTCB2aWEgZGV2aWNlIHRyZWUgZm9yIHRoZSAKYXRtZWwgcmF3IG5hbmQgZHJpdmVyLCBvciBk
aWQgSSBtaXNzIHNvbWV0aGluZz8gCgpJIGd1ZXNzIHRoYXQncyBubyByZWNvbW1lbmRlZCBoYXJk
d2FyZSBzZXR1cD8KCkdyZWV0cwpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
