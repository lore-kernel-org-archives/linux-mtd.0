Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33D6CF3182
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCwOdiit1ELYtPN/pav8ZM8BWkiZQcJzRMsglacPyOM=; b=YWKUYTcRax4L4V
	thMMaXhwztZSItqrQZaHmXpjA+PdAxdYEt7byPT9PD8h4HNd3C67Qzie/1V1rm/bRViIcb1w2lZnV
	aNYcv5cqEGY7lkLUdvjGRSrP2h3HVRhyr0e21zvgWyYw+s1cf2GFvtZB/wTPxDRypN5IIe9+F4hSK
	jYyZJ+xVT3AqLM/x1Cd6phnu1/G+yK6v6H5H/8iF6bMzlBSG/h1FlA0XlxE83AMDccQ9fKPv/LQaj
	7yfq3hlUXtNkhENig6qXFkX7lQISUALzfBkK6LRSoMCfRNliA8tBpJU/Zzy5PLgaXk0eYpkzYE7yX
	wVJM0xgH83JsP8oBeGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeM6-00000002r74-0PYq;
	Wed, 19 Nov 2025 09:20:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeM3-00000002r6U-3TCQ
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 09:20:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 683FF4E41787;
	Wed, 19 Nov 2025 09:19:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DB7760720;
	Wed, 19 Nov 2025 09:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D83F103719CC;
	Wed, 19 Nov 2025 10:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EwmAMJIFnDR1EPtnj98McrOf0sLvp4Xwrmi0okZD8zs=;
	b=O10zcVHlY/aJcAjawEWMiDdTh8d1BH0PW++33KZruso/M0VDJ2AlRoDqGkGi1uJFRGbMO6
	oU+Tc4t6IFJn0/k+hI/u5AHYSrnyIki/kRn62y1AUxx4qlH15R/FwfNu8V5lqSzI7YfH1N
	jS00FiHEzUlS/oa2t4mQ2SMptJ1G2Qkb12RQVKOjfU1cQdydDfveU2H9x28R4RiVy4JcMn
	USl/D63hao41vo8jb90elvT752uw9shGzK1Ll0TdQCWxYeL6knzudD1jxTAjNkckDq36Dj
	Yzj199duac2yoKeg+icTrQ05z981kkkx6upPQ6MPegdJy5BtSuu2xxyofPRAiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 07/19] mtd: spi-nor: swp: Clarify a comment
In-Reply-To: <DEBQB9D7POZD.2S729874RIZH6@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:55:58 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
	<DEBQB9D7POZD.2S729874RIZH6@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:19:53 +0100
Message-ID: <87zf8icrba.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_012000_026172_99A2B1C9 
X-CRM114-Status: UNSURE (   8.08  )
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

T24gMTgvMTEvMjAyNSBhdCAxMDo1NTo1OCArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTm92IDE0LCAyMDI1IGF0IDY6NTMgUE0gQ0VULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBUaGUgY29tbWVudCBzdGF0ZXMgdGhhdCBhbGwgcG93ZXIg
b2YgdHdvIHNpemVzIGFyZSBub3Qgc3VwcG9ydGVkLiBUaGlzCj4KPiBObyBpdCBzYXlzICJzb21l
IHBvd2VyLW9mLXR3byIuIFRoYXQncyBjbGVhcmx5IG5vdCBhbGwgOikKCkFoIGNyYXAsIEkgZmFp
bGVkIGF0IHJlcGxpY2F0aW5nIHRoZSBjb21tZW50IGhlcmUuIFdlbGwsIHRoZSBjaGFuZ2UgSQpi
ZWxpZXZlIGlzIHN0aWxsIGNvcnJlY3QgYnV0IHRoZSBjb21taXQgaXMgaW5kZWVkIHdyb25nLCBJ
J2xsIGZpeCBpdC4KCj4gSSdtIGZpbmUgd2l0aCBlaXRoZXI6Cj4gUmV2aWV3ZWQtYnk6IE1pY2hh
ZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
