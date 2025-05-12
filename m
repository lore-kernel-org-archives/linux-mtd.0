Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCA4C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=garZmV4EYUuLNv5+JdVXgenuVV5lugekvhM6anP8LE4=; b=zlHcdST5nx0vSO+nKnxSmIF5CW
	GezLxtzSRs/038bXMQaCSugyZuuPyVupYyXFEM/sPs3PlMy5dOVj3VRLZcjMb37Ulc/X4kiOypZM4
	ZfDj4hEyiPk83ye8+n7gK3EZVRuNs1pcnk04GgLjT1/bBklFKXhMry0OwHV6mDLlgLfTbVtAYdTA4
	ZHg/7YHUSHGuJ00153vvpbBtiRY8vHgpIUQjnaniBNcDpRWkrxyMyOR1dqnBE35JbHzQv3COLGMFQ
	3MRDUSRCWuRdPbZrXIuBxERaqQ0kuRYli6b6Dj3v8dzV/jBFUH9IalYXBDTDmRAHIj7ZC5WtQE/Oz
	+II3gdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVzr-0000000A2RE-2SnW;
	Mon, 12 May 2025 16:27:19 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVXQ-00000009xXF-1zlc
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 15:57:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C633A294730;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WUghdvuq5KTy; Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6FF76298562;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IzOUdMxh8QkF; Mon, 12 May 2025 17:57:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4D1D2294730;
	Mon, 12 May 2025 17:57:54 +0200 (CEST)
Date: Mon, 12 May 2025 17:57:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <636744371.31012717.1747065474158.JavaMail.zimbra@nod.at>
In-Reply-To: <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu> <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at> <4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu> <87r00ugcat.fsf@bootlin.com> <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at> <87y0v1g7xz.fsf@bootlin.com> <2c2ff01f-b6e2-4b9e-958a-c4c405518a54@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: Verify written data in paranoid mode
Thread-Index: 75AKXALdUUz/uNm8Yjvipq4cEdAKSw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085756_655241_692D9272 
X-CRM114-Status: UNSURE (   7.97  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNzw7Nrw6FzIEJlbmNlIiA8
Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPj4+IFVCSSBvZmZlcnMgdGhpcyBhbHJlYWR5LCB0aGVy
ZSBpcyBhIHdyaXRlIHNlbGYtY2hlY2sgYXMgcGFydCBvZiB0aGUgaW8KPj4+IGNoZWNrcyB0aGF0
IGNhbiBiZSBlbmFibGVkCj4+PiB2aWEgZGVidWdmcyBwZXIgVUJJIGRldmljZS4KPj4+IFNvIGZv
ciB0cm91Ymxlc2hvb3RpbmcgdGhpcyBzaG91bGQgYmUgZ29vZCBlbm91Z2guCj4+PiBUaGVyZSBp
cyByb29tIGZvciBpbXByb3ZlbWVudCwgdGhvdWdoLiBDdXJyZW50bHkgaXQgdXNlcyB2bWFsbG9j
KCkuCj4+IAo+PiBVQkkgaXMgZnVsbCBvZiB1bmNvdmVyZWQgcmVzb3VyY2VzIDotKQo+IAo+IEZv
ciBzdXJlLiBQbHVzLCBldmVuIHRob3VnaCB3ZSB1c2UgVUJJICsgVUJJRlMsIHRoYXQgbWF5IG5v
dCBuZWNlc3NhcmlseQo+IGJlIHRoZSBjYXNlIGZvciBvdGhlcnMuIE1heWJlIHNvbWVvbmUgdXNl
cyBtdGRibG9jayArIHNvbWUKPiAiY29udmVudGlvbmFsIiBGUyAoZXh0KiwgZjJmcyBldGMuKS4g
T3IgbWF5YmUgdGhleSB1c2UgSkZGUy4gT3IgbWF5YmUgbm8KPiBGUyBhdCBhbGwuIFdlIHNob3Vs
ZCBzdGlsbCBhbGxvdyB1c2Vyc3BhY2Ugb3IgaGlnaGVyIEZTIGxheWVycyB0byBiZQo+IG5vdGlm
aWVkIG9mIHRoZSBwcm9ibGVtLgoKTm9ib2R5IHNhbmUgd291bGQgZXZlcnkgdXNlIGEgcmVndWxh
ciBibG9jayBiYXNlZCBmaWxlc3lzdGVtIGluIHJ3IG1vZGUKb24tdG9wIG9mIG10ZGJsb2NrLiBF
c3BlY2lhbGx5IGlmIHlvdSBjYXJlIGFib3V0IHlvdXIgZGF0YS4KCkpGRlMyIGhhcyBDT05GSUdf
SkZGUzJfRlNfV0JVRl9WRVJJRlkuCkFGQUlLLCB0aGlzIG9yaWdpbnMgZm9ybSB0aGUgb2xkIGFu
ZCBkYXJrIGFnZSBvZiBmbGFzaGVzIHdoZXJlIGV2ZXJ5dGhpbmcKd2FzIHdvbmt5IGFuZCBubyBn
b29kIHRlc3QgdG9vbGluZyBleGlzdGVkLgoKTG9uZyBzdG9yeSBzaG9ydCwgSSdtIG5vdCBjb252
aW5jZWQgYnkgdGhpcyBwYXRjaCBzZXQuCk5vIGFjayBmb3JtIG15IHNpZGUuCkF0IGxlYXN0IGl0
IHNob3VsZCBiZSBjb25maWd1cmFibGUgcGVyIGRldmljZSBhbmQgbm90IGJlaW5nIGEgZ2xvYmFs
CmNvbmZpZyBvcHRpb24uIElmIE1pY2hhZWwgb3IgTWlxdWVsIGxpa2UgaXQsIEknbGwgbm90IGJs
b2NrIHRoaXMgZGVjaXNpb24uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
