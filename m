Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AF0C47077
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beuUsgHoggpSLaHd6WLL25rjrQcbuFIbJFQyyLeBJ+Q=; b=YaVRtuGAzYvT9v
	jv7g2+l5g23HB11p2gkab6NkIOK1UP3dTCpIJBhNskRDpDfAHovpwKt317QmeWNCGtodp3Acz3ACX
	uNsprCZ+rkq0K3R5m/pNYuLgQdFjO9ev4Jnz03dfz1twx9gW47LPUkcwz5TU7OkjzVJE23Ia6x6Ls
	ua7NKRr5g9GeH+q+lg8iF62fGbvQCeF5RGx5+L7JyPjWPZW9d3nr3v7BLPGbYcsrh2wMeLgct3I+/
	9O8KKlvCjt49YIcnBggzx47ZYTtTyPqNDJf9jR/H4Ag7snxNY3nqKDFhZnKB5fbHUDwbgwOnxEXpI
	GUl/tLvljSuGYGdMD5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpeM-00GKiP-2R;
	Thu, 11 Jan 2024 07:38:50 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpeJ-00GKfG-1y
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 07:38:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E146FF805;
	Thu, 11 Jan 2024 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704958720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTHZVt7Yg4qAfaTuFt8XN7iuukWykn5zydklR2p2jeo=;
	b=DuhHftLXasyJ+03jyMKg3iGWP3ZGkR/AVQ1kvQzZZzgO1SLVQQR7uWU30cDoMc998aHpU2
	LvufpvtqerMbmZdnwQ45/GzVNVjuhVVdL5E1apD9SBuQkVZ7MvM88wNTSIfyc3bQaWR5/B
	S8t0f+Z/M9AMYSL1GGkHaay+SCgxWtDKnSG5IdCVAMuVnUYm0g46FqRDJFqb22hrbm69Ca
	L4vCuOi4i+jR23np8UG8DYC1F35VPoDt/wObd55bES44E/p8b26oX4fLJcL+jP+urpBE47
	sFX3+SEefrEetoPc7dRZftShZ0EVSUkXUwGQxIDynmkS+r1YG0WqASIOzBy7Ww==
Date: Thu, 11 Jan 2024 08:38:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Kyeongrho.Kim" <kr.kim@skyhighmemory.com>
Cc: Mohamed Sardi <moh.sardi@skyhighmemory.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 Mohammad Nada <Mohammad.nada@skyhighmemory.com>, "Changsub.Shim"
 <changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Message-ID: <20240111083838.7f215daf@xps-13>
In-Reply-To: <SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
	<20240108144719.3198373e@xps-13>
	<SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_233847_940639_7CD28359 
X-CRM114-Status: GOOD (  14.83  )
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

SGkgS2ltLAoKPiA+ICAgMi4gIEhvdyBtYW55IHZlcnNpb24gb2YgdGhpcyBkcml2ZXIgd2UgbmVl
ZCB0byBkZXZlbG9wIHRvIHN1cHBvcnQgYWxsIHZlcnNpb24gb2YgTGludXggKG5vdyBiZWluZyA2
Lnh4eCk/ICAKPiAKPiBXZSBvbmx5IGJyaW5nIHN1cHBvcnQgdG8gdGhlIGxhdGVzdCBtYWlubGlu
ZSBrZXJuZWwsIHdoYXRldmVyIHZlcnNpb24gaXQgY291bGQgYmUuIFNvIGlmIHlvdSBzZW5kIGEg
cGF0Y2ggKHBsZWFzZSBmb2xsb3cgdGhlIGNvbnRyaWJ1dGluZyBndWlkZWxpbmVzIGluIERvY3Vt
ZW50YXRpb24vKSBpdCBzaG91bGQgYmUgYSBkaWZmIGFnYWluc3QgdGhlIG5leHQgLXJjMSAoc28g
aXQgd2lsbCBiZSB2Ni44LXJjMSBpbiB0d28gd2Vla3MpLiBZb3UgY2FuIHNoYXJlIGRpZmZzIGZv
ciBvdGhlciB2ZXJzaW9ucyBhcyB3ZWxsIG9uIHlvdXIgb3duIHdlYnNpdGUgYnV0IHRoZXJlIGlz
IHVzdWFsbHkgbm8gYmFja3BvcnQgb2YgJ25ldyBmZWF0dXJlcycuCj4gCj4gW0tSXSBTaW1wbHks
IHlvdSBjYW4gb25seSBzdXBwb3J0IGZvciBvdXIgcGF0Y2ggdG8gdGhlIGxhdGVzdCB2ZXJzaW9u
LiBJcyB0aGF0IHJpZ2h0PwoKV2VsbCwgdGhlcmUgaXMgb25seSBvbmUgIm1haW5saW5lIiwgYW5k
IHlvdXIgY29udHJpYnV0aW9ucyBtdXN0IG1hdGNoCnRoZSBzdGF0ZSBvZiB0aGlzIG1haW5saW5l
LiBXaGVuIGFwcGx5aW5nIHRoZSBwYXRjaCwgdGhlIG5leHQga2VybmVsCmFuZCBhbGwgb3RoZXJz
IGZvbGxvd2luZyB3aWxsIGhhdmUgc3VwcG9ydCBmb3IgeW91ciBjaGlwcy4KPiAKPiA+IEZvciBp
bnN0YW5jZSBpZiB0aGUgZHJpdmVyIChhdHRhY2hlZCBpcyA1LjQpLCBjYW4gaXQgYmUgdXNlZCB1
cCB0byA1LjE44oCmICBvciBzaG91bGQgd2UgbW9kaWZ5IGl0IHN0YXJ0aW5nIGZyb20gdmVyc2lv
biA1LjR4LiAgCj4gCj4gSWYgaXQgY29tcGlsZXMsIGl0IHdpbGwgcHJvYmFibHkgd29yayBhcyB3
ZWxsIGFzIHRoZSBjb3JlIGhhcyBub3QgY2hhbmdlZCBtdWNoIHNpbmNlIGl0J3MgYmVlbiBjcmVh
dGVkLCBidXQgdGhlcmUgaXMgb2YgY291cnNlIG5vIGd1YXJhbnRlZS4KPiAKPiBbS1JdIElzIGl0
IHBvc3NpYmxlIHRvIGFwcGx5IHRoZSBwYXRjaCB0byBvbGQgdmVyc2lvbiBvZiBMaW51eCBjb21t
dW5pdHk/CgpPbiB5b3VyIHNpZGUgeW91IGNhbiBwcm92aWRlIGEgZGlmZiBmb3IgZWFjaCBrZXJu
ZWwgdmVyc2lvbiB0aGF0IHlvdQp3YW50IHRvIHN1cHBvcnQgd2hpY2ggZG9lcyBub3QgY29udGFp
biB5b3VyIHBhdGNoIHNlcmllcy4gRm9yIGFsbAprZXJuZWwgdmVyc2lvbnMgYWZ0ZXIgeW91ciBj
aGFuZ2VzIGhhdmUgYmVlbiBtZXJnZWQsIHRoZXJlIGlzIG5vdGhpbmcKYWRkaXRpb25hbCB0byBk
byBvbiB5b3VyIHNpZGUgKGJlc2lkZXMgcG9zdGluZyB1cGRhdGVzL2ZpeGVzIG1heWJlKS4KWW91
IGNhbm5vdCBiYWNrcG9ydCBhIGZlYXR1cmUgdG8gb2xkZXIgKHN0YWJsZSkga2VybmVscy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
