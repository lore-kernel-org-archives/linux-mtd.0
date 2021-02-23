Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AE9C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:35:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF1464E61
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF1464E61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jZh9Ri/M5smpdDe1w2kSw6fYIytX6NcXNIjn3zWS4TU=; b=FHHBFfic+PSrOVnJitHFyFD7G
	W1s9H6CiR2W14pN3RX0kdUsyMmptcwSI3J8fQRQJsjqfI26bck+TgLO5LtgSUJ2Q1jtuExdbpKsIK
	srCHQyNH5HcmnLkUAp8DPw1ol6qTvxAdHyuTsdQkw+jUO6bGKW82vlyZRVpP2dU/lcVV2I0EtizOu
	7pMTTlDHgR/ziOGRNWeYKzlmyvS5bY9rkoNBHT8z8j7XFXIHZHTXGgkIuc9U6chgLJccl2xrAPFXG
	QOvRuFoWxFWP5w0a9v+mm1rR16Ioyx5Al+Zuzz328jbIXm8H7d7Su+PSl/TtOF/Cc9jf176dVaxIA
	LGHsmcZWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEaeH-0002bC-P0; Tue, 23 Feb 2021 16:34:57 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEaeE-0002aK-DP
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:34:55 +0000
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1020A24000E;
 Tue, 23 Feb 2021 16:34:50 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:34:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
Message-ID: <20210223173449.1a55df1e@xps13>
In-Reply-To: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_113454_661461_7E5FFE30 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: sricharan@codeaurora.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, mani@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1
ZSwgMjMgRmViIDIwMjEKMDE6MzQ6MjcgKzA1MzA6Cgo+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBv
bndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8gcmVhZCBsYXN0CgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYSBuZXcKCj4gY29kZXdvcmQuIFRoaXMgY2hhbmdlIHdpbGwgYWRk
IHRoZSBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rlci4KCiAgICAgICAgICAgIEFkZCBz
dXBwb3J0IGZvciB0aGlzIFJFQURfTE9DQVRJT05fTEFTVF9DV19uIHJlZ2lzdGVyLgoKPiAKPiBG
b3IgZmlyc3QgdGhyZWUgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fbiByZWdpc3RlciB3aWxsIGJl
Cj4gdXNlLkZvciBsYXN0IGNvZGUgd29yZCBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiByZWdpc3Rl
ciB3aWxsIGJlCj4gdXNlLgoKIgpJbiB0aGUgY2FzZSBvZiBRUElDIHYyLCBjb2Rld29yZHMgMCwg
MSBhbmQgMiB3aWxsIGJlIGFjY2Vzc2VkIHRocm91Z2gKUkVBRF9MT0NBVElPTl9uLCB3aGlsZSBj
b2Rld29yZCAzIHdpbGwgYmUgYWNjZXNzZWQgdGhyb3VnaApSRUFEX0xPQ0FUSU9OX0xBU1RfQ1df
bi4KIgoKV2hlbiBJIHJlYWQgbXkgb3duIHNlbnRlbmNlLCBJIGZlZWwgdGhhdCB0aGVyZSBpcyBz
b21ldGhpbmcgd3JvbmcuCklmIHRoZXJlIGFyZSBvbmx5IDQgY29kZXdvcmRzLCBJIGd1ZXNzIGEg
UVBJQyB2MiBpcyBhYmxlIHRvIHVzZQpSRUFEX0xPQ0FUSU9OXzMgb3IgUkVBRF9MT0NBVElPTl9M
QVNUX0NXXzAgaW50ZXJjaGFuZ2VhYmx5LiBJc24ndCBpdD8KCkkgZ3Vlc3MgdGhlIHBvaW50IG9m
IGhhdmluZyB0aGVzZSAibGFzdF9jd19uIiByZWdpc3RlcnMgaXMgdG8gc3VwcG9ydAp1cCB0byA4
IGNvZGV3b3JkcywgYW0gSSB3cm9uZz8gSWYgdGhpcyB0aGUgY2FzZSwgdGhlIGN1cnJlbnQgcGF0
Y2gKY29tcGxldGVseSBmYWlscyBkb2luZyB0aGF0IEkgZG9uJ3QgZ2V0IHRoZSBwb2ludCBvZiBz
dWNoIGNoYW5nZS4KCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVh
dXJvcmEub3JnPgo+IC0tLQoKWy4uLl0KCj4gIC8qIGhlbHBlciB0byBjb25maWd1cmUgYWRkcmVz
cyByZWdpc3RlciB2YWx1ZXMgKi8KPiBAQCAtNzAwLDggKzcyNyw5IEBAIHN0YXRpYyB2b2lkIHNl
dF9hZGRyZXNzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgdTE2IGNvbHVtbiwgaW50IHBh
Z2UpCj4gICAqCj4gICAqIEBudW1fY3c6CQludW1iZXIgb2Ygc3RlcHMgZm9yIHRoZSByZWFkL3dy
aXRlIG9wZXJhdGlvbgo+ICAgKiBAcmVhZDoJCXJlYWQgb3Igd3JpdGUgb3BlcmF0aW9uCj4gKyAq
IEBjdwk6CQl3aGljaCBjb2RlIHdvcmQKPiAgICovCj4gLXN0YXRpYyB2b2lkIHVwZGF0ZV9yd19y
ZWdzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IG51bV9jdywgYm9vbCByZWFkKQo+
ICtzdGF0aWMgdm9pZCB1cGRhdGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3Qs
IGludCBudW1fY3csIGJvb2wgcmVhZCwgaW50IGN3KQo+ICB7Cj4gIAlzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwID0gJmhvc3QtPmNoaXA7Cj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjID0gZ2V0X3Fjb21fbmFuZF9jb250cm9sbGVyKGNoaXApOwo+IEBAIC03NDAsNyArNzY4LDcg
QEAgc3RhdGljIHZvaWQgdXBkYXRlX3J3X3JlZ3Moc3RydWN0IHFjb21fbmFuZF9ob3N0ICpob3N0
LCBpbnQgbnVtX2N3LCBib29sIHJlYWQpCj4gIAluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VY
RUNfQ01ELCAxKTsKPiAgCj4gIAlpZiAocmVhZCkKPiAtCQluYW5kY19zZXRfcmVhZF9sb2MoY2hp
cCwgMCwgMCwgMCwgaG9zdC0+dXNlX2VjYyA/Cj4gKwkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAs
IGN3LCAwLCAwLCBob3N0LT51c2VfZWNjID8KPiAgCQkJCSAgIGhvc3QtPmN3X2RhdGEgOiBob3N0
LT5jd19zaXplLCAxKTsKPiAgfQo+ICAKPiBAQCAtMTExMSwxOCArMTEzOSwzNCBAQCBzdGF0aWMg
dm9pZCBjb25maWdfbmFuZF9wYWdlX3JlYWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQkg
ICAgICBOQU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIH0KPiAgCj4g
Ky8qIGhlbHBlciB0byBjaGVjayB3aGljaCBsb2NhdGlvbiByZWdpc3RlciBzaG91bGQgYmUgdXNl
IGZvciB0aGlzCgogICAgLyoKICAgICAqIENoZWNrIHdoaWNoIGxvY2F0aW9uLi4uCgo+ICsgKiBj
b2RlIHdvcmQuIE5BTkRfUkVBRF9MT0NBVElPTiBvciBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9D
Vwo+ICsgKi8KPiArc3RhdGljIGJvb2wgY29uZmlnX2xvY19sYXN0X3JlZyhzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBpbnQgY3cpCj4gK3sKPiArCXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAq
bmFuZGMgPSBnZXRfcWNvbV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4gKwlzdHJ1Y3QgbmFuZF9l
Y2NfY3RybCAqZWNjID0gJmNoaXAtPmVjYzsKPiArCj4gKwlpZiAobmFuZGMtPnByb3BzLT5xcGlj
X3YyICYmIHFjb21fbmFuZGNfaXNfbGFzdF9jdyhlY2MsIGN3KSkKPiArCQlyZXR1cm4gdHJ1ZTsK
Ck5vdCBzdXJlIHRoaXMgaXMgcmVhbGx5IHVzZWZ1bCwgaXQncyBwcm9iYWJseSBiZXR0ZXIgdG8g
ZHJvcCB0aGlzCmhlbHBlciBhbmQganVzdCB1c2UuLi4KCj4gKwo+ICsJcmV0dXJuIGZhbHNlOwo+
ICt9Cj4gIC8qCj4gICAqIEhlbHBlciB0byBwcmVwYXJlIERNQSBkZXNjcmlwdG9ycyBmb3IgY29u
ZmlndXJpbmcgcmVnaXN0ZXJzCj4gICAqIGJlZm9yZSByZWFkaW5nIGVhY2ggY29kZXdvcmQgaW4g
TkFORCBwYWdlLgo+ICAgKi8KPiAgc3RhdGljIHZvaWQKPiAtY29uZmlnX25hbmRfY3dfcmVhZChz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBib29sIHVzZV9lY2MpCj4gK2NvbmZpZ19uYW5kX2N3X3Jl
YWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgYm9vbCB1c2VfZWNjLCBpbnQgY3cpCj4gIHsKPiAg
CXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSBnZXRfcWNvbV9uYW5kX2NvbnRy
b2xsZXIoY2hpcCk7Cj4gKwlpbnQgcmVnID0gTkFORF9SRUFEX0xPQ0FUSU9OXzA7Cj4gKwo+ICsJ
aWYgKGNvbmZpZ19sb2NfbGFzdF9yZWcoY2hpcCwgY3cpKQoKLi4uICAgICBpZiAobmFuZGMtPnBy
b3BzLT5xcGljX3YyICYmIHFjb21fbmFuZGNfaXNfbGFzdGN3KCkpIGhlcmUuCgo+ICsJCXJlZyA9
IE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzA7Cj4gIAo+ICAJaWYgKG5hbmRjLT5wcm9wcy0+
aXNfYmFtKQo+IC0JCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElPTl8wLCA0
LAo+IC0JCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gKwkJd3JpdGVfcmVnX2RtYShuYW5k
YywgcmVnLCA0LCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIAo+ICAJd3JpdGVfcmVnX2RtYShuYW5k
YywgTkFORF9GTEFTSF9DTUQsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiAgCXdyaXRlX3JlZ19k
bWEobmFuZGMsIE5BTkRfRVhFQ19DTUQsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiBAQCAtMTE0
MiwxMiArMTE4NiwxMiBAQCBjb25maWdfbmFuZF9jd19yZWFkKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsIGJvb2wgdXNlX2VjYykKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
