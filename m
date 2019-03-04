Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFA0C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2808D20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:31:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVcwj/Aa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2808D20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eDdkthjcoz7STgL46ef2xeyXV9Ag9O4ede3fsJt+U0=; b=HVcwj/AaONJLpa
	+waxnKQYXNcpHzbz/MGyhDcnlrOjYSEl+OGA/Mcz4q1xG7m9IdA6uBvcW9GujwzsPh8g9AP5DqvvK
	h0pqV6PPfH415iewsObRpqZ9wRT6o4CMPv1Q7clmu4depqjOYlesE0Qe8K/ELoWppHXP26UN7oy4s
	U/hig2zLuwoMhqN/JYJ9bvYPu7zuLRA37VIvI9lrOmR7cafoc2vwkt9snU4JVYG+T4BIa5D29wEnv
	HQC9RBBMhVRaXRs3e5hNh27Ngn3Wp/cnzLXooo7soDzqnBBy76I8M95m4n0zecm2ma+mmdDvBLO9P
	KCGayCPuLISwHGU3B7mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0jwF-0006yG-Sm; Mon, 04 Mar 2019 09:31:11 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0jwC-0006xX-Tr
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 09:31:10 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BFAF940008;
 Mon,  4 Mar 2019 09:30:53 +0000 (UTC)
Date: Mon, 4 Mar 2019 10:30:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 04/10] mtd: rawnand: denali: switch over to
 ->exec_op() from legacy hooks
Message-ID: <20190304103052.0eba71a6@xps13>
In-Reply-To: <1549955582-30346-5-git-send-email-yamada.masahiro@socionext.com>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-5-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_013109_115323_A8ADD870 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIEZlYgoyMDE5IDE2OjEyOjU2ICswOTAwOgoKPiBJbXBsZW1l
bnQgLT5leGVjX29wKCksIGFuZCByZW1vdmUgdGhlIGRlcHJlY2F0ZWQgaG9va3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNv
bT4KPiAtLS0KClRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBJIGxpa2UgaXQgdmVyeSBtdWNo
IQoKPiAKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rl
bmFsaS5jIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTI2IGluc2VydGlvbnMoKyksIDEwOCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+IGluZGV4IGEyZmUyZmYuLmJkN2RmMjUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9kZW5hbGkuYwoKWy4uLl0KCj4gKwo+ICtzdGF0aWMgaW50IGRlbmFsaV9leGVjX2luc3Ry
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3Bf
aW5zdHIgKmluc3RyKQo+ICt7Cj4gKwlzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0g
dG9fZGVuYWxpKGNoaXApOwo+ICsJYm9vbCB3aWR0aDE2ID0gY2hpcC0+b3B0aW9ucyAmIE5BTkRf
QlVTV0lEVEhfMTY7Cj4gKwo+ICsJc3dpdGNoIChpbnN0ci0+dHlwZSkgewo+ICsJY2FzZSBOQU5E
X09QX0NNRF9JTlNUUjoKPiArCQlkZW5hbGlfZXhlY19vdXQ4KGRlbmFsaSwgREVOQUxJX01BUDEx
X0NNRCwKPiArCQkJCSAmaW5zdHItPmN0eC5jbWQub3Bjb2RlLCAxKTsKPiArCQlyZXR1cm4gMDsK
PiArCWNhc2UgTkFORF9PUF9BRERSX0lOU1RSOgo+ICsJCWRlbmFsaV9leGVjX291dDgoZGVuYWxp
LCBERU5BTElfTUFQMTFfQUREUiwKPiArCQkJCSBpbnN0ci0+Y3R4LmFkZHIuYWRkcnMsCj4gKwkJ
CQkgaW5zdHItPmN0eC5hZGRyLm5hZGRycyk7Cj4gKwkJcmV0dXJuIDA7Cj4gKwljYXNlIE5BTkRf
T1BfREFUQV9JTl9JTlNUUjoKPiArCQkoIWluc3RyLT5jdHguZGF0YS5mb3JjZV84Yml0ICYmIHdp
ZHRoMTYgPwo+ICsJCSBkZW5hbGlfZXhlY19pbjE2IDoKPiArCQkgZGVuYWxpX2V4ZWNfaW44KShk
ZW5hbGksIERFTkFMSV9NQVAxMV9EQVRBLAo+ICsJCQkJICBpbnN0ci0+Y3R4LmRhdGEuYnVmLmlu
LAo+ICsJCQkJICBpbnN0ci0+Y3R4LmRhdGEubGVuKTsKCkkgdGhpbmsgdGhpcyBpcyBhYnVzaW5n
IHRoZSB0ZXJuYXJ5IG9wZXJhdG9yLCBjYW4geW91IHBsZWFzZSBmaW5kCmFub3RoZXIgd2F5IGZv
ciB3cml0aW5nIHRoaXM/IE90aGVyd2lzZSBpdCBpcyBub3QgZWFzaWx5IHJlYWRhYmxlLi4uIElm
Cml0IGlzIHJlYWxseSB0b28gY29tcGxpY2F0ZWQgd2l0aGluIDgwIGNoYXJzLCB0aGVuIG5ldmVy
IG1pbmQuCgo+ICsJCXJldHVybiAwOwo+ICsJY2FzZSBOQU5EX09QX0RBVEFfT1VUX0lOU1RSOgo+
ICsJCSghaW5zdHItPmN0eC5kYXRhLmZvcmNlXzhiaXQgJiYgd2lkdGgxNiA/Cj4gKwkJIGRlbmFs
aV9leGVjX291dDE2IDoKPiArCQkgZGVuYWxpX2V4ZWNfb3V0OCkoZGVuYWxpLCBERU5BTElfTUFQ
MTFfREFUQSwKPiArCQkJCSAgIGluc3RyLT5jdHguZGF0YS5idWYub3V0LAo+ICsJCQkJICAgaW5z
dHItPmN0eC5kYXRhLmxlbik7Cj4gKwkJcmV0dXJuIDA7Cj4gKwljYXNlIE5BTkRfT1BfV0FJVFJE
WV9JTlNUUjoKPiArCQlyZXR1cm4gZGVuYWxpX2V4ZWNfd2FpdHJkeShkZW5hbGkpOwo+ICsJZGVm
YXVsdDoKPiArCQlXQVJOX09OQ0UoMSwgInVuc3VwcG9ydGVkIE5BTkQgaW5zdHJ1Y3Rpb24gdHlw
ZTogJWRcbiIsCj4gKwkJCSAgaW5zdHItPnR5cGUpOwo+ICsKPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiArCX0KPiArfQo+ICsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
