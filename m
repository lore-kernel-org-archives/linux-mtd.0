Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EABC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 09:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855D860FD7
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 855D860FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBh2GhS1xKZ4HnKIYkF746L4fkbqlQjQJrM+LtOh9cM=; b=N7eT9i2pUTE5rH
	VXFd6EA3yJZTWd3LRQRf+FKyGeuUB2O5/MaLQHQJCzKQBTZHhZUCHtG+ya69SAyF9Ux797D4G08yv
	Wbru32dg8wTjhIa9cLMiieUzzb50eJW6MYfL1oEMvUsv/2clvlafm3GwakzLqdBUoNWPAnfWiNm+F
	NRsWaR/tDuxXujNR5H996ygeTwpaiBbDpA3Plwxrczu02sq9kBvOyM1SgJH6dmCH6Qs5Nc8FDFfTT
	cTd59HcoPak8fWbPeBWKwONF28p0+1dlcwV779h+ROL4WtWkXAdi/XNXh6tpkhAYryFhv7FZP6IAx
	0rcR+JrJa5wlnizjYmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI5nT-00G1aW-3T; Mon, 23 Aug 2021 08:59:11 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI5nP-00G1ZW-Ox
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 08:59:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 59D6040005;
 Mon, 23 Aug 2021 08:59:05 +0000 (UTC)
Date: Mon, 23 Aug 2021 10:59:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marion et Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: cafe: Fix a resource leak in the error
 handling path of 'cafe_nand_probe()'
Message-ID: <20210823105904.3d01c688@xps13>
In-Reply-To: <332872880.718.1629708519896.JavaMail.www@wwinf1d09>
References: <20210823083533.9576-1-miquel.raynal@bootlin.com>
 <332872880.718.1629708519896.JavaMail.www@wwinf1d09>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_015907_983890_AC7C56C4 
X-CRM114-Status: GOOD (  13.72  )
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

SGkgQ2hyaXN0b3BoZSwKCitNTAoKTWFyaW9uIGV0IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0
b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlIG9uCk1vbiwgMjMgQXVnIDIwMjEgMTA6NDg6
MzkgKzAyMDAgKENFU1QpOgoKPiBIaSwKPiAKPiBqdXN0IG5vdGljZWQgYSB0eXBvIGluIG15IHBh
dGNoIDogcy9vdXIvb3V0LyBpbiB0aGUgbGFiZWzCoAo+IAo+IENhbiB5b3UgZml4IGl0IGJlZm9y
ZSBpdCBsZWF2ZXMgeW91ciB0cmVlPwoKWWVwLCBkb25lIQoKPiAKPiBDSgo+IAo+IMKgCj4gCj4g
wqAKPiAKPiA+IE1lc3NhZ2UgZHUgMjMvMDgvMjEgMTA6MzUKPiA+IERlIDogIk1pcXVlbCBSYXlu
YWwiIAo+ID4gQSA6ICJDaHJpc3RvcGhlIEpBSUxMRVQiICwgbWlxdWVsLnJheW5hbEBib290bGlu
LmNvbSwgcmljaGFyZEBub2QuYXQsIHZpZ25lc2hyQHRpLmNvbSwgYm9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20sIGxlZS5qb25lc0BsaW5hcm8ub3JnLCBzZWdoZXJAa2VybmVsLmNyYXNoaW5n
Lm9yZywgZHdtdzJAaW5mcmFkZWFkLm9yZwo+ID4gQ29waWUgw6AgOiBsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywga2VybmVsLWphbml0
b3JzQHZnZXIua2VybmVsLm9yZwo+ID4gT2JqZXQgOiBSZTogW1BBVENIXSBtdGQ6IHJhd25hbmQ6
IGNhZmU6IEZpeCBhIHJlc291cmNlIGxlYWsgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggb2Yg
J2NhZmVfbmFuZF9wcm9iZSgpJwo+ID4gCj4gPiBPbiBTYXQsIDIwMjEtMDgtMjEgYXQgMDc6NTg6
NDUgVVRDLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6ICAKPiA+ID4gQSBzdWNjZXNzZnVsICdp
bml0X3JzX25vbl9jYW5vbmljYWwoKScgY2FsbCBzaG91bGQgYmUgYmFsYW5jZWQgYnkgYQo+ID4g
PiBjb3JyZXNwb25kaW5nICdmcmVlX3JzKCknIGNhbGwgaW4gdGhlIGVycm9yIGhhbmRsaW5nIHBh
dGggb2YgdGhlIHByb2JlLCBhcwo+ID4gPiBhbHJlYWR5IGRvbmUgaW4gdGhlIHJlbW92ZSBmdW5j
dGlvbi4KPiA+ID4gCj4gPiA+IFVwZGF0ZSB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBhY2NvcmRp
bmdseS4KPiA+ID4gCj4gPiA+IEZpeGVzOiA4YzYxYjdhN2Y0ZDQgKCJbTVREXSBbTkFORF0gVXNl
IHJzbGliIGZvciBDQUbDiSBFQ0MiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpB
SUxMRVQgICAKPiA+IAo+ID4gQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgo+ID4g
Cj4gPiBNaXF1ZWwKPiA+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
