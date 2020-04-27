Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B994C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE9B214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EGy1Cauc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spPp3AQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE9B214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX2ZsJtSW6qncluC4oopIen8Ngs//FqKIfZfyWbWOfs=; b=EGy1CaucXI3AOA
	aQL8DnjcrKmYgdWIhgNiFFHrRMh2Wei8Ex47ob/KrG8dk0SdgmEMnMhIq99N4IjSNkEYLNzeQsOeM
	rqFO9iAO+7dkPd/HZQ930Lb41IPCpoiL3ZyAjJ/TYbgkLZQSY9U6vpFFGUAeB28xI3jzh2loQeerM
	WU6I2zO4knHDWCBO5vWr6nRrYfS9H7IWH/oVq+BRi9YF9y+vVmciOJnjcrGRLVnZV86n1s2C10ccX
	ALEhJ8h5rgxg648ZNNrOqca1O6cp79RbXSCA0QBCZoe5LyEB40i4L2opv/kLQ6jbXsvj2HvC3Boyr
	mKK/v2GY3uMCaKoWno/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8yU-00016X-Lc; Mon, 27 Apr 2020 18:59:26 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8yR-00015h-Du
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:59:24 +0000
Received: by mail-ot1-x343.google.com with SMTP id m18so28088152otq.9
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dn9g5cX8gQQAFc8VwJl7LrvRMyAveTzdkK2d7c/ld0g=;
 b=spPp3AQlbkCWOr1IVcN4nVx89OvcR2r1EvRKSLnhbg8/X4jq+g+XmpPGWF4ruUmJeJ
 EhxPEOjOwjDrUOJOXFiQ5wIpqT1B5eKcjT8MEIJcwKIQwvNwejXTt5JmpGG/gnMI1FHP
 EN5ZJNAtLHeunOXtcYlKhdAx0IL2uZ/Nt+mdiWbDlKV0sKl7F9QOQCbuQG3G5peUWafx
 WhDvwb17YUignNNcfmvxbil3WAMbkbw6oT/f4R4q7ftkSLucxVTgSUAL+BkrgNr+oJnc
 WIf6+fLcoLNGokPztIXuZhqJkQILcpzhvpqnN23oxNCKPOJJwHiyWolMWDELmZ5huXQ9
 DVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dn9g5cX8gQQAFc8VwJl7LrvRMyAveTzdkK2d7c/ld0g=;
 b=GaOqBP/IDoJW2Lj0fChnfkmHCp7GI0HKd1Z0kpMI6hiVXWAzEO0IS23wXKQBUEu7/Q
 spTFQc/aZSzZXBr6j3/Y9L3Y+Pw3gvEcbZellNKUz/95oRrJDOGawjpa3+nF6d75erMQ
 vaMx7PycGBvQ/sUGaToDSdbG09b8OfSUeeHwVu2FXrY+EsHvjc3XgfTzARI/Fag+9bv4
 Cbyy8Z/Vz1xFCHxxH/Jc04guqETqFXaHmaZUz6TsMXwdTpGfogL/mej71Pi63pVei9Pn
 rTvZLd89PHidRXTl+PpBQ2GqeyhSm1DgVAQN/qnFzC27w1/MCFsitEdjU16LCaS9rLwO
 oWHA==
X-Gm-Message-State: AGi0PuaN2nO4GAALe/c58uA3IEQvm/oC61HWUjQazuXqe59s5sG4nwkJ
 t2WIYSt5PcVdoWfl6jgN/SGz7NKFX0UEqxJ7Chs=
X-Google-Smtp-Source: APiQypJyxEBfMLQvcIG1+N3zZT8eBy3qleSR/lnF3LT8sQTSc7gR3u2BLoJh0leuSLL+stGUuDGVFGSYSjLDNpV10gs=
X-Received: by 2002:a05:6830:4c8:: with SMTP id
 s8mr20070779otd.198.1588013962169; 
 Mon, 27 Apr 2020 11:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com> <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13> <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com> <20200427164138.05076f3a@xps13>
 <CAP6exYJbpmxQztCOHum-k_CqmCDrJewZaYWk-Bsxy2dsYibbaQ@mail.gmail.com>
 <CAP6exYKtHVZrs=v+g+XU0Rx9qvFZ+xj9St7=ZZV+JLHSQy0BaA@mail.gmail.com>
 <20200427205636.14f84490@xps13>
In-Reply-To: <20200427205636.14f84490@xps13>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 27 Apr 2020 11:59:11 -0700
Message-ID: <CAP6exYLsxdmM_qk4i6zzLF-WcTBxBzax=r8euuaWpnL0ZHh_5Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115923_486662_72AFF4C9 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

eWVwLCBvbiBpdC4KCk9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDExOjU2IEFNIE1pcXVlbCBSYXlu
YWwKPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgcm9uLAo+Cj4gcm9u
IG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAyNyBBcHIgMjAyMCAx
MTo1MDo0Ngo+IC0wNzAwOgo+Cj4gPiBJIHdpbGwgYWRkIHRoYXQgdGhlIHN5bnRheCBsb29rcyBs
ZXNzIG5pY2UgdG8gbWUgdGhhbiB0aGUgW10gbm90YXRpb24KPiA+IGJ1dCBzdGlsbCAuLi4gaXQg
c2hvdWxkIHdvcmsuCj4KPiBJIGFncmVlLCBidXQgd2UgbmVlZCB0byBrZWVwIGNtZGxpbmUgcGFy
c2luZyBpbiBsaW5lIHdpdGggYm9vdGxvYWRlcnMKPiBhbmQgdGhpcyBpcyBtb3JlIHByb2JsZW1h
dGljIHRvIGRvIHRoYW4gdG8gc2F5Lgo+Cj4gV291bGQgeW91IG1pbmQgdGVzdGluZyBpZiBpdCB3
b3JrcyBmb3IgeW91LCB0aGVuIHBvc3QgQm9yaXMnIGRpZmYgd2l0aAo+IHlvdXIgVGVzdGVkLWJ5
Pwo+Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
