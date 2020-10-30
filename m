Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11C2C55179
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:19:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A1F22210
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5VvoFQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A1F22210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8D8xJx5r+HSHC+0FsTAW/rhgqzD0qABCsCGV8QQ2SUQ=; b=i5VvoFQ4bKzEcdpJWoCfWHTCI
	/p3CBh6j6JDlWT9mPjBFn51ctUndf1oY6bRRETa8qI9lF7FXMx/Da/RA8stp9KbWRjwWpufdcjTnf
	QJx6yC7rg0j+5Jia1EnlOJgxcXU7Gpzu6+4qeAlFCjPyEP1JgwzKQhLYqm3Dt2GgDUbstDDBhkMrO
	/Tjr96Yogk2d215Gg83VddV05vheK/0wlp7iMrqzAQvfy5bT9cV6HaWMv0UY8lwA9Ek9RED4ycLpL
	rpaRoxvssd3hkU5EVfUXoo9xTBtzmr3lve44eZzqTWWEEhtYOz8doIDrFtXhB8eCPf7NIo/oMADSG
	ZGKemwS7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYPcx-0002t6-GK; Fri, 30 Oct 2020 08:19:15 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYPct-0002rb-NA
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 08:19:12 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1A09D200005;
 Fri, 30 Oct 2020 08:19:07 +0000 (UTC)
Date: Fri, 30 Oct 2020 09:19:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
Message-ID: <20201030091905.111aa7a4@xps13>
In-Reply-To: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
References: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_041911_855430_67D90EC8 
X-CRM114-Status: GOOD (  20.22  )
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
LmNvbT4gd3JvdGUgb24gVGh1LCAyOSBPY3QKMjAyMCAxNzozODoxMiArMDEwMDoKCj4gU2luY2Ug
Y29tbWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3Jr
IHVzZXIKPiBpbnB1dCBwYXJzaW5nIGJpdHMiKSwgRUNDIGFyZSBicm9rZW4gaW4gRk1DMiBkcml2
ZXIgaW4gY2FzZSBvZgo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5ndGgg
YXJlIG5vdCBzZXQgaW4gdGhlIGRldmljZSB0cmVlLgo+IFRoZSBkZWZhdWx0IHVzZXIgY29uZmln
dXJhdGlvbiBzZXQgaW4gRk1DMiBkcml2ZXIgaXMgbG9zdCB3aGVuCj4gcmF3bmFuZF9kdF9pbml0
IGZ1bmN0aW9uIGlzIGNhbGxlZC4gVG8gYXZvaWQgdG8gbG9zZSB0aGUgZGVmYXVsdCB1c2VyCj4g
Y29uZmlndXJhdGlvbiwgaXQgaXMgbmVlZGVkIHRvIG1vdmUgaXQgaW4gdGhlIG5ldyB1c2VyX2Nv
bmYgc3RydWN0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hy
aXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiBGaXhlczogZDcxNTdmZjQ5YTViICgibXRkOiByYXdu
YW5kOiBVc2UgdGhlIEVDQyBmcmFtZXdvcmsgdXNlciBpbnB1dCBwYXJzaW5nIGJpdHMiKQo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDggKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IGIzMWE1ODEuLmRjODZh
YzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IEBAIC0xODQ2
LDYgKzE4NDYsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiAgCXN0cnVjdCBt
dGRfaW5mbyAqbXRkOwo+ICAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcDsKPiArCXN0cnVjdCBuYW5k
X2RldmljZSAqbmFuZGRldjsKPiAgCXN0cnVjdCByZXNvdXJjZSBjcmVzOwo+ICAJaW50IGNoaXBf
Y3MsIG1lbV9yZWdpb24sIHJldCwgaXJxOwo+ICAJaW50IHN0YXJ0X3JlZ2lvbiA9IDA7Cj4gQEAg
LTE5NTIsMTAgKzE5NTMsMTEgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJ
RFRIX0FVVE8gfCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfAo+ICAJCQkgTkFORF9VU0VTX0RNQTsK
PiAgCj4gLQkvKiBEZWZhdWx0IEVDQyBzZXR0aW5ncyAqLwo+ICsJLyogRGVmYXVsdCBFQ0MgdXNl
ciBzZXR0aW5ncyAqLwo+ICAJY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5F
X1RZUEVfT05fSE9TVDsKPiAtCWNoaXAtPmVjYy5zaXplID0gRk1DMl9FQ0NfU1RFUF9TSVpFOwo+
IC0JY2hpcC0+ZWNjLnN0cmVuZ3RoID0gRk1DMl9FQ0NfQkNIODsKPiArCW5hbmRkZXYgPSBtdGRf
dG9fbmFuZGRldihtdGQpOwo+ICsJbmFuZGRldi0+ZWNjLnVzZXJfY29uZi5zdGVwX3NpemUgPSBG
TUMyX0VDQ19TVEVQX1NJWkU7Cj4gKwluYW5kZGV2LT5lY2MudXNlcl9jb25mLnN0cmVuZ3RoID0g
Rk1DMl9FQ0NfQkNIODsKPiAgCj4gIAkvKiBTY2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBk
ZXZpY2UgKi8KPiAgCXJldCA9IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwoKU29ycnkgZm9y
IGJyZWFraW5nIHRoZSBkcml2ZXIgd2l0aCB0aGlzIGNoYW5nZSwgYnV0IG5vdyBJIHRoaW5rIHdl
CnNob3VsZCBoYXZlIGFsbCBFQ0MgcmVsYXRlZCBiaXRzIGluIC0+YXR0YWNoKCkgaW5zdGVhZCBv
ZiAtPnByb2JlKCkuClRoZSAtPmF0dGFjaCgpIGhvb2sgaXMgY2FsbGVkIGR1cmluZyB0aGUgbmFu
ZF9zY2FuKCkgb3BlcmF0aW9uIGFuZCBhdAp0aGlzIHBvaW50IHRoZSBjaGlwJ3MgcmVxdWlyZW1l
bnRzL2xheW91dCBhcmUga25vd24gKG5vdCBiZWZvcmUpLiBJCmtub3cgdGhhdCBjZXJ0YWluIGNv
bnRyb2xsZXJzIGRvbid0IHJlYWxseSBjYXJlIGFib3V0IHRoYXQsIGhlcmUgeW91cgpzaW1wbHkg
aGFyZGNvZGUgdGhlc2UgdHdvIGZpZWxkcyBhbmQgeW91IGRvbid0IG5lZWQgdG8ga25vdyBhbnl0
aGluZwphYm91dCB0aGUgY2hpcCdzIHByb3BlcnRpZXMuIEJ1dCBhcyBhIGJpZCB0byBoYXJtb25p
emUgYWxsIGRyaXZlcnMgd2l0aAp0aGUgdGFyZ2V0IG9mIGEgZ2VuZXJpYyBFQ0MgZW5naW5lIGlu
IG1pbmQsIEkgdGhpbmsgaXQncyBub3cgdGltZSB0bwptb3ZlIHRoZXNlIHRocmVlIGxpbmVzIChj
aGlwLT5lY2MuKiA9IC4uLikgYXQgdGhlIHRvcCBvZiAtPmF0dGFjaCgpLgpBbHNvLCB0aGVzZSBm
aWVsZHMgc2hvdWxkIGhhdmUgYmVlbiBwb3B1bGF0ZWQgYnkgdGhlIGNvcmUgc28gcGVyaGFwcwp0
aGUgYmVzdCBhcHByb2FjaCBpcyB0byBjaGVjayBpZiB0aGUgdXNlciByZXF1aXJlbWVudHMgYXJl
IHN5bmNlZCB3aXRoCnRoZSBjb250cm9sbGVyJ3MgY2FwYWJpbGl0aWVzIGFuZCBlcnJvciBvdXQg
b3RoZXJ3aXNlPwoKV2UgcGxhbiB0byBzZW5kIGEgZml4ZXMgUFIgZm9yIC1yYzIsIGlmIHRoZSB2
MiBhcnJpdmVzIHRvZGF5IEknbGwKaW50ZWdyYXRlIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
