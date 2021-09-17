Return-Path: <SRS0=wNtg=OH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0ADC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 19:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9EEC61100
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 19:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9EEC61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMRSAJ/Sy5FU1nMnQm26wMGTsy7yAq51OxnTAa7psPI=; b=pn5L2pdOZ+FDG1
	BKcmo9gx98cfv28TFuHrqAdzVJeEZvPuWs+g+7uWNaaM3gAfXk6B3GCShNXxI9nhtN+m9gOt6DwrZ
	DndOIfHWhDzxEOOQNSS8fr7TyJ5q4cJ44r5AENEpo/+KVwra+pIo6oxfd4LXmqYredCrFhpjOw4je
	h5v7n7cySExWvQGNx1AoAByIafmYmccJh8YqbJO+KwLH712qfS49UCSsEmrdkv1yfWMSv4hof164P
	mLNONZdpo3n3x8mOicuaq/2gUhRhepEce3kwy3VwkQ6d1knsPOCdhJUn3TvpKahILxH8MXbWQwk63
	QlcByrd7023S7HJhb23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRJbT-00EvzP-6q; Fri, 17 Sep 2021 19:32:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRJbQ-00EvyK-3M
 for linux-mtd@lists.infradead.org; Fri, 17 Sep 2021 19:32:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D87EE1BF209;
 Fri, 17 Sep 2021 19:32:47 +0000 (UTC)
Date: Fri, 17 Sep 2021 21:32:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jan Hoffmann <jan@3e8.eu>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210917213246.319e60cb@xps13>
In-Reply-To: <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu>
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
 <20210917190154.76203a9a@xps13>
 <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_123252_320253_FFA3B475 
X-CRM114-Status: GOOD (  15.00  )
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

SGkgSmFuLAoKamFuQDNlOC5ldSB3cm90ZSBvbiBGcmksIDE3IFNlcCAyMDIxIDE5OjQ1OjMzICsw
MjAwOgoKPiBIaSBNaXF1w6hsLAo+IAo+ID4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHlv
dXIgbWVzc2FnZSBhcyBhbnN3ZXIgdG8gdGhpcyB0aHJlYWQuCj4gPiBUaGVyZSBhcmUgdHdvIHBy
b2JsZW1zIGhlcmU6Cj4gPiAxLyBUaGUgRFQgdmFsdWVzIG5vdCBiZWluZyB0YWtlbiBpbnRvIGFj
Y291bnQgIAo+IAo+IFRoaXMgaXMgdGhlIGlzc3VlIEknbSByZWZlcnJpbmcgdG8uCj4gCj4gPiAx
LyBIYXMgYWxyZWFkeSBiZWVuIGZpeGVkIChhdCBsZWFzdCB0aGF0IGlzIHdoYXQgSSB0aGluaykg
IAo+IAo+IFRoaXMgaXMgbm90IGZpeGVkIGluIGtlcm5lbCA1LjEwLiBBbmQgdW5sZXNzIEkgYW0g
bWlzc2luZyBzb21ldGhpbmcKPiB0aGVyZSBhbHNvIGRvZXNuJ3Qgc2VlbSBiZSBhIGZpeCBpbiBt
b3JlIHJlY2VudCBrZXJuZWxzLgo+IAo+IEkgYW0gYXdhcmUgb2YgY29tbWl0IDMzZDk3NGU3NmUy
MSAoIm10ZDogcmF3bmFuZDogeHdheTogRG8gbm90IGZvcmNlIGEKPiBwYXJ0aWN1bGFyIHNvZnR3
YXJlIEVDQyBlbmdpbmUiKSwgYnV0IHRoYXQgb25seSBmaXhlcyB0aGUgRUNDCj4gYWxnb3JpdGht
LiBUaGUgRUNDIGVuZ2luZSB0eXBlIGlzIHN0aWxsIGhhcmQtY29kZWQgaW4geHdheV9hdHRhY2hf
Y2hpcC4KClllcyB0aGlzIHdhcyBteSB1bmRlcnN0YW5kaW5nLCB0aGF0IG9ubHkgc29mdHdhcmUg
RUNDIGVuZ2luZSB3YXMKc3VwcG9ydGVkLiBUaGUgbWFpbmxpbmUgZHJpdmVyIHNob3dzIGFic29s
dXRlbHkgbm8gc2lnbnMgb2YgaGFyZHdhcmUKRUNDIGVuZ2luZSBzdXBwb3J0LgoKUGVyaGFwcyBo
b3dldmVyIHlvdSBtZWFuIHRoYXQgb24tZGllIEVDQyBlbmdpbmUgYXJlIG5vdCBzdXBwb3J0ZWQK
YW55bW9yZSBiZWNhdXNlIG9mIHRoZSBlbmdpbmVfdHlwZSBiZWluZyBzZXQgaW4gYXR0YWNoX2No
aXAoKT8gSWYgeWVzCnRoZW4gaW5kZWVkIHRoZXJlIGlzIHNvbWV0aGluZyB0byBkbywgcGVyaGFw
cyBjaGVja2luZyBpZiBhbiBlbmdpbmUgaGFzCmJlZW4gYWxyZWFkeSBzZXQgaXMgZW5vdWdoPyBZ
b3UgY2FuIHRyeSBzb21ldGhpbmcgbGlrZToKCmlmIChlbmdpbmVfdHlwZSA9PSB1bmtub3duKQoJ
ZW5naW5lX3R5cGUgPSBzb2Z0OwogClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
