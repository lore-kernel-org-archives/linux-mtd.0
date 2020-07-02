Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CCFC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 18:50:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41A92145D
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 18:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DdDCT0J/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zcYxdAI+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MemawI8i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C41A92145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ys3IrkGp/P0AraDkvXGjXaf0PBRRsNYlQWJeMWGj1Gs=; b=DdDCT0J/dwcf9sTZI3NoqEiZL
	VQe0mS5qwbdfWDJqyLp8AWMjvflAYZkhGpX3IjftTzpbOu/fVZl+y3w9X/PFHmwMGr7ILgH1W15Xv
	zkWKnBjdMirOUBsqGgs2OMFjDMY7pB9ONbi6AKhnUOLbqh5G4jNDhT4ji3dIcmZJDhiXzlxpG73eW
	NALvYfY7AoyW2Kqd+LD8NQeHqXedocRO4RBDlEsYG38u/IYe4tz0Ee5MomS40mxcKeIarhuNE1p88
	PTn1b/W9gZ6R1a12gUiQ6dYkd6E0sJKU2SNgUY6krDZ03VGrQbnnL6iQRmDPZ8G+hrkIHlo47xupB
	pAaIYvpQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr4Ge-0004uR-SY; Thu, 02 Jul 2020 18:49:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr4Gc-0004td-7M
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 18:49:03 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593715739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyS/sdtCp22TSdTDWsdNuICcI6fRW1cSFB0XHx2c98o=;
 b=zcYxdAI+Ae7BacKKX80zORHwxjigts4CB3cdc8HxOKKBY6hn5xkmNlJaKyl+aN5fbm9qbv
 VkGBcuEzaswUcR9pKZg/0+G9rIWxNAzH9npd1y+xKH0VnGd1kul+x1cHI1p2EF/ekXv3Q1
 4nzlM7ysNkLRzL3UqZ308o6g/PfQFF/tXQ57vt7l/U3luDb11m0TNgb2FExr6n4BQrL2tH
 1XVti/vAw9Xmc0DMcIbtuoMeYdVyKfVCw1oTvdZhNS8xyugu5jcowoxSjUQW/lUHTDMnl2
 aQ9mShy4YNLf8Q8bpi6yIO2zGNvTNE8yIcJtNH3N/t3kHHsGrTkSy/DavlJMBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593715739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyS/sdtCp22TSdTDWsdNuICcI6fRW1cSFB0XHx2c98o=;
 b=MemawI8iCeT6nqbRomYnQwKvQA1IHeTC2yOZmI1Sciencg3Rj9uIe2F/AxUpwSEB1xwMUx
 0P3qcWoqpO0JwcCA==
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
In-Reply-To: <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
 <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
Date: Thu, 02 Jul 2020 20:48:57 +0200
Message-ID: <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_144902_402406_50492633 
X-CRM114-Status: UNSURE (   5.73  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JpdGVzOgo+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAidGdseCIgPHRnbHhAbGludXRyb25peC5kZT4K
Pj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVG9yYmVuIEhvaG4iIDx0b3JiZW4u
aG9obkBsaW51dHJvbml4LmRlPgo+PiBDQzogImJpZ2Vhc3kiIDxiaWdlYXN5QGxpbnV0cm9uaXgu
ZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiU2FzY2hh
IEhhdWVyIgo+PiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4sICJkYXZpZCIgPGRhdmlkQHNpZ21h
LXN0YXIuYXQ+Cj4+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAyLiBKdWxpIDIwMjAgMTY6NDA6MjQK
Pj4gQmV0cmVmZjogUmU6IFtQQVRDSCB2MiAwLzRdIHViaWZzOiBzdXBwb3J0IGF1dGhlbnRpY2F0
aW9uIHdpdGhvdXQgaG1hYwo+Cj4+IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
IHdyaXRlczoKPj4+IFRoZSBzdXBlcmJsb2NrIGlzIHNpZ25lZCBieSB0aGUgb2ZmbGluZSBrZXku
IEFzIHNvb24geW91IHN3aXRjaCB0byB0aGUgbmV3IGtleQo+Pj4gdGhlIHN1cGVyIGJsb2NrIGlz
IHJld3JpdHRlbiBhbmQgY2FuIG5vIGxvbmdlciB2ZXJpZmllZCB0aGlzIGtleS4KPj4+IEluc3Rl
YWQgb2YgcmV3cml0aW5nIHRoZSBpZGVhIHdhcyBrZWVwaW5nIGEgY29weS4KPj4+Cj4+PiBBbnl3
YXksIGxpa2Ugc2FpZCBpbiB0aGUgb3RoZXIgbWFpbCwgSSB0aGluayBpZiB3ZSBjaGFuZ2UgdGhl
IGZlYXR1cmUgdG8KPj4+ICJrZWVwIG9mZmxpbmUgc2lnbiBrZXkgYW5kIGltcGx5IHJvIG1vdW50
IiB0aGluZ3Mgd2lsbCBiZSBtb3JlIHNtb290aCB3aXRoIGxlc3MKPj4+IGNvcm5lcgo+Pj4gY2Fz
ZXMuCj4+IAo+PiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgZGVzaXJlZCBtb2RlIGlzIHRvIHByZXZl
bnQgUlcgbW91bnRzIGZvciBhIGZhY3RvcnkKPj4gc2lnbmVkIGltYWdlIHdoaWNoIGltcGxpZXMg
dGhlIHByZXZlbnRpb24gb2YgcmV3cml0aW5nIHRoZSBzdXBlcmJsb2NrLgo+Cj4gVGhpcyBpcyBl
eGFjdGx5IHdoYXQgSSdtIGFza2luZyBmb3IuCj4gS2VlcCB0aGUgZmFjdG9yeSBzaWduZWQgc3Vw
ZXIgYmxvY2sgYW5kIGltcGx5IHJlYWQtb25seSBtb2RlLgoKQW5kIHRoYXQncyB3aGF0IFRvcmJl
biBpbXBsZW1lbnRlZCB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLgoKVGhhbmtzLAoKICAg
ICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
