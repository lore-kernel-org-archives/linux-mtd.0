Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968BCE77176
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhTmZ7CwM5xNljvD3lRmYLahHMSnF4P9yjJU5TcyRf4=; b=tBI6WspcnuN72n
	/9uoqD6AZI5TxvA4cggbT3oVlTj+GYiOLlj1Zlhy6dc0ZQnMGe4c9WXMEpPXs04GhTdZ0RvX959Fm
	glISxuBhcFyUhk7y6l8UhQeQxEMCRtNQSpplStBDFtCLwLeJNt1ek5WmVGG5sOU6l3NSZw65Y4PrL
	6H2flpF1jNii8RsMBydcXOWKtKMXM0xCxHP3KY6eZWJmy1SA6bFcL8FLTkWwkX2y1fczPn43VhrIn
	ZrbHBqU+UacHVhsm8upy7MEoUOyodvLuxxezAp4VdDpPTSFbAJSjc1WZYFa+pzkDOD9wd+pBEOw7F
	bsM8NUjdS9jGDwINKGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVp-0000000Fpme-09iL;
	Thu, 05 Dec 2024 11:59:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Kc-0000000FZy5-2wqE
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC42FF80E;
	Thu,  5 Dec 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5t6joJtJZPuUfxufETdMhnHZDm4ow5zVt3Kp6DZ8Ic=;
	b=RCxcp1TfXULYe34tuytL3/VKwqfchUB/p2vbViNliQvadrrrUpIu/DfnjCvjhuevScl7LC
	Y6h+jUBUpXZV/1bLmaKHNHI5pMeyJXnruwLijYOY+NZDcJo86IXmwSuOZ4eKSHC0AJbgjl
	rDVUS+sfi0OABXjOYkHyK+2e5CC7yXrMGQZg5ooymjgQAy6exmeeB6UE/Qakvw/fLPG5/H
	6jK1Wulzz9ZSTHgJcvYB/bTDB3gWvaqmbBY9ISMKsTUzY2ualwQhaIEOL/UJ/rsMZJYwOP
	g/D2SkjzNLUzaOVUAf+yqBGzFCv+1BHBemrwMfPRdkQj9vZlwKlcfQUHudRUyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Ivan Stepchenko <sid@itb.spb.ru>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: Fix uninitialized retlen in do_otp_read()
Date: Thu,  5 Dec 2024 11:43:29 +0100
Message-ID: <173339519116.766262.7666020579808375858.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114132951.12810-1-sid@itb.spb.ru>
References: <20241114132951.12810-1-sid@itb.spb.ru>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024338_867177_F58A9026 
X-CRM114-Status: UNSURE (   9.64  )
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

T24gVGh1LCAxNCBOb3YgMjAyNCAxNjoyOTo1MSArMDMwMCwgSXZhbiBTdGVwY2hlbmtvIHdyb3Rl
Ogo+IFRoZSBmdW5jdGlvbiBkb19vdHBfcmVhZCgpIGRvZXMgbm90IHNldCB0aGUgb3V0cHV0IHBh
cmFtZXRlciAqcmV0bGVuLAo+IHdoaWNoIGlzIGV4cGVjdGVkIHRvIGNvbnRhaW4gdGhlIG51bWJl
ciBvZiBieXRlcyBhY3R1YWxseSByZWFkLgo+IEFzIGEgcmVzdWx0LCBpbiBvbmVuYW5kX290cF93
YWxrKCksIHRoZSB0bXBfcmV0bGVuIHZhcmlhYmxlIHJlbWFpbnMKPiB1bmluaXRpYWxpemVkIGFm
dGVyIGNhbGxpbmcgZG9fb3RwX3dhbGsoKSBhbmQgdXNlZCB0byBjaGFuZ2UKPiB0aGUgdmFsdWVz
IG9mIHRoZSBidWYsIGxlbiBhbmQgcmV0bGVuIHZhcmlhYmxlcy4KPiAKPiBGb3VuZCBieSBMaW51
eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLgo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBvbmVuYW5k
OiBGaXggdW5pbml0aWFsaXplZCByZXRsZW4gaW4gZG9fb3RwX3JlYWQoKQoKUGF0Y2hlKHMpIHdp
bGwgYmUgYXZhaWxhYmxlIHdpdGhpbiBob3VycyBvbjoKbXRkL2xpbnV4LmdpdAoKS2luZCByZWdh
cmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
