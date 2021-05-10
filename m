Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5134C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:00:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07575613B6
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07575613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLTGOYBChw7Ju9DeDZsXHIOv6cjTlhmSELkKU7KXfUo=; b=pinFPI/bgXVyu+1+8xDYRqgPK
	4c82jCXwTgseHChH3NFxSaAvWIMHR0D+30LI+u6hYHgaExTyqhs6aREJlFUbuUZeSq/rQj1/T+XBI
	fYXXTm6DPxxRJ/51nHbLWcoHplRrSn+L6YnxiRX4QiSAifiQR1UxcXSK8QA0fQuyHDHoQ5RgiWrNA
	72k0ZmBsNbbWquuod1bEea6Yz1OUdd8JA2jzvfUQR7CCky/G+md50NsyQQaeRimTNKCQVLgv4YMHC
	kuaX4jqe7BRwed4w6VQn6gNZ9s2LzVi//X9hM27v7I8BSP85mCvPkGOLex4/yDroiw26xk+26xBUR
	pnbb83g2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg0p4-00Da0n-IG; Mon, 10 May 2021 07:59:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0ow-00Da0T-Nq
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 07:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=rCgolsZJq0C9FetG19jEaqtyCkrKpRfHuM4mFMiAMv0=; b=TV6mr1EuIc5K1Nlytv09Qn/hox
 QHk+YU0ouyFvV0s9OuSSKJQCNg4TmfBCUsp8IWJ3oQN/ktml/vraXATbGiGfxmTiDfybHrGGvdNaX
 uIgqbi35RYLzjx/JFTpU/mlLWUKXeylJGhbwcSyQIBtUKGyWVoz3JynxmL4RJmDwm3MP9hiBMMFMw
 bMVIFXjknoINfYQVkHhtN0SWL9FiJX8K6F4dYAhrgRtd2fWxEbO5Nz+3Nej4Qjjy8MOWxogI+9gs0
 MY4gha3hgI8dKiXwkjIp78dDiJGOlX6lv2HHZtwIn2NTUC4MrNnn0V2TrsOr85PvM6fs3gwZXA+MJ
 I/IpzBlg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0os-008OPY-RX
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 07:59:16 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CECC96000B;
 Mon, 10 May 2021 07:59:08 +0000 (UTC)
Date: Mon, 10 May 2021 09:59:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kasi viswanathan <kviswanathan.83@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash Write protection
Message-ID: <20210510095907.0c4ae196@xps13>
In-Reply-To: <CAMmihzqVhm49oGCYbkFmCFaYAX57xU5yVZm6hn3OCmuk1jBSSg@mail.gmail.com>
References: <CAMmihzqVhm49oGCYbkFmCFaYAX57xU5yVZm6hn3OCmuk1jBSSg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_005915_049831_5FCB85A9 
X-CRM114-Status: GOOD (  15.86  )
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

SGkga2FzaSwKCmthc2kgdmlzd2FuYXRoYW4gPGt2aXN3YW5hdGhhbi44M0BnbWFpbC5jb20+IHdy
b3RlIG9uIFNhdCwgOCBNYXkgMjAyMQowOTo0OTo1OCArMDUzMDoKCj4gSGkgYWxsLAo+IAo+IElu
IG9uZSBvZiBvdXIgY3VycmVudCBib2FyZHMgd2UgYXJlIHVzaW5nIE1pY3JvbiBOQU5EIGZsYXNo
IG9mIFNpemUgNTEyTUIuCj4gU29tZXRpbWVzIHRoZSBmaXJzdCBwYWdlICg0aykgZ2V0cyBjb3Jy
dXB0ZWQgYW5kIHRoZSBib2FyZCBnZXRzIGJyaWNrZWQuCgpJIHRoaW5rIHRoaXMgaXMgeW91ciBy
ZWFsIGlzc3VlLiBJIGFtIG5vdCBzdXJlIHRyeWluZyB0byBsb2NrIHRoZSBmbGFzaAppcyB0aGUg
cmlnaHQgdGhpbmcgdG8gZm9jdXMgb24sIHVuZGVyc3RhbmRpbmcgd2h5IGl0IGdldHMgYnJpY2tl
ZCBzZWVtcwptb3JlIGxlZ2l0aW1hdGUgdG8gbWUuCgo+IFdlIGhhdmUgc3RvcmVkIHRoZSBib290
bG9hZGVyIGF0IHRoaXMgbG9jYXRpb24uCj4gCj4gQXMgYSBwcmV2ZW50aXZlIG1lYXN1cmUgd2Ug
aGF2ZSBhZGRlZCByZWFkLW9ubHkgYW5kIGxvY2sgZmxhZ3MgaW4gdGhlIGR0YiBlbnRyeS4KPiAK
PiBNeSBxdWVyeSBpcywgSXMgaXQgcG9zc2libGUgdG8gbG9jayBhIHBhcnRpY3VsYXIgYmxvY2sg
b2YgTkFORCBmbGFzaAo+IG1lbW9yeSBpbiBsaW51eCA/CgpJIGRvbid0IHRoaW5rIHRoaXMgY2Fw
YWJpbGl0eSByZWFsbHkgYmVsb25ncyB0byBMaW51eC4gVGhlIHJpZ2h0CnF1ZXN0aW9uIGlzLCBp
cyB5b3VyIE5BTkQgZmxhc2ggY2FwYWJsZSBvZiB0aGF0PyBJIGtub3cgdGhhdCBNYWNyb25peApm
bGFzaGVzIGhhdmUgYSBzcGVjaWZpYyBhZGRpdGlvbmFsIGxvY2svdW5sb2NrIGZlYXR1cmUgdGhh
dCBpcwp1cHN0cmVhbSwgYnV0IHRoZXJlIGlzIG5vIE1pY3JvbiBzdXBwb3J0IGZvciB0aGF0IHll
dC4gWW91IGNhbiBhZGQgaXQKdGhvdWdoIGlmIGl0IGV4aXN0cyB3aXRoIE1pY3JvbidzIGRldmlj
ZXMgdGhyb3VnaCB0aGUKLT57bG9jayx1bmxvY2t9X2FyZWEoKSBob29rcy4KCj4gSSB1bmRlcnN0
b29kIGFmdGVyIGdvb2dsaW5nIHRoYXQgYSBzcGVjaWZpYyBIL1cgcGluIHN1cHBvcnQgaXMgbmVl
ZGVkCj4gdG8gYWNoaWV2ZSB0aGlzICJQb3dlci1VcCAgUmVhZCAgRW5hYmxlLCAgTG9jay9Vbmxv
Y2sgIEVuYWJsZShQUkwpIgoKVGhlcmUgaXMgaW5kZWVkIGEgV1AgKFdyaXRlIFByb3RlY3QpIHBp
biB3aGljaCBwcmV2ZW50cyB3cml0ZXMgYW5kCmVyYXN1cmVzIG92ZXIgdGhlIGVudGlyZSBjaGlw
IHRoYXQgeW91IGNhbiB1c2UgdG8gcHJvdGVjdCB0aGUgY29udGVudApvZiB5b3VyIGNoaXAuIEJ1
dCB0aGF0IHdvbid0IHdvcmsgaWYgeW91IHVzZSBlZy4gVUJJRlMgb24gdG9wIG9mIGl0IGFzCml0
IHdpbGwgbmVlZCB3cml0ZSBhY2Nlc3MgYXQgc29tZSBwb2ludC4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
