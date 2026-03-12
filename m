Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3BDFED2FE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w56CJTrDyOFGWvp99He6AlHV21S6QxaIGxmLNuRldm4=; b=Ijg0LuSQ/DhbIq
	l/CQYkIsowY+SV1arWvBMETqLHJPPPYXQpU7ffiO0QMjXXMFbi1fLacrDhTlFqG7+fBNZIzkg2+T4
	URwBob26ZtN64n3CrVd0XQoFJCVap7otB79KCTl/e4fPQn412kb9LglmAUIA8GSzoFFmmPb585ALe
	bwk4Ct/I09uQ2NrEEAZenuXn1Q6YSl1M1U927I6vTref8VTVNISnBiixm9R/d2dXyiCgFsv4fCEa4
	W+8t8SsUUDeR/3thdN05KqSPL+reyYAWidQSyFyKkZsdr8XI3RvEZ51cO5XXGyqUllL3kLDW9Ahve
	OCQVUi0HQq2BfezBuQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0daG-0000000DtNy-2UQx;
	Thu, 12 Mar 2026 10:48:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0daC-0000000DtNP-0Ym9;
	Thu, 12 Mar 2026 10:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=; b=KOZaB6VPojpyXbSwMlxld0miNm
	7g16fLh0k658rRfHRByxz/cYK+Czak0HvB0cjq1Unamdkddq9Jy0OXiIBQH1YliCbtT/owrnof8d7
	CKa5UkVy2W9R8ONXG1rKZQPQnmX6KvONtr+knwQdowiMI8outbs9Gemi2mG+NIBCt372NLD/8s1cP
	adTR2PRPPSaA3Y+qmus4a3zymTg4jxIG2k4wgW9CSuCOGAeFW+ozCrGtj+8VosmxDPwcyPL4XvOPl
	jyOpHjfkPsFXvSJKeas08oUU6/8+Xc10zfpixFPMJ2oks5lEol6rozarrh9NN6Qa/UphXJI+HvkjZ
	moD80Tiw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0da9-0000000BCaI-1IQ4;
	Thu, 12 Mar 2026 10:47:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5435C415A7;
	Thu, 12 Mar 2026 10:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FF315FDEB;
	Thu, 12 Mar 2026 10:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11EC610369C88;
	Thu, 12 Mar 2026 11:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773312457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h1uHovn6Yup6c3SyQUieodwk4UlRm93zEwCbjt4JOGM=;
	b=JaEHHHnqNbNmuD8Ch3LK6QaSJ74j0vNJCsrjA+LWq/5L84WfkVe1vDxAxQd+IxrJfZCa1a
	hT3qgXKMi0iGpoktI5bUvrNGNbafIDHPdCkcQys8BES2om5Es4IjiDSF/O0NYiWFZrs30b
	DK4n3LOBf79X8IKhHUEh9IB9rQMgmLhLlhR4iOAT0CWpesvwWDc4XGF7RkeJGsv6bna/9H
	h9sYoyn5cTcxoftMpAGK8iDeO31EkiuaiefYWnVbyAWxFLVIigg42FUZ8oO0FunKdNZIAR
	Ty/zLOLgE1raczyrfSphyi7ytsCEAGr/zaIPQg9Wg+rbyi3Ut/2oFnlepKEmww==
Message-ID: <a157ebaf-c8bc-4123-a7fa-e38beac8f268@bootlin.com>
Date: Thu, 12 Mar 2026 11:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode
 self-explanatory
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-6-richard.genoud@bootlin.com>
 <874impne0n.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <874impne0n.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104757_397094_E12C555F 
X-CRM114-Status: UNSURE (   8.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMDkvMDMvMjAyNiDDoCAxNzo1MCwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IE9uIDA1
LzAzLzIwMjYgYXQgMTE6MDE6MzYgKzAxLCBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+IAo+IEluIHRoZSB0aXRsZTogcy9tb2RlL21vcmUvPwo+IAo+
PiBJbiBzdW54aV9uZmNfaHdfZWNjX3tyZWFkLHdyaXRlfV9jaHVuaygpLCB0aGUgRUNDIHN0ZXAg
d2FzIGZvcmNlIHRvIDAsCj4gCj4gZm9yY2VkIQoKV2lsbCBmaXggdGhhdC4KClRoYW5rcyEKCj4g
Cj4+IHRoZSByZWFzb24gaXMgbm90IHRyaXZpYWwgdG8gZ2V0IHdoZW4gcmVhZGluZyB0aGUgY29k
ZS4KPj4KPj4gVGhlIGV4cGxhbmF0aW9uIGlzIHRoYXQsIGZyb20gdGhlIE5BTkQgZmxhc2ggY29u
dHJvbGxlciBwZXJzcGVjdGl2ZSwgd2UKPj4gYXJlIGluZGVlZCBhdCBzdGVwIDAgZm9yIHVzZXIg
ZGF0YSBsZW5ndGggYW5kIEVDQyBlcnJvcnMuCj4+Cj4+IEp1c3QgYWRkIGEgY29uc3QgdmFsdWUg
d2l0aCBhbiBleHBsYW5hdGlvbiB0byBjbGFyaWZ5IHRoaW5ncy4KPj4KPiAKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
