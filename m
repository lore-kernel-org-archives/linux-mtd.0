Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A999C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzGZikjM9KIZ7N3o45qcIK36qb/MfSOblOvJqk7n9eQ=; b=vGvWA3lONRH1WG
	F0s1o426vRot08g1f5klu3MVlWL4kAgIAPSr/uCRVic3GOqaoFY3CUzBnUUmYYonP/zKCTW06Kz/t
	H3sNh5MH2MOU3c8vV0wbIRuUOdYzuo+Hg3C1RzehERlcbu3WkM2a6IdMhtBLgK6FZ7ve8WjG7qIvE
	NEXP/k54NkLdRVOHg2bUcZpgN3lM6c8DErggCt89R0VUS3gcai0oxudt1U9Ho11sRXJD7zdNG3eFP
	OZfXTBWl4qycBePAub0q+F/NF+L4P1KHwq5am+sGQH5BQrHYjnLynUd/Yau2qmSAl/C80RD+FQQ59
	Au5JGIOUZGow1p3cygXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngjlp-002Tcu-HI; Tue, 19 Apr 2022 09:03:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngjll-002Ta5-Q0
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 09:03:35 +0000
Received: by mail-ej1-x635.google.com with SMTP id y10so14091614ejw.8
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=usv6LsfP2cl45Jpxb3VrZ8H5gYxexSGIiGdXhxZYctY=;
 b=RvMnYTapv2jgsckzqwaa2Le2oV1s2E6PSsG4mUw3k0DHRDzOqh4wFmub76UvXZgRA2
 UUdfYlzmvUnLbPdRVcJ9On7K3uObBJcKAAX2wen0OWwbV50TkbKKJ0XKcrPZfMPLI/tU
 g1VCVh0AGwtFnloZIZV+1O6ELlEAj1cuif6S8+UHluYNTHuYQCzUfoM1g36GDD/IS7MB
 CTnflwDOacXgIIjOXICBJYQZWLP+ZamICr7oCGDjjnuWWbvw3nzoxWmHLPOR0mzjP63S
 g5rL08bHOfI/ycftmwgwky+Q6b7boaFaERmZS/A5KzwWyHMtYfm1baJZbPDMaE6IikJo
 FijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=usv6LsfP2cl45Jpxb3VrZ8H5gYxexSGIiGdXhxZYctY=;
 b=J5oLsrOveQAEePH4UYrkjBkarYQ1gR/v/WZ/Cp90l16N6Ok4IluukMHIOrZsS4L/sY
 f5UYgXjW7seTjNJdkFwtE+9BhMLGoDbrR/WmloxT2sDqSY+fL31e2zg8EeBR8lqb4oo1
 hmrhiIWDwoedO5rdI0eBDNGHc8466FYJjXx8h07pdgnsi+LTPqJOnZ4huOXYucwefynq
 BS3wqjJ3g7OxzqjabyPa4BqewOWyebTSrxqm3lFudgjL7zPGuTnigD7Z3/rSKuixoTn6
 QVfLqzQLpuA7rWiPdGC04HwHvzvpO2+rIdiEFqCi5YEytfObQ8Y800+NR/1l+gxMQd5m
 pKNg==
X-Gm-Message-State: AOAM531LkTeqiMXWx6mIpPIlc3kI6EXePvEQYnIumtCnI39D8kLZFKrR
 ZACzpdUZgObS3KxvhWGMsoS5a1GgHtposzD2RsfrU+LypNg=
X-Google-Smtp-Source: ABdhPJywkutpMEo3lAjJqXpPjQngpJ9K2P0rC4TWs3MiMOY623Hpsl9Vda0u/8IBI2JZ2Eo6ghIaMz9TyAs/zQzFcrQ=
X-Received: by 2002:a17:907:d8d:b0:6df:b214:392a with SMTP id
 go13-20020a1709070d8d00b006dfb214392amr12518477ejc.669.1650359007284; Tue, 19
 Apr 2022 02:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220414192413.0db7ef46@xps13>
 <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
 <20220415102929.5c654933@xps13>
 <CABy3iKwAVYkstq4=fg6cjh4VRAzSwGa7JNy494Ag69e_t9UTjA@mail.gmail.com>
 <20220419093317.7fe2ae6c@xps13>
 <542373121.266606.1650354270993.JavaMail.zimbra@nod.at>
In-Reply-To: <542373121.266606.1650354270993.JavaMail.zimbra@nod.at>
From: Scott Zhang <macromarship@gmail.com>
Date: Tue, 19 Apr 2022 17:03:15 +0800
Message-ID: <CABy3iKzeJ4CF74YjF60_F_zbZhhYq_5imuG=BU4fOBrKQ5eqaw@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_020333_917171_C3DBAE20 
X-CRM114-Status: GOOD (  22.12  )
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

VGhhbmtzLgoKSSB3aWxsIGRvIG1vcmUgdGVzdHMuCgpJIGNyZWF0ZWQgdWJpZnMgYnkgdXNpbmcg
YnVpbGRyb290IHdpdGggZGVmYXVsdCBvcHRpb25zLgpNeSBuYW5kIGRyaXZlcnMgb25seSBwYXNz
IGJpdGVycm9ycyB0ZXN0IGF0IHRoZSBtb21lbnQuCkkgYW0gdXNpbmcgZGVmYXVsdCBidWlsZHJv
b3QgdWJpZnMuaW1nIHNvIEkgZGlkbid0IHRlc3Qgd2l0aCBvdGhlcnMgeWV0LgoKSSB3aWxsIGxl
dCB5b3Uga25vdyBhZnRlciBJIGZpbmlzaCB0aGUgdGVzdC4KCk9uIFR1ZSwgQXByIDE5LCAyMDIy
IGF0IDM6NDQgUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4K
PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBEaWQgeW91IHJ1biB0aGUgdmFy
aW91cyBuYW5kIHRlc3RzIGJlc2lkZXMgbmFuZGJpdGVycnM/IElmIHRoZXkgYWxsCj4gPiBwYXNz
IHRoZW4gbWF5YmUgUmljaGFyZCB3aWxsIGJlIG1vcmUgaGVscGZ1bCB0aGFuIEkgYW0uLi4KPgo+
IFsuLi5dCj4KPiA+Pgo+ID4+IEJ1dCBJIG5vdGljZWQgdGhlIGx6byBkZWNvbXByZXNzIGVycm9y
IGlzIHN0aWxsIHRoZXJlLgo+ID4+IEkgZGlkICBmb2xsb3dpbmcgYWN0aW9ucyB0byB0ZXN0Lgo+
ID4+IC9kZXYvbXRkMyBpcyBtb3VudGVkIG9uIC9vcHQgdXNpbmcgdWJpZnMuCj4gPj4gdGFyIHpj
dmYgL3Jvb3Qvb3B0LnRhci5neiAvb3B0ICAoZG9uZSB3aXRob3V0IGVycm9yKQo+ID4+IGZvcm1h
dCAvb3B0Lgo+ID4+IHRhciB6eHZmIC9yb290L29wdC50YXIuZ3ogLUMgLwo+Cj4gSG93IGRpZCB5
b3UgY3JlYXRlIHViaWZzPwo+Cj4gRG9lcyB5b3VyIG5hbmQgZHJpdmVyIHBhc3MgdWJpIHRlc3Rz
Pwo+Cj4gPj4gVGhlbiB3aGVuIEkgcnVuIHBocCBwcm9ncmFtIHdoaWNoIGlzIGluIG9wdC4gSSBz
YXcgZG1lc2cKPiA+PiBbICAxMTguODUwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2
KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4gPj4gZGVjb21wcmVzcyAyMjkzIGJ5dGVzLCBj
b21wcmVzc29yIGx6bywgZXJyb3IgLTIyCj4gPj4gWyAgMTE4Ljg2MDAwMF0gVUJJRlMgZXJyb3Ig
KHViaTA6MCBwaWQgMTUyNik6IGRvX3JlYWRwYWdlOiBiYWQgZGF0YQo+ID4+IG5vZGUgKGJsb2Nr
IDE1LCBpbm9kZSAzOTYpCj4gPj4gWyAgMTE4Ljg3MDAwMF0gVUJJRlMgZXJyb3IgKHViaTA6MCBw
aWQgMTUyNik6IGRvX3JlYWRwYWdlOiBjYW5ub3QgcmVhZAo+ID4+IHBhZ2UgMTUgb2YgaW5vZGUg
Mzk2LCBlcnJvciAtMjIKPiA+PiBbICAxMTguODgwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBp
ZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4gPj4gZGVjb21wcmVzcyAyMjkzIGJ5
dGVzLCBjb21wcmVzc29yIGx6bywgZXJyb3IgLTIyCj4gPj4gWyAgMTE4LjkwMDAwMF0gVUJJRlMg
ZXJyb3IgKHViaTA6MCBwaWQgMTUyNik6IGRvX3JlYWRwYWdlOiBiYWQgZGF0YQo+ID4+IG5vZGUg
KGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4gPj4gWyAgMTE4LjkwMDAwMF0gVUJJRlMgZXJyb3IgKHVi
aTA6MCBwaWQgMTUyNik6IGRvX3JlYWRwYWdlOiBjYW5ub3QgcmVhZAo+ID4+IHBhZ2UgMTUgb2Yg
aW5vZGUgMzk2LCBlcnJvciAtMjIKPiA+PiBbICAxMTguOTIwMDAwXSBVQklGUyBlcnJvciAodWJp
MDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4gPj4gZGVjb21wcmVzcyAy
MjkzIGJ5dGVzLCBjb21wcmVzc29yIGx6bywgZXJyb3IgLTIyCj4gPj4gWyAgMTE4LjkzMDAwMF0g
VUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTUyNik6IGRvX3JlYWRwYWdlOiBiYWQgZGF0YQo+ID4+
IG5vZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4gPj4gWyAgMTE4Ljk0MDAwMF0gVUJJRlMgZXJy
b3IgKHViaTA6MCBwaWQgMTUyNik6IGRvX3JlYWRwYWdlOiBjYW5ub3QgcmVhZAo+ID4+IHBhZ2Ug
MTUgb2YgaW5vZGUgMzk2LCBlcnJvciAtMjIKPiA+Pgo+ID4+IEkgcmVtb3ZlZCB0aGUgdWJpZnNf
ZHVtcF9ub2RlIGNhbGwgdG8gYXZvaWQgbWFueSBkdW1wIHRleHQuIFRoZQo+ID4+IHByb2JsZW0g
aXMgd2hlbiBJIHJ1biBwaHAgcHJvZ3JhbSwgbG90cyBvZiBhYm92ZSBsb2dzIGR1bXBlZC4KPiA+
PiBCdXQgSSBkb24ndCBzZWUgYW55IGVmZmVjdCBvZiB0aGUgYWJvdmUgbG9ncy4gdGhlIHByb2dy
YW0gc2VlbXMgcnVubmluZy4KPiA+PiBJcyB0aGVyZSBhIHBvc3NpYmlsaXR5IHRoZSB1bmRlcmx5
aW5nIG5hbmQgZHJpdmVyIGRhdGEgaXMgb2ssIGJ1dCB0aGUKPiA+PiBsem8gY29tcHJlc3MvZGVj
b21wcmVzcyBjb2RlIGhhcyBidWdzID8gIEkgYW0gcnVubmluZyBsaW51eC01LjQueQo+ID4+IGNs
b25lZCBmcm9tIGtlcm5lbC5vcmcuCj4KPiBEb2VzIHRoZSBwcm9ibGVtIG9ubHkgaGFwcGVuIHdp
dGggbHpvPwo+Cj4gUGxlYXNlIHJlLXRlc3Qgd2l0aCBubyBjb21wcmVzc29yIGVuYWJsZWQgKGNv
bXByPW5vbmUpIGFuZCBhbHNvIG1vdW50IHdpdGgKPiB0aGUgY2hrX2RhdGFfY3JjIG1vdW50IG9w
dGlvbi4KPgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
