Return-Path: <SRS0=jI2T=XW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851FBC388F3
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 15:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570CF217D7
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 15:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lx8V8wa0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="ZlwG63J8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570CF217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:To:Subject:References:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNS0G/C8t5opWpVq2LK4PO4VZkEt48Jg7jFerN985HM=; b=lx8V8wa0h86J39
	vouzKKIJAn8Ulo8/reCFXh2CvpZnVxZ+C4Mqp+UglmDiaq5cpeKz/z038uU4dSd/QotdAmXNxMvB5
	QCO/Ls1234TW+Vw9PXW65iLLQ1aYnhmmbEpCV8/ay0djEvfCSgvTaqPU7c3nQIqDEQyEVsof75WiQ
	GPnLbAamWn3HFyzs1wED+W+XG7Lrf7mAL0+99dHJJICXbHGhCchU9DcQHX6y6oXx2h11L8syrOApg
	ehJhsHpc/sutBB/dOBQa9cgBQ3GDkUiFXpmpKjCrYOPDmLZygqeD/Eb6CHH1UeKfVuXM7QlQb/lWg
	PWVoK4g+PSI72Xum3PUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDs7m-00026c-6H; Fri, 27 Sep 2019 15:25:38 +0000
Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDs7j-000267-4O
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2019 15:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1569597901;
 bh=fsPHriY23wbnZVDJpnwWGxaKR2DwyQgmEUkE1GQ7D/M=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=ZlwG63J8Qi/ew0ULlmrQigkvS2N2DzVlOv7ZhE1cJmtUuzwIfgZ2HgLscBPvQLOg1
 kAMr1dkQqlNB3nRLW4zAR9SnsBI9t/I6QIlhamn+K7k47L+aIQFFDcbSTTJXuflDZ5
 yaHHG+N0AKOmWhXeBUTRNJwpJoPjyvZFi+rR4f44=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.191.8]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LnBPR-1hgCK81DUj-00hLTo; Fri, 27
 Sep 2019 17:25:01 +0200
References: <20190925154302.17708-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] mtd: onenand: prevent memory leak in onenand_scan
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-mtd@lists.infradead.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0b12fc29-d93c-ef02-cc5c-85057bfe6197@web.de>
Date: Fri, 27 Sep 2019 17:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190925154302.17708-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:MK2cn2pKle2egEcpGaDu/9UIU54vWqUAoddMMlGjXMAsW1KFeuB
 B1z6bl8TJXZ/qLo+yX6qsBY2Hwz8UYjyC5YBrFwTq3Aar/YEtllu8vPY/UitGb8WVV50IHk
 DTp2jKr8Zq3alNBmLEAP66yqws0LxeGr3IrALppbwYu6EV3PWDBEzwwk9HHM/4ovL1zKC4d
 hdNY5bTlO/xsfStWLtREQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rzhIW7LOGXg=:RKl6F7am3YBt7DMPsMXmKC
 eVbvu+YHjOS3KrLjbn7fqmNxN86ttqC7sRxQ89DatSNloDGmrWEEl7o9qh16293248nm1q06C
 cvRhCZvSv+40TSjoTuEAxCXxySRqEgGJpfhZuucecJ0uu31L7hcKL96NfLOootW3BVdZ63MXB
 RtuP62MU7DPWkWhfUWDv4aT7w2Ga1+W2P57FEx0Ryp8jJfMNLf3aQMZypqOovJ1I7Clz6/mDx
 9s0IBbGIsUGKcCiI9L4e9es9F2TEXO/JbR+k1SzHwjAFw/tmVIlH09jc1bMHD/t6PAzR/SuwW
 rPkr5dKDWdJsbO7cYtJiJngFDMerc4GIIVcWZs5P+BZjaGS1d2SwrVhPA+HfEYqAT2c/sKZTX
 UMSp+Zzw2Gv2sM9fhRpLiN+66oaQgTl4NStO2ynS0Kd9R5XkhBgp9YpopcyMfHM+b1NR8G3nX
 vU4PNzCfkIiuq/nsRE1SICTUMvBpEgjae/Spnl28QeF7wNV0z9lg32YIZ56Wz8ORntXe2DJzf
 LTVsw2NwEU1pa9Kf4G5ofym7U0BZS6KlFJsyhHZO94vtJkIipTDCoAXJqsENVa/4aUwKkkWQg
 GrMWP9J99hvmuqQ3SUYsG+aNhuIGXKogXcEJDUVIFjz80NM/YtqPg3RfblU3ZY+zvkMCjuOdH
 3s9NMM50vjhOlkg5mAAsS+UhViRHM1ET/D9Um21b5apWkVXzx/JnP9zRKU0OSJVxFdqwTtLM2
 7snkmSLuTDbO9lymizM60OHHrq0x4homT6b3A5opf4sTtM4/3fTKueZqkYWMz5pSBV53MYOwY
 RAk2xhvTXnQzA7wxLC2YhKF0eFivzqqN+BeoSe9o+5Gp9QjkKEXildQmgz0lj9+jpk7aBdV0z
 gPBFndabj620CGAOJxwwxs6wlUDBX4JNT6KAXQkcynYVlQT48HK7V2LN0aU34wMIMUxgrElNm
 rp5kTO3V/YINuXDVtjdwJyGDiZB7ObiBSS11lrq2dH04S/qxO8NVOMxQPP1bGC4PvnMryL8BM
 6owXvmuQ1QXJtZ2GtL89dm5108gPpK8rvLf0PG/J8UfPOavgV/Q5VUyrtz9DxLJcxbysnpV1V
 1pa0JtGkyK9wVS5Cfon7LW/cv/ShSUdq5Vq53ctsfsHALzHgzEBeMD7YuSR30fzmeX4s1izv/
 NOjvQI/Iqbz7Pjud37heHwS3V9tF68VluyIk0eCsxml5ceV0WQ9Nots1iCF4qMDnduBKbIMzp
 0cCFNam8PYJxE7K52xQwhKCrRj89QCWk9WHdAeMcFYcOmjlzclEQXA+CyFAo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_082535_466706_C6C8B4DF 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel-janitors@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Stephen A McCamant <smccaman@umn.edu>,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Navid Emamdoost <emamd001@umn.edu>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBJbiBvbmVuYW5kX3NjYW4gaWYgc2Nhbl9iYnQgZmFpbHMgdGhlIGFsbG9jYXRlZCBidWZmZXJz
IHNob3VsZCBiZSByZWxlYXNlZC4KCldpbGwgYW4gb3RoZXIgY2hhbmdlIGRlc2NyaXB0aW9uIGJl
IG1vcmUgYXBwcm9wcmlhdGU/CgoKSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBhZGQgdGhlIHRh
ZyDigJxGaXhlc+KAnSBoZXJlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
