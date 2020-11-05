Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB42C00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 07:50:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE482151B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 07:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXk0YR3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE482151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eyN53PJZBK7xH1GjZgT76tSS98tZSI0EU3IVZgjcAZc=; b=GXk0YR3Syj1QH/V3/zIpLCOLa
	3bmCn4tvrnzqxHO5pdnaDAn8dBsFxhpAIMjPRarza6aSL+v4nkOWzUoBDSDYna8fIbZpOu+bj0zZ0
	ZYhwUuZp1jghx2Vl+xNxyOZi/TyKhburAxq8bIv/8si4RZq1pT98e5aPDjOVB2uNEi9U1BP2QONub
	0vXeXNZQFr4TwtjT7XEb0M/mnAyReeSeuGMfUTUV4TKE76HDJYlDcqM4ymlYnyjJwWixoKHGQe22Z
	GyRnSFCwdfwZNQJizRJ64Ljs7JdbihcbdlfoqYG54yLbWuAKoY2itRrRqGbE4ttQAxyD9CVPCJ3u/
	WFXnJGynw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaa1j-000657-Fa; Thu, 05 Nov 2020 07:49:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaa1g-00064Q-Vi
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 07:49:46 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B8ADC0005;
 Thu,  5 Nov 2020 07:49:40 +0000 (UTC)
Date: Thu, 5 Nov 2020 08:49:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
Message-ID: <20201105084939.72ea6bfd@xps13>
In-Reply-To: <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
 <20201104183859.590f0806@xps13>
 <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_024945_296028_CE9B1B75 
X-CRM114-Status: GOOD (  24.76  )
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGUgb24gV2VkLCA0IE5vdiAyMDIwCjE5OjM3OjU3ICswMTAwOgoKPiBIaSBNaXF1
ZWwsCj4gCj4gTGUgMDQvMTEvMjAyMCDDoCAxODozOCwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKg
Ogo+ID4gSGkgQ2hyaXN0b3BoZSwKPiA+IAo+ID4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZSBvbiBXZWQsIDA0IE5vdgo+ID4gMjAyMCAxODozMzo1
MyArMDEwMDoKPiA+ICAgCj4gPj4gSGkgTWlxdWVsLAo+ID4+Cj4gPj4gSSdtIHVuYWJsZSB0byBi
b290IDUuMTAtcmMxIG9uIG15IGJvYXJkcy4gSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcjoKPiA+
Pgo+ID4+IFsgICAgNC4xMjU4MTFdIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElE
OiAweGFkLCBDaGlwIElEOiAweDc2Cj4gPj4gWyAgICA0LjEzMTk5Ml0gbmFuZDogSHluaXggTkFO
RCA2NE1pQiAzLDNWIDgtYml0Cj4gPj4gWyAgICA0LjEzNjE3M10gbmFuZDogNjQgTWlCLCBTTEMs
IGVyYXNlIHNpemU6IDE2IEtpQiwgcGFnZSBzaXplOiA1MTIsIE9PQiBzaXplOiAxNgo+ID4+IFsg
ICAgNC4xNDM1MzRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4+IFsg
ICAgNC4xNDc5MzRdIFVuc3VwcG9ydGVkIEVDQyBhbGdvcml0aG0hCj4gPj4gWyAgICA0LjE1MjE0
Ml0gV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jh
c2UuYzo1MjQ0IG5hbmRfc2Nhbl93aXRoX2lkcysweDEyNjAvMHgxNjQwCj4gPj4gLi4uCj4gPj4g
WyAgICA0LjMzMjA1Ml0gLS0tWyBlbmQgdHJhY2UgZTNhMzZmNjJjYWU0YWM1NiBdLS0tCj4gPj4g
WyAgICA0LjMzNjg4Ml0gZ3Bpby1uYW5kOiBwcm9iZSBvZiBjMDAwMDAwMC5uYW5kIGZhaWxlZCB3
aXRoIGVycm9yIC0yMgo+ID4+Cj4gPj4gQmlzZWN0ZWQgdG8gY29tbWl0IGQ3MTU3ZmY0OWE1YiAo
Im10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIHVzZXIgaW5wdXQgcGFyc2luZyBi
aXRzIikKPiA+Pgo+ID4+IE15IGZpcnN0IGltcHJlc3Npb24gaXMgdGhhdCB3aXRoIHRoYXQgY2hh
bmdlLCB0aGUgdmFsdWUgc2V0IGluIGNoaXAtPmVjYy5hbGdvCj4gPj4gYnkgZ3Bpb19uYW5kX3By
b2JlKCkgaW4gZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jIGdldHMgb3ZlcndyaXR0ZW4gaW4g
cmF3bmFuZF9kdF9pbml0KCkKPiA+Pgo+ID4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlIGZpeGVzIHRo
ZSBwcm9ibGVtLCB0aG91Z2ggSSdtIG5vdCBzdXJlIGl0IGlzIHRoZSByaWdodCBmaXguIENhbiB5
b3UgaGF2ZSBhIGxvb2sgPwo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+PiBp
bmRleCAxZjBkNTQyZDU5MjMuLmFhNzQ3OTdjZjJkYSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmFzZS5jCj4gPj4gQEAgLTUwMzIsNyArNTAzMiw4IEBAIHN0YXRpYyBpbnQgcmF3bmFu
ZF9kdF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPj4gICAgCQljaGlwLT5lY2MuZW5n
aW5lX3R5cGUgPSBuYW5kLT5lY2MuZGVmYXVsdHMuZW5naW5lX3R5cGU7Cj4gPj4KPiA+PiAgICAJ
Y2hpcC0+ZWNjLnBsYWNlbWVudCA9IG5hbmQtPmVjYy51c2VyX2NvbmYucGxhY2VtZW50Owo+ID4+
IC0JY2hpcC0+ZWNjLmFsZ28gPSBuYW5kLT5lY2MudXNlcl9jb25mLmFsZ287Cj4gPj4gKwlpZiAo
Y2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQo+ID4+ICsJCWNoaXAtPmVj
Yy5hbGdvID0gbmFuZC0+ZWNjLnVzZXJfY29uZi5hbGdvOwo+ID4+ICAgIAljaGlwLT5lY2Muc3Ry
ZW5ndGggPSBuYW5kLT5lY2MudXNlcl9jb25mLnN0cmVuZ3RoOwo+ID4+ICAgIAljaGlwLT5lY2Mu
c2l6ZSA9IG5hbmQtPmVjYy51c2VyX2NvbmYuc3RlcF9zaXplOwo+ID4+Cj4gPj4gLS0tCj4gPj4K
PiA+PiBUaGFua3MKPiA+PiBDaHJpc3RvcGhlICAKPiA+IAo+ID4gU29ycnkgZm9yIGludHJvZHVj
aW5nIHRoaXMgaXNzdWUsIEkgZGlkbid0IGhhZCB0aGUgdGltZSB0byBzZW5kIHRoZQo+ID4gRml4
ZXMgUFIgeWV0IGJ1dCBJIHRoaW5rIHRoaXMgaXNzdWUgaGFzIGJlZW4gc29sdmVkIGFscmVhZHku
IENvdWxkCj4gPiB5b3UgcGxlYXNlIHRyeSB3aXRoIGEgcmVjZW50IGxpbnV4LW5leHQ/Cj4gPiAg
IAo+IAo+IFNvcnJ5LCBzYW1lIHByb2JsZW0gd2l0aCAiTGludXggdmVyc2lvbiA1LjEwLjAtcmMy
LW5leHQtMjAyMDExMDQiCgpDYW4geW91IHBsZWFzZSBnaXZlIHRoaXMgcGF0Y2ggYSB0cnksIHBs
ZWFzZT8KCi0tLTg8LS0tCgpBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+CkRhdGU6ICAgVGh1IE5vdiA1IDA4OjQ0OjQ4IDIwMjAgKzAxMDAKCiAgICBtdGQ6
IHJhd25hbmQ6IGdwaW86IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9j
aGlwKCkKICAgIAogICAgV2hpbGUgZm9yY2luZyBhIEhhbW1pbmcgc29mdHdhcmUgRUNDIGxvb2tz
IGNsZWFybHkgd3JvbmcsIGxldCdzIGp1c3QKICAgIGZpeCB0aGUgc2l0dWF0aW9uIGZvciBub3cg
YW5kIG1vdmUgdGhlc2UgbGluZXMgdG8gdGhlIC0+YXR0YWNoX2NoaXAoKQogICAgaG9vayB3aGlj
aCBnZXRzIGV4ZWN1dGVkIGFmdGVyIHRoZSB1c2VyIGlucHV0IHBhcnNpbmcgYW5kIE5BTkQgY2hp
cAogICAgZGlzY292ZXJ5LgogICAgCiAgICBGaXhlczogZDcxNTdmZjQ5YTViICgibXRkOiByYXdu
YW5kOiBVc2UgdGhlIEVDQyBmcmFtZXdvcmsgdXNlciBpbnB1dCBwYXJzaW5nIGJpdHMiKQogICAg
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncGlvLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncGlvLmMKaW5kZXggM2JkODQ3Y2NjM2YzLi42ZmVhYjg0N2Y1ZTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncGlvLmMKQEAgLTE2MSw4ICsxNjEsMTUgQEAgc3RhdGljIGludCBncGlvX25hbmRfZXhlY19v
cChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogICAgICAgIHJldHVybiByZXQ7CiB9CiAKK3N0YXRp
YyBpbnQgZ3Bpb19uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCit7Cisg
ICAgICAgY2hpcC0+ZWNjLm1vZGUgPSBOQU5EX0VDQ19TT0ZUOworICAgICAgIGNoaXAtPmVjYy5h
bGdvID0gTkFORF9FQ0NfSEFNTUlORzsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2Nv
bnRyb2xsZXJfb3BzIGdwaW9fbmFuZF9vcHMgPSB7CiAgICAgICAgLmV4ZWNfb3AgPSBncGlvX25h
bmRfZXhlY19vcCwKKyAgICAgICAuYXR0YWNoX2NoaXAgPSBncGlvX25hbmRfYXR0YWNoX2NoaXAs
CiB9OwogCiAjaWZkZWYgQ09ORklHX09GCkBAIC0zNDIsOCArMzQ5LDYgQEAgc3RhdGljIGludCBn
cGlvX25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICAgICAgICBncGlv
bXRkLT5iYXNlLm9wcyA9ICZncGlvX25hbmRfb3BzOwogCiAgICAgICAgbmFuZF9zZXRfZmxhc2hf
bm9kZShjaGlwLCBwZGV2LT5kZXYub2Zfbm9kZSk7Ci0gICAgICAgY2hpcC0+ZWNjLm1vZGUgICAg
ICAgICAgPSBOQU5EX0VDQ19TT0ZUOwotICAgICAgIGNoaXAtPmVjYy5hbGdvICAgICAgICAgID0g
TkFORF9FQ0NfSEFNTUlORzsKICAgICAgICBjaGlwLT5vcHRpb25zICAgICAgICAgICA9IGdwaW9t
dGQtPnBsYXQub3B0aW9uczsKICAgICAgICBjaGlwLT5jb250cm9sbGVyICAgICAgICA9ICZncGlv
bXRkLT5iYXNlOwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
