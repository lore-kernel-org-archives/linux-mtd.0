Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D15C33CAC
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 15:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7CC7214AF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 15:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXOwyvGe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZiEGmPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7CC7214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aog21orWmCvIMO93m3FJWcPgAL/WiMv/T50Mu5B3r5Q=; b=hXOwyvGe1QTcDZ
	UIfwtLQ8XRbG5kTwfSdF6RJHaAaK8op3Etfaks+Wk40dqECTrJ57sPga8WRlha7fNuw/vqwXCcyKc
	qkYB0OVWgikl565N7JmgQPlyc7dwDnatlMTj4JM+iddk+KoDaW+uoHnuRn8/AnVPuUqTNN6xiNpGy
	YOCL3hr/GotzXZtUxXVHNKMo/klqGT30jMGbiaC62fJO3PrqPIAGmDtm2tiZj3ylXuU1etSx6MI9p
	2yK22ZM0RnniwyhkIp8FAwygqY1OiJCB8/EzmpVARUqN8BVfPYOhCAp8VtY+UXUA5/lSLeYWBGZ4X
	ybXW+Urn+mryQ3T0uYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izjM1-0008Ei-Ew; Thu, 06 Feb 2020 15:46:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izjLy-0008ED-0u
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 15:46:07 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74C24214AF;
 Thu,  6 Feb 2020 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581003965;
 bh=qkTT9QVfoW5Hqi+5sQCx4C739P1VAWdOEN6lyWVwXek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eZiEGmPzLMlAvJlOgWtAC1//RnQHWe6BlLdIFgB4P21fSmFf73hVfnIE568YwqCdy
 6c1N/cnrZ39J4LVGQQbD3NH1KR9YIHKzsK2sxUGDUF40hT+LcM8ogCd019xQqqyfvp
 TE5ilZjcZtI8o7sUYgnr8wMRMvvQ8XHjO305gjBA=
Date: Thu, 6 Feb 2020 16:45:59 +0100
From: Miquel Raynal <mraynal@kernel.org>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v1 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <20200206164559.59c5eb6a@xps13>
In-Reply-To: <e135f947-226f-8dd0-b328-fb87c5064914@allwinnertech.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-12-git-send-email-liaoweixiong@allwinnertech.com>
 <20200120110306.32e53fd8@xps13>
 <27226590-379c-8784-f461-f5d701015611@allwinnertech.com>
 <20200121094802.61f8cb4d@xps13>
 <2c6000b1-ae25-564b-911a-2879e9c244b2@allwinnertech.com>
 <20200122184114.125b42c8@xps13>
 <e135f947-226f-8dd0-b328-fb87c5064914@allwinnertech.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_074606_106177_EB58CA79 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgbGlhbywKCmxpYW93ZWl4aW9uZyA8bGlhb3dlaXhpb25nQGFsbHdpbm5lcnRlY2guY29tPiB3
cm90ZSBvbiBUaHUsIDYgRmViIDIwMjAKMjE6MTA6NDcgKzA4MDA6Cgo+IGhpIE1pcXVlbCBSYXlu
YWwsCj4gCj4gT24gMjAyMC8xLzIzIEFNIDE6NDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
ZWxsbywKPiA+IAo+ID4gICAKPiA+Pj4+Pj4gKy8qCj4gPj4+Pj4+ICsgKiBBbGwgem9uZXMgd2ls
bCBiZSByZWFkIGFzIHBzdG9yZS9ibGsgd2lsbCByZWFkIHpvbmUgb25lIGJ5IG9uZSB3aGVuIGRv
Cj4gPj4+Pj4+ICsgKiByZWNvdmVyLgo+ID4+Pj4+PiArICovCj4gPj4+Pj4+ICtzdGF0aWMgc3Np
emVfdCBtdGRwc3RvcmVfcmVhZChjaGFyICpidWYsIHNpemVfdCBzaXplLCBsb2ZmX3Qgb2ZmKQo+
ID4+Pj4+PiArewo+ID4+Pj4+PiArCXN0cnVjdCBtdGRwc3RvcmVfY29udGV4dCAqY3h0ID0gJm9v
cHNfY3h0Owo+ID4+Pj4+PiArCXNpemVfdCByZXRsZW47Cj4gPj4+Pj4+ICsJaW50IHJldDsKPiA+
Pj4+Pj4gKwo+ID4+Pj4+PiArCWlmIChtdGRwc3RvcmVfYmxvY2tfaXNiYWQoY3h0LCBvZmYpKQo+
ID4+Pj4+PiArCQlyZXR1cm4gLUVORVhUOwo+ID4+Pj4+PiArCj4gPj4+Pj4+ICsJcHJfZGVidWco
InRyeSB0byByZWFkIG9mZiAweCVsbHggc2l6ZSAlenVcbiIsIG9mZiwgc2l6ZSk7Cj4gPj4+Pj4+
ICsJcmV0ID0gbXRkX3JlYWQoY3h0LT5tdGQsIG9mZiwgc2l6ZSwgJnJldGxlbiwgKHVfY2hhciAq
KWJ1Zik7Cj4gPj4+Pj4+ICsJaWYgKChyZXQgPCAwICYmICFtdGRfaXNfYml0ZmxpcChyZXQpKSB8
fCBzaXplICE9IHJldGxlbikgIHsgIAo+ID4+Pj4+Cj4gPj4+Pj4gSUlSQyBzaXplICE9IHJldGxl
biBkb2VzIG5vdCBtZWFuIGl0IGZhaWxlZCwgYnV0IHRoYXQgeW91IHNob3VsZAo+ID4+Pj4+IGNv
bnRpbnVlIHJlYWRpbmcgYWZ0ZXIgcmV0bGVuIGJ5dGVzLCBubz8gIAo+ID4+Pj4+ICAgICA+PiAg
Cj4gPj4+PiBZZXMsIHlvdSBhcmUgcmlnaHQuIEkgd2lsbCBmaXggaXQuIFRoYW5rcy4gIAo+ID4+
Pj4gICA+Pj4+PiBBbHNvLCBtdGRfaXNfYml0ZmxpcCgpIGRvZXMgbm90IG1lYW4gdGhhdCB5b3Ug
YXJlIHJlYWRpbmcgYSBmYWxzZSAgCj4gPj4+Pj4gYnVmZmVyLCBidXQgdGhhdCB0aGUgZGF0YSBo
YXMgYmVlbiBjb3JyZWN0ZWQgYXMgaXQgY29udGFpbmVkIGJpdGZsaXBzLgo+ID4+Pj4+IG10ZF9p
c19lY2NlcnIoKSBob3dldmVyLCB3b3VsZCBiZSBtZWFuaW5nZnVsLiAgCj4gPj4+Pj4gICAgID4+
ICAKPiA+Pj4+IFN1cmUgSSBrbm93IG10ZF9pc19iaXRmbGlwKCkgZG9lcyBub3QgbWVhbiBmYWls
dXJlLCBidXQgSSBkbyBub3QgdGhpbmsKPiA+Pj4+IG10ZF9pc19lY2NlcnIoKSBzaG91bGQgYmUg
aGVyZSBzaW5jZSB0aGUgY29kZXMgYXJlIHJldCA8IDAgYW5kIE5PVAo+ID4+Pj4gbXRkX2lzX2Jp
dGZsaXAoKS4gIAo+ID4+Pgo+ID4+PiBZZXMsIGp1c3QgZHJvcCB0aGlzIGNoZWNrLCBvbmx5IGtl
ZXAgcmV0IDwgMC4gIAo+ID4+PiAgICA+PiAgCj4gPj4gSWYgSSBkb24ndCBnZXQgaXQgd3Jvbmcs
IGl0IHNob3VsZCBub3QJIGJlIGRyb3BwZWQgaGVyZS4gTGlrZSB5b3VyIHdvcmRzLAo+ID4+ICJt
dGRfaXNfYml0ZmxpcCgpIGRvZXMgbm90IG1lYW4gdGhhdCB5b3UgYXJlIHJlYWRpbmcgYSBmYWxz
ZSBidWZmZXIsCj4gPj4gYnV0IHRoYXQgdGhlIGRhdGEgaGFzIGJlZW4gY29ycmVjdGVkIGFzIGl0
IGNvbnRhaW5lZCBiaXRmbGlwcy4iLCB0aGUKPiA+PiBkYXRhIEkgZ2V0IGFyZSB2YWxpZCBldmVu
IGlmIG10ZF9pc19iaXRmbGlwKCkgcmV0dXJuIHRydWUuIEl0J3MgY29ycmVjdAo+ID4+IGRhdGEg
YW5kIGl0J3Mgbm8gbmVlZCB0byBnbyB0byBoYW5kbGUgZXJyb3IuIFRvIG1lLCB0aGUgY29kZXMK
PiA+PiBzaG91bGQgYmU6Cj4gPj4gCWlmIChyZXQgPCAwICYmICFtaXRfaXNfYml0ZmxpcCgpKQo+
ID4+IAkJW2Vycm9yIGhhbmRsaW5nXSAgCj4gPiAKPiA+IFBsZWFzZSBjaGVjayB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgbXRkX2lzX2JpdGZsaXAoKS4gWW91J2xsIHByb2JhYmx5Cj4gPiBmaWd1cmUg
b3V0IHdoYXQgSSBhbSBzYXlpbmcuCj4gPiAKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgjTDU4NQo+ID4gICAK
PiAKPiBIb3cgYWJvdXQgdGhlIGNvZGVzIGFzIGZvbGxvd3M6Cj4gCj4gZm9yIChkb25lID0gMCwg
cmV0bGVuID0gMDsgZG9uZSA8IHNpemU7IGRvbmUgKz0gcmV0bGVuKSB7Cj4gCXJldCA9IG10ZF9y
ZWFkKC4uLiwgJnJldGxlbiwgLi4uKTsKPiAJaWYgKCFyZXQpCj4gCQljb250aW51ZTsKPiAJLyoK
PiAJICogZG8gbm90aGluZyBpZiBiaXRmbGlwIGFuZCBlY2MgZXJyb3Igb2NjdXJzIGJlY2F1c2Ug
d2hldGhlcgo+IAkgKiBpdCdzIGJpdGZsaXAgb3IgRUNDIGVycm9yLCBqdXN0IGEgc21hbGwgbnVt
YmVyIG9mIGJpdHMgZmxpcAo+IAkgKiBhbmQgdGhlIGltcGFjdCBvbiBsb2cgZGF0YSBpcyBzbyBz
bWFsbC4gVGhlIG10ZHBzdG9yZSBqdXN0Cj4gCSAqIGhhbmRzIG92ZXIgd2hhdCBpdCBnZXRzIGFu
ZCB1c2VyIGNhbiBqdWRnZSB3aGV0aGVyIHRoZSBkYXRhCj4gCSAqIGlzIHZhbGlkIG9yIG5vdC4K
PiAJICovCj4gCWlmIChtdGRfaXNfYml0ZmxpcChyZXQpKSB7Cj4gCQlkZXZfd2FybigiYml0Zmxp
cCBhdC4uLi4iKTsKPiAJCWNvbnRpbnVlOwoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBkbyB5b3Ug
Y2hlY2sgZm9yIGJpdGZsaXBzLiBCaXRmbGlwcyBoYXZlIGJlZW4KY29ycmVjdGVkIGF0IHRoaXMg
c3RhZ2UsIHlvdSBqdXN0IGdldCB0aGUgaW5mb3JtYXRpb24gdGhhdCB0aGVyZQpoYXMgYmVlbiBi
aXRmbGlwcywgYnV0IHRoZSBkYXRhIGludGVncml0eSBpcyBmaW5lLgoKSSBhbSBub3QgYWdhaW5z
dCBpZ25vcmluZyBFQ0MgZXJyb3JzIGluIHRoaXMgY2FzZSB0aG91Z2guIEkgd291bGQKcHJvcG9z
ZToKCglmb3IgKC4uLikgewoJCWlmIChyZXQgPCAwKSB7CgkJCWNvbXBsYWluOwoJCQlyZXR1cm47
CgkJfQoKCQlpZiAobXRkX2lzX2VjY2VycigpKQoJCQljb21wbGFpbjsKCX0KCQkKPiAJfSBlbHNl
IGlmIChtdGRfaXNfZWNjZXJyKHJldCkpIHsKPiAJCWRldl93YXJuKCJlY2NlcnIgYXQuLi4uIik7
Cj4gCQlyZXRsZW4gPSByZXRsZW4gPT0gMCA/IHNpemUgOiByZXRsZW47Cj4gCQljb250aW51ZTsK
PiAJfSBlbHNlIHsKPiAJCWRldl9lcnIoInJlYWQgZmFpbHVyZSBhdC4uLiIpOwo+IAkJLyogdGhp
cyB6b25lIGlzIGJyb2tlbiwgdHJ5IG5leHQgb25lICovCj4gCQlyZXR1cm4gLUVORVhUOwo+IAl9
Cj4gfQo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
