Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28591C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S17cYjQ2m1XpylditOJxt8wxu2ib26Q7mHGGGGEqQPU=; b=NYbmXgUP+c494u
	LgzWpMcpc/AIbQ2PDGze6t55TRaYETwJPmSzjvvHgaE9KjiDagLnd2B2kCmP/Li+mefvZjH/tSfdg
	ppMjf2+BwdnwCDZWZSxrzabrpjLiUV2Ik3E8p/bC40JIDNxzQ6kHf1HYINeOT1o1eC3arvd2BDpZL
	zd6UpAOU2VRwHyUQjpy62wMkGdMGGGL41WxXsXdJEUHNsietjRQPwKamUR4NFmzERuUV2LmnRhkBD
	l7NfE6zqS89LF8/3WUcj2Rrz2JLFS+boUg4vu+ZRIcO9GNYeK+s1QPOgDWpqUaLFniD076jFgLA5F
	FnDIKq/3tHvBFHZjPcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIy9-00CcNE-1e; Mon, 19 Sep 2022 15:46:01 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaInu-00CWjs-JS
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 15:35:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5221BFF802;
	Mon, 19 Sep 2022 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663601721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrJZdM8oRjwEUaCDb6HQyhFcx0jpFsIYOO3Dzpg3b18=;
	b=j9KRb7OVwmAhuD9cYMCtEp5udKOY72TpX8DpljCzrzfeUzmBoYPpb5WdDDTjeAvbDZs0rS
	o1SxK0F6sWYIgqHG8Dxe+EeZxKdbnbKU1OlxEYY6Tqpi9Qq+OoY/x7FbTtLuETRcuIrOf2
	Zpeg6I33zsFUUEMh0YImy5h2Kvej04bmrllU6xXiXQVJjJrMt1EbEDaaK89XHxD+bLbKwO
	/PbTEzmB0SXaIBRjKhi70BQydWicFC8/wEfmV2xRRDh8gYcQbWhkc5ruPZnLOIPdpB7YcA
	R/NGoy0DqKFUga6b4Uq7aAP15tV8SoQPHozf5bJlJ11KhqLECIDRiL82gt1cAA==
Date: Mon, 19 Sep 2022 17:35:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "GONG, Ruiqi" <gongruiqi1@huawei.com>, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangweiyang2@huawei.com
Subject: Re: [PATCH] mtd: rawnand: denali: Fix a possible resource leak in
 denali_pci_probe
Message-ID: <20220919173518.35742b2f@xps-13>
In-Reply-To: <dac8e781-5c2b-4ba1-34a7-d902ba060b29@wanadoo.fr>
References: <20220801080315.1713934-1-gongruiqi1@huawei.com>
	<dac8e781-5c2b-4ba1-34a7-d902ba060b29@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083526_822736_6846493C 
X-CRM114-Status: GOOD (  13.87  )
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

SGksCgpjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mciB3cm90ZSBvbiBNb24sIDEgQXVnIDIw
MjIgMjA6MjY6MDcgKzAyMDA6Cgo+IExlIDAxLzA4LzIwMjIgw6AgMTA6MDMsIEdPTkcsIFJ1aXFp
IGEgw6ljcml0wqA6Cj4gPiBDYWxsIHBjaV9yZWxlYXNlX3JlZ2lvbnMoKSB0byByZXRyaWV2ZSB0
aGUgYWxsb2NhdGVkIHJlc291cmNlIHdoZW4KPiA+IGRldm1faW9yZW1hcCgpIG9yIGRlbmFsaV9p
bml0KCkgZmFpbGVkLgo+ID4gICAKPiAKPiBIaSwKPiB0aGlzIGlzIG5vdCBjb3JyZWN0Lgo+IAo+
IEZpcnN0LCBzaG91bGQgeW91IGJlIHJpZ2h0LCB5b3Ugc2hvdWxkIGFsc28gdXBkYXRlIHRoZSAu
cmVtb3ZlKCkgZnVuY3Rpb24gdGhlIHNhbWUgd2F5Lgo+IAo+IFNlY29uZCwgYXQgdGhlIGJlZ2lu
bmluZyB0aGVyZSBpcyBwY2ltX2VuYWJsZV9kZXZpY2UoKSBjYWxsLgo+IFRoaXMgbG9va2VkIGxp
a2UgbWFnaWMgdG8gbWUgd2hlbiBJIGZpcnN0IHNhdyBpdCwgYnV0IHRoaXMgZnVuY3Rpb24gbWFr
ZXMgc29tZSBwY2lfIGZ1bmN0aW9ucyB3b3JrIGp1c3QgYXMgaXQgdGhleSB3ZXJlIHBjaW1fIGZ1
bmN0aW9ucy4KPiAKPiBTZWUgcGNpbV9lbmFibGVfZGV2aWNlKCkgKFsxXSksIGF0IGxpbmUgMjEz
Mi4KPiBXaGVuIHBjaW1fcmVsZWFzZSgpIChbMl0pIGlzIGNhbGxlZCBieSB0aGUgZnJhbWV3b3Jr
LCB0aGVuIHJlZ2lvbnMgYXJlIHJlbGVhc2VkIGF0IGxpbmUgMjA3OQoKSW50ZXJlc3RpbmcsIEkg
anVzdCBzZWUgdGhpcyBhbnN3ZXIgbm93LCBwbGVhc2UgaWdub3JlIG15IGZpcnN0IGNvbW1lbnQK
dGhlbiwgaXQncyBub3QgdXNlZnVsLgoKVGhhbmtzIENocmlzdG9waGUgZm9yIHRoZSBmZWVkYmFj
ay4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
