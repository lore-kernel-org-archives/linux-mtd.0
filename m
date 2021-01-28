Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B756BC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 07:48:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6906F64DD6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 07:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6906F64DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6yAzxJHwsmx1TlEt7JY9dpf6zrMgY/CNDMiIcdELp1k=; b=zBmIV5P5TJtQcteqEk5qF82kb
	/OkjGkwRF1HHWKVYpHDgFydjkY6ZK4caWX40m03Ari4rgIdQZyd77BhmUwLZgS8Lf0Tn1IYPaUYId
	Z6do77mZuh3WsNgdQqBiWOGJ70Cq41Yvjg2fu9vt32M+fHDrdmF2xGItKZJXsqxX1Iepzzrbop4RJ
	DJdwUExxwqUlnrqdfZg+tIapiC44Jssa4HpxJcqGHRndAkL/aRIsaT+KlAgzWPogkrDYHEt5JQFub
	8tTiBfbYpUEAG55MVdmXJmcOctmDTuOogHzw0DDWuTH1Lx7JcuBpYVuwLWC3/NoOlGdp0uHl4SskF
	Ql1EFd6YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l521M-0003XI-DX; Thu, 28 Jan 2021 07:47:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l521J-0003WY-UB
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 07:47:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D1B596074005;
 Thu, 28 Jan 2021 08:47:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2I6E_uKbcIlQ; Thu, 28 Jan 2021 08:47:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7917B6074007;
 Thu, 28 Jan 2021 08:47:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gwvr2wLtfqUm; Thu, 28 Jan 2021 08:47:11 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 582B36074005;
 Thu, 28 Jan 2021 08:47:11 +0100 (CET)
Date: Thu, 28 Jan 2021 08:47:11 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tomas Winkler <tomas.winkler@intel.com>
Message-ID: <1665542284.336646.1611820031174.JavaMail.zimbra@nod.at>
In-Reply-To: <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
 <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
 <a6cb6eb10bbb48989d3a9e087951e50e@intel.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfPxzntFAEGBJdu8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_024714_108816_E04D8F1D 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9tYXMsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+ID4+IENhbiB5b3UgcGxl
YXNlIGV4cGxhaW4gYSBsaXR0bGUgbW9yZSB3aGF0IGRldmljZXMgYXJlIGludm9sdmVkPwo+PiA+
PiBEb2VzIGl0IGltcGxlbWVudCBfZ2V0X2RldmljZSgpIGFuZCBfcHV0X2RldmljZSgpPwo+PiA+
IE5vIHRoaXMgaXMgbm90IGNvbm5lY3RlZCB0byB0aG9zZSBoYW5kbGVycyBvZiB0aGUgdW5kZXJs
eWluZyBkZXZpY2UKPj4gPiBhbmQgdGhvc2Ugd29uJ3QgaGVscC4KPj4gPiBJIGhhdmUgYSBzcGkg
ZGV2aWNlIHByb3ZpZGVkIGJ5IE1GRCBmcmFtZXdvcmsgc28gaXQgY2FuIGdvIGF3YXkgYW55dGlt
ZS4KPj4gCj4+IENhbiBpdCBnbyBhd2F5IHBoeXNpY2FsbHkgb3IganVzdCBpbiBzb2Z0d2FyZT8K
PiBTb2Z0d2FyZSwgYnV0IHNpbmNlIHRoaXMgaXMgbWZkIGl0J3MgYmFzaWNhbGx5IGhvdHBsdWcu
IFRoZSBrZXJuZWwgaXMgY3Jhc2hpbmcKPiB3aGVuIEkgc2ltdWxhdGUgaGFyZHdhcmUgZmFpbHVy
ZS4KPj4gCj4+IFVzdWFsbHkgdGhlIHBhdHRlcm4gaXMgdGhhdCB5b3UgbWFrZSBzdXJlIGluIHRo
ZSBkZXZpY2UgZHJpdmVyIHRoYXQgbm9ib2R5IGNhbgo+PiBvcnBoYW4gdGhlIE1URCB3aGlsZSBp
dCBpcyBpbiB1c2UuCj4+IGUuZy4gZHJpdmVycy9tdGQvdWJpL2dsdWViaS5jIGRvZXMgc28uIElu
IF9nZXRfZGV2aWNlKCkgaXQgZ3JhYnMgYSByZWZlcmVuY2Ugb24KPj4gdGhlIHVuZGVybHlpbmcg
VUJJIHZvbHVtZSB0byBtYWtlIHN1cmUgaXQgY2Fubm90IGdvIGF3YXkgd2hpbGUgdGhlIE1URCAo
b24KPj4gdG9wIG9mIFVCSSkgaXMgaW4gdXNlLgo+IAo+IEkgY2FuIHRyeSB0aGF0IGlmIGl0IGhl
bHBzLCBiZWNhdXNlIHdlIGFyZSBzaW11bGF0aW5nIHBvc3NpYmxlIGxvd2VyIGxldmVsCj4gY3Jh
c2guCj4gSW4gYW4gY2FzZSBJIGJlbGlldmUgdGhhdCB0aGUgcHJvcGVyIHJlZmNvdXRpbmcgaXMg
bXVjaCBtb3JlIHJvYnVzdCBzb2x1dGlvbiwKPiB0aGFuIHRoZSBjdXJyZW50IG9uZS4KPiBJJ2Qg
YXBwcmVjaWF0ZSBpZiBzb21lb25lIGNhbiByZXZpZXcgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlv
bi4KClRoaXMgaGFwcGVucyByaWdodCBub3csIEkgdHJ5IHRvIHVuZGVyc3RhbmQgd2h5IGV4YWN0
bHkgdGhlIGN1cnJlbnQgd2F5IGlzIG5vdApnb29kIGluIGVub3VnaC4gOi0pCgpZb3VyIGFwcHJv
YWNoIG1ha2VzIHN1cmUgdGhhdCB0aGUgTVREIGl0c2VsZiBkb2VzIG5vdCBnbyBhd2F5IHdoaWxl
IGl0IGhhcyB1c2VycyBidXQKaG93IGRvZXMgdGhpcyBoZWxwIGluIHRoZSBjYXNlIHdoZXJlIHRo
ZSB1bmRlcmx5aW5nIE1GRCBqdXN0IHZhbmlzaGVzPwpUaGUgTVREIGNhbiBiZSBpbiB1c2UgYW5k
IHRoZSBNRkQgY2FuIGdvIGF3YXkgd2hpbGUgZS5nLiBtdGRfcmVhZCgpIG9yIHN1Y2gKdGFrZXMg
cGxhY2UuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
