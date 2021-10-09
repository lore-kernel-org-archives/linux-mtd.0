Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E51C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 20:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B9C60F90
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 20:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40B9C60F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n+ooDjjtJlV4hEKanmpnYU38HZ7QeNAdHdmMTr/Z9GI=; b=ISNB99P0XlcU/wEfT5bX0b2iJr
	gXc1jc/bmFtp1aKcGxAuKHL+SFASpXlNyKsTE3byQejAz3eJOSciFCpyTvwfjt+ylFzS99KvBI0TO
	4UJj9dfZHgGq8oPQmDGjr2VUpkLLgn9jaIaGZJS4CbZktw94IcqvRh9L1ouw4+Ln8Tmzs90w/m+Y6
	8LINPML8TS6d7WWZSBQIKGv9fqqN7QMd4GW2XkWx6xsDKtlz4HDu9L2nflG8/xRkOwGxCTEzbcVZ7
	oi2lF08pSuhvjJvMNuwZQhKdVL1kOo9+YkkeuSS3oDbEpgdxoXM3vkZJquyAdieuOYeXry8w1MJVh
	vt04D1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZJH9-0064wN-14; Sat, 09 Oct 2021 20:48:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZJH5-0064w4-Rw
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 20:48:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8AE3761B8F4E;
 Sat,  9 Oct 2021 22:48:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IfQSoEYup1iB; Sat,  9 Oct 2021 22:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D57EE61B8F4F;
 Sat,  9 Oct 2021 22:48:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KxUwAN7OS5P4; Sat,  9 Oct 2021 22:48:53 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id AB09E61B8F4E;
 Sat,  9 Oct 2021 22:48:53 +0200 (CEST)
Date: Sat, 9 Oct 2021 22:48:53 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: schaecsn <schaecsn@gmx.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Stefan Schaeckeler <sschaeck@cisco.com>
Message-ID: <67641638.55077.1633812533457.JavaMail.zimbra@nod.at>
In-Reply-To: <20211004055758.C52AD899CC4@corona.crabdance.com>
References: <20210907214034.11676-1-schaecsn@gmx.net>
 <20210907214034.11676-2-schaecsn@gmx.net>
 <1815586081.32955.1633291105033.JavaMail.zimbra@nod.at>
 <20211004055758.C52AD899CC4@corona.crabdance.com>
Subject: Re: [PATCH 1/1] ubifs: ubifs to export filesystem error counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: ubifs to export filesystem error counters
Thread-Index: UO676Xgz4Y0Avo+u3Pw5FRWRm0S/nw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_134856_233916_4B2A8365 
X-CRM114-Status: GOOD (  25.34  )
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

U3RlZmFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInNjaGFlY3Nu
IiA8c2NoYWVjc25AZ214Lm5ldD4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBD
QzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtl
cm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiU3RlZmFuIFNjaGFlY2tlbGVy
Igo+IDxzc2NoYWVja0BjaXNjby5jb20+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgNC4gT2t0b2JlciAy
MDIxIDA3OjU3OjU4Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCAxLzFdIHViaWZzOiB1YmlmcyB0byBl
eHBvcnQgZmlsZXN5c3RlbSBlcnJvciBjb3VudGVycwoKPiBIZWxsbyBSaWNoYXJkLAo+IAo+PiA+
IE5vdCBhbGwgdWJpZnMgZmlsZXN5c3RlbSBlcnJvcnMgYXJlIHByb3BhZ2F0ZWQgdG8gdXNlcnNw
YWNlLgo+PiA+Cj4+ID4gRXhwb3J0IGJhZCBtYWdpYywgYmFkIG5vZGUgYW5kIGNyYyBlcnJvcnMg
dmlhIHN5c2ZzLiBUaGlzIGFsbG93cyB1c2Vyc3BhY2UKPj4gPiB0byBub3RpY2UgZmlsZXN5c3Rl
bSBlcnJvcnM6Cj4+ID4KPj4gPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfbWFnaWMKPj4g
PiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfbm9kZQo+PiA+IC9zeXMvZnMvdWJpZnMvdWJp
WF9ZL2Vycm9yc19jcmMKPj4gPgo+PiA+IFRoZSBjb3VudGVycyBhcmUgcmVzZXQgdG8gMCB3aXRo
IGEgcmVtb3VudC4gV3JpdGluZyBhbnl0aGluZyBpbnRvIHRoZQo+PiA+IGNvdW50ZXJzIGFsc28g
Y2xlYXJzIHRoZW0uCj4+Cj4+IEkgdGhpbmsgdGhpcyBpcyBhIG5pY2UgZmVhdHVyZS4gVGhhbmtz
IGZvciBpbXBsZW1lbnRpbmcgaXQuCj4+IFBsZWFzZSBzZWUgc29tZSBtaW5vciBuaXRzIGJlbG93
Lgo+Pgo+PiBJcyB0aGVyZSBhIHNwZWNpZmljIHJlYXNvbiB3aHkgeW91IGRpZG4ndCBpbXBsZW1l
bnQgaXQgdmlhIFVCSUZTJ3MgZGVidWdmcwo+PiBpbnRlcmZhY2U/Cj4gCj4gVGhlc2UgZXJyb3Ig
Y291bnRlcnMgYXJlIG5vdCBtZWFudCBmb3IgYWlkaW5nIGRlYnVnZ2luZyBidXQgZm9yIHVzZXJz
cGFjZSB0bwo+IG1vbml0b3IgdGhlIHNhbml0eSBvZiB0aGUgZmlsZXN5c3RlbS4gQWxzbyBleHQ0
IGV4cG9ydHMgZXJyb3IgY291bnRlcnMgdmlhCj4gc3lzZnMgLSBpdCdzIHByb2JhYmx5IGEgZ29v
ZCBpZGVhIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGVtLgo+IAo+ICQgZGlyIC9zeXMvZnMvZXh0
NC9zZGIyLyplcnJvcioKPiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgT2N0ICAzIDEzOjQ2
IC9zeXMvZnMvZXh0NC9zZGIyL2Vycm9yc19jb3VudAo+IC1yLS1yLS1yLS0gMSByb290IHJvb3Qg
NDA5NiBPY3QgIDMgMTM6NDYgL3N5cy9mcy9leHQ0L3NkYjIvZmlyc3RfZXJyb3JfYmxvY2sKPiAt
ci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgT2N0ICAzIDEzOjQ2IC9zeXMvZnMvZXh0NC9zZGIy
L2ZpcnN0X2Vycm9yX2VycmNvZGUKPiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgT2N0ICAz
IDEzOjQ2IC9zeXMvZnMvZXh0NC9zZGIyL2ZpcnN0X2Vycm9yX2Z1bmMKPiAtci0tci0tci0tIDEg
cm9vdCByb290IDQwOTYgT2N0ICAzIDEzOjQ2IC9zeXMvZnMvZXh0NC9zZGIyL2ZpcnN0X2Vycm9y
X2lubwo+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiBPY3QgIDMgMTM6NDYgL3N5cy9mcy9l
eHQ0L3NkYjIvZmlyc3RfZXJyb3JfbGluZQo+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiBP
Y3QgIDMgMTM6NDYgL3N5cy9mcy9leHQ0L3NkYjIvZmlyc3RfZXJyb3JfdGltZQo+IC1yLS1yLS1y
LS0gMSByb290IHJvb3QgNDA5NiBPY3QgIDMgMTM6NDYgL3N5cy9mcy9leHQ0L3NkYjIvbGFzdF9l
cnJvcl9ibG9jawo+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiBPY3QgIDMgMTM6NDYgL3N5
cy9mcy9leHQ0L3NkYjIvbGFzdF9lcnJvcl9lcnJjb2RlCj4gLXItLXItLXItLSAxIHJvb3Qgcm9v
dCA0MDk2IE9jdCAgMyAxMzo0NiAvc3lzL2ZzL2V4dDQvc2RiMi9sYXN0X2Vycm9yX2Z1bmMKPiAt
ci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgT2N0ICAzIDEzOjQ3IC9zeXMvZnMvZXh0NC9zZGIy
L2xhc3RfZXJyb3JfaW5vCj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0MDk2IE9jdCAgMyAxMzo0
NiAvc3lzL2ZzL2V4dDQvc2RiMi9sYXN0X2Vycm9yX2xpbmUKPiAtci0tci0tci0tIDEgcm9vdCBy
b290IDQwOTYgT2N0ICAzIDEzOjQ2IC9zeXMvZnMvZXh0NC9zZGIyL2xhc3RfZXJyb3JfdGltZQo+
IC0tdy0tLS0tLS0gMSByb290IHJvb3QgNDA5NiBPY3QgIDMgMTM6NDYgL3N5cy9mcy9leHQ0L3Nk
YjIvdHJpZ2dlcl9mc19lcnJvcgoKZXh0NCBpcyBub3QgdGhlIHJlZmVyZW5jZSBkZXNpZ24gZm9y
IGZpbGVzeXN0ZW1zIGluIExpbnV4LgplLmcuIGJ0cmZzIGhhcyBhbiBpb2N0bCBmb3Igc3VjaCBz
dGF0cy4KCj4gCj4+IHN5c2ZzIGlzIEFCSSwgc28gd2UgY2Fubm90IGNoYW5nZSBtdWNoIGFueW1v
cmUuCj4gCj4gSnVkZ2luZyBieSB0aGUgZmlsZXN5c3RlbSBwZXJtaXNzaW9ucyBhYm92ZSwgZXh0
NCBkb2VzIG5vdCBzZWVtIHRvIGFsbG93Cj4gcmVzZXR0aW5nIGVycm9yIGNvdW50ZXJzLiBJZiB5
b3Ugd29ycnkgYWJvdXQgdW5jaGFuZ2FibGUgQUJJcyB0aGVuIHdlIGNvdWxkCj4gcGxheSBpdCBz
YWZlIGFuZCBkb24ndCBzdXBwb3J0IHdyaXRlIGNhbGxiYWNrcyBmb3IgcmVzZXR0aW5nIHRoZSBl
cnJvciBjb3VudGVycwo+IGluIGFuIGluaXRpYWwgdmVyc2lvbiBvZiB0aGUgdWJpZnMgc3lzZnMu
IFdoYXQgZG8geW91IHRoaW5rPwoKQWNrLgoKPiBXaGVuIHdlIGFyZSBhdCBpdCwgaW4gdGhlIGN1
cnJlbnQgY29kZSwgd3JpdGluZyBhbnl0aGluZyBpbnRvIGEgc3lzZnMgbm9kZQo+IHJlc2V0cyB0
aGUgY29ycmVzcG9uZGluZyBjb3VudGVyLiBPbmUgY291bGQgZmluZS10dW5lIHRoYXQgdG8gc2V0
IHRoZSBjb3VudGVyCj4gdG8gd2hhdGV2ZXIgbm9uLW5lZ2F0aXZlIGludGVnZXIgaXMgcGFzc2Vk
Lgo+IAo+IAo+PiA+ICsJCWlmIChjLT5zdGF0cykKPj4gPiArCQkJYy0+c3RhdHMtPm1hZ2ljX2Vy
cm9ycysrOwo+Pgo+PiBQbGVhc2Ugd3JhcCB0aGlzIGludG8gYSBoZWxwZXIgZnVuY3Rpb24uCj4g
Cj4gQWNrLgo+IAo+IAo+PiA+ICsJCWlmIChjLT5zdGF0cykKPj4gPiArCQkJYy0+c3RhdHMtPm5v
ZGVfZXJyb3JzKys7Cj4+Cj4+IFNhbWUuCj4gCj4gQWNrLgo+IAo+IAo+PiA+ICsJCWlmIChjLT5z
dGF0cykKPj4gPiArCQkJYy0+c3RhdHMtPmNyY19lcnJvcnMrKzsKPj4KPj4gU2FtZS4KPiAKPiBB
Y2suCj4gCj4gCj4+ID4gKyNkZWZpbmUgVUJJRlNfQVRUUl9GVU5DKF9uYW1lLCBfbW9kZSkgVUJJ
RlNfQVRUUihfbmFtZSwgX21vZGUsIF9uYW1lKQo+PiA+ICsKPj4gPiArVUJJRlNfQVRUUl9GVU5D
KGVycm9yc19tYWdpYywgMDY0NCk7Cj4+ID4gK1VCSUZTX0FUVFJfRlVOQyhlcnJvcnNfY3JjLCAw
NjQ0KTsKPj4gPiArVUJJRlNfQVRUUl9GVU5DKGVycm9yc19ub2RlLCAwNjQ0KTsKPj4KPj4gSSdt
IG5vdCBzdXJlIHdoZXRoZXIgZXZlcnlvbmUgc2hvdWxkIGJlIGFsbG93ZWQgdG8gcmVhZCB0aGVz
ZSBzdGF0cy4KPj4gZG1lc2cgaXMgYWxzbyByZXN0cmljdGVkIHRoZXNlIGRheXMuIEFuIHVucHJp
dmlsZWdlZCB1c2VyIHNob3VsZCBub3Qgc2VlIHRoZQo+PiBlcnJvcnMgaGUgY2FuIGluZGlyZWN0
bHkgdHJpZ2dlci4KPiAKPiBJIGRvbid0IG1pbmQgNjAwLCBidXQgaGF2aW5nIGVycm9yIGNvdW50
ZXJzIHdvcmxkLXJlYWRhYmxlIGlzIGNvbnNpc3RlbnQgd2l0aAo+IGV4dDQgKHNlZSBkaXIgYWJv
dmUpIGFuZCBzbyBJIHN1Z2dlc3QgdG8ga2VlcCA2NDQuCj4gCgpPay4KIAo+PiA+ICsJY2FzZSBh
dHRyX2Vycm9yc19jcmM6Cj4+ID4gKwkJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAi
JXVcbiIsCj4+ID4gKwkJCQlzYmktPnN0YXRzLT5jcmNfZXJyb3JzKTsKPj4KPj4gUGxlYXNlIHVz
ZSBzeXNmc19lbWl0KCkuCj4gCj4gQWNrLgo+IAo+IAo+PiA+ICsJaWYgKG4gPT0gVUJJRlNfREZT
X0RJUl9MRU4pIHsKPj4gPiArCQkvKiBUaGUgYXJyYXkgc2l6ZSBpcyB0b28gc21hbGwgKi8KPj4g
PiArCQlyZXQgPSAtRUlOVkFMOwo+PiA+ICsJCWdvdG8gb3V0X2xhc3Q7Cj4+Cj4+IFdoZXJlIGlz
IGMtPnN0YXRzIHJlbGVhc2VkIGluIGNhc2Ugb2YgYW4gZXJyb3I/Cj4gCj4gTXkgZmF1bHQuIFdp
bGwgYmUgZml4ZWQuCj4gCj4gCj4+ID4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N5c2ZzLmggYi9m
cy91Ymlmcy9zeXNmcy5oCj4+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmExMGE4MjU4NWFmOAo+PiA+IC0tLSAvZGV2L251bGwKPj4gPiArKysgYi9mcy91
Ymlmcy9zeXNmcy5oCj4+Cj4+IERvIHdlIHJlYWxseSBuZWVkIGEgbmV3IGhlYWRlciBmaWxlPwo+
PiBVc3VhbGx5IG1vc3QgcnVuLXRpbWUgc3R1ZmYgb2YgVUJJRlMgaXMgcGFydCBvZiB1Ymlmcy5o
Lgo+IAo+IEkgd2FudGVkIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBkZWJ1Z2ZzIHdoZXJlIGZzL3Vi
aWZzL2RlYnVnLmMgY29tZXMgd2l0aCBpdHMKPiBvd24gaGVhZGVyIGZzL3ViaWZzL2RlYnVnLmgu
CgpkZWJ1Zy5oIGlzIG5vdCBqdXN0IGFib3V0IGRlYnVnZnMuIEl0IGlzIGFib3V0IGRlYnVnZ2lu
Zy9kZXZlbG9waW5nIFVCSUZTLgpUaGF0J3Mgd2h5IGl0IGlzIGtpbmQgb2Ygc3BlY2lhbC4KCj4g
Cj4gSSdsbCBzZW5kIG91dCBhIG5ldyBwYXRjaCBvbmNlIHdlIGFncmVlIG9uIGFsbCBjaGFuZ2Vz
LiBUbyByZWNhcDoKPiAKPiAtIHdyaXRlIGNhbGxiYWNrczogZG8gd2UgcmVtb3ZlIHRoZW0/IElm
IG5vdCwgZG8gd2Uga2VlcCB0aGVtIGFzIGlzIG9yIGRvIHdlCj4gIGZpbmUtdGluZSB0aGVtIGJ5
IGxldHRpbmcgYSBub24tbmVnYXRpdmUgaW50ZWdlciBzZXQgdGhlIGNvdW50ZXI/CgpJJ2QgZ28g
Zm9yIHJlYWQtb25seSBmaXJzdC4KCj4gLSA2NDQgKHdvcmxkLXJlYWRhYmxlKSBjb3VudGVycyB0
byBiZSBjb25zaXN0ZW50IHdpdGggZXh0ND8KCkFjay4KCj4gLSBrZWVwIHN5c2ZzLmggdG8gYmUg
Y29uc2lzdGVudCB3aXRoIGRlYnVnZnM/CgpQbGVhc2UgcmVtb3ZlIHN5c2ZzLmguCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
