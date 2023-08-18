Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF07C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG1nnW0y4nr5WHXOqaYP8iYK9X2/0YLCoy0E1FbSp4Q=; b=ZI1icmL4CaFypt
	9Rgu0QocmmXE88kAje1tvp3NHXTCWb+aaHgXtYVtVIS4bpszXQvr+tvzoPGlwZpSz8hpU0UUZ4ECQ
	PqXm6ashjUvNA0T1sejtIunA7nq5DcNWWXpVM/2+rvBWwlNDMNjoeXu+sAB5RNpPvq2XOcgwCXQgT
	q0d6ycnzA/6LiSVz8wLIM0ucDUKZojTNYOZBGXHEhSR44h/BYIYljQM0HnP7vF1o0obOzu4u+BVBJ
	e9ah9DBFmWfkZpPAKKnzXrdhIwXssOfNZ6t5N6R/r1OQKO09KVD8QNYZIYGAGmReFojZg4hRLGWCr
	UK0dT1VEX9NeECZe/hFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fO-009Vl6-2K;
	Fri, 18 Aug 2023 14:41:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fK-009ViU-0Q
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7255BC0008;
	Fri, 18 Aug 2023 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oP6/XmLTNuaUUUFfdKXGBPRfoTEJnKuCfl6wI72l9Bw=;
	b=gtKyuACNHsl+acNrPXevnZ7bFSIqLKIQvHGr+jeDfRqW4EulDTWPuG4fFZ1ht8KNQGopEB
	YFQsTT55/bf9h9SSjY56KTP299ceI24vD+pzYd5EhuODLu32bPLAQsTqaWuWbIFUj8+qlf
	f7E6z3RN26OsABDhG9nx26q50jmXH8sYL28ZK6vvpFnW5pq2AZg2R6h9op9P+QdLw73HpM
	wlzuq3EVkg6FlXQkwOUeeteL+3L8GN/DuBIbg8GrCx+arMn52XzY2iScxcdtVOHbjhcOHk
	wCG7dhD1Mgj5ucuchQZq0BHeYnNOH2Vh8d8LDPyciKz1jpFNd8rvF3wSAu7gmw==
Date: Fri, 18 Aug 2023 16:41:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for 6.6
Message-ID: <20230818164127.4acb185a@xps-13>
In-Reply-To: <95ae3e7f-65ff-57bc-6a53-ec219f887959@linaro.org>
References: <95ae3e7f-65ff-57bc-6a53-ec219f887959@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074130_307311_77BC3A2B 
X-CRM114-Status: UNSURE (   6.17  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAxOCBBdWcg
MjAyMyAxMzo1MzoyNiArMDMwMDoKCj4gSGksCj4gCj4gSGVyZSdzIHRoZSBTUEkgTk9SIFBSIGZv
ciA2LjYuCgpQdWxsZWQgaW50byBtdGQvbmV4dCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
