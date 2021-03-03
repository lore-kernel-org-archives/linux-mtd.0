Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA25EC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:55:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4817564EE7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4817564EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DpWXPa4JS3SPgxDqZYmLvsmcQwUrhwv6pXpHPtgxZSY=; b=L/N/g/7l30PUYcJQio/jjVMYl
	kx0t29bxmlinR7DybgQUlFKKQopR857+tJjxosS+fuw/nM9Lruzy7v0R4okTuiogr+voCLYdUGNH5
	5iRxvsEIJtXnhkv6+5RLCuc9DSvVqsl/GNrHXVbEQ5xkKNztYXzIrAKnriQXVOF70wEFtzHXfmTw2
	9pRCdhCmglKygRCpl4f+fJU6ubbgfnnickn08h+b5p0XwV4+eaVdKwgDjbM8EbL6b78uMUk+sd44K
	Szwhdzx0PxNkac5rn7T+HBsuT63haqhaIFOR4yu+alkFQewXPgc0AYEUrk2mAycTigLK+Tr+AMlyx
	ZwOpFS0Sg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWcs-0066Jk-Lj; Wed, 03 Mar 2021 18:53:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1t-005HVz-DX
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=LUweuJlFXWF8/yUQAu+ZXTJM7c0laNBoOBA58LifAQg=; b=l/D2m6hM/wZBNlHp+3EgiRbldg
 CHVBYeWkp5a/y+jKKNYibMUnVchGEWoZj0Tcr0Xe2uVt6Re26jt1FocNXk9XuCgEu1ubZCf6PfB+x
 +C371tS9T4DjJPnittoO7bYUqJzrbjIq1qs53qIacMwHuvJQLA9OL3qSqrBMlETVijSEgqeXbHQQR
 Q5ItxDLNr0XmCUQzTKt8EXT1IOhw2d5P6nHnbmXVP75tZ1zFmvhduuldJBzdtAgjqONV4DIyfJXAN
 oVZohgCNxA6ZceSdAQNY1BYC8EyrUMBP6QRr9e6cOSCWUfqJTeGYlv/vZW6tfprWpH1QlNVifrl+Q
 rll5MS2Q==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHMUP-001lEw-H6
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 08:04:18 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8AF5DE0015;
 Wed,  3 Mar 2021 08:03:43 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:03:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: richard@nod.at, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH 0/2] Handle probe defer properly in MTD core
Message-ID: <20210303090342.635130fb@xps13>
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_080418_466486_4706AEB8 
X-CRM114-Status: GOOD (  12.11  )
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

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFR1ZSwKMiBNYXIgMjAyMSAxODo1Nzo1NSArMDUzMDoK
Cj4gSGVsbG8sCj4gCj4gVGhlc2UgdHdvIHBhdGNoZXMgYWltcyBhdCBmaXhpbmcgdGhlIC1FUFJP
QkVfREVGRVIgaGFuZGxpbmcgaW4gdGhlIE1URAo+IGNvcmUgYW5kIGFsc28gaW4gdGhlIFFjb20g
bmFuZCBkcml2ZXIuIFRoZSAicWNvbXNtZW0iIHBhcnNlciBkZXBlbmRzIG9uCj4gdGhlIFFDT01f
U01FTSBkcml2ZXIgdG8gcGFyc2UgdGhlIHBhcnRpdGlvbnMgZGVmaW5lZCBpbiB0aGUgc2hhcmVk
Cj4gbWVtb3J5LiBEdWUgdG8gdGhlIERUIGxheW91dCwgdGhlIFNNRU0gZHJpdmVyIG1pZ2h0IHBy
b2JlIGFmdGVyIHRoZSBOQU5ECj4gZHJpdmVyLiBJbiB0aGF0IGNhc2UsIHRoZSAtRVBST0JFX0RF
RkVSIHJldHVybmVkIGJ5IHFjb21fc21lbV9nZXQoKSBpbgo+IHRoZSBwYXJzZXIgd2lsbCBmYWls
IHRvIHByb3BhZ2F0ZSB0aWxsIHRoZSBkcml2ZXIgY29yZS4gU28gdGhpcyB3aWxsCj4gcmVzdWx0
IGluIHRoZSBwYXJ0aXRpb25zIG5vdCBnZXR0aW5nIHBhcnNlZCBldmVuIGFmdGVyIHRoZSBTTUVN
IGRyaXZlciBpcwo+IGF2YWlsYWJsZS4KPiAKPiBTbyBmaXggdGhpcyBpc3N1ZSBieSBoYW5kbGlu
ZyB0aGUgLUVQUk9CRV9ERUZFUiBlcnJvciBwcm9wZXJseSBpbiBib3RoCj4gTVREIGNvcmUgYW5k
IGluIHRoZSBRY29tIG5hbmQgZHJpdmVyLiBUaGlzIGlzc3VlIGlzIG9ic2VydmVkIG9uIFFjb20g
U0RYNTUKPiBiYXNlZCBUZWxpdCBGTjk4MCBFVkIgYW5kIGluIFNEWDU1LU1UUC4KCkFwcGxpZWQg
bWFudWFsbHkgb24gdG9wIG9mIG5hbmQvbmV4dCBhcyBpbmZyYWRlYWQub3JnIGlzIGRlYWQgYXQg
dGhlCm1vbWVudCBhbmQgdGhlIHBhdGNoZXMgd2VyZSBub3QgY29sbGVjdGVkIGJ5IHBhdGNod29y
ay4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
