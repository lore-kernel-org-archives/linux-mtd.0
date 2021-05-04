Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68269C433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 06:59:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A114A613B3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 06:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A114A613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eIQYwgLClMZUgUKBCFWre78o2es6Jl9czwM9BxRAQJ8=; b=iSJugGwWprDDEUVNygOMdyvuv
	gPhkSS7zbmHumk6L0vRgAewUaaVkDB/k/Snd/VJ+Oc1jihtjOewMcbbhPb7sffDV5sLw1DoG7+ekM
	cJQcs++rNp0uat68Hgx7m5yltUP9PNyq8ZgWP7Ega0C7XsJx8vxjhlMD3XA/Yyg6DjKVnXHnst6uY
	85XdaprYW0cIJN4pYsfJO7aailohZuziow34y/0ynRuZIyDjqE511IJArKbKqbQ/4VmJKmYG1Gtgs
	979t1i0po0OxnfVKiCYWZGb6g7d8k9i0EEreUZ9siy9p2lJdE14r4DRahFeS7ClX8O4T0BMpCb9Vm
	IHu1oKOcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldp0k-00FZzC-5h; Tue, 04 May 2021 06:58:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldp0g-00FZyR-QI
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 06:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=U3FFIoKTeeGgHOyAohu3Z6haLwWn1gwNUIfWnYZ6Pe8=; b=D2AxcUw7Ny6gdbfF97vTJtVc8k
 eU/BcyQn2XpNSCwUhvYOQAtLPZSuFeQhD4yeCdjNfuui2bM12AupEmV1woQlGXXxgNV1l2ynqoJiq
 nfdFNwksIp8rsrIlSf849Er4LxLzBJKZiv+IUquVlY9dJ9inJ2hSVYuj+3k3jPVZ3rzqyn9t7RSBD
 OCnG3MQd6n/SrbZBr6Tq4JCcnTnQz1hqAM+7fp4juMuQGkuydoxeWQ8UqQ3IN8TykBXPh69asRah0
 ADVdxsMojzR+6EFAqAb+P6yUMNAIe7dBxkC2Z5XQeNaV84GL+bv72qvLxF2rGPmAu/fOWdA5WVyy1
 2KQ6ydrg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldp0d-003k5U-C6
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 06:58:21 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E1695240002;
 Tue,  4 May 2021 06:58:06 +0000 (UTC)
Date: Tue, 4 May 2021 08:58:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: avoid write to obsolete register
Message-ID: <20210504085805.73e60979@xps13>
In-Reply-To: <2667b47434a8f2892ea3d5f304380960@codeaurora.org>
References: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
 <2667b47434a8f2892ea3d5f304380960@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_235819_709715_72917FCC 
X-CRM114-Status: GOOD (  17.27  )
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

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gTW9uLCAwMyBNYXkgMjAyMSAy
MDoyNDo1NCArMDUzMDoKCj4gT24gMjAyMS0wNC0yNCAwMDo1MSwgTWQgU2FkcmUgQWxhbSB3cm90
ZToKPiA+IFFQSUNfRUJJMl9FQ0NfQlVGX0NGRyByZWdpc3RlciBnb3Qgb2Jzb2xldGUgZnJvbSBR
UElDIFYyLjAgb253YXJkcy4KPiA+IEF2b2lkIHdyaXRpbmcgdGhpcyByZWdpc3RlciBpZiBRUElD
IHZlcnNpb24gaXMgVjIuMCBvciBuZXdlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWQgU2Fk
cmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMTcgKysrKysrKysrKystLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+IGluZGV4IGZkNGMzMTguLjhjNTIwNWMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gQEAgLTcxNCw3ICs3MTQsOCBAQCBz
dGF0aWMgdm9pZCB1cGRhdGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QKPiA+ICpob3N0
LCBpbnQgbnVtX2N3LCBib29sIHJlYWQpCj4gPiAgCW5hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRf
REVWMF9DRkcwLCBjZmcwKTsKPiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9ERVYwX0NG
RzEsIGNmZzEpOwo+ID4gIAluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0RFVjBfRUNDX0NGRywg
ZWNjX2JjaF9jZmcpOwo+ID4gLQluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VCSTJfRUNDX0JV
Rl9DRkcsIGhvc3QtPmVjY19idWZfY2ZnKTsKPiA+ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNf
djIpCj4gPiArCQluYW5kY19zZXRfcmVnKG5hbmRjLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIGhv
c3QtPmVjY19idWZfY2ZnKTsKPiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5kYywgTkFORF9GTEFTSF9T
VEFUVVMsIGhvc3QtPmNscmZsYXNoc3RhdHVzKTsKPiA+ICAJbmFuZGNfc2V0X3JlZyhuYW5kYywg
TkFORF9SRUFEX1NUQVRVUywgaG9zdC0+Y2xycmVhZHN0YXR1cyk7Cj4gPiAgCW5hbmRjX3NldF9y
ZWcobmFuZGMsIE5BTkRfRVhFQ19DTUQsIDEpOwo+ID4gQEAgLTEwODMsNyArMTA4NCw4IEBAIHN0
YXRpYyB2b2lkIGNvbmZpZ19uYW5kX3BhZ2VfcmVhZChzdHJ1Y3QKPiA+IHFjb21fbmFuZF9jb250
cm9sbGVyICpuYW5kYykKPiA+ICB7Cj4gPiAgCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfQURE
UjAsIDIsIDApOwo+ID4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZHMCwgMywg
MCk7Cj4gPiAtCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRywgMSwg
MCk7Cj4gPiArCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3YyKQo+ID4gKwkJd3JpdGVfcmVnX2Rt
YShuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHLCAxLCAwKTsKPiA+ICAJd3JpdGVfcmVnX2Rt
YShuYW5kYywgTkFORF9FUkFTRURfQ1dfREVURUNUX0NGRywgMSwgMCk7Cj4gPiAgCXdyaXRlX3Jl
Z19kbWEobmFuZGMsIE5BTkRfRVJBU0VEX0NXX0RFVEVDVF9DRkcsIDEsCj4gPiAgCQkgICAgICBO
QU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gPiBAQCAtMTEzMiw4ICsx
MTM0LDkgQEAgc3RhdGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV93cml0ZShzdHJ1Y3QKPiA+IHFj
b21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPiA+ICB7Cj4gPiAgCXdyaXRlX3JlZ19kbWEobmFu
ZGMsIE5BTkRfQUREUjAsIDIsIDApOwo+ID4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RF
VjBfQ0ZHMCwgMywgMCk7Cj4gPiAtCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRUJJMl9FQ0Nf
QlVGX0NGRywgMSwKPiA+IC0JCSAgICAgIE5BTkRfQkFNX05FWFRfU0dMKTsKPiA+ICsJaWYgKCFu
YW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4gPiArCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0VC
STJfRUNDX0JVRl9DRkcsIDEsCj4gPiArCQkJICAgICAgTkFORF9CQU1fTkVYVF9TR0wpOwo+ID4g
IH0KPiA+IAo+ID4gIC8qCj4gPiBAQCAtMTE4Nyw3ICsxMTkwLDggQEAgc3RhdGljIGludCBuYW5k
Y19wYXJhbShzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgPiAqaG9zdCkKPiA+ICAJCQkJCXwgMiA8PCBX
Ul9SRF9CU1lfR0FQCj4gPiAgCQkJCQl8IDAgPDwgV0lERV9GTEFTSAo+ID4gIAkJCQkJfCAxIDw8
IERFVjBfQ0ZHMV9FQ0NfRElTQUJMRSk7Cj4gPiAtCW5hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRf
RUJJMl9FQ0NfQlVGX0NGRywgMSA8PCA+IEVDQ19DRkdfRUNDX0RJU0FCTEUpOwo+ID4gKwlpZiAo
IW5hbmRjLT5wcm9wcy0+cXBpY192MikKPiA+ICsJCW5hbmRjX3NldF9yZWcobmFuZGMsIE5BTkRf
RUJJMl9FQ0NfQlVGX0NGRywgMSA8PCA+IEVDQ19DRkdfRUNDX0RJU0FCTEUpOwo+ID4gCj4gPiAg
CS8qIGNvbmZpZ3VyZSBDTUQxIGFuZCBWTEQgZm9yIE9ORkkgcGFyYW0gcHJvYmluZyBpbiBRUElD
IHYxICovCj4gPiAgCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3YyKSB7Cj4gPiBAQCAtMjYyOCw3
ICsyNjMyLDggQEAgc3RhdGljIGludCBxY29tX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRf
Y2hpcCA+ICpjaGlwKQo+ID4gIAkJCQl8IGVjY19tb2RlIDw8IEVDQ19NT0RFCj4gPiAgCQkJCXwg
aG9zdC0+ZWNjX2J5dGVzX2h3IDw8IEVDQ19QQVJJVFlfU0laRV9CWVRFU19CQ0g7Cj4gPiAKPiA+
IC0JaG9zdC0+ZWNjX2J1Zl9jZmcgPSAweDIwMyA8PCBOVU1fU1RFUFM7Cj4gPiArCWlmICghbmFu
ZGMtPnByb3BzLT5xcGljX3YyKQo+ID4gKwkJaG9zdC0+ZWNjX2J1Zl9jZmcgPSAweDIwMyA8PCBO
VU1fU1RFUFM7Cj4gPiAKPiA+ICAJaG9zdC0+Y2xyZmxhc2hzdGF0dXMgPSBGU19SRUFEWV9CU1lf
TjsKPiA+ICAJaG9zdC0+Y2xycmVhZHN0YXR1cyA9IDB4YzA7ICAKPiAKPiAKPiBwaW5nISBIaSBN
aXF1ZWwgY291bGQgeW91IHJldmlldyB0aGlzIGNoYW5nZSBhbmQgbGV0IG1lIGtub3cgaWYgbW9y
ZSBpbmZvIG5lZWRlZC4KCkNvbWUgb24sIHRoYXQncyBvbmx5IDYgZGF5cyBvZiB3b3JrIGFuZCB3
ZSBhcmUgaW4gdGhlIG1pZGRsZSBvZiB0aGUKbWVyZ2Ugd2luZG93Li4uIAoKQlRXICJhdm9pZCB3
cml0ZSB0byIgaW4gdGhlIHRpdGxlIGlzIGluY29ycmVjdCAid3JpdGluZyB0byIgd291bGQgYmUK
bmljZXIuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
