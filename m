Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE572C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 20:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E302075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 20:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MK/ZOQXc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E302075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kO63YlYc4YXs6xyMVOaRi5uPPWATmWH8xL9ua9NoQi8=; b=MK/ZOQXcfs/xp2
	UZEdc6RDT38j1D4SfBl9agDYVCtGvhOklaVT+M9G49RwI1gV/L7hcJI/7lrx/VvPnViCYBddMVe4C
	fSnQpW6M2QvKuVlesFd9UD9g3XAw6FLcTQ9YvzAE6jt82mOxcwy9SoDM1U+7A1NoICPQXtm6FkRJW
	xId3q8TTaPjAgLngunY0bCFrcF6Q9t/Yv9L/fdo1kIzr7fyp/hi1Hb7+qRc91K7Ws94Dgs/323hNh
	nnHmkgHK34ANLA1BEe43w/2T0OSASC+lImX6ExLg/Mnl+nOaMSvUiGVRtfefz8mSy+6Vi8a/3Aimb
	xpetN2XncjXhNQlOiZrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLD4F-0008Ln-Hu; Mon, 29 Apr 2019 20:40:03 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLD47-0008Kq-Cu
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 20:39:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AE2B56088978;
 Mon, 29 Apr 2019 22:39:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id U6N1K8smHgCb; Mon, 29 Apr 2019 22:39:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 750156083269;
 Mon, 29 Apr 2019 22:39:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wsjl_ljeozo8; Mon, 29 Apr 2019 22:39:42 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 321646083252;
 Mon, 29 Apr 2019 22:39:42 +0200 (CEST)
Date: Mon, 29 Apr 2019 22:39:42 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <804905808.38480.1556570382142.JavaMail.zimbra@nod.at>
In-Reply-To: <20190429110013.68984b7f@xps13>
References: <20190408083145.13178-1-miquel.raynal@bootlin.com>
 <20190414105019.5bac65d3@collabora.com>
 <9a8a3963-1b8a-9f9b-8e54-200945518f99@zonque.org>
 <2565820.SR17ECleB1@blindfold> <20190429110013.68984b7f@xps13>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Clean the controller state
 before each operation
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: rawnand: marvell: Clean the controller state before each
 operation
Thread-Index: udClQw7/IBrlpHvoiC4cEsfjESLwkA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_133955_586177_88FBDA08 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAiRGFuaWVsIE1hY2siIDxkYW5pZWxAem9ucXVlLm9yZz4sICJCb3JpcyBCcmV6aWxs
b24iIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4sICJEYXZpZCBXb29kaG91c2UiCj4g
PGR3bXcyQGluZnJhZGVhZC5vcmc+LCAiQnJpYW4gTm9ycmlzIiA8Y29tcHV0ZXJzZm9ycGVhY2VA
Z21haWwuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsudmFzdXRAZ21haWwuY29tPiwgIlR1ZG9y
Cj4gQW1iYXJ1cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgImxpbnV4LW10ZCIKPiA8bGludXgtCj4+IElzbid0
IGl0IHZpc2libGUgaW4gbGludXgtbmV4dD8KPj4gSSB3YXMgYWJvdXQgdG8gc2VuZCBhIGZpbmFs
IFBSIHRvIExpbnVzIGxhdGVyIHRvZGF5Lgo+PiAKPiAKPiBJbmRlZWQgdGhlIHBhdGNoIGlzIG1p
c3NpbmcgaW4gMjAxOTA0MjYgLW5leHQuCgpCYWQgdGltaW5nIG9uIG15IHNpZGUgSSBmZWFyLCBu
b3cgaXQgaXMgaW4gLW5leHQuIDotKQoKVGhhbmtzLAovL3JpY2hhcmQKClAuczogWWF5LCBtYWls
IHdvcmtzIGFnYWluISBNeSBsYXB0b3AgaGFkICJpc3N1ZXMiLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
