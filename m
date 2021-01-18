Return-Path: <SRS0=hsQV=GV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF70C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 11:10:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B337221F8
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 11:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B337221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mY/7fZBnA252k5h2JdCjxR99mv0pqfD2vsgKicnEdag=; b=K8JdDC60J8OYh2ZVqWmcapMn1
	4d8Sly5AXV44K66ELIawPEHnf1DU8Fl6ni+LdH0yqjjvkBclsUM7grgmV6ImwMwOZ1QXkG3Oyj06s
	uiV2PCgBd3z7WuTf4nEJC1JEEoT/g2s0fxS2FyGc0onWSXq5JHfZedmBN2dhhfQkzMv9Ej/ZcJmQT
	7+c7ZJGNexobjWOYLg6enq4C2ZxgVE1C6wEfCu9+9QtglZgalGgs7Knv9RjgPz5mIdnRPBPv30cdD
	zS8+di7ikGqQ8feRs5gNxRVYg+x1xEqMQ80NiA/yC+Xsmlye5WPHBP14xj0lAZAxZVpZ9jYnKxJcW
	kJeP6V/7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1SPW-0003VG-9r; Mon, 18 Jan 2021 11:09:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1SPT-0003UN-8r
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2021 11:09:24 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 37ACE20005;
 Mon, 18 Jan 2021 11:09:18 +0000 (UTC)
Date: Mon, 18 Jan 2021 12:09:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting
 raw payload
Message-ID: <20210118120917.544af10c@xps13>
In-Reply-To: <d3ebfc3c-4842-a506-512a-28c6c02f6c42@geanix.com>
References: <20210104103558.9035-1-miquel.raynal@bootlin.com>
 <7db4b36e-23a6-6075-132c-214d043e78bd@geanix.com>
 <20210104121516.3d50fb58@xps13>
 <d3ebfc3c-4842-a506-512a-28c6c02f6c42@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_060923_413023_F9AE1C96 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VhbiwKClNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4gd3JvdGUgb24gTW9uLCAx
OCBKYW4gMjAyMSAxMjowNzowMQorMDEwMDoKCj4gT24gMDQvMDEvMjAyMSAxMi4xNSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+IEhpIFNlYW4sCj4gPgo+ID4gU2VhbiBOeWVramFlciA8c2VhbkBn
ZWFuaXguY29tPiB3cm90ZSBvbiBNb24sIDQgSmFuIDIwMjEgMTE6NTA6MTAgKzAxMDA6Cj4gPiAg
Cj4gPj4gT24gMDQvMDEvMjAyMSAxMS4zNSwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+PiBP
biBNb24sIDIwMjAtMTItMjEgYXQgMTA6MDA6MTMgVVRDLCBTZWFuIE55ZWtqYWVyIHdyb3RlOiAg
Cj4gPj4+PiBSZS1hZGQgdGhlIG11bHRpcGx5IGJ5IDggdG8gInN0ZXAgKiBlY2NzaXplIiB0byBj
b3JyZWN0IHRoZSBkZXN0aW5hdGlvbiBiaXQgb2Zmc2V0Cj4gPj4+PiB3aGVuIGV4dHJhY3Rpbmcg
dGhlIGRhdGEgcGF5bG9hZCBpbiBncG1pX2VjY19yZWFkX3BhZ2VfcmF3KCkuCj4gPj4+Pgo+ID4+
Pj4gRml4ZXM6IGU1ZTU2MzFjYzg4OSAoIm10ZDogcmF3bmFuZDogZ3BtaTogVXNlIG5hbmRfZXh0
cmFjdF9iaXRzKCkiKQo+ID4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+Pj4+IFJl
cG9ydGVkLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+Cj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+ICAKPiA+Pj4gQXBw
bGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
dGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgo+ID4+Pgo+ID4+PiBNaXF1ZWwgIAo+ID4+
IEhpIE1pcXVlbAo+ID4+Cj4gPj4gV2lsbCB5b3UgcGxlYXNlIHF1ZXVlIHRoaXMgZm9yIGZpeGVz
PyBJdCdzIHF1aXRlIHJlbGV2YW50IGZvciA1LjEwIExUUyA6KSAgCj4gPiBSaWdodCwgdGhhdCB3
aWxsIGJlIHF1aWNrZXIgdG8gaGF2ZSBpdCBpbiBMaW51cycgdHJlZS4gSSBtb3ZlZAo+ID4gdGhl
IHBhdGNoIHRvIHRoZSBtdGQvbmV4dCBicmFuY2guCj4gPiAgCj4gSGkgTWlxdWVsLAo+IAo+IEFu
eSBndWVzcyB0byB3aGVuIHRoZSBtdGQvZml4ZXMgYnJhbmNoIHdpbGwgYmUgcHVsbGVkIGludG8g
TGludXMnIHRyZWU/Cj4gCj4gL1NlYW4KCkl0IHNob3VsZCBiZSBpbiBsaW51eC1uZXh0IGFscmVh
ZHksIEkgaG9wZSB0byBjb2xsZWN0IGFuIG90aGVyCmltcG9ydGFudCBmaXggdGhpcyB3ZWVrIGJl
Zm9yZSByZXF1ZXN0aW5nIGEgbWVyZ2Ugb2YgdGhlIG10ZC9maXhlcwpicmFuY2ggZm9yIHRoZSBu
ZXh0IC1yYy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
