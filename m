Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6429CC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2406564E5C
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2406564E5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LWVGf0VVVeBm1nG3zHo4lpoSzNR5dla6uOuzt/P4FiU=; b=djWOSIzPuP7hD6oRM2UmDnAas
	az3WwheIq49Ns8bCeWF5k9Z2BYcJAakFIhCDJ6yBC4d4PnDDp7hygIRRmripEyodeXy/OPqrtt94u
	k4Y6FBSlflt1Wa/7BVaEw8GbvDUUKj2ftf54Ly5oMVxadaeaWKoP1IsCvjiqv9N+RG7fvLTdeW064
	Hd5MkCv5oCJh1wr7ACBitmop6UM1UchgNDL0pugJV51nkF7MtBNlzo/IiBmTSy9n4UBPHBJmD0OSr
	I0rOFg3ziNg4xWMNyIZItbsvgHmEz3SiZvl0dWgazkvb3RSu1HdyY/4OcfFTLujw/W+xYC75pyST5
	TGN7lAPbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEaIa-0007wV-R8; Tue, 23 Feb 2021 16:12:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEaIX-0007uw-3p
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:12:31 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DF253E0013;
 Tue, 23 Feb 2021 16:12:24 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:12:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Add helper to check last code word
Message-ID: <20210223171223.53f86959@xps13>
In-Reply-To: <1613975095-15550-1-git-send-email-mdalam@codeaurora.org>
References: <1613975095-15550-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_111229_387653_41C82DC5 
X-CRM114-Status: GOOD (  23.20  )
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

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1v
biwgMjIgRmViIDIwMjEKMTE6NTQ6NTUgKzA1MzA6Cgo+IFRoaXMgY2hhbmdlIHdpbGwgYWRkIGhl
bHBlciBxY29tX25hbmRjX2lzX2xhc3RfY3coKQoKVXNlIHRoZSBpbXBlcmF0aXZlIGZvcm0sIHNv
bWV0aGluZyBsaWtlOgoKIgpBZGQgdGhlIHFjb21fbmFuZGNfaXNfbGFzdF9jdygpIGhlbHBlciB3
aGljaCBjaGVja3MgaWYgdGhlIGlucHV0IGN3CmluZGV4IGlzIHRoZSBsYXN0IG9uZSBvciBub3Qu
CiIKCj4gd2hpY2ggd2lsbCBjaGVjayBmb3IgbGFzdCBjb2RlIHdvcmQgYW5kIHJldHVybiB0cnVl
IGZvcgo+IGxhc3QgY29kZSB3b3JkIGFuZCBmYWxzZSBmb3Igb3RoZXIgY29kZSB3b3JkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMjQgKysrKysrKysrKysr
KysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCBhZTg4NzBlYy4u
NDE4OWE3ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtNjYxLDYgKzY2
MSwxMiBAQCBzdGF0aWMgdm9pZCBuYW5kY19zZXRfcmVnKHN0cnVjdCBxY29tX25hbmRfY29udHJv
bGxlciAqbmFuZGMsIGludCBvZmZzZXQsCj4gIAkJKnJlZyA9IGNwdV90b19sZTMyKHZhbCk7Cj4g
IH0KPiAgCj4gKy8qIEhlbHBlciB0byBjaGVjayB0aGUgY29kZSB3b3JkLCB3aGV0aGVyIGl0IGlz
IGxhc3QgY3cgb3Igbm90ICovCj4gK3N0YXRpYyBib29sIHFjb21fbmFuZGNfaXNfbGFzdF9jdyhz
dHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjLCBpbnQgY3cpCj4gK3sKPiArCXJldHVybiBjdyA9PSAo
ZWNjLT5zdGVwcyAtIDEpOwo+ICt9Cj4gKwo+ICAvKiBoZWxwZXIgdG8gY29uZmlndXJlIGFkZHJl
c3MgcmVnaXN0ZXIgdmFsdWVzICovCj4gIHN0YXRpYyB2b2lkIHNldF9hZGRyZXNzKHN0cnVjdCBx
Y29tX25hbmRfaG9zdCAqaG9zdCwgdTE2IGNvbHVtbiwgaW50IHBhZ2UpCj4gIHsKPiBAQCAtMTYz
Miw3ICsxNjM4LDcgQEAgcWNvbV9uYW5kY19yZWFkX2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCWRhdGFfc2l6ZTEgPSBtdGQtPndyaXRlc2l6
ZSAtIGhvc3QtPmN3X3NpemUgKiAoZWNjLT5zdGVwcyAtIDEpOwo+ICAJb29iX3NpemUxID0gaG9z
dC0+YmJtX3NpemU7Cj4gIAo+IC0JaWYgKGN3ID09IChlY2MtPnN0ZXBzIC0gMSkpIHsKPiArCWlm
IChxY29tX25hbmRjX2lzX2xhc3RfY3coZWNjLCBjdykpIHsKPiAgCQlkYXRhX3NpemUyID0gZWNj
LT5zaXplIC0gZGF0YV9zaXplMSAtCj4gIAkJCSAgICAgKChlY2MtPnN0ZXBzIC0gMSkgKiA0KTsK
PiAgCQlvb2Jfc2l6ZTIgPSAoZWNjLT5zdGVwcyAqIDQpICsgaG9zdC0+ZWNjX2J5dGVzX2h3ICsK
PiBAQCAtMTcxMyw3ICsxNzE5LDcgQEAgY2hlY2tfZm9yX2VyYXNlZF9wYWdlKHN0cnVjdCBxY29t
X25hbmRfaG9zdCAqaG9zdCwgdTggKmRhdGFfYnVmLAo+ICAJfQo+ICAKPiAgCWZvcl9lYWNoX3Nl
dF9iaXQoY3csICZ1bmNvcnJlY3RhYmxlX2N3cywgZWNjLT5zdGVwcykgewo+IC0JCWlmIChjdyA9
PSAoZWNjLT5zdGVwcyAtIDEpKSB7Cj4gKwkJaWYgKHFjb21fbmFuZGNfaXNfbGFzdF9jdyhlY2Ms
IGN3KSkgewo+ICAJCQlkYXRhX3NpemUgPSBlY2MtPnNpemUgLSAoKGVjYy0+c3RlcHMgLSAxKSAq
IDQpOwo+ICAJCQlvb2Jfc2l6ZSA9IChlY2MtPnN0ZXBzICogNCkgKyBob3N0LT5lY2NfYnl0ZXNf
aHc7Cj4gIAkJfSBlbHNlIHsKPiBAQCAtMTc3Myw3ICsxNzc5LDcgQEAgc3RhdGljIGludCBwYXJz
ZV9yZWFkX2Vycm9ycyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QsIHU4ICpkYXRhX2J1ZiwK
PiAgCQl1MzIgZmxhc2gsIGJ1ZmZlciwgZXJhc2VkX2N3Owo+ICAJCWludCBkYXRhX2xlbiwgb29i
X2xlbjsKPiAgCj4gLQkJaWYgKGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkgewo+ICsJCWlmIChxY29t
X25hbmRjX2lzX2xhc3RfY3coZWNjLCBpKSkgewo+ICAJCQlkYXRhX2xlbiA9IGVjYy0+c2l6ZSAt
ICgoZWNjLT5zdGVwcyAtIDEpIDw8IDIpOwo+ICAJCQlvb2JfbGVuID0gZWNjLT5zdGVwcyA8PCAy
Owo+ICAJCX0gZWxzZSB7Cj4gQEAgLTE4NzIsNyArMTg3OCw3IEBAIHN0YXRpYyBpbnQgcmVhZF9w
YWdlX2VjYyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QsIHU4ICpkYXRhX2J1ZiwKPiAgCWZv
ciAoaSA9IDA7IGkgPCBlY2MtPnN0ZXBzOyBpKyspIHsKPiAgCQlpbnQgZGF0YV9zaXplLCBvb2Jf
c2l6ZTsKPiAgCj4gLQkJaWYgKGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkgewo+ICsJCWlmIChxY29t
X25hbmRjX2lzX2xhc3RfY3coZWNjLCBpKSkgewo+ICAJCQlkYXRhX3NpemUgPSBlY2MtPnNpemUg
LSAoKGVjYy0+c3RlcHMgLSAxKSA8PCAyKTsKPiAgCQkJb29iX3NpemUgPSAoZWNjLT5zdGVwcyA8
PCAyKSArIGhvc3QtPmVjY19ieXRlc19odyArCj4gIAkJCQkgICBob3N0LT5zcGFyZV9ieXRlczsK
PiBAQCAtMjA1MSw3ICsyMDU3LDcgQEAgc3RhdGljIGludCBxY29tX25hbmRjX3dyaXRlX3BhZ2Uo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdWludDhfdCAqYnVmLAo+ICAJZm9yIChpID0g
MDsgaSA8IGVjYy0+c3RlcHM7IGkrKykgewo+ICAJCWludCBkYXRhX3NpemUsIG9vYl9zaXplOwo+
ICAKPiAtCQlpZiAoaSA9PSAoZWNjLT5zdGVwcyAtIDEpKSB7Cj4gKwkJaWYgKHFjb21fbmFuZGNf
aXNfbGFzdF9jdyhlY2MsIGkpKSB7Cj4gIAkJCWRhdGFfc2l6ZSA9IGVjYy0+c2l6ZSAtICgoZWNj
LT5zdGVwcyAtIDEpIDw8IDIpOwo+ICAJCQlvb2Jfc2l6ZSA9IChlY2MtPnN0ZXBzIDw8IDIpICsg
aG9zdC0+ZWNjX2J5dGVzX2h3ICsKPiAgCQkJCSAgIGhvc3QtPnNwYXJlX2J5dGVzOwo+IEBAIC0y
MDY4LDEwICsyMDc0LDEwIEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY193cml0ZV9wYWdlKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKPiAgCQkgKiB3aGVuIEVDQyBp
cyBlbmFibGVkLCB3ZSBkb24ndCByZWFsbHkgbmVlZCB0byB3cml0ZSBhbnl0aGluZwo+ICAJCSAq
IHRvIG9vYiBmb3IgdGhlIGZpcnN0IG4gLSAxIGNvZGV3b3JkcyBzaW5jZSB0aGVzZSBvb2IgcmVn
aW9ucwo+ICAJCSAqIGp1c3QgY29udGFpbiBFQ0MgYnl0ZXMgdGhhdCdzIHdyaXR0ZW4gYnkgdGhl
IGNvbnRyb2xsZXIKPiAtCQkgKiBpdHNlbGYuIEZvciB0aGUgbGFzdCBjb2Rld29yZCwgd2Ugc2tp
cCB0aGUgYmJtIHBvc2l0aW9ucyBhbmQKPiAtCQkgKiB3cml0ZSB0byB0aGUgZnJlZSBvb2IgYXJl
YS4KPiArCQkgKiBpdHNlbGYuIEZvciB0aGUgbGFzdCBjb2Rld29yZCwgd2Ugc2tpcCB0aGUgYmJt
IHBvc2l0aW9ucyBhbmQgd3JpdGUKPiArCQkgKiB0byB0aGUgZnJlZSBvb2IgYXJlYS4KCk5vdCBy
ZWxhdGVkIGNoYW5nZSwgcGxlYXNlIGRyb3AuCgo+ICAJCSAqLwo+IC0JCWlmIChpID09IChlY2Mt
PnN0ZXBzIC0gMSkpIHsKPiArCQlpZiAocWNvbV9uYW5kY19pc19sYXN0X2N3KGVjYywgaSkpIHsK
PiAgCQkJb29iX2J1ZiArPSBob3N0LT5iYm1fc2l6ZTsKPiAgCj4gIAkJCXdyaXRlX2RhdGFfZG1h
KG5hbmRjLCBGTEFTSF9CVUZfQUNDICsgZGF0YV9zaXplLAo+IEBAIC0yMTI2LDcgKzIxMzIsNyBA
QCBzdGF0aWMgaW50IHFjb21fbmFuZGNfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwKPiAgCQlkYXRhX3NpemUxID0gbXRkLT53cml0ZXNpemUgLSBob3N0LT5jd19zaXplICog
KGVjYy0+c3RlcHMgLSAxKTsKPiAgCQlvb2Jfc2l6ZTEgPSBob3N0LT5iYm1fc2l6ZTsKPiAgCj4g
LQkJaWYgKGkgPT0gKGVjYy0+c3RlcHMgLSAxKSkgewo+ICsJCWlmIChxY29tX25hbmRjX2lzX2xh
c3RfY3coZWNjLCBpKSkgewo+ICAJCQlkYXRhX3NpemUyID0gZWNjLT5zaXplIC0gZGF0YV9zaXpl
MSAtCj4gIAkJCQkgICAgICgoZWNjLT5zdGVwcyAtIDEpIDw8IDIpOwo+ICAJCQlvb2Jfc2l6ZTIg
PSAoZWNjLT5zdGVwcyA8PCAyKSArIGhvc3QtPmVjY19ieXRlc19odyArCgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
