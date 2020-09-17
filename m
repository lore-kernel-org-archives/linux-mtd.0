Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DF9C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E38BC22210
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1zSQyxkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E38BC22210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=owLNA82YqGiX9lfNFCpz4CTwv12qmmvqxsKIprtq+go=; b=1zSQyxkm5nLdfEFhP8cI2xQNg
	gRTfc4/P0l1SAswJvPchjYztt0BEaTRH2LorQdbR7JehwXVFbarQ0qXKhtf5sHNIGLcYSg5nfbSF9
	bVjlCG7BqdEh8LB2CugVZB5ZFodCDIbO+u6VZU1kjeF3iCF2/mJABQOO0Yj+yOIT6RMacE5+/FVcW
	2qHeYkTSYuDcz+NcZIVfamHAUjdweQNjZuy/UiWcZoGf7NGHJiXozldFyjqrZILNmIGmAldfcH+fx
	JMg0dORuyv1RU6ern3HnoqWKPKZVu/F3WLmJ3kRV7a1izGeo4EwL/kbtcccacwkW1i7SfZuTxj+zX
	zETO0xFcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIwXJ-00017F-2Z; Thu, 17 Sep 2020 16:13:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIwXE-00016N-Q8
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 16:13:27 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 200F520004;
 Thu, 17 Sep 2020 16:13:19 +0000 (UTC)
Date: Thu, 17 Sep 2020 18:13:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20200917181318.3fd9965d@xps13>
In-Reply-To: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_121324_942931_CD534D1B 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFdl
ZCwgMTYgU2VwIDIwMjAgMTA6NDk6MDMKLTAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBhIGlt
eDI3LXBoeXRlYy1waHljYXJkLXMtcmRrICBib2FyZCBydW5uaW5nIGxpbnV4LW5leHQsIHRoZQo+
IGZvbGxvd2luZyB3YXJuaW5nIGlzIHNlZW46Cj4gCj4gMTA6MTU6MjYuMjMyMDY5ICAtLS0tLS0t
LS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiAxMDoxNToyNi4yMzI4ODAgIFdBUk5JTkc6
IENQVTogMCBQSUQ6IDEgYXQKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYzo1MjQy
IG5hbmRfc2Nhbl93aXRoX2lkcysweDliYy8weDEwMDgKPiAxMDoxNToyNi4yNDExMzIgIFVuc3Vw
cG9ydGVkIEVDQyBhbGdvcml0aG0hCj4gCj4gSSBiZWxpZXZlIGl0IGhhcyBiZWVuIGNhdXNlZCBi
eSA3NGE4OWQ3ZjllZDcgKCJtdGQ6IHJhd25hbmQ6IFVzZSB0aGUKPiBFQ0MgZnJhbWV3b3JrIHVz
ZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPiAKPiBJdHMgZHRzIHVzZXMgbmFuZC1lY2MtbW9kZSA9
ICJodyIgOgo+IAo+ICZuZmMgewo+IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gcGluY3Ry
bC0wID0gPCZwaW5jdHJsX25mYz47Cj4gbmFuZC1idXMtd2lkdGggPSA8OD47Cj4gbmFuZC1lY2Mt
bW9kZSA9ICJodyI7Cj4gbmFuZC1vbi1mbGFzaC1iYnQ7Cj4gc3RhdHVzID0gIm9rYXkiOwo+IH07
Cj4gCj4gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGlzIGhhcmR3YXJlLCBidXQgSSBzYXcgdGhl
IHJlcG9ydCBieSB0aGUKPiBQZW5ndXRyb25peCBsYWIgaW4ga2VybmVsY2k6Cj4gaHR0cHM6Ly9z
dG9yYWdlLmtlcm5lbGNpLm9yZy9uZXh0L21hc3Rlci9uZXh0LTIwMjAwOTE2L2FybS9pbXhfdjRf
djVfZGVmY29uZmlnL2djYy04L2xhYi1wZW5ndXRyb25peC9iYXNlbGluZS1pbXgyNy1waHl0ZWMt
cGh5Y2FyZC1zLXJkay5odG1sCj4gCj4gQW55IGlkZWFzPwoKVGhhbmtzIGZvciB0aGUgcmVwb3J0
LCBJIGRvbid0IGtub3cgd2hhdCBpcyBoYXBwZW5pbmcgeWV0IGJ1dCBJJ2xsCmludmVzdGlnYXRl
LgoKQXMgSSdsbCBiZSBvZmYgbmV4dCB3ZWVrLCBpdCBtaWdodCB0YWtlIGEgYml0IGxvbmdlciB0
aGFuIGV4cGVjdGVkCnRvIHNlZSB0aGlzIHNvbHZlZCBpZiBJIGRvbid0IGNvbWUgdXAgd2l0aCBz
b21ldGhpbmcgYnkgdG9tb3Jyb3cuLi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
