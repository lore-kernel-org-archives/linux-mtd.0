Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F0C44507
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXhYGsEUJNysFeZhoyuTojnY5cLLzDi6gsttuyVJKME=; b=1NJY7PrSB/cn0e
	BDQyu3x6ZE5odq6I0/UfLLDRE1i6hhUyZ0C1FhjoVvb5gd4NNndL6vXLpZVZlYd2ETCm7sW0aVWXF
	r0O8SPT4Y+vktkhdgb7hjdLAHQZh6NKK4I/zGuyAtJGUBUy1Xrq5nzEFIge4UqFe9NN5YR20Y10eg
	b+8dVr5XeMzL0o284LH7TPvy6HUgTcgVPHMxEevUYzGvPv4YfaJg7I3JtTpKAKyLNkq51hvNi2aqb
	gkecBz4Tb2w+aB7m34hfiPGGUW4xRGjMpS+eVmOlXpxUXF5E8SpPnNNoN0JFap8AZsz+rI0LJVh1x
	duBpww9HELkxKU57jaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf61-00000001rnY-1V5F;
	Fri, 17 Jul 2026 09:43:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkf5w-00000001rmg-2Ish
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 09:43:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05CD94E40E17;
	Fri, 17 Jul 2026 09:42:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBB0F60361;
	Fri, 17 Jul 2026 09:42:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AD1111BD03DD;
	Fri, 17 Jul 2026 11:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784281378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wDA7PH6SG+1IbJdVpWIYnNVXI6eysPHFkoxwDGzOMF8=;
	b=RMKxXvhHqCyFi8shz1mt3PWQBGeeER7Fz63dXsty2lJq9WFTgV+UppFmeBRyFTM1jgSX23
	dlA6ZLOzvmha37E6UpGdJB3A119HyfzvdI1ZqH9+7LX/UstQaJ8W/IwKooNM/fbpslfux/
	Jh5L9npxcSw3UUDG9t35gEaTOM3TSrCbk8B5QhcMWcd6vwtzc1wMa5Jt44+xti8j8pSf6P
	Dm3Isj+PTvNjQqgHJ7nIMbpzVxzfFZWDMmiSDnJ45dBOOCLDguLfeKLcOpWh9okoQRklkm
	vCdnSp/IPYT1hBoV4xzIQVSyIgu02dEPeoHpGLjjKKP/odSR0OLpLEpzEgId0Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Matthew Brost <matthew.brost@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  David Airlie <airlied@gmail.com>,  Simona
 Vetter <simona@ffwll.ch>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  intel-xe@lists.freedesktop.org,
  dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] mtd: mtd_intel_dg: add survivability partition
In-Reply-To: <20260715-cri_surviv-v1-1-61763a6f1076@intel.com> (Alexander
	Usyskin's message of "Wed, 15 Jul 2026 16:45:29 +0300")
References: <20260715-cri_surviv-v1-0-61763a6f1076@intel.com>
	<20260715-cri_surviv-v1-1-61763a6f1076@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 11:42:54 +0200
Message-ID: <87qzl2j6jl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_024300_729155_BD4899B0 
X-CRM114-Status: UNSURE (   7.23  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMTUvMDcvMjAyNiBhdCAxNjo0NToyOSArMDMsIEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBBZGQgb3B0
aW9uIHRvIGV4cG9zZSBhZGRpdGlvbmFsIGZpeGVkLXNpemVkIHBhcnRpdGlvbiBzdGFydGluZwo+
IGZyb20gdGhlIGJlZ2lubmluZyBvZiBzdG9yYWdlLgo+IFhlIGRyaXZlciBjYW4gcmVxdWVzdCB0
aGlzIHBhcnRpdGlvbiBleHBvc3VyZSBpZiBmaXJtd2FyZSBvciBoYXJkd2FyZQo+IGhhdmUgZGV0
ZWN0ZWQgZmFpbHVyZSB0aGF0IG1heSBpbnZvbHZlIGNvcnJ1cHRlZCBwYXJ0aXRpb24gdGFibGUu
Cj4gRml4ZWQtc2l6ZWQgcGFydGl0aW9uIGFsbG93cyBmdWxsIHN0b3JhZ2UgcmUtd3JpdGUgaW4g
dGhpcyBzaXR1YXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxl
eGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+CgpJJ20gbm90IHN1cmUgSSBmb2xsb3cgdGhlIGV4YWN0IHVz
ZSBjYXNlLCBidXQgSSBkb24ndCBzZWUgYW55IG1ham9yIHNob3cKc3RvcHBlciBmcm9tIGFuIE1U
RCBzdGFuZHBvaW50LCBzbyBmZWVsIGZyZWUgdG8gdGFrZSB0aGlzIHRocm91Z2ggZHJtLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
