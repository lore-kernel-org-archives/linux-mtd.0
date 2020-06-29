Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:52:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550972333E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQX7Qa+T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M/VFD+7b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550972333E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qWzFagHJpfGhGrqXeeRfa2Tgx+4Hk/Fp9EFoMPT/s+Q=; b=bQX7Qa+TkgJW42MPJONjYwBnq
	FPAgFxmM70UxYscpD+EDmoojXurEceqDTwsv+EqKNJ94o67D7J/gz4ShlK10eeszshTrQmcVhIP6D
	VsDt8f/KsnETSoYhrNixNzWvhFJlfqx3zVNKPdaOdcqNFfE+WVz5MnriHM3FOBd03ajg3wGTgVxzw
	Mrr/1eT3rJ25abYSx2wYacdDjs9wLG8BNyCqDBihrkFQ6SiuKSKRr73l7aFn/xT6IWilkvPln0QLY
	G1Noycr7SteNZy/mkjW1sq8STrUlIFDqHpC9rx6B5dFFaIAS+/rLtsEqqS7EV3NsnQEocjZ50p4u+
	j0x36iB1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoZn-0005XT-9e; Mon, 29 Jun 2020 07:51:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoZl-0005X1-Au
 for linux-mtd@merlin.infradead.org; Mon, 29 Jun 2020 07:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=wtX7VwirBwc4jVWRRaM1OH39GeUOcTt7Kh4ECZCblec=; b=M/VFD+7byZYLrabsS2AL+xFcxH
 ytRcmoWK25iC7w2J4GGYhAb1o63qJKIf7pPbApRcE1jfsckwNCrTVKFiTOBY+KWdFuLRshOHgIYPr
 wPMfSK/YkUAhpxaDdRqXmvGETxqPAoeffWFVMxnkreBLHYByIFzUhSO2+PboUemlUB6VuApiMfV74
 komex/Q7+bi6mjsg604ifjfBM0hVqyuLHqKfqNRRVLV5JJ3BxQ4nnYQpbS3JJfL+gNbw5RQ3d2m3D
 a1DjRxggP49T76hyHSN+twsr014KgWYieRw3lI6gsipHKc3/rXrIFEHfFTpAeMVlc0M6WlFubExmO
 x3YHxffQ==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoZf-0006Tc-5s
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 07:51:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 161536071A74;
 Mon, 29 Jun 2020 09:51:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Fzor3bZvhlLm; Mon, 29 Jun 2020 09:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 511776071A7C;
 Mon, 29 Jun 2020 09:51:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1uKTBFNetjWK; Mon, 29 Jun 2020 09:51:25 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 258766071A74;
 Mon, 29 Jun 2020 09:51:25 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:51:25 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <667429184.71186.1593417085045.JavaMail.zimbra@nod.at>
In-Reply-To: <20200629074814.CBCA12400D6@gemini.denx.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
 <2117676.Cu8v49ySxQ@ada>
 <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
 <20200629074814.CBCA12400D6@gemini.denx.de>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: Q8js6AHmT/2f16CZl4JJSCpn6DBeFg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_085132_272885_BD0D8816 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V29sZmdhbmcsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiV29sZmdh
bmcgRGVuayIgPHdkQGRlbnguZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
Q0M6ICJBbGV4YW5kZXIgRGFobCIgPGFkYUB0aG9yc2lzLmNvbT4sICJTYXNjaGEgSGF1ZXIiIDxz
LmhhdWVyQHBlbmd1dHJvbml4LmRlPiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAiVG9yYmVuIEhvaG4iIDx0b3JiZW4uaG9obkBsaW51dHJvbml4LmRlPgo+
IEdlc2VuZGV0OiBNb250YWcsIDI5LiBKdW5pIDIwMjAgMDk6NDg6MTQKPiBCZXRyZWZmOiBSZTog
W1BBVENIIDAvMV0gdWJpZnM6IHN1cHBvcnQgYXV0aGVudGljYXRpb24gd2l0aG91dCBobWFjCgo+
IERlYXIgUmljaGFyZCwKPiAKPiBJbiBtZXNzYWdlIDwxMDY3NDc4Mzk5LjcxMDY2LjE1OTM0MTQy
ODc2MjMuSmF2YU1haWwuemltYnJhQG5vZC5hdD4geW91IHdyb3RlOgo+PiAKPj4gPiBJIHRyaWVk
IHRvIGZpbmQgb3V0IG1vcmUgYWJvdXQgdXNpbmcgVUJJIHN0YXRpYyB2b2x1bWVzIGluIGdlbmVy
YWwgYW5kIGZvcgo+PiA+IHRoYXQgdXNlY2FzZSwgYnV0IG5laXRoZXIgaHR0cDovL2xpbnV4LW10
ZC5pbmZyYWRlYWQub3JnL2RvYy91YmkuaHRtbCBub3IKPj4gPiBodHRwOi8vbGludXgtbXRkLmlu
ZnJhZGVhZC5vcmcvZmFxL3ViaS5odG1sIHBvaW50IG1lIGluIGEgZGlyZWN0aW9uIHdoZXJlIHRv
Cj4+ID4gZmluZCByZWFsIHdvcmxkIGV4YW1wbGVzIHRvIGxvb2sgYXQuIEFyZSB0aGVyZSBhbnkg
Ym9hcmRzIGluIHRoZSB3aWxkIHVzaW5nCj4+ID4gdGhpcz8gTWF5YmUgd2l0aCBkZWZjb25maWdz
IGluIFUtQm9vdCBhbHJlYWR5Pwo+PiAKPj4gVS1Cb290IGNob29zZSB0aGUgVUJJRlMgd2F5IEFG
QUlDVC4KPiAKPiBObywgVS1Cb290IGRvZXMgbm90IGltcGxlbWVudCBhbnkgcHJlZmVyZW5jZXMg
aGVyZSwgaS4gZS4gYm90aAo+IG1ldGhvZHMgY2FuIGJlIHVzZWQgb3V0IG9mIHRoZSBib3guICBJ
dCBpcyBqdXN0IHRoZSBwcmVmZXJlbmNlIG9mCj4gdGhlIHVzZXIgd2hvIGRlY2lkZXMgd2hpY2gg
d2F5IHRvIGdvIC0gdXNpbmcgdGhlIGZpbGUgc3lzdGVtIHNlZW1zCj4gbW9yZSBmbGV4aWJsZSB0
byBzb21lIHVuc2Vycywgd2hpbGUgb3RoZXJzIGNhcmUgYWJvdXQgdGhlIGFkZGl0aW9uYWwKPiBi
b290IHRpbWUgbmVlZGVkIHRvIG1vdW50IHRoZSBmaWxlIHN5c3RlbSBvciB0aGUgYWRkaXRpb25h
bCBtZW1vcnkKPiBmb290cHJpbnQgbmVlZGVkIGZvciB0aGUgZmlsZSBzeXN0ZW0gY29kZS4KPiAK
PiBZb3VyIGNob2ljZS4KCkdvb2QgdG8ga25vdyEgVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91
dC4KCkkgdGhpbmsgZm9yIG1vc3QgdXNlcnMgcmVhZGluZyBmcm9tIGEgZmlsZXN5c3RlbSBmZWVs
cyBtb3JlIG5hdHVyYWwKc2luY2Ugb24gb3RoZXIgc3RvcmFnZSBzeXN0ZW1zIHRoaXMgaXMgdGhl
IG9ubHkgd2F5IHRvIGdvLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
