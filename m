Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A8AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 08:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U20yLisPf2JYIvOXInzcddaWTgbf/76mShrT7QKDSAc=; b=buDtq69pyICge9
	/l0YolXe5m56op+0Y3o25bNKW+a/pykZ21oniJOWOuLJcUnkSVdc1SNq3KRcW0jHlt3N+BAkrR4O4
	OjbfUFstaHO9MUo3QXaJFuFGj655NKcjMCEHaYzVyFq9eEUco1wsJuZydRIV9RUyLYqyH8TB43lZH
	xkrrtFRyLPiKurd/HF3+Gd1MXqwCgtpiPf1cGDJIhSZ6lZVTvQhdN+42wVcwytnkK9YsXvfsB/Iic
	xRRAd5AwdVpYko2OdckuFXmTMJ3aGf/ijOqx+26/bJXG45kNy9BeednSmwWAtae0WAdv+Jj+ijEMy
	jA+S3z+2/8M5DYgV+Z6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYl0r-007tdL-Pl; Mon, 28 Mar 2022 08:46:09 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYl0l-007tbH-Og
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 08:46:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68043200011;
 Mon, 28 Mar 2022 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648457159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDtKfskCNIHV8IVg8KPS+MdmWAn1IwDGexz+ALMDvSk=;
 b=M/vdS3y/ELAxxpR2mH1t+d492JN19D+2NcU4kctxsUuCgMuwLRt19CCKhKZM5JShEHCYPH
 mJ4FD2m4G5+deV1h7j92yxFPf+ibLn7OUROAwcKRQrlRxv9uzar5vVRXOH4Gv4ujD7uxKm
 Ht9LT7t5GdGwnNnfPmoPgdZ6W7le3rsXEzeNFE6zH1qy8xoLTb3fj5XGQ2XEbRFCrJoE9I
 hVxub119p5DcEi7ZF5imufYTI6206vNP9RsKsKlGgpf/6reGrTXnsyujcxcF5k/uEVg/xe
 iC70KsjhTwxcEdGFRZhswAHJKshNhbqopMmIMs6dvKXP0HJBWmsuF/eWkBYk2Q==
Date: Mon, 28 Mar 2022 10:45:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
Message-ID: <20220328104557.4f065c25@xps13>
In-Reply-To: <237eda25-8fc0-38df-0da0-96364a9f9359@gmail.com>
References: <20220325120025.17931-1-zajec5@gmail.com>
 <798660053.192180.1648452469848.JavaMail.zimbra@nod.at>
 <237eda25-8fc0-38df-0da0-96364a9f9359@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_014604_157248_8D5A1197 
X-CRM114-Status: GOOD (  28.20  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDI4IE1hciAyMDIyIDEw
OjI5OjE1ICswMjAwOgoKPiBPbiAyOC4wMy4yMDIyIDA5OjI3LCBSaWNoYXJkIFdlaW5iZXJnZXIg
d3JvdGU6Cj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+PiBWb246ICJS
YWZhxYIgTWnFgmVja2kiIDx6YWplYzVAZ21haWwuY29tPgo+ID4+IEFuOiAiTWlxdWVsIFJheW5h
bCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+ID4+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAi
UmFmYcWCIE1pxYJlY2tpIiA8cmFmYWxAbWlsZWNraS5wbD4KPiA+PiBHZXNlbmRldDogRnJlaXRh
ZywgMjUuIE3DpHJ6IDIwMjIgMTM6MDA6MjUKPiA+PiBCZXRyZWZmOiBbUEFUQ0ggbXRkLXV0aWxz
XSBuYW5kd3JpdGU6IHdhcm4gYWJvdXQgd3JpdGluZyAweGZmIGJsb2NrcyAgCj4gPiAgIAo+ID4+
IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+Pgo+ID4+IFN1Y2gg
YmxvY2tzIG1heSBiZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIGVtcHR5IChldmVuIHRob3VnaCB0
aGV5IG1heQo+ID4+IGhhdmUgbm9uLWVyYXNlIE9PQikuIFdhcm4gYWJvdXQgaXQgc28gcGVvcGxl
IG1heSBzdGFydCBzdWluZwo+ID4+IC0tc2tpcC1hbGwtZmZzIC4KPiA+Pgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+PiAtLS0KPiA+PiBu
YW5kLXV0aWxzL25hbmR3cml0ZS5jIHwgMTMgKysrKysrKysrKysrLQo+ID4+IDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvbmFuZC11dGlscy9uYW5kd3JpdGUuYyBiL25hbmQtdXRpbHMvbmFuZHdyaXRlLmMKPiA+PiBp
bmRleCBlOGEyMTBjLi5jZDUzYTE3IDEwMDY0NAo+ID4+IC0tLSBhL25hbmQtdXRpbHMvbmFuZHdy
aXRlLmMKPiA+PiArKysgYi9uYW5kLXV0aWxzL25hbmR3cml0ZS5jCj4gPj4gQEAgLTI4MCw2ICsy
ODAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPiA+PiAJbGli
bXRkX3QgbXRkX2Rlc2M7Cj4gPj4gCWludCBlYnNpemVfYWxpZ25lZDsKPiA+PiAJdWludDhfdCB3
cml0ZV9tb2RlOwo+ID4+ICsJc2l6ZV90IGFsbF9mZnNfY250ID0gMDsKPiA+Pgo+ID4+IAlwcm9j
ZXNzX29wdGlvbnMoYXJnYywgYXJndik7Cj4gPj4KPiA+PiBAQCAtNDE3LDYgKzQxOCw4IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICogY29uc3QgYXJndltdKQo+ID4+IAkgKi8KPiA+PiAJd2hp
bGUgKChpbWdsZW4gPiAwIHx8IHdyaXRlYnVmIDwgZmlsZWJ1ZiArIGZpbGVidWZfbGVuKQo+ID4+
IAkJJiYgbXRkb2Zmc2V0IDwgbXRkLnNpemUpIHsKPiA+PiArCQlib29sIGFsbGZmczsKPiA+PiAr
Cj4gPj4gCQkvKgo+ID4+IAkJICogTmV3IGVyYXNlYmxvY2ssIGNoZWNrIGZvciBiYWQgYmxvY2so
cykKPiA+PiAJCSAqIFN0YXkgaW4gdGhlIGxvb3AgdG8gYmUgc3VyZSB0aGF0LCBpZiBtdGRvZmZz
ZXQgY2hhbmdlcyBiZWNhdXNlCj4gPj4gQEAgLTU1NSw3ICs1NTgsOCBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPiA+PiAJCX0KPiA+Pgo+ID4+IAkJcmV0ID0gMDsK
PiA+PiAtCQlpZiAoIXNraXBhbGxmZnMgfHwgIWJ1ZmZlcl9jaGVja19wYXR0ZXJuKHdyaXRlYnVm
LCBtdGQubWluX2lvX3NpemUsIDB4ZmYpKSB7Cj4gPj4gKwkJYWxsZmZzID0gYnVmZmVyX2NoZWNr
X3BhdHRlcm4od3JpdGVidWYsIG10ZC5taW5faW9fc2l6ZSwgMHhmZik7Cj4gPj4gKwkJaWYgKCFh
bGxmZnMgfHwgIXNraXBhbGxmZnMpIHsgIAo+ID4gCj4gPiBXaHkgaXMgY2hlY2tpbmcgZm9yIGFs
bGZmcyBuZWVkZWQgaGVyZT8gIAo+IAo+IFdpdGggLS1za2lwLWFsbC1mZnMgd2Ugd2FudCB0byB3
cml0ZSBibG9jayBpZiBpdCBjb250YWlucyBkYXRhLgo+IAo+IEluIG90aGVyIHdvcmRzIHRoaXMg
Y2hlY2sgaXMgZXF1YWwgdG86Cj4gaWYgKGNvbnRhaW5zX2RhdGEgfHwgd3JpdGVfYWxsX2Jsb2Nr
KQo+IAo+IAo+ID4+IAkJCS8qIFdyaXRlIG91dCBkYXRhICovCj4gPj4gCQkJcmV0ID0gbXRkX3dy
aXRlKG10ZF9kZXNjLCAmbXRkLCBmZCwgbXRkb2Zmc2V0IC8gbXRkLmViX3NpemUsCj4gPj4gCQkJ
CQltdGRvZmZzZXQgJSBtdGQuZWJfc2l6ZSwKPiA+PiBAQCAtNTY0LDYgKzU2OCw4IEBAIGludCBt
YWluKGludCBhcmdjLCBjaGFyICogY29uc3QgYXJndltdKQo+ID4+IAkJCQkJd3JpdGVvb2IgPyBv
b2JidWYgOiBOVUxMLAo+ID4+IAkJCQkJd3JpdGVvb2IgPyBtdGQub29iX3NpemUgOiAwLAo+ID4+
IAkJCQkJd3JpdGVfbW9kZSk7Cj4gPj4gKwkJCWlmICghcmV0ICYmIGFsbGZmcykgIAo+ID4gCj4g
PiBXaHkgY2hlY2tpbmcgZm9yICFyZXQ/ICAKPiAKPiBJZiBtdGRfd3JpdGUoKSByZXR1cm5zIGVy
cm9yIHdlIGRpZG4ndCBhY3R1YWx5IHdyaXRlIGFueXRoaW5nLgo+IAo+IAo+ID4+ICsJCQkJYWxs
X2Zmc19jbnQrKzsKPiA+PiAJCX0KPiA+Pgo+ID4+IAkJaWYgKHJldCkgewo+ID4+IEBAIC02MTUs
NiArNjIxLDExIEBAIGNsb3NlYWxsOgo+ID4+IAkJICAgfHwgKHdyaXRlYnVmIDwgZmlsZWJ1ZiAr
IGZpbGVidWZfbGVuKSkKPiA+PiAJCXN5c19lcnJtc2dfZGllKCJEYXRhIHdhcyBvbmx5IHBhcnRp
YWxseSB3cml0dGVuIGR1ZSB0byBlcnJvciIpOwo+ID4+Cj4gPj4gKwlpZiAoYWxsX2Zmc19jbnQp
IHsKPiA+PiArCQlmcHJpbnRmKHN0ZGVyciwgIldyaXR0ZW4gJXp1IGJsb2NrcyBjb250YWluaW5n
IG9ubHkgMHhmZiBieXRlc1xuIiwKPiA+PiBhbGxfZmZzX2NudCk7Cj4gPj4gKwkJZnByaW50Zihz
dGRlcnIsICJUaG9zZSBibG9jayBtYXkgYmUgaW5jb3JyZWN0bHkgdHJlYXRlZCBhcyBlbXB0eSFc
biIpOwo+ID4+ICsJfQo+ID4+ICsgIAo+ID4gCj4gPiBXaGlsZSBJIGxpa2UgdGhlIHBhdGNoIEkn
bSBzdGlsbCBub3Qgc28gY29udmluY2VkIHdoeSB3ZSBjYW4ndCBtYWtlIHNraXBhbGxmZnM9dHJ1
ZSBieSBkZWZhdWx0LiAgCj4gCj4gSSB0aG91Z2h0IGl0J3MgYWJvdXQgY2hhbmdpbmcgLyBicmVh
a2luZyB1c2VyIGludGVyZmFjZToKPiAKPiBbMjAyMi0wMy0yNV0gWzExOjQwOjUzIENFVF0gPGRl
clJpY2hhcmQ+IG1yYXluYWw6IGkgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgLS1za2lwLWFsbC1mZnMg
ZGVmYXVsdCBpbiBuYW5kd3JpdGUKPiBbMjAyMi0wMy0yNV0gWzExOjQwOjU2IENFVF0gPGRlclJp
Y2hhcmQ+IHdoYXQgZG8geW91IHRoaW5rPwo+IFsyMDIyLTAzLTI1XSBbMTE6NDI6MDAgQ0VUXSA8
cm1pbGVja2k+IGkgd2FzIHByZXBhcmluZyBhIHBhdGNoIHdpdGggd2FybmluZyBpZiBhbnkgMHhm
ZiBibG9jayBoYXMgYmVlbiB3cml0dGVuCj4gWzIwMjItMDMtMjVdIFsxMTo0MjozMyBDRVRdIDxy
bWlsZWNraT4gaSBkaWRuJ3Qga25vdyBkZWZhdWx0aW5nIHRvIC0tc2tpcC1hbGwtZmZzIGNhbiBi
ZSBkb25lCj4gWzIwMjItMDMtMjVdIFsxMTo0NzowNSBDRVRdIDxtcmF5bmFsPiB3ZWxsLCB0aGF0
IHdvdWxkIGJyZWFrIHRoZSB1c2VyIGludGVyZmFjZQoKSW5kZWVkIEkgcmFpc2VkIHRoaXMgaXNz
dWUgYnV0IEkgYW0gbm90IG9wcG9zZWQgdG8gdGhpcyBjaGFuZ2UgaWYKZXZlcnlib2R5IGFncmVl
cyB0aGF0IGl0J3MgYSBnb29kIG1vdmUuIEluIHBhcnRpY3VsYXIsIHRoZSBOQU5ECnN1YmxheWVy
IHdpbGwgZ2l2ZSB0aGUgc2FtZSAiZW1wdHkiIGRhdGEgdG8gdXNlcnNwYWNlIHdoZXRoZXIgaXQK
cHJvZ3JhbW1lZCBlbXB0eSBwYWdlcyBvciBza2lwcGVkIHRoZW0uIFNvIEkgZ3Vlc3Mgd2UgYXJl
IGZpbmUgYWdhaW5zdApkaXJlY3QgcmVncmVzc2lvbnMgKGJ1dCB3ZSBtaWdodCBicmVhayBjbGV2
ZXIgc2NyaXB0cyBkb2luZyBzdHJhbmdlCnRoaW5ncykuCgpJIHdvdWxkIGdvIGZvciB0aGlzIHNv
bHV0aW9uOgotIEJyaW5nIHN1cHBvcnQgZm9yIHRoZSBkb3VibGUgZmxhZyAtW25vLV1za2lwLWZm
cwotIE1ha2UgdGhlIHVzZSBvZiAtc2tpcC1mZnMgdGhlIGRlZmF1bHQKU28gdGhhdCBpdCBpcyBl
YXN5IGZvciBzY3JpcHRpbmcgcGVvcGxlIHRvIGVuc3VyZSB0aGVpciB3YXkgaXMgZmluZT8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
