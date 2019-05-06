Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7EFC04AAB
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7E32082F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mirddSeY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7E32082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXtXgJLJSIovMplqG+oEvXxWO+MmPCS0xduUqs20rI4=; b=mirddSeYpCFX1A
	Rl9qloODg0ldCCgaE138tjkxCFf99hhW/GDkoPhnhc0oRj45am0AZYH05YGAPu/gvomYwQl788Tiv
	sKcXvApvvd81xymHbjFebxbUHr2+UWVZRlAldXRmi3iq9zeEmic40E2rxmQXvMoSZiv40TYK07DwI
	k3BVWbbYBaCJnbUeGFEFt9A373/fym1kR0CcLfuvQoYiCYp1hhcaDEftu5bKm/K8CmSgmoNC4iVNT
	3CZ9qctaSwlIARVoaYA0yAmtch6JDBXHE0zIbXRWx0O929x7n9+G5lQ61+tBmscuZm4vp+Qj8qVvg
	W/tG6XRSSYsfo3SsOAiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNYjF-0000KD-B6; Mon, 06 May 2019 08:12:05 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNYjC-0000Jn-Gg
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 08:12:04 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0E163E0023;
 Mon,  6 May 2019 08:11:50 +0000 (UTC)
Date: Mon, 6 May 2019 10:11:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: xiaolei li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH v2 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
Message-ID: <20190506101149.221361b0@xps13>
In-Reply-To: <1557040000.26455.59.camel@mhfsdcap03>
References: <20190430100250.28083-2-xiaolei.li@mediatek.com>
 <20190430103205.5175421744@mail.kernel.org>
 <1557040000.26455.59.camel@mhfsdcap03>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_011202_707561_3EFCF8B8 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, richard@nod.at,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgeGlhb2xlaSwKCnhpYW9sZWkgbGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBTdW4sIDUgTWF5IDIwMTkgMTU6MDY6NDAKKzA4MDA6Cgo+IEhpIFNhc2hhLAo+IAo+IEkgYW0g
bm90IHN1cmUgaWYgaXQgaXMgY2F1c2VkIGJ5IHJhdyBOQU5EIGNvZGUgcGF0aCBjaGFuZ2UuCj4g
Cj4gUmF3IE5BTkQgY29kZSB3YXMgbW92ZWQgZnJvbSBtdGQvbmFuZCB0byBtdGQvbmFuZC9yYXcg
c3ViZGlyZWN0b3J5IHNpbmNlCj4ga2VybmVsIHY0LjE3Lgo+IAo+IFRoZSBmaXhpbmcgY29tbWl0
OiBlZGZlZTM2MTljNDkgbXRkOiBuYW5kOiBtdGs6Cj4gYWRkLT5zZXR1cF9kYXRhX2ludGVyZmFj
ZSgpIGhvb2sgZXhpc3RzIGJlZm9yZSBrZXJuZWwgdjQuMTcuCj4gCj4gQE1pcXVlbCwgZG8geW91
IGtub3cgaWYgc29tZSBvdGhlciByYXcgTkFORCBkcml2ZXIgZXZlciBlbmNvdW50ZXJlZCB0aGlz
Cj4gY2FzZT8gVGhhbmtzLgoKRG9uJ3Qga25vdy4gSnVzdCBjaGVja291dCBhIDQuMTQuMTE0IGFu
ZCB0cnkgdG8gYXBwbHkgdGhlIHBhdGNoIDopCgo+IAo+IE9uIFR1ZSwgMjAxOS0wNC0zMCBhdCAx
MDozMiArMDAwMCwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gW1RoaXMgaXMg
YW4gYXV0b21hdGVkIGVtYWlsXQo+ID4gCj4gPiBUaGlzIGNvbW1pdCBoYXMgYmVlbiBwcm9jZXNz
ZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKPiA+IGZpeGluZyBjb21taXQ6
IGVkZmVlMzYxOWM0OSBtdGQ6IG5hbmQ6IG10azogYWRkIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2Uo
KSBob29rLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
