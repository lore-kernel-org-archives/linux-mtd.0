Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73651C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F3220661
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfRLPozg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F3220661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tEv9zxA9ftKZN00Iy0C/IU5t+AURV6y0sDA0isS34w=; b=BfRLPozgo/CwKS
	s1TQy5cOF7OPj2kshGpP0jY7UkJyZ+WaEnvnOBPG/bPzJ+WoxEHZJr6JuSfufwKotkf8b5CvBHPio
	Rxmv9OmD9J9Aj5QwBH/SY57+v3bwrip16U1AF4KUfreytHxc1KJ7/MXvho77q7nbQ8Yo/gTlb0781
	+ykdLmNnf17PNA0b2i+ucSEVl3OD65Q2VEG1HStaz7gz+LPKPVu5lizEIW5X0AYld0o7ZaAtebARP
	m3HXwtFZaZiOxCCUpTtuit4q61Vg9z91vQlQXtyQkT6h3vMS5avNs2XuVWpfLdjMX9l6d5zOiaBhu
	omz4+MT/lRpSMLXgmqnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipb40-00021r-G9; Thu, 09 Jan 2020 16:53:40 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipb3w-00020p-DJ
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:53:38 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 00206100014;
 Thu,  9 Jan 2020 16:53:19 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:53:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Message-ID: <20200109175318.73ab8bd7@xps13>
In-Reply-To: <1572256527-5074-4-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-4-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_085336_584456_04798091 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
TW9uLCAyOCBPY3QgMjAxOSAxNzo1NToyNgorMDgwMDoKCj4gUGF0Y2ggbmFuZF9zdXNwZW5kKCkg
JiBuYW5kX3Jlc3VtZSgpIGZvciBtYW51ZmFjdHVyZXIgc3BlY2lmaWMKPiBzdXNwZW5kL3Jlc3Vt
ZSBvcGVyYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdA
bXhpYy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwg
OSArKysrKysrLS0KPiAgaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgfCAyICsrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jCj4gaW5kZXggNWUzMThmZi4uMmE5YzViYiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTQzMjMsNiArNDMyMyw4IEBAIHN0YXRpYyBpbnQg
bmFuZF9zdXNwZW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gIAo+ICAJbXV0ZXhfbG9jaygmY2hpcC0+bG9jayk7
Cj4gKwlpZiAoY2hpcC0+X3N1c3BlbmQpCj4gKwkJY2hpcC0+X3N1c3BlbmQoY2hpcCk7CgpSZXR1
cm4gdmFsdWUgc2hvdWxkIGJlIGNoZWNrZWQhCgo+ICAJY2hpcC0+c3VzcGVuZGVkID0gMTsKPiAg
CW11dGV4X3VubG9jaygmY2hpcC0+bG9jayk7Cj4gIAo+IEBAIC00MzM4LDExICs0MzQwLDE0IEBA
IHN0YXRpYyB2b2lkIG5hbmRfcmVzdW1lKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5kKG10ZCk7Cj4gIAo+ICAJbXV0ZXhfbG9jaygm
Y2hpcC0+bG9jayk7Cj4gLQlpZiAoY2hpcC0+c3VzcGVuZGVkKQo+ICsJaWYgKGNoaXAtPnN1c3Bl
bmRlZCkgewo+ICsJCWlmIChjaGlwLT5fcmVzdW1lKQo+ICsJCQljaGlwLT5fcmVzdW1lKGNoaXAp
Owo+ICAJCWNoaXAtPnN1c3BlbmRlZCA9IDA7Cj4gLQllbHNlCj4gKwl9IGVsc2Ugewo+ICAJCXBy
X2VycigiJXMgY2FsbGVkIGZvciBhIGNoaXAgd2hpY2ggaXMgbm90IGluIHN1c3BlbmRlZCBzdGF0
ZVxuIiwKPiAgCQkJX19mdW5jX18pOwo+ICsJfQo+ICAJbXV0ZXhfdW5sb2NrKCZjaGlwLT5sb2Nr
KTsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oIGIv
aW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gaW5kZXggMjQzMGVjZC4uNmIxNDA0MSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L210ZC9yYXduYW5kLmgKPiBAQCAtMTExNyw2ICsxMTE3LDggQEAgc3RydWN0IG5hbmRfY2hp
cCB7Cj4gIAo+ICAJc3RydWN0IG11dGV4IGxvY2s7Cj4gIAl1bnNpZ25lZCBpbnQgc3VzcGVuZGVk
IDogMTsKPiArCWludCAoKl9zdXNwZW5kKShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKTsKPiArCXZv
aWQgKCpfcmVzdW1lKShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKTsKClBsZWFzZSBkb24ndCBmb3Jn
ZXQgdGhlIGtkb2MhCgo+ICAKPiAgCXVpbnQ4X3QgKm9vYl9wb2k7Cj4gIAlzdHJ1Y3QgbmFuZF9j
b250cm9sbGVyICpjb250cm9sbGVyOwoKV2l0aCB0aGlzIGZpeGVkLApSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
