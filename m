Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC83CD4F3C
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3RNHlKzJhn6l1xblFSh3r3Og0XGWlJ6bdY745I1E1s=; b=xW8z0rlAqaTiWU
	0xTAjCJ+0z/vwADXSBYx/9cdFsjcOVm8G5zSxgk2QA13gPOI9DlH4uf0w63FHVLCarytdIx1UXZNA
	35/XvWKfnziA2fwTxsOFlYodO0y1biDqY3lSESJphQaIMuLwActjWbQCy+DOGRNvxIUIXEmzup5CU
	zMPgE/0hf/mpdMYs3Kv5ukcOM9uVklr3/lONb4IyqYBDp7+FW1pv/WfCu5sngHA6EXAYB1OEx9h/b
	gBcbFJYWjVKH7a/T2knMwR2xN7R0u/8/gHLvYzODRGHWeuAtWfg7woDLFH1l+i82VrsafMgYkX6IA
	vokpLMD7kBCGcmYvcEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOui4-0000000F714-2AXS;
	Mon, 18 May 2026 09:56:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOui3-0000000F70c-24tp
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 May 2026 09:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IAne4eZYDOyIBZGzlpPHVFsT4GTCCXeAGPyHUMC7Lxs=; b=POgUdp+9vK1WDBnFMjqHuHd6ji
	scF2BWWNz8d6GA7mwZMBPXeyy8TA2WAs/TCHlzI38bkP4QdPlxk3KyEsJ6HlckKVFfpYsOq52zTmS
	KbpTfWIqyExFRsxvt3tc86dJXn0CzSvPNfe4CBydT9J+P8biy+Fx9hL7RzUZqD24DQQmEc55qz7IL
	4jKe9XnRfg7O2bNdDEtnPl6CFVv1nNFWREkEw1YZa8tsk2+CG3jkL3axFHPRMg+fmAzVYSry9Opq5
	FSpDo5z/cjJiIz+aZZrOwYkmSdW+HtXXnqTaQ9wcj2q2A7ESHpbklnDtD/GL+26ukTtaBvZr5HDsM
	tHSaoIKg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuhr-0000000Aewt-32VR
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 09:56:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC60AC5DC40;
	Mon, 18 May 2026 09:57:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1A84602B8;
	Mon, 18 May 2026 09:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E299611AF8DDA;
	Mon, 18 May 2026 11:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779098166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IAne4eZYDOyIBZGzlpPHVFsT4GTCCXeAGPyHUMC7Lxs=;
	b=Dt0TLPIEK1lbsyAn+TU0fDFKhrN733OU/Ah+yHjDTs8u4+wh4+z2QgxIRkKGr+cGQTG3a9
	hIjEBszRUTWKa6x7BtB7kLQFvVuyyXKwlW/hC+VKfFXy2m0kjvcgb0KRYsZkkktf7CdeDi
	o7kmsu6PDDfRmK8037tLe2Lk50l3jCNFtlVuSmcYBdU2nOYbFuXSyU8LfDey8GLaTRw53V
	ExfYQE360+4Rt+fJG6frkS+hUyxK4sxYB7u0rnT9caeriaA9pHj2KJm4acLtoJ60GlPzRs
	m0OfBbJRcOJZ3ukxOLYmgPnH3SeiV1rJaOBd0+liV3zM7cub+x/tMCN8emeXcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org,  Steam Lin <stlin2@winbond.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Md Sadre Alam
 <quic_mdalam@quicinc.com>,  Sridharan S N <quic_sridsn@quicinc.com>
Subject: Re: [PATCH 4/4] mtd: spi-nand: winbond: Sort the devices
In-Reply-To: <agrZHsyrm1jyFMj6@atmark-techno.com> (Dominique MARTINET's
	message of "Mon, 18 May 2026 18:17:18 +0900")
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
	<20241009125002.191109-5-miquel.raynal@bootlin.com>
	<agrZHsyrm1jyFMj6@atmark-techno.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 18 May 2026 11:56:02 +0200
Message-ID: <87wlx1t51p.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105616_149734_C7EC6410 
X-CRM114-Status: GOOD (  13.13  )
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

T24gMTgvMDUvMjAyNiBhdCAxODoxNzoxOCArMDksIERvbWluaXF1ZSBNQVJUSU5FVCA8ZG9taW5p
cXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPiB3cm90ZToKCj4gTWlxdWVsIFJheW5hbCB3
cm90ZSBvbiBXZWQsIE9jdCAwOSwgMjAyNCBhdCAwMjo1MDowMlBNICswMjAwOgo+PiBVc2UgYWxw
aGFiZXRpY2FsIG9yZGVyLCBub3QgYmVjYXVzZSBpdCdzIHByZXR0eSwgYnV0IGJlY2F1c2UgaXQg
bWFrZXMKPj4gc2Vuc2UuIFRoaXMgd2F5IHRoZSBkZXZpY2VzIGFyZSBsaXN0ZWQgYnkgZGVuc2l0
eSwgYW5kIHRoZW4gYnkgaGFyZHdhcmUKPj4gZmVhdHVyZSBzZXQuIEFkZCBjb21tZW50cyB0byBt
YWtlIHRoZSBsaXN0IG1vcmUgdW5kZXJzdGFuZGFibGUuCj4+IAo+PiBUaGVyZSBpcyBubyBpbnRl
bmRlZCBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IFByb2JhYmx5IHdvbid0IG1hdHRlciBmb3IgbW9z
dCBwZW9wbGUsIGJ1dCBGV0lXIHRoaXMgY29tbWl0IGFkZGVkCj4gVzI1TjA0S1csIGFuZCB0aHVz
IHdhcyBub3Qgb25seSBhIHJlLW9yZGVyIChJIGFzc3VtZSBzb3J0aW5nIG1hZGUgeW91Cj4gbm90
aWNlIGl0IHdhcyBtaXNzaW5nLCBidXQgZm9yZ290IHRvIHNwbGl0IGl0IG91dCkKPgo+IFRoaXMg
aGFzIHRoZSBzaWRlLWVmZmVjdCB0aGF0IHRoaXMgcGFydGljdWxhciBuYW5kIHdvbid0IHdvcmsg
b24gc3RhYmxlCj4gdHJlZXMgKGRldmljZSBhZGRpdGlvbnMgYXJlIHVzdWFsbHkgYmFja3BvcnRl
ZCB0byByZWNlbnQga2VybmVscyksIGJ1dAo+IEknbSBub3Qgc3VyZSBpdCdzIHdvcnRoIHRoZSBl
ZmZvcnQgdG8gc2VuZCBhIHN0YWJsZSBwYXRjaCBqdXN0IGZvciB0aGF0LAo+IEkganVzdCB3YW50
ZWQgdG8gcG9pbnQgaXQgb3V0IGluIGNhc2Ugc29tZW9uZSBlbHNlIHNlYXJjaHMgZm9yIHRoaXMg
c3RyaW5nCj4gb3IgNi4xMiBrZXJuZWxzIG9yIG9sZGVyOgo+IHNwaS1uYW5kIHNwaTAuMDogdW5r
bm93biByYXcgSUQgZWZiYTIzMDAwMAo+Cj4KPiAkIGdpdCBzaG93IDI1ZjY0M2EzZDczZmY5ZjU1
OTMzOWRiYTZhYzM1YmVkZDhmOGU0ZjYgfCByZyAnXlsrLV1bIFx0XSpTUElOQU5EX0lORk9cKCcg
fCBzb3J0CgpbLi4uXQoKPiArCVNQSU5BTkRfSU5GTygiVzI1TjA0S1ciLCAvKiAxLjhWICovCgpD
cmFwLiBJbmRlZWQgSSBkb24ndCB0aGluayBpdCdzIGEgYml0IHByb2JsZW0sIGJ1dCB5ZWFoLCBz
b3JyeSBmb3IKbWlzc2luZyB0aGlzLCBpdCBzaG91bGQgaGF2ZSBiZWVuIHNwbGl0LgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
