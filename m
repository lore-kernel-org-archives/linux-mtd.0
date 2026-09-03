Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37197C624DB
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAXjOPEPECHBmvC8Qnjx0ZY9lv36B7fRyTT+1A/kQjs=; b=UL9awO+8T3JwUk
	yjLydtgofM3rCOLVJ3Bl2AITsnHZdh5Pc+DLlcLMKAt5+r+gfqv3uFtchihJILisXL9+LwcmHjTdy
	D/xZBq4FOQEz+qoPgNSZUD76zpVbvvIWH1vFW9pmkhhdVCQz8RHvsmZS7raGZb3QigLdzOjVDMRvw
	OpLvi+uUqG7IcLBfA6Axks3oPZaLh1ia3MlTYQwOLHwUMJHCeDHlGA8B+hiIkU5Fq8EK+t8aueODu
	b4oxuKWHMlVw52wj1pKI1D/m9D5UX/eJvmg4PHvvUpS/ENBGEJe4mTgcBT0dDmy7cEWyuFy6tINTe
	kpE3W21YOxmR/Hw8/9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22R1-0000000GjRH-05s3;
	Thu, 03 Sep 2026 08:04:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Qx-0000000GjQp-34x6
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 08:04:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EED774E414EB;
	Thu,  3 Sep 2026 08:04:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBF8E602B8;
	Thu,  3 Sep 2026 08:04:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 000AE11C79ED7;
	Thu,  3 Sep 2026 10:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788422663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mKTESKF9DSQSLmk9LEWoM19Dn7BVERBm41zRt3vprfA=;
	b=IiKbbUsw7JlI0jWEs0tlb0SndLv/vE3JlKggJdZjMbz3y6xezeu6km4NodLHOHo0l+4pff
	ykXTJFJecVezFq6S3q+z85HL85ZC67Izq4vrdPO9rZSsA4cP8E1as/m3+kSTDLOjqJGfsM
	nS8XFmqq6Mg2HRyrvLWF4NyQunBRQwhsBIyj6QWMLTscebpR3wT2Piy/HXxd9Yr5+x7yL+
	u/bH6d7CvqnXOcOHklmcuRESuIJMOAg8xQ2gsR4txBfWkFcRBkQBI3rdSwFFHSRhe3awPs
	YWJBkJLgim6PQGaoZQLH3+d2cFmxYO94iCdBzh7sdvS51ZJPdfRNv2/pmEYXaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: henrymei <ljp1205831794@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  linux-kernel@vger.kernel.org,  Aohan Mei <henrymei@tencent.com>,
  TencentOS Corvus AI <corvus@tencent.com>,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: inftl: validate MediaHeader partition geometry
 before allocating tables
In-Reply-To: <20260902124044.3942821-1-henrymei@tencent.com> (henrymei's
	message of "Wed, 2 Sep 2026 20:40:19 +0800")
References: <20260902124044.3942821-1-henrymei@tencent.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 10:04:18 +0200
Message-ID: <87h5k67ocd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_010431_933774_8A2E4A06 
X-CRM114-Status: UNSURE (   6.87  )
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

SGkgSGVucnksCgpPbiAwMi8wOS8yMDI2IGF0IDIwOjQwOjE5ICswOCwgaGVucnltZWkgPGxqcDEy
MDU4MzE3OTRAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQW9oYW4gTWVpIDxoZW5yeW1laUB0
ZW5jZW50LmNvbT4KPgo+IGZpbmRfYm9vdF9yZWNvcmQoKSB0cnVzdHMgdGhlIG9uLWZsYXNoIElO
RlRMIE1lZGlhSGVhZGVyIHBhcnRpdGlvbgo+IGZpZWxkcyB3aXRob3V0IHZhbGlkYXRpbmcgdGhl
aXIgcmVsYXRpb25zaGlwIHRvIGVhY2ggb3RoZXIgb3IgdG8gdGhlCj4gZGV2aWNlIGdlb21ldHJ5
Lgo+Cj4gVGhlIHNhbml0eSBjaGVjawo+Cj4gCWlmICgoaXAtPmxhc3RVbml0IC0gaXAtPmZpcnN0
VW5pdCArIDEpIDwgaXAtPnZpcnR1YWxVbml0cykKPgo+IGlzIGV2YWx1YXRlZCBpbiB1bnNpZ25l
ZCAzMi1iaXQgYXJpdGhtZXRpYy4gIFdpdGggbGFzdFVuaXQgPCBmaXJzdFVuaXQKCmxhc3RVbml0
IDwgZmlyc3RVbml0PyBEaWQgeW91IGV2ZW4gcmVhZCB0aGF0IHNlbnRlbmNlPwoKU29ycnkgYnV0
LCBuby4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
