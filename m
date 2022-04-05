Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD60C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2SlrdbS+b5wuOGT8NlAXHRmJOxODkR9XeAyYnpAx3o=; b=u2Q9gOoRyq5b5T
	4xHkc/PJpva6sWrmn/2dqnWf7ev364mXyw6Wzuexn3o7+igRF+IAe1OIsPunMYtZy9iupqcQrzkbM
	YmHTWLCJHwGV7XJskwcL8VI/HvoLlcr+Xx3TW2ruwwCKvFMEiNDWLp0Rd58uU3DzDUjNZGL53giiG
	rIcW2ruQvVipAYHETx4efXILYb9xeaY7154ppgC0IY8IRBoA+BmDylzJzqamz7/1whm+aSzYquAdV
	utakuYqbWyvXvbBDRGVWp0Jyt5eSrOOsFnOj3+jRBDwxOZURmmkeUk1GlQ9mX+h7fKaz34/h28bUi
	GpjFU8p1FV9/A6dP9bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdg0-00HYvz-4s; Tue, 05 Apr 2022 07:32:32 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbda1-00HVrN-B1
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 07:26:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2FA04000D;
 Tue,  5 Apr 2022 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649143577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lta+N23bh7SVP6bj0E8neuXd5iYQADhZWwznhhzK7Q=;
 b=o+5ByhR0hM1mFgi8exd1UKsDPD6dC624+Iky4Sn8Vh4VSNKi3xckerZGOJcTjKg96mYxWM
 bA3oAeg+sXSV/4wK5Ls9g5kPkkhpknBzZ/+AQbL573og8SD4yeMdxzjfs+rKkVAuT/wyda
 DwUZMiP8l9B71617k6GCYxhJzufyDNKrkNtXQ3dPoMvLTcvpjoVM/3xLdFKhxWNnz4NXOV
 qORPegHZwkJD7MIj3fqRcU4QxfSrt+KYMv+vJnbM3KU/KI/EVVisrAYbX3NHPmW2QlrKdf
 2jaZBNAJ9hNzY3U88w1kYX3E6yWBUO/a8Mm9c93Z4yDjX6HUh1Z4DzsSCqTaog==
Date: Tue, 5 Apr 2022 09:26:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sean@geanix.com, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: gpmi: Refactor bch geometry
 settings function
Message-ID: <20220405092614.037e9715@xps13>
In-Reply-To: <20220404195427.8871-1-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_002621_704940_75D9ECC3 
X-CRM114-Status: GOOD (  27.62  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gTW9uLCAgNCBBcHIgMjAyMiAxNDo1NDoy
NCAtMDUwMDoKCj4gVGhlIGNvZGUgY2hhbmdlIHJlZmFjdG9yIHRoZSBiY2ggZ2VvbWV0cnkgc2V0
dGluZyBmdW5jdGlvbiwgd2hpY2ggc3RpbGwKPiB1c2UgdGhlIGxlZ2FjeSBiY2ggc2V0dGluZyBh
cyBkZWZhdWx0IG9wdGlvbiwgd2hpbGUgdXNlciBtYXkgY2hvb3NlIHRvCj4gdXNlIGNoaXBzIHJl
cXVpcmVkIG1pbmltdW0gZWNjIHN0cmVuZ3RoIGJ5IERUIGZsYWcgImZzbCx1c2UtbWluaW11bS1l
Y2MiLgo+IAo+IFRoZSBkcml2ZXIgdXNlcyBsZWdhY3kgYmNoIGdlb21ldHJ5IHNldHRpbmdzIGJ5
IGRlZmF1bHQsIGlmIHRoZSBOQU5ECgpTaGFsbCB3ZSByZWFsbHkgcmVmZXIgdG8gYSBsZWdhY3kg
Z2VvbWV0cnk/IEl0J3MganVzdCB0aGF0IHRoZXJlIHdhcyBhCmRlZmF1bHQgdmFsdWUgdW50aWwg
a25vdywgeW91IG5lZWQgYW5vdGhlciBkZWZhdWx0IGZvciBiaWdnZXIgZGV2aWNlcywKYnV0IHRo
ZSBhbmNpZW50IGdlb21ldHJ5IGlzIHN0aWxsIGNvbXBsZXRlbHkgdmFsaWQgKGF0IGxlYXN0IGZv
cgpleGlzdGluZyBkZXZpY2VzKS4KCkNhbiB5b3UgY2hhbmdlIHRoZSBuYW1pbmc/IFlvdSBjYW4g
aG93ZXZlciBtZW50aW9uIGluIGEgY29tbWVudAp0aGF0IHRoaXMgd2F5IG9mIGRlcml2aW5nIHRo
ZSBnZW9tZXRyeSBpcyBkZXByZWNhdGVkIGZvciBsYXJnZXIgZGV2aWNlcwooYW5kIG1lbnRpb24g
dGhlIHNwbGl0KS4KCk90aGVyd2lzZSBMR1RNLgoKPiBjaGlwcyBvb2Igc2l6ZSBpcyBsZXNzIHRo
YW4gMUtCLiBUaGUgbGVnYWN5X3NldF9nZW9tZXRyeSgpIHNldHMgdGhlIGRhdGEKPiBjaHVuayBz
aXplKHN0ZXBfc2l6ZSkgbGFyZ2VyIHRoYW4gb29iIHNpemUgdG8gbWFrZSBzdXJlIEJCTSBsb2Nh
dGVzIGluCj4gZGF0YSBjaHVuaywgdGhlbiBzZXQgdGhlIG1heGltdW0gZWNjIHN0cmVuZ3RoIG9v
YiBjYW4gaG9sZC4gSXQgYWx3YXlzIHVzZQo+IHVuYmFsYW5jZWQgRUNDIGxheW91dCwgd2hpY2gg
ZWNjMCB3aWxsIGNvdmVyIGJvdGggbWV0YSBhbmQgZGF0YTAgY2h1bmsuCj4gCj4gRm9yIGFsbCBv
dGhlciBjYXNlcyxzZXQgdGhlIGJjaCBnZW9tZXRyeSBieSBjaGlwIHJlcXVpcmVkIHN0cmVuZ3Ro
IGFuZAo+IHN0ZXAgc2l6ZSwgd2hpY2ggdXNlcyB0aGUgbWluaW11bSBlY2Mgc3RyZW5ndGggY2hp
cCByZXF1aXJlZC4gSXQgY2FuIGJlCj4gZXhwbGljaXRseSBlbmFibGVkIGJ5IERUIGZsYWcgImZz
bCx1c2UtbWluaW11bS1lY2MiLCBidXQgbmVlZCB0byBiZQo+IGVuL2Rpc2FibGVkIGluIGJvdGgg
dS1ib290IGFuZCBrZXJuZWwgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBI
YW4gWHUgPGhhbi54dUBueHAuY29tPgo+IFRlc3RlZC1ieTogU2VhbiBOeWVramFlciA8c2VhbkBn
ZWFuaXguY29tPgo+IAo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjIKPiAgLSBzcGxpdCB0aGUgZWNj
IGNoZWNrIHRvIGEgc2luZ2xlIHBhdGNoCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MQo+ICAtIHNwbGl0
IHRoZSBwYXRjaCB0byB0d28gcGFydHMKPiAgLSBjaGFuZ2UgdGhlIGNvbW1pdCBsb2cKPiAgLSBh
ZGQgdGVzdCB0YWcKPiAtLS0KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5k
L2dwbWktbmFuZC5jIHwgMzIgKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IGluZGV4IGQ5Njg5OWZhOTBiNy4uNDE0NGQ1
OTM3MTAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1p
LW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQu
Ywo+IEBAIC01MTQsMjQgKzUxNCwzMiBAQCBzdGF0aWMgaW50IGxlZ2FjeV9zZXRfZ2VvbWV0cnko
c3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ICBzdGF0aWMgaW50IGNvbW1vbl9uZmNfc2V0
X2dlb21ldHJ5KHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiAgewo+ICAJc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCA9ICZ0aGlzLT5uYW5kOwo+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBu
YW5kX3RvX210ZCgmdGhpcy0+bmFuZCk7Cj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9lY2NfcHJvcHMg
KnJlcXVpcmVtZW50cyA9Cj4gIAkJbmFuZGRldl9nZXRfZWNjX3JlcXVpcmVtZW50cygmY2hpcC0+
YmFzZSk7Cj4gKwlib29sIHVzZV9taW5pbXVuX2VjYzsKPiArCWludCBlcnI7Cj4gIAo+IC0JaWYg
KGNoaXAtPmVjYy5zdHJlbmd0aCA+IDAgJiYgY2hpcC0+ZWNjLnNpemUgPiAwKQo+IC0JCXJldHVy
biBzZXRfZ2VvbWV0cnlfYnlfZWNjX2luZm8odGhpcywgY2hpcC0+ZWNjLnN0cmVuZ3RoLAo+IC0J
CQkJCQljaGlwLT5lY2Muc2l6ZSk7Cj4gLQo+IC0JaWYgKChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
dGhpcy0+ZGV2LT5vZl9ub2RlLCAiZnNsLHVzZS1taW5pbXVtLWVjYyIpKQo+IC0JCQkJfHwgbGVn
YWN5X3NldF9nZW9tZXRyeSh0aGlzKSkgewo+IC0JCWlmICghKHJlcXVpcmVtZW50cy0+c3RyZW5n
dGggPiAwICYmIHJlcXVpcmVtZW50cy0+c3RlcF9zaXplID4gMCkpCj4gLQkJCXJldHVybiAtRUlO
VkFMOwo+ICsJdXNlX21pbmltdW5fZWNjID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKHRoaXMtPmRl
di0+b2Zfbm9kZSwKPiArCQkJCQkJImZzbCx1c2UtbWluaW11bS1lY2MiKTsKPiAgCj4gLQkJcmV0
dXJuIHNldF9nZW9tZXRyeV9ieV9lY2NfaW5mbyh0aGlzLAo+IC0JCQkJCQlyZXF1aXJlbWVudHMt
PnN0cmVuZ3RoLAo+IC0JCQkJCQlyZXF1aXJlbWVudHMtPnN0ZXBfc2l6ZSk7Cj4gKwkvKiB1c2Ug
bGVnYWN5IGJjaCBnZW9tZXRyeSBzZXR0aW5ncyBieSBkZWZhdWx0Ki8KPiArCWlmICgoIXVzZV9t
aW5pbXVuX2VjYyAmJiBtdGQtPm9vYnNpemUgPCAxMDI0KSB8fAo+ICsJICAgICEocmVxdWlyZW1l
bnRzLT5zdHJlbmd0aCA+IDAgJiYgcmVxdWlyZW1lbnRzLT5zdGVwX3NpemUgPiAwKSkgewo+ICsJ
CWRldl9kYmcodGhpcy0+ZGV2LCAidXNlIGxlZ2FjeSBiY2ggZ2VvbWV0cnlcbiIpOwo+ICsJCWVy
ciA9IGxlZ2FjeV9zZXRfZ2VvbWV0cnkodGhpcyk7Cj4gKwkJaWYgKCFlcnIpCj4gKwkJCXJldHVy
biAwOwo+ICAJfQo+ICAKPiAtCXJldHVybiAwOwo+ICsJLyogb3RoZXJ3aXNlIHVzZSB0aGUgbWlu
aW11bSBlY2MgbmFuZCBjaGlwIHJlcXVpcmVkICovCj4gKwlkZXZfZGJnKHRoaXMtPmRldiwgInVz
ZSBtaW5pbXVtIGVjYyBiY2ggZ2VvbWV0cnlcbiIpOwo+ICsJZXJyID0gc2V0X2dlb21ldHJ5X2J5
X2VjY19pbmZvKHRoaXMsIHJlcXVpcmVtZW50cy0+c3RyZW5ndGgsCj4gKwkJCQkJcmVxdWlyZW1l
bnRzLT5zdGVwX3NpemUpOwo+ICsJaWYgKGVycikKPiArCQlkZXZfZXJyKHRoaXMtPmRldiwgIm5v
bmUgb2YgdGhlIGJjaCBnZW9tZXRyeSBzZXR0aW5nIHdvcmtzXG4iKTsKPiArCj4gKwlyZXR1cm4g
ZXJyOwo+ICB9Cj4gIAo+ICAvKiBDb25maWd1cmVzIHRoZSBnZW9tZXRyeSBmb3IgQkNILiAgKi8K
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
