Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726A5C27C43
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bk+z+L6DpozwFdy6UPs+nN+q5jfIsiDsp/Ivyy/UUGM=; b=3uXBjKjtlny1Hw
	B3WTAa+DjtC4okCo0JQb/0AMUHT03TBHiLmB29aN8rPdIyxk5nT9qYYgbkM7TPyrYhgiftQh8dK/R
	1mFYngG4mdBy8hueDNu085yzswKbh3Ho/GC2/FHs1BHoymqcJuNCujOGW7/8jrIDpYJRGyoeEsdl0
	U5sacbfDKty5p/08tw9CRkf0AXwH40DKrTPy8GeY2i405OFV+UCMcvLWEimiYbjzqQG/T6xntwx6X
	EtA/CYN2Hc6lTG6TRiHNUHWKCHpddfcWLwGgUDUNSzs25nOiJLJoaadGUzi2bMIBcdWkQ8+RGAK7B
	yfKB4bryNu+Kymzm0K6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIBR-000000042Zg-2Ovy;
	Wed, 29 May 2024 12:13:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIBO-000000042Xa-2hym
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 12:13:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 333E51BF20C;
	Wed, 29 May 2024 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716984807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qPE9lYK/jtCaQQJJj72PN/tJ5wf6JCOgn3hLbpwt2pk=;
	b=mfW57XT0mO3W9hMc7glrP0zAYm1E7+Z3v5Q8jnwOfa06mrDfpmU0coM6lH/iq5tq96vMh3
	+gth/Dq0QThzCc+BLom/aNKoFwiFrxSNu9IMfHdgAwGYYoK9xjmO36V1dNxzv4HjfHvBDd
	VGHQldoYEnRuaYOhN0EzUq4gS+VbagQp65Q6FxXTTLeooike/X6dLExb8FogcoEOdBymMX
	YkpsWvJ4cGJxNpcW7upRdLwOCk29YHwr9FnLWOcxju61DFPb1Mlvlt8GgBTxG2PGps1MJk
	voWeCBh3k3Ov0F3zrjzspcqcp9LxiOytZsRz2vuqaEZRFvug+E8P+59/RON5DA==
Date: Wed, 29 May 2024 14:13:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, David Woodhouse <David.Woodhouse@intel.com>, Akinobu
 Mita <akinobu.mita@gmail.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: make mtd_test.c a separate module
Message-ID: <20240529141323.7015f3d9@xps-13>
In-Reply-To: <20240529095049.1915393-1-arnd@kernel.org>
References: <20240529095049.1915393-1-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_051330_876199_F619B9E1 
X-CRM114-Status: GOOD (  10.11  )
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

SGkgQXJuZCwKCmFybmRAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI5IE1heSAyMDI0IDExOjUw
OjM5ICswMjAwOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRo
aXMgZmlsZSBnZXRzIGxpbmtlZCBpbnRvIG5pbmUgZGlmZmVyZW50IG1vZHVsZXMsIHdoaWNoIGNh
dXNlcyBhIHdhcm5pbmc6Cj4gCj4gc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyMzY6IGRyaXZlcnMv
bXRkL3Rlc3RzL01ha2VmaWxlOiBtdGRfdGVzdC5vIGlzIGFkZGVkIHRvIG11bHRpcGxlIG1vZHVs
ZXM6IG10ZF9uYW5kYml0ZXJycyBtdGRfb29idGVzdCBtdGRfcGFnZXRlc3QgbXRkX3JlYWR0ZXN0
IG10ZF9zcGVlZHRlc3QgbXRkX3N0cmVzc3Rlc3QgbXRkX3N1YnBhZ2V0ZXN0IG10ZF90b3J0dXJl
dGVzdAoKSSd2ZSBuZXZlciBleHBlcmllbmNlZCB0aGlzIHdhcm5pbmcgbXlzZWxmLCBob3cgZGlk
IHlvdSBwcm9kdWNlIGl0PwoKPiBNYWtlIGl0IGEgc2VwYXJhdGUgbW9kdWxlIGluc3RlYWQuCgpJ
J20gbm90IGEgdG90YWwgZmFuIG9mIHRoaXMganVzdCBiZWNhdXNlIGl0IG5vdyByZXF1aXJlcyBh
biBhZGRpdGlvbmFsCnN0ZXAgdG8gaW5zZXJ0IHRoZXNlIHRlc3QgbW9kdWxlcyAodGhleSBhcmUg
bGlrZWx5IHVzZWQgZm9yCmRlYnVnZ2luZy9kZXZlbG9wbWVudCBwdXJwb3Nlcywgc28gbm90IHBy
b3Blcmx5IGluc3RhbGxlZCBpbiB0aGUKcm9vdGZzKS4gSXMgdGhlcmUgYW55IGNoYW5jZSB3ZSBj
YW4gZmluZCBhbm90aGVyIHdheT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
