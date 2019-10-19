Return-Path: <SRS0=GZUv=YM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4298ACA9EAB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 09:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EE4222CD
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2019 09:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4RkQQNZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EE4222CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOpdhHVQ4Mi77OH/J1QVL3zCiSbyMS/VcBIR5xdkjvQ=; b=r4RkQQNZT3V885
	jLq9VrqmfBDUiPx7EwFHXx+WCEjOSA/dfVRVmg2R5MZbJneu1m1jr3CFz5Q6GfkR8ye8UWckn/i0M
	bN0U7mhhMeupSrvNtLcgMZvhJgqZ5jgcBvlbgsLjGlj1WDDkBYKi3oF85VaK3d62gJ5h63uL/S264
	6/C4RWm146yzQZ8EDhaXRPqFMOO23/XOLwvHK5nmyw8M9xCYa7OcG8WXbzwbZLFA+K1gNlmnL9SYN
	fRBEgNw3Ks4ih+T8mRn+MALJ4QNBw5FuhbAh0McbN/00qDZF9HpsWA7JkfKi15LsykL5qAiGO/vRB
	TGmglEK+lk/hrxssUGOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLkkA-00017m-E6; Sat, 19 Oct 2019 09:09:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLkk4-000177-C2
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2019 09:09:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 229C6608F44E;
 Sat, 19 Oct 2019 11:09:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gREQTJPg-UOX; Sat, 19 Oct 2019 11:09:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BD1A16162112;
 Sat, 19 Oct 2019 11:09:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AxLTqkty1K1x; Sat, 19 Oct 2019 11:09:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 557B1608A386;
 Sat, 19 Oct 2019 11:09:37 +0200 (CEST)
Date: Sat, 19 Oct 2019 11:09:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Kiran B S <bs.kiran81@gmail.com>
Message-ID: <396862842.29400.1571476176976.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+VTqB=0QSWG68GLO=6LuetoSwwiuxDT6k_n=m+ruZpbjuvgeQ@mail.gmail.com>
References: <CA+VTqBkr+1Kd0QSLUJbRZG3CMZdNct_svGNjSfVh=8Gaozfrfw@mail.gmail.com>
 <CA+VTqB=0QSWG68GLO=6LuetoSwwiuxDT6k_n=m+ruZpbjuvgeQ@mail.gmail.com>
Subject: Re: Seeing ubifs unmap LEB error with linux 2.6.35 kernel
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: Seeing ubifs unmap LEB error with linux 2.6.35 kernel
Thread-Index: 2sWVzL16nu12F1WFJIu4tXjKw0MIuQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191019_020945_055061_37DF605F 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

S2lyYW4sCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiS2lyYW4gQiBT
IiA8YnMua2lyYW44MUBnbWFpbC5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNo
YXJkLndlaW5iZXJnZXJAZ21haWwuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCAxOC4gT2t0b2JlciAyMDE5IDExOjQ2
OjQ0Cj4gQmV0cmVmZjogUmU6IFNlZWluZyB1YmlmcyB1bm1hcCBMRUIgZXJyb3Igd2l0aCBsaW51
eCAyLjYuMzUga2VybmVsCgo+IEhpIFJpY2hhcmQsCj4gQWxzbyBhIHJlYm9vdCBvZiB0aGUgc3lz
dGVtIHJlY292ZXJlZCB0aGUgdWJpZnMgZmlsZXN5c3RlbS4KCk9rYXkuIFRoaXMgaW5kaWNhdGVz
IHRoYXQgdGhlIHByb2JsZW0gaXMgbm90IGZhdGFsLgpJbml0aWFsbHkgd2Ugc2V0IHRoZSBHQy1I
ZWFkIHRvIC0xLCB1bm1hcHBpbmcgdGhlIEdDLUhlYWQgaXMKYSBjb21tb24gb3BlcmF0aW9uIGlu
IFVCSUZTLCBtYXliZSB0aGVyZSBpcyBzb21lIGxvZ2ljIGJ1ZyBpbiB0aGUKcmVwbGF5IGNvZGUu
CgpDYW4geW91IHBsZWFzZSBnaXZlIHRoZSBmb2xsb3dpbmcgY2hhbmdlIGEgdHJ5PwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvdWJpL2thcGkuYyBiL2RyaXZlcnMvbXRkL3ViaS9rYXBpLmMKaW5k
ZXggNjlmYTRlZjAzYzUzLi4wM2NlNzUyZDRkMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3Vi
aS9rYXBpLmMKKysrIGIvZHJpdmVycy9tdGQvdWJpL2thcGkuYwpAQCAtNjEwLDggKzYxMCwxMCBA
QCBpbnQgdWJpX2xlYl91bm1hcChzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpkZXNjLCBpbnQgbG51
bSkKICAgICAgICBpZiAoZGVzYy0+bW9kZSA9PSBVQklfUkVBRE9OTFkgfHwgdm9sLT52b2xfdHlw
ZSA9PSBVQklfU1RBVElDX1ZPTFVNRSkKICAgICAgICAgICAgICAgIHJldHVybiAtRVJPRlM7CiAK
LSAgICAgICBpZiAobG51bSA8IDAgfHwgbG51bSA+PSB2b2wtPnJlc2VydmVkX3BlYnMpCisgICAg
ICAgaWYgKGxudW0gPCAwIHx8IGxudW0gPj0gdm9sLT5yZXNlcnZlZF9wZWJzKSB7CisgICAgICAg
ICAgICAgICBkdW1wX3N0YWNrKCk7CiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAg
ICAgICB9CiAKICAgICAgICBpZiAodm9sLT51cGRfbWFya2VyKQogICAgICAgICAgICAgICAgcmV0
dXJuIC1FQkFERjsKClVzaW5nIGR1bXBfc3RhY2soKSB3ZSBjYW4gc2VlIHdobyB0cmllcyB0byB1
bm1hcCBhIGJhZCBMRUIgZW50cnkuCgpBZnRlciAyLjYuMzUgVUJJRlMgd2FzIGNoYW5nZWQgYSBs
b3QgbWF5YmUgdGhlIGlzc3VlIGdvdCBmaXhlZCBhbmQKaXMgbm90IHByZXNlbnQgaW4gYSByZWNl
bnQga2VybmVsLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
