Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36405C6377D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 08:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39FD61241
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 08:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C39FD61241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KXEDs0XS5sTJmbBT3ROqFtM9E72v8joCNvNWPDEv3N8=; b=OMG7dYc71g7rdOTOwjIMHorjDS
	9oKzSugvEmshQ3ZMW7u/s+ziN/hM5kLdgjCjNocMZqE9VfRHywVmH0EJSbgTiLYT7MfdnoyM9dO+0
	dqZsKXPvPv5FO1Uj6Nw9CXYRgN6HV08bKqmsqaZc1w4ybUK/cuAMOEHz8AHinygEQQV6BA97HCQ0a
	RcrwnywY9BAhnrrrS/RAMJfJDcPPsnl+pUlUdtKJTkCDLD+sOiMeFmaI7lYszsKQIe2d8GFOK/kqe
	oGAjXLazHd0Rl/e5ZKKiF6MDsOPnTLeBwwbS7P0Cq+Bv9HH59wzr5thx4EYn42/EDQpBVsALMGbR9
	QIpv5pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6U9H-000hUe-0R; Thu, 22 Jul 2021 08:33:43 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6U9D-000hU2-OX
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 08:33:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 79A0A60A3599;
 Thu, 22 Jul 2021 10:33:35 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4vu4TfjmM_Bb; Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BABC96108461;
 Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ktcqJGscyb3K; Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4D08F60A3599;
 Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
Date: Thu, 22 Jul 2021 10:33:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: sg@emlix.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <dedekind1@gmail.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
In-Reply-To: <YPkj9NUxNLGG5tjL@emlix.com>
References: <YPkj9NUxNLGG5tjL@emlix.com>
Subject: Re: ubifs: corrupted dirent (ENOENT), problably related to
 O_TMPFILE and linkat
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: corrupted dirent (ENOENT),
 problably related to O_TMPFILE and linkat
Thread-Index: RaG6b1FS1BcsyEswrHvBbz6Yz5+seQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_013340_152645_7E9C4A4F 
X-CRM114-Status: GOOD (  30.20  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogc2dAZW1saXguY29tCj4gQW46
ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBDQzogInJpY2hh
cmQiIDxyaWNoYXJkQG5vZC5hdD4sICJBcnRlbSBCaXR5dXRza2l5IiA8ZGVkZWtpbmQxQGdtYWls
LmNvbT4sICJBZHJpYW4gSHVudGVyIiA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+LAo+ICJjaGVu
Z3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogRG9ubmVyc3Rh
ZywgMjIuIEp1bGkgMjAyMSAwOTo1MzoyNAo+IEJldHJlZmY6IHViaWZzOiBjb3JydXB0ZWQgZGly
ZW50IChFTk9FTlQpLCBwcm9ibGFibHkgcmVsYXRlZCB0byBPX1RNUEZJTEUgYW5kIGxpbmthdAoK
PiBIaSwKPiAKPiB3ZSBlbmNvdW50ZXJlZCBhbiBlcnJvciBpbiB1YmlmcyBtb3N0IGxpa2VseSB3
aGVuIHVzaW5nIE9fVE1QRklMRSBhbmQgbGlua2F0Lgo+IAo+IFRoZSBjb2RlIChkaXIuYzp1Ymlm
c19sb29rdXApIHdlIHJhbiBpbnRvIHN0YXRlcwo+IAo+ICAgICAgICAvKgo+ICAgICAgICAgKiBU
aGlzIHNob3VsZCBub3QgaGFwcGVuLiBQcm9iYWJseSB0aGUgZmlsZS1zeXN0ZW0gbmVlZHMKPiAg
ICAgICAgICogY2hlY2tpbmcuCj4gICAgICAgICAqLwo+IEknZCBsb3ZlIHRvLCBidXQgaG93PyBz
aW5jZSByZWNvdmVyeS5jIHNob3VsZCBoYXZlIHRha2VuIGNhcmUgb2YgdGhhdCBiZWZvcmUKPiBB
RkFJSwoKVUJJRlMgY29kZSBzb21ldGltZXMgY29udGFpbnMgYSBsaXR0bGUgcG9ydGlvbiBvZiBo
dW1vci4KIAo+IAo+IEkgd2lzaCBJIGNvdWxkIGdpdmUgbW9yZSBlbGFib3JhdGUgaW5mb3JtYXRp
b24gYnV0IHRoaXMgb25lIGlzIGhhcmQgdG8gdHJhY2sKPiBhbmQgcmVwcm9kdWNlLgo+IAo+IFdo
YXQgaGFzIGJlZW4gdHJpZWQgc28gZmFyIGFuZCBhbHNvIHdhcyB0aGUgZmlyc3QgZW5jb3VudGVy
Cj4gCj4gLSBzeXN0ZW1kLWNvcmVkdW1wIGhhcyBiZWVuIHRyaWdnZXJlZCAoaW4gb3VyIHRlc3Qt
c2V0dXAgd2l0aCBraWxsIC1TSUdBQlJUIG9mCj4gIHNvbWUgcHJvY2VzcykKPiAtIGhhcmR3YXJl
IHBvd2VyLWN1dCAodGhlIHRpbWluZyB3aGVuIHRvIHBvd2Vyb2ZmIGhhcyB5ZXQgdG8gYmUgZm91
bmQpCj4gLSBvbiByZXBsYXlpbmcgdGhlIGpvdXJuYWwgdGhlIGZzIHdhcyBtb3VudGVkIHJlYWQg
b25seQo+IC0gb24gbGF0ZXIgYm9vdHMgdGhlIGZzIHdhcyBtb3VudGVkIHByb3Blcmx5IGJ1dCB3
aGVuIGFjY2Vzc2luZyB0aGUgcmVzcGVjdGl2ZQo+ICBkaXJlY3RvcnkgYW4gaW5vZGUgY291bGQg
bm90IGJlIGZvdW5kICh3aXRoIGxzKS4KPiAgVHJhY2VkIGl0IGRvd24gdG8gdWJpZnNfdG5jX2xv
b2t1cC4KPiAtIGRlYWQgZGlyZWN0b3J5IGVudHJ5IGVycm9yIGxlYWQgdG8gcm9fbW9kZQo+IAo+
IEZvbGxvd2luZyBwYXJ0IG9mIGRtZXNnIHNob3dzIHRoZSBlcnJvcgo+IAo+ICAgWyAgIDY3LjQ4
MDg1OF0gVUJJRlMgREJHIGdlbiAocGlkIDI0MSk6IGRpciBpbm8gOTMsIGZfcG9zIDB4MAo+ICAg
WyAgIDY3LjQ4MTYzNF0gVUJJRlMgREJHIGdlbiAocGlkIDI0MSk6IGlubyA0MDczNSwgbmV3IGZf
cG9zIDB4Mjk1ZTk4Cj4gICBbICAgNjcuNDgyMDI0XSBVQklGUyBEQkcgZ2VuIChwaWQgMjQxKTog
aW5vIDk4NDkzLCBuZXcgZl9wb3MgMHg5ZjlhNjUKPiAgIFsgICA2Ny40ODI3NTNdIFVCSUZTIERC
RyBnZW4gKHBpZCAyNDEpOiBpbm8gOTgxNDYsIG5ldyBmX3BvcyAweDE4YjVkZDgxCj4gICBbICAg
NjcuNDgzMjU3XSBVQklGUyBEQkcgZ2VuIChwaWQgMjQxKTogJ3RtcCcgaW4gZGlyIGlubyA5Mwo+
ICAgWyAgIDY3LjQ4NjkyMF0gVUJJRlMgREJHIGdlbiAocGlkIDI0MSk6Cj4gICAnY29yZS5XUEVX
ZWJQcm9jZXNzLjAuZTdjNTU5ODBjMjMwNDAxZDhlMzk0MWU3MmY1NmE5NWMuMjUxLjE1MzAwMTc1
NDMwMDAwMDAnIGluCj4gICBkaXIgaW5vIDkzCj4gICBbICAgNjcuNDg5NDEyXSBVQklGUyBlcnJv
ciAodWJpMDoyIHBpZCAyNDEpOiB1Ymlmc19pZ2V0OiBmYWlsZWQgdG8gcmVhZCBpbm9kZQo+ICAg
OTg0OTMsIGVycm9yIC0yCj4gCj4gCj4gc3lzdGVtZC1jb3JlZHVtcCBvcGVucyBhIGZpbGUgd2l0
aCBPX1RNUEZJTEUsIHdyaXRlcyB0byBpdCBhbmQgbGF0ZXIgY2FsbHMKPiBsaW5rYXQoKQo+IFdp
dGggT19UTVBGSUxFIGRpc2FibGVkIGluIGtlcm5lbCB0aGUgZXJyb3IgZG9lcyBub3Qgb2NjdXIg
YW5kIHN5c3RlbWQgdXNlcyBhbgo+IGFsdGVybmF0ZSBjb2RlIHBhdGguCgpJbiB0aGlzIGFyZWEg
d2UgaGFkIGEgbG90IG9mIGlzc3Vlcywgc2ltcGx5IGJlY2F1c2UgdGhlIGNvbmNlcHQgb2YgaW5v
ZGUgInJlYmlydGgiCndhcyB1bmtub3duIHRvIFVCSUZTLgoKPiBTeXN0ZW0KPiAKPiAgTGludXgg
NC4xOS4xODYgIzI2IFNNUCBXZWQgSnVsIDIxIDEzOjE5OjA4IENFU1QgMjAyMSBhcm12N2wgR05V
L0xpbnV4CgpUaGlzIGlzIG5ldyBlbm91Z2ggdG8gY29udGFpbiBlZTE0MzhjZTVkYzQgKCJ1Ymlm
czogQ2hlY2sgbGluayBjb3VudCBvZiBpbm9kZXMgd2hlbiBraWxsaW5nIG9ycGhhbnMuIikuClNv
IGl0IG11c3QgYmUgc29tZXRoaW5nIGRpZmZlcmVudC4KCj4gCj4gd2l0aCBmb2xsb3dpbmcgcGF0
Y2hlcyBvZiB3aGljaCBJIHRob3VnaHQgdGhleSBtaWdodCBzb2x2ZSB0aGUgcHJvYmxlbQo+ICAz
MjViNzMxOTgzZDAxMGQzNTg1MDViZjJjNDBmNWUwMDY5YWY2MmQyCgpZb3Ugd2FudCB0aGlzIG9u
ZSBkZWZpbml0ZWx5LiBJdCBjb3VsZCBleHBsYWluIHRoZSBwcm9ibGVtIHlvdSBzZWUuCkJUVzog
QXBwbHlpbmcgdGhpcyBwYXRjaCB3aWxsIG5vdCByZWNvdmVyIHRoZSBjb3JydXB0ZWQgZnMuIEl0
IGp1c3QgbWFrZXMgc3VyZQp0aGF0IHRoZSBjb3JydXB0aW9uIGRvZXMgbm90IGhhcHBlbi4gCgo+
ICBkZDdkYjE0OWJjZDkxNGRiOGZkZWIxOWNkNTU5N2MwNzQwMTIxYmM3CgpUaGlzIG9uZSBpcyB1
bnJlbGF0ZWQuIEluIHdvcnN0IGNhc2UgeW91J2xsIGhpdCBhbiBVQklGUyBhc3NlcnQuCgo+IC9k
YXRhL3ZhciBpcyBiaW5kLW1vdW50ZWQgdG8gL3ZhciB0aGUgZGlyZWN0b3J5IHVzZWQgYnkgc3lz
dGVtZC1jb3JlZHVtcC4KPiAvZGF0YSBpcyB0aGUgYWN0dWFsIG1vdW50cG9pbnQgb2YgdWJpIHZv
bHVtZSB1YmkwXzIKPiAKPiAgc3lzdGVtZCB2ZXJzaW9uIDIzOQo+IAo+IEhhcmR3YXJlCj4gIGku
TVg2USBvbiBhIHBoeUNvcmUgU09NIHdpdGggYSBTUEFOU0lPTiBTMzRNTDA4RzIwMVRGSTAwIE5B
TkQgZmxhc2gKPiAKPiAgVGhlIHBvd2VyLWN1dCBpcyBkb25lIGhhcmQgYnkgcHVsbGluZyB0aGUg
Q1BVIHJlc2V0IGxpbmUuCj4gCj4gCj4gQ2FuIHlvdSBnaXZlIG1lIGhpbnRzIGhvdyB0byBwcm9j
ZWVkIG9uIHRoaXM/Cj4gLSBhcmUgdGhlcmUgYW55IHBhdGNoZXMgZnJvbSA1LjE0LXJjMiBJIG1p
Z2h0IGhhdmUgbWlzc2VkCj4gLSBob3cgdG8gcmVwcm9kdWNlIHRoZSBlcnJvciBtb3JlIHJlbGlh
YmxlLCBpZS4gZmluZCB0aGUgcmlnaHQgdGltZSB0byBjdXQgcG93ZXIKPiAgSXQgaXMgbm93IGF0
IGFyb3VuZCA0cyBhZnRlciBpc3N1ZWluZyAna2lsbCcuIFdpdGggYSBtYXJnaW4gb2YgNTAwbXMK
PiAgYW5kIHN0ZXAgd2lkdGggb2YgMjVtcwoKQ2FuIHlvdSByZXByb2R1Y2UgdXNpbmcgYSByZWNl
bnQga2VybmVsPwoKPiAtIHdpdGggdGhlIG1lbnRpb25lZCBhYm92ZSBJIG1pZ2h0IGdldCBteSBo
YW5kcyBvbiBtb3JlIHVzZWZ1bAo+ICBpbmZvcm1hdGlvbiB0aGFuIHRoZSBibGFuayB0bmMgYW5k
IGpvdXJuYWwgc3BhbSB3aXRoIGVuYWJsZWQgREVCVUcgKGhhZCB0byBzZXQKPiAgTE9HX0JVRiB0
bwo+ICAyNCAoMTZNKSB0byBjYXB0dXJlL3NhdmUgYWxsIG1lc3NhZ2VzCj4gLSBob3cgdG8gcmVj
b3ZlciBieSBoYW5kCgpXaXRob3V0IGluc3BlY3RpbmcgdGhlIGZpbGVzeXN0ZW0gdGhpcyBpbXBv
c3NpYmxlIHRvIGFuc3dlci4KWW91IGhhdmUgc29tZSByZWNvdmVyeSB0b29sIGluIG1pbmQ/Cgo+
IC0gbWlnaHQgaXQgYmUgc2FmZSB0byBqdXN0IGdldCByaWQgb2YgdGhlIGlub2RlIGluIHViaWZz
X3JlYWRkaXIgd2hlbiBpdCBjYW4gbm90Cj4gIGJlIGZvdW5kPyBJbiBvdXIgcGFydGljdWxhciBj
YXNlIGl0IGlzIGp1c3QgYSBjb3JlZHVtcCBhbiB3ZSBkb24ndCBjYXJlIGZvcgo+ICBkYXRhIGxv
c3MgYXMgbG9uZyBhcyB3ZSBjYW4gc3RpbGwgdXNlIHRoZSByZXN0IG9mIHRoZSB2b2x1bWUvCj4g
IGZpbGVzeXN0ZW0uCgpZZXMuIE1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIG1ha2UgVUJJRlMgYXQg
dGhpcyBzdGFnZSBtb3JlIGZvcmdpdmluZyBpbnN0ZWFkIG9mCnRoZSBjdXJyZW50IHNpdHVhdGlv
bi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
