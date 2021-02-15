Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A78C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 08:41:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD53264E05
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 08:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD53264E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mv1OugaFobMFok8ybEXwHqpQOkRH6JteP4tGlgVOD/o=; b=uZcGxnPoInjF78J7y5SoiHcfa
	Dfd6Xr8D/FlXhTl3lK9Fagm4fqwP8VmjBYq/uQlg402hWrIBhNry5UuTcA1GNMsNS7gJbEJ/oBHQU
	N98E1KC/v4xBSZik62/qY6Bre7r5JFgeAXgkzk0axjFRuJ9I9dl5yO7FmD+ej67O2I3kM4uObMF7F
	VA5YL5OO+DBUMvM/rDWBC12bTuRZYm2NxUcH1ZwGBwb7mD3xkxOtR0v9KykwgJk6hL2rMqZCaf4r/
	DnrSuEXnA5zIiAp++zVtf+YlaEu0ywojsRah3LKaop1+g4bsicFt1BQRu993PqVKhSklmD/lZOREr
	58Rmtb0yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBZRL-0004eI-Et; Mon, 15 Feb 2021 08:41:07 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBZRI-0004dn-I0
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 08:41:05 +0000
X-Originating-IP: 90.89.99.36
Received: from xps13 (lfbn-tou-1-1536-36.w90-89.abo.wanadoo.fr [90.89.99.36])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 42BA5E0005;
 Mon, 15 Feb 2021 08:40:56 +0000 (UTC)
Date: Mon, 15 Feb 2021 09:40:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
Message-ID: <20210215094055.1c3847f8@xps13>
In-Reply-To: <1613337451-8002-1-git-send-email-mdalam@codeaurora.org>
References: <1613337451-8002-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_034104_818238_88113073 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: vigneshr@ti.com, mani@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, krzk@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1v
biwgMTUgRmViIDIwMjEKMDI6NDc6MzEgKzA1MzA6Cgo+IEZyb20gUVBJQyB2ZXJzaW9uIDIuMCBv
bndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8KPiByZWFkIGxhc3QgY29kZXdvcmQuIFRo
aXMgY2hhbmdlIHdpbGwgYWRkIHRoZSBSRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbgo+IHJlZ2lzdGVy
Lgo+IAo+IEZvciBmaXJzdCB0aHJlZSBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9uIHJlZ2lzdGVy
IHdpbGwgYmUKPiB1c2UuRm9yIGxhc3QgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fTEFTVF9DV19u
IHJlZ2lzdGVyIHdpbGwgYmUKPiB1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxh
bSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+IFtWNV0KPiAgKiBBZGRlZCBoZWxwZXIg
ZnVuY3Rpb24gdG8gdXBkYXRlIGxvY2F0aW9uIHJlZ2lzdGVyIHZhbHVlLgoKClBsZWFzZSBkb24n
dCBmb3JnZXQgdGhlICJ2NSIgaW4gdGhlIG1lc3NhZ2Ugb2JqZWN0LgoKPiAgLyoKPiBAQCAtMTA5
NCwxMSArMTE0MSwxNiBAQCBzdGF0aWMgdm9pZCBjb25maWdfbmFuZF9wYWdlX3JlYWQoc3RydWN0
IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPiAgICogYmVmb3JlIHJlYWRpbmcgZWFjaCBj
b2Rld29yZCBpbiBOQU5EIHBhZ2UuCj4gICAqLwo+ICBzdGF0aWMgdm9pZAo+IC1jb25maWdfbmFu
ZF9jd19yZWFkKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMsIGJvb2wgdXNlX2Vj
YykKPiArY29uZmlnX25hbmRfY3dfcmVhZChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjLCBib29sIHVzZV9lY2MsIGJvb2wgbGFzdF9jdykKPiAgewo+IC0JaWYgKG5hbmRjLT5wcm9w
cy0+aXNfYmFtKQo+IC0JCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElPTl8w
LCA0LAo+IC0JCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gKwlpZiAobmFuZGMtPnByb3Bz
LT5pc19iYW0pIHsKPiArCQlpZiAobmFuZGMtPnByb3BzLT5xcGljX3YyICYmIGxhc3RfY3cpCj4g
KwkJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzAsIDQs
Cj4gKwkJCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gKwkJZWxzZQo+ICsJCQl3cml0ZV9y
ZWdfZG1hKG5hbmRjLCBOQU5EX1JFQURfTE9DQVRJT05fMCwgNCwKPiArCQkJCSAgICAgIE5BTkRf
QkFNX05FWFRfU0dMKTsKCkkgZ3Vlc3Mgd3JpdGVfcmVnX2RtYSBzaG91bGQgYmUgdXBkYXRlZCBh
cyB3ZWxsLgoKClsuLi5dCgo+ICAKPiAtCWNvbmZpZ19uYW5kX2N3X3JlYWQobmFuZGMsIGZhbHNl
KTsKPiArCWNvbmZpZ19uYW5kX2N3X3JlYWQobmFuZGMsIGZhbHNlLCBjdyA9PSBlY2MtPnN0ZXBz
IC0gMSA/IHRydWUgOiBmYWxzZSk7Cj4gIAo+ICAJcmVhZF9kYXRhX2RtYShuYW5kYywgcmVnX29m
ZiwgZGF0YV9idWYsIGRhdGFfc2l6ZTEsIDApOwo+ICAJcmVnX29mZiArPSBkYXRhX3NpemUxOwo+
IEBAIC0xODczLDE4ICsxOTM4LDMxIEBAIHN0YXRpYyBpbnQgcmVhZF9wYWdlX2VjYyhzdHJ1Y3Qg
cWNvbV9uYW5kX2hvc3QgKmhvc3QsIHU4ICpkYXRhX2J1ZiwKPiAgCj4gIAkJaWYgKG5hbmRjLT5w
cm9wcy0+aXNfYmFtKSB7Cj4gIAkJCWlmIChkYXRhX2J1ZiAmJiBvb2JfYnVmKSB7Cj4gLQkJCQlu
YW5kY19zZXRfcmVhZF9sb2MobmFuZGMsIDAsIDAsIGRhdGFfc2l6ZSwgMCk7Cj4gLQkJCQluYW5k
Y19zZXRfcmVhZF9sb2MobmFuZGMsIDEsIGRhdGFfc2l6ZSwKPiAtCQkJCQkJICAgb29iX3NpemUs
IDEpOwo+ICsJCQkJaWYgKG5hbmRjLT5wcm9wcy0+cXBpY192MiAmJiBpID09IChlY2MtPnN0ZXBz
IC0gMSkpIHsKCkkgd291bGQgbGlrZSB0aGUgaGVscGVyIHRvIGhhbmRsZSB0aGlzIGNvbmRpdGlv
bi4gSSB3b3VsZCBwcmVmZXIgdG8KYXZvaWQgeWV0IGFuIGV4dHJhIGluZGVudGF0aW9uIGxldmVs
LgoKPiArCQkJCQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAw
KTsKPiArCQkJCQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgaSwgMSwgZGF0YV9zaXplLAo+ICsJ
CQkJCQkJICAgb29iX3NpemUsIDEpOwo+ICsJCQkJfSBlbHNlIHsKPiArCQkJCQluYW5kY19zZXRf
cmVhZF9sb2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAwKTsKPiArCQkJCQluYW5kY19zZXRf
cmVhZF9sb2MoY2hpcCwgaSwgMSwgZGF0YV9zaXplLAo+ICsJCQkJCQkJICAgb29iX3NpemUsIDEp
Owo+ICsJCQkJfQo+ICAJCQl9IGVsc2UgaWYgKGRhdGFfYnVmKSB7Cj4gLQkJCQluYW5kY19zZXRf
cmVhZF9sb2MobmFuZGMsIDAsIDAsIGRhdGFfc2l6ZSwgMSk7Cj4gKwkJCQlpZiAobmFuZGMtPnBy
b3BzLT5xcGljX3YyICYmIGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkKPiArCQkJCQluYW5kY19zZXRf
cmVhZF9sb2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAxKTsKPiArCQkJCWVsc2UKPiArCQkJ
CQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgaSwgMCwgMCwgZGF0YV9zaXplLCAxKTsKPiAgCQkJ
fSBlbHNlIHsKPiAtCQkJCW5hbmRjX3NldF9yZWFkX2xvYyhuYW5kYywgMCwgZGF0YV9zaXplLAo+
IC0JCQkJCQkgICBvb2Jfc2l6ZSwgMSk7Cj4gKwkJCQlpZiAobmFuZGMtPnByb3BzLT5xcGljX3Yy
ICYmIGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkKPiArCQkJCQluYW5kY19zZXRfcmVhZF9sb2MoY2hp
cCwgaSwgMCwgZGF0YV9zaXplLAo+ICsJCQkJCQkJICAgb29iX3NpemUsIDEpOwo+ICsJCQkJZWxz
ZQo+ICsJCQkJCW5hbmRjX3NldF9yZWFkX2xvYyhjaGlwLCBpLCAwLCBkYXRhX3NpemUsCj4gKwkJ
CQkJCQkgICBvb2Jfc2l6ZSwgMSk7Cj4gIAkJCX0KPiAgCQl9Cj4gIAo+IC0JCWNvbmZpZ19uYW5k
X2N3X3JlYWQobmFuZGMsIHRydWUpOwo+ICsJCWNvbmZpZ19uYW5kX2N3X3JlYWQobmFuZGMsIHRy
dWUsIGkgPT0gZWNjLT5zdGVwcyAtIDEgPyB0cnVlIDogZmFsc2UpOwoKCWkgPT0gKGVjYy0+c3Rl
cHMgLSAxKQoKaXMgYWxyZWFkeSBhIGJvb2xlYW4sIHlvdSBkb24ndCBuZWVkCgoJIj8gdHJ1ZSA6
IGZhbHNlIgoKPiAgCj4gIAkJaWYgKGRhdGFfYnVmKQo+ICAJCQlyZWFkX2RhdGFfZG1hKG5hbmRj
LCBGTEFTSF9CVUZfQUNDLCBkYXRhX2J1ZiwKPiBAQCAtMTk0Niw3ICsyMDI0LDcgQEAgc3RhdGlj
IGludCBjb3B5X2xhc3RfY3coc3RydWN0IHFjb21fbmFuZF9ob3N0ICpob3N0LCBpbnQgcGFnZSkK
PiAgCXNldF9hZGRyZXNzKGhvc3QsIGhvc3QtPmN3X3NpemUgKiAoZWNjLT5zdGVwcyAtIDEpLCBw
YWdlKTsKPiAgCXVwZGF0ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUpOwo+ICAKPiAtCWNvbmZpZ19u
YW5kX3NpbmdsZV9jd19wYWdlX3JlYWQobmFuZGMsIGhvc3QtPnVzZV9lY2MpOwo+ICsJY29uZmln
X25hbmRfc2luZ2xlX2N3X3BhZ2VfcmVhZChuYW5kYywgaG9zdC0+dXNlX2VjYywgdHJ1ZSk7CgpN
YXliZSBpdCdzIGJlc3QgdG8ganVzdCBmb3J3YXJkIHRoZSBjb2Rld29yZCBhbmQgbGV0IHRoZSBj
b2RlIHRoYXQKbmVlZHMgdG8ga25vdyBpZiBpdCBpcyB0aGUgbGFzdCBvbmUgb3Igbm90IGRvIHRo
ZSBjb21wYXJpc29uLgoKPiAgCj4gIAlyZWFkX2RhdGFfZG1hKG5hbmRjLCBGTEFTSF9CVUZfQUND
LCBuYW5kYy0+ZGF0YV9idWZmZXIsIHNpemUsIDApOwo+ICAKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
