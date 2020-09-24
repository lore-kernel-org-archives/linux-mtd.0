Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB16C4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 10:29:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8E523741
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 10:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neOtp2hG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8E523741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=juM8vO4IH/edwpkLcJ0p+lGkTE87x4FRhW1ZkeNIQpU=; b=neOtp2hGYHX0HZbAT1LU+EKjM
	UI5a5WXCIZ1uiiJGz2ukxtzL/caQtoRy+/0OTyo/ytjfTG01b4vFezwYsAUO4D8QFEkxSycd9n3qg
	td/pEskS2gv7CW+onIl+Gk6xzJPwWXqbBgHzZUVJ6hp+LboadAs/zav2SeM9yn+/7JR0SukMKKCA8
	9V4Y8SrYKXzo7gZswyzfZhDzasJCDOKi6PObCCaZEUwCEwyfOVp890HT3gfPnTOWHXwZwbAPK6kKp
	lb5fJFYULE/zTmdVEWkCB/L0XQyUKhwomIJ/nMeHvrJZ957E2VbdsI7b/LKGZHermEiU4mEDvdrxa
	c+IVt7qIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLOUE-0004nq-Rj; Thu, 24 Sep 2020 10:28:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLOUC-0004mu-0v
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 10:28:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 56A686125F21;
 Thu, 24 Sep 2020 12:28:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mR70vCVLlb_o; Thu, 24 Sep 2020 12:28:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 00DB56125F2E;
 Thu, 24 Sep 2020 12:28:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WvtoFTCJ-dAH; Thu, 24 Sep 2020 12:28:12 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C8A246125F21;
 Thu, 24 Sep 2020 12:28:12 +0200 (CEST)
Date: Thu, 24 Sep 2020 12:28:12 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <1766570234.127585.1600943292686.JavaMail.zimbra@nod.at>
In-Reply-To: <47db6371-19f5-c478-6f02-bb36fa378059@pengutronix.de>
References: <20181222124008.28046-1-ken@kenjo.org>
 <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
 <6672633.KqxhzBgVKO@blindfold> <20190104095302.236a19dc@bbrezillon>
 <48ea6042-943a-03b5-dfde-b68a0b223c49@pengutronix.de>
 <CAFLxGvzcq-6PS9xGztxcf8YxoTs4ggZVX+LFLw4StAnFLASa+A@mail.gmail.com>
 <47db6371-19f5-c478-6f02-bb36fa378059@pengutronix.de>
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable
 subpage writes.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Add support to disable subpage writes.
Thread-Index: SO0aWIEWm38XWA5ui9x1eq+46Sgrrw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_062824_171645_2FE5BEAC 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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
Cc: Kenneth Johansson <ken@kenjo.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IERvaCEgVGhhbmtzIGZvciB0aGUgaW5w
dXQsIHRoaXMgaXMgdGhlIG9wdGlvbiBJIG5lZWRlZCB0byBwcm9wZXJseSBhdHRhY2ggdGhlCj4g
VUJJISBcby8KCjotKQoKPj4gVGhpcyBpcyB0aGUgd2F5IEkgZGVhbCB3aXRoIHN1YnBhZ2UgImlz
c3VlcyIgd2hlbiBpbnNwZWN0aW5nIHViaS91Ymlmcwo+PiBpbWFnZXMgb24gbmFuZHNpbS4KPiAK
PiBPbmUgcXVlc3Rpb24gKHJhdGhlciBhY2FkZW1pYywgSSBkb24ndCB3YW50IHRvIGRvIHRoYXQp
OiBEb2VzIHRoZSBVQkkvVUJJRlMgZG8KPiBzdWItcGFnZSB3cml0ZXMgb24gdGhlIG5hbmRzaW0/
IElzIHRoZSByZXN1bHRpbmcgTkFORCBpbWFnZSBzdGlsbCBjb21wYXRpYmxlIGlmCj4gSSB3cml0
ZSBpdCB0byB0aGUgb3JpZ2luYWwgZGV2aWNlLCB0aGF0IGRvZXNuJ3QgZG8gc3VicGFnZSB3cml0
ZXM/CgpTaW5jZSBuYW5kc2ltIGFubm91bmNlcyBzdWJwYWdlcywgVUJJIHdpbGwgdXNlIHRoZW0u
IEV4Y2VwdCB5b3UgZGVmaW5lIHlvdXIgb3duClZJRCBoZWFkZXIgb2Zmc2V0LgpVQklGUyBkb2Vz
IG5vdCB1c2Ugc3VicGFnZXMgYXQgYWxsIGFuZCBVQkkgb25seSBmb3IgVklEIGhlYWRlcnMgdG8g
YmUgbW9yZSBzdG9yYWdlCmVmZmljaWVudC4KClNvLCB1YmlhdHRhY2ggLU8gc2hvdWxkIGNvbXBs
ZXRlbHkgZnVsZmlsbCB5b3VyIG5lZWRzLgoKSWYgYWxsIG90aGVyIHBhcmFtZXRlcnMgb2YgdGhl
IE5BTkQgbWF0Y2gsIGFuZCBJIGd1ZXNzIHNvLCBvdGhlcndpc2UgdWJpYXR0YWNoCndvdWxkIG5v
dGljZSwgdGhlIFVCSSBpbWFnZSBzaG91bGQgYWxzbyB3b3JrIG9uIHRoZSB0YXJnZXQuCk1vZHVs
byBmYXN0bWFwLCBpZiB5b3UgaGF2ZSBiYWQgYmxvY2tzLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
