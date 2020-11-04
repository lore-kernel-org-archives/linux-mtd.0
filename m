Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20195C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 18:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99841206C1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 18:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Enom52Y+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99841206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S76v3+Rt9EeTa6Cx5qRnIoJDCrVovi6Wzn0/QybHGCk=; b=Enom52Y+hBP0S+XSVn70vjX1q
	K23vW+kDf7ipy1bp/D5KXI0Qcymx2IjprljWOEbIkqGLPG4gpZlrOwfK9L0gsN66PZtpRbX+Y3yw1
	zsyKJn1PssnApit8Nqqb+Mgzuxd/MXqZS96acED3x9P3VtJhS+XRVLyW0av73H+2rpgx0sns/8dWe
	wQdKbQahLSedwT5shDjOrnqcnhMfWmFhVFtwjMPzcRkH+9fKtC7ek48bzMWKPhPwcPuJHSchhY+yg
	+bK5L7cIxBZisc1WF7I8xeQolVYwWZXojgaCJK0NxACiuRw5/zuhsgZ7jm+lg1XZp079jEtEXnttx
	T78CNdcPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaNj8-0004jS-VL; Wed, 04 Nov 2020 18:41:47 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaNfk-0002Mm-5r
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 18:38:18 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRFlN3WTQz9v6f3;
 Wed,  4 Nov 2020 19:38:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JjmZWKkzP7iN; Wed,  4 Nov 2020 19:38:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRFlN1VZTz9v0w0;
 Wed,  4 Nov 2020 19:38:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9C538B807;
 Wed,  4 Nov 2020 19:38:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Hr-DBJrM14jM; Wed,  4 Nov 2020 19:38:09 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36C368B7FF;
 Wed,  4 Nov 2020 19:38:09 +0100 (CET)
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to d7157ff49a5b
 ("mtd: rawnand: Use the ECC framework user input parsing bits"))
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
 <20201104183859.590f0806@xps13>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
Date: Wed, 4 Nov 2020 19:37:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201104183859.590f0806@xps13>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_133816_525662_BEA6A578 
X-CRM114-Status: GOOD (  19.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKTGUgMDQvMTEvMjAyMCDDoCAxODozOCwgTWlxdWVsIFJheW5hbCBhIMOpY3Jp
dMKgOgo+IEhpIENocmlzdG9waGUsCj4gCj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1PiB3cm90ZSBvbiBXZWQsIDA0IE5vdgo+IDIwMjAgMTg6MzM6NTMgKzAx
MDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gSSdtIHVuYWJsZSB0byBib290IDUuMTAtcmMxIG9u
IG15IGJvYXJkcy4gSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcjoKPj4KPj4gWyAgICA0LjEyNTgx
MV0gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YWQsIENoaXAgSUQ6IDB4
NzYKPj4gWyAgICA0LjEzMTk5Ml0gbmFuZDogSHluaXggTkFORCA2NE1pQiAzLDNWIDgtYml0Cj4+
IFsgICAgNC4xMzYxNzNdIG5hbmQ6IDY0IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxNiBLaUIsIHBh
Z2Ugc2l6ZTogNTEyLCBPT0Igc2l6ZTogMTYKPj4gWyAgICA0LjE0MzUzNF0gLS0tLS0tLS0tLS0t
WyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+IFsgICAgNC4xNDc5MzRdIFVuc3VwcG9ydGVkIEVD
QyBhbGdvcml0aG0hCj4+IFsgICAgNC4xNTIxNDJdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmM6NTI0NCBuYW5kX3NjYW5fd2l0aF9pZHMr
MHgxMjYwLzB4MTY0MAo+PiAuLi4KPj4gWyAgICA0LjMzMjA1Ml0gLS0tWyBlbmQgdHJhY2UgZTNh
MzZmNjJjYWU0YWM1NiBdLS0tCj4+IFsgICAgNC4zMzY4ODJdIGdwaW8tbmFuZDogcHJvYmUgb2Yg
YzAwMDAwMDAubmFuZCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPj4KPj4gQmlzZWN0ZWQgdG8gY29t
bWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIHVz
ZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPj4KPj4gTXkgZmlyc3QgaW1wcmVzc2lvbiBpcyB0aGF0
IHdpdGggdGhhdCBjaGFuZ2UsIHRoZSB2YWx1ZSBzZXQgaW4gY2hpcC0+ZWNjLmFsZ28KPj4gYnkg
Z3Bpb19uYW5kX3Byb2JlKCkgaW4gZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bpby5jIGdldHMgb3Zl
cndyaXR0ZW4gaW4gcmF3bmFuZF9kdF9pbml0KCkKPj4KPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Ug
Zml4ZXMgdGhlIHByb2JsZW0sIHRob3VnaCBJJ20gbm90IHN1cmUgaXQgaXMgdGhlIHJpZ2h0IGZp
eC4gQ2FuIHlvdSBoYXZlIGEgbG9vayA/Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4+
IGluZGV4IDFmMGQ1NDJkNTkyMy4uYWE3NDc5N2NmMmRhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYwo+PiBAQCAtNTAzMiw3ICs1MDMyLDggQEAgc3RhdGljIGludCByYXduYW5kX2R0
X2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gICAgCQljaGlwLT5lY2MuZW5naW5lX3R5
cGUgPSBuYW5kLT5lY2MuZGVmYXVsdHMuZW5naW5lX3R5cGU7Cj4+Cj4+ICAgIAljaGlwLT5lY2Mu
cGxhY2VtZW50ID0gbmFuZC0+ZWNjLnVzZXJfY29uZi5wbGFjZW1lbnQ7Cj4+IC0JY2hpcC0+ZWNj
LmFsZ28gPSBuYW5kLT5lY2MudXNlcl9jb25mLmFsZ287Cj4+ICsJaWYgKGNoaXAtPmVjYy5hbGdv
ID09IE5BTkRfRUNDX0FMR09fVU5LTk9XTikKPj4gKwkJY2hpcC0+ZWNjLmFsZ28gPSBuYW5kLT5l
Y2MudXNlcl9jb25mLmFsZ287Cj4+ICAgIAljaGlwLT5lY2Muc3RyZW5ndGggPSBuYW5kLT5lY2Mu
dXNlcl9jb25mLnN0cmVuZ3RoOwo+PiAgICAJY2hpcC0+ZWNjLnNpemUgPSBuYW5kLT5lY2MudXNl
cl9jb25mLnN0ZXBfc2l6ZTsKPj4KPj4gLS0tCj4+Cj4+IFRoYW5rcwo+PiBDaHJpc3RvcGhlCj4g
Cj4gU29ycnkgZm9yIGludHJvZHVjaW5nIHRoaXMgaXNzdWUsIEkgZGlkbid0IGhhZCB0aGUgdGlt
ZSB0byBzZW5kIHRoZQo+IEZpeGVzIFBSIHlldCBidXQgSSB0aGluayB0aGlzIGlzc3VlIGhhcyBi
ZWVuIHNvbHZlZCBhbHJlYWR5LiBDb3VsZAo+IHlvdSBwbGVhc2UgdHJ5IHdpdGggYSByZWNlbnQg
bGludXgtbmV4dD8KPiAKClNvcnJ5LCBzYW1lIHByb2JsZW0gd2l0aCAiTGludXggdmVyc2lvbiA1
LjEwLjAtcmMyLW5leHQtMjAyMDExMDQiCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
