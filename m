Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB839C4363A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 13:37:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9A72076E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 13:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrGsQSql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9A72076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ARbaQGQtOxmHMoUQUlv6vWCojwXJpEhEArt7TL8OD14=; b=UrGsQSqlYO6x02Ps0jmd0ePwu
	MezrW6D3/c2+uizhNSxCA1dTzTKO7w84iObTrxSiHw4hwa4tISTmB86Rzbzps6PpHTDFUEVOHP2ka
	EcjuH00sAwVNdFJGvNMyMPynA0lTiG1sWDW0Ly8vhyM9hL2T/1aAbtgjLEt6R2qeLIH8WacZD8V1s
	EwlsDNm/hunMYqK87v8oKD4T/KivB6RnKuoUQTjCRKSNon0xo6spBLDRFoElMm0Iw2RX7HBoVlHLI
	pupOc5q4oN/HtRihLYgJAT/jzcKU7eRSHxYVLwbPMmFUHbQBFvpNiH+SfpcyLA9l2Gsii3R3pg6ID
	qyKxOMWQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYUa3-0000hK-Ks; Fri, 30 Oct 2020 13:36:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYUa1-0000gL-26
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 13:36:34 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B132B200006;
 Fri, 30 Oct 2020 13:36:28 +0000 (UTC)
Date: Fri, 30 Oct 2020 14:36:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2] mtd: rawnand: stm32_fmc2: fix broken ECC
Message-ID: <20201030143627.1a910cbc@xps13>
In-Reply-To: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
References: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_093633_204797_B5BE5555 
X-CRM114-Status: GOOD (  20.05  )
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
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gRnJpLCAzMCBPY3QKMjAyMCAxNDozMzozOSArMDEwMDoKCj4gU2luY2Ug
Y29tbWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3Jr
IHVzZXIKPiBpbnB1dCBwYXJzaW5nIGJpdHMiKSwgRUNDIGFyZSBicm9rZW4gaW4gRk1DMiBkcml2
ZXIgaW4gY2FzZSBvZgo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5ndGgg
YXJlIG5vdCBzZXQgaW4gdGhlIGRldmljZSB0cmVlLgo+IFRvIGF2b2lkIHRoaXMgaXNzdWUsIHRo
ZSBkZWZhdWx0IHNldHRpbmdzIGFyZSBub3cgc2V0IGluCj4gc3RtMzJfZm1jMl9uZmNfYXR0YWNo
X2NoaXAgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+IEZpeGVzOiBkNzE1N2ZmNDlhNWIgKCJtdGQ6IHJh
d25hbmQ6IFVzZSB0aGUgRUNDIGZyYW1ld29yayB1c2VyIGlucHV0IHBhcnNpbmcgYml0cyIpCj4g
LS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBtb3ZlIGRlZmF1bHQgRUNDIHNldHRpbmdzIGluIHN0
bTMyX2ZtYzJfbmZjX2F0dGFjaF9jaGlwIGZ1bmN0aW9uLgo+IAo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDE1ICsrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggYjMxYTU4MS4uNTUwYmRhNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gQEAgLTE3MDgsNiArMTcwOCwxMyBA
QCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAo+ICsJLyogRGVmYXVsdCBFQ0Mg
c2V0dGluZ3MgaW4gY2FzZSB0aGV5IGFyZSBub3Qgc2V0IGluIHRoZSBkZXZpY2UgdHJlZSAqLwo+
ICsJaWYgKCFjaGlwLT5lY2Muc2l6ZSkKPiArCQljaGlwLT5lY2Muc2l6ZSA9IEZNQzJfRUNDX1NU
RVBfU0laRTsKPiArCj4gKwlpZiAoIWNoaXAtPmVjYy5zdHJlbmd0aCkKPiArCQljaGlwLT5lY2Mu
c3RyZW5ndGggPSBGTUMyX0VDQ19CQ0g4Owo+ICsKPiAgCXJldCA9IG5hbmRfZWNjX2Nob29zZV9j
b25mKGNoaXAsICZzdG0zMl9mbWMyX25mY19lY2NfY2FwcywKPiAgCQkJCSAgIG10ZC0+b29ic2l6
ZSAtIEZNQzJfQkJNX0xFTik7Cj4gIAlpZiAocmV0KSB7Cj4gQEAgLTE3MjcsOCArMTczNCw3IEBA
IHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCkKPiAgCj4gIAltdGRfc2V0X29vYmxheW91dChtdGQsICZzdG0zMl9mbWMyX25mY19vb2Js
YXlvdXRfb3BzKTsKPiAgCj4gLQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYp
Cj4gLQkJc3RtMzJfZm1jMl9uZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7Cj4gKwlzdG0z
Ml9mbWMyX25mY19zZXR1cChjaGlwKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IEBAIC0xOTUy
LDExICsxOTU4LDYgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJRFRIX0FV
VE8gfCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfAo+ICAJCQkgTkFORF9VU0VTX0RNQTsKPiAgCj4g
LQkvKiBEZWZhdWx0IEVDQyBzZXR0aW5ncyAqLwo+IC0JY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0g
TkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDsKPiAtCWNoaXAtPmVjYy5zaXplID0gRk1DMl9F
Q0NfU1RFUF9TSVpFOwo+IC0JY2hpcC0+ZWNjLnN0cmVuZ3RoID0gRk1DMl9FQ0NfQkNIODsKPiAt
Cj4gIAkvKiBTY2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBkZXZpY2UgKi8KPiAgCXJldCA9
IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwo+ICAJaWYgKHJldCkKClRoaXMgb3ZlcmFsbCBs
b29rcyB2ZXJ5IGdvb2QgdG8gbWUsIHRoYW5rcyBmb3IgdGhpcyB1cGRhdGUhCgpDaGVlcnMsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
