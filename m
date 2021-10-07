Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F48C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 20:49:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC0260FDC
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 20:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BC0260FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f7tTlR0Sdo/cCM+XfFctSTCD7Dm4xrkg08N94xO9rGM=; b=Kx3yH8orabU3y6pghqKSdjTx18
	m/RP1JYrzWpKlTIomZbNaLLS3sAp2sapueLLwDL88ekSEdIWHCXTbzIT8gC/qv99/OdxSOI8JC5vf
	1l1RS9WZ7HQq23N06pEcob0Hun3Ema9hl4BujPR7a1nXPg8ozsdFQzopNGSMx3LD9lbSq9xWHIOJq
	HfN3602c/8Ti7yCQuTt6I7sneZXtiT8Cej3hA61icJofK/beurHyzpcRvwnTPwKnCn9oIbAKQMzqN
	3S1xkRiGMJgeLQnPZurixfh3hNy1l4OjzHbgeZ3cApH6xqDQJoqu5muoO1A8QmZvuejKRjyfdPmfJ
	nLCbDgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYaJl-000iEz-WC; Thu, 07 Oct 2021 20:48:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYaJi-000iDO-S1
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 20:48:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1D83160F6B67;
 Thu,  7 Oct 2021 22:48:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id j6-AP7ZFCv8e; Thu,  7 Oct 2021 22:48:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 864B160F6B6A;
 Thu,  7 Oct 2021 22:48:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eiwMgk_1dPfS; Thu,  7 Oct 2021 22:48:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 38F8B60F6B67;
 Thu,  7 Oct 2021 22:48:36 +0200 (CEST)
Date: Thu, 7 Oct 2021 22:48:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Message-ID: <1766448751.48215.1633639715945.JavaMail.zimbra@nod.at>
In-Reply-To: <20211007174510.tctkyrbvks7vjzjx@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
 <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
 <20211007135401.4z3gcunwr2uq7fpx@lug-owl.de>
 <135911793.46658.1633616346904.JavaMail.zimbra@nod.at>
 <20211007142617.3hgjddbbvcowzgc3@lug-owl.de>
 <940617141.46853.1633620047008.JavaMail.zimbra@nod.at>
 <20211007174510.tctkyrbvks7vjzjx@lug-owl.de>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: PING: [PATCH] Don't overflow when writing a key
Thread-Index: QL5Nnge+D7+0LBgycAf7t9MQ+Htb4Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_134839_079512_CF5F093F 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkphbi1CZW5lZGljdCBHbGF3
IiA8amJnbGF3QGx1Zy1vd2wuZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
Q0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJBcnRlbSBC
aXR5dXRza2l5IiA8YXJ0ZW0uYml0eXV0c2tpeUBsaW51eC5pbnRlbC5jb20+Cj4gR2VzZW5kZXQ6
IERvbm5lcnN0YWcsIDcuIE9rdG9iZXIgMjAyMSAxOTo0NToxMAo+IEJldHJlZmY6IFJlOiBQSU5H
OiBbUEFUQ0hdIERvbid0IG92ZXJmbG93IHdoZW4gd3JpdGluZyBhIGtleQoKPiBPbiBUaHUsIDIw
MjEtMTAtMDcgMTc6MjA6NDcgKzAyMDAsIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+IHdyb3RlOgo+PiA+IFNvIC4uLiAgVGhlIGNvZGUgZG9lcyBfbm90XyBvdmVyZmxvdywgdGhh
dCdzIGdvb2QgZmlyc3Qgb2YgYWxsLiBJdCdzCj4+ID4ganVzdCBhIGJpdCBjb25mdXNpbmcgaG93
IHRoZSBrZXkgYnl0ZXMgYXJlIHdyaXR0ZW4gdG8gdGhlIGJ1ZmZlci4gQXQKPj4gPiBsZWFzdCBJ
IHdhcyBlYXNpbHkgZGlzdHJhY3RlZCBieSB0aGUgdHdvIGRpZmZlcmVudCBzaXplcy4KPj4gCj4+
IElmIHlvdSBmaW5kIGEgYmV0dGVyIHdheSB0byB3cml0ZSB0aGUgZnVuY3Rpb24sIEknbSBhbGwg
b3BlbiBmb3IgYSBwYXRjaC4KPj4gQnV0IHBsZWFzZSBtYWtlIHN1cmUgdGhlIGdlbmVyYXRlZCBj
b2RlIGlzIHNhbmUuCj4gCj4gVGhhdCB3b3VsZG4ndCBiZSB0ZXJyaWJseSBjb21wbGljYXRlZCwg
YnV0IEkgaGF2ZSBubyB3YXkgdG8gYWN0dWFsbHkKPiAqdGVzdCogdGhhdC4gIEl0J3MganVzdCBh
biBpc3N1ZSBJIGZvdW5kIHdoaWxlIGRvaW5nIG1hc3MtYnVpbGRzIGZvcgoKWW91IGNhbiB0ZXN0
IGl0LgoKJCBtb2Rwcm9iZSBuYW5kc2ltCiQgbW9kcHJvYmUgdWJpCiQgbW9kcHJvYmUgdWJpZnMK
JCB1YmlhdHRhY2ggLW0wCiQgdWJpbWt2b2wgLW0gLU4gdGVzdCAvZGV2L3ViaTAKJCBtb3VudCAt
dCB1YmlmcyAvZGV2L3ViaTBfMCAvbW50CgpOb3cgeW91IGhhdmUgYSBzaGlueSB1YmlmcyBvbiAv
bW50LiA6LSkKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
