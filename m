Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE58ECD992
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba6dy2rypkJrOj9G8W8CXkKIl59vCWmoGlVv+rr54jM=; b=uWrBx76/034Fes
	Ym4vfV76xYEgqGJjxx6YavbuFVyY1nFneTweD6N09TPIqcRz43klKIzzyCJ7ONK2vdMvY4cO2UG3V
	x1tEUeU4JXIk77+9W7G7vDba+nXDd1ZpoeeWO3OINtGWz0+tZgIyLibhwe/27/DYeAx3BBFZlQqED
	K6LwAXmIaQjO1WRVHi1NoGnOpALRJ7kcG68LMxRW6iePNHH2q2T9y7wF0iXSdmBPzwIZU8lSxZ12M
	znykIiBEGdIAlgfO3A4GPGZwprZL1B99Wdqy1uUMasRuc5dJ46ex2esJSyON/aHKSlQp6kaMpEYOQ
	LtSsj1eVSQ4ldMvIzbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3WT-0000000AKSo-43bG;
	Thu, 05 Feb 2026 17:52:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3WM-0000000AKSK-3hLc
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:52:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E9794E42424;
	Thu,  5 Feb 2026 17:52:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 111F86074D;
	Thu,  5 Feb 2026 17:52:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B76E0102F2A49;
	Thu,  5 Feb 2026 18:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770313919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RkGlrX3rK4GiNQXi+0GNluYODZgj5IeRWRRUdOdGIHA=;
	b=RPhvRriwf16jdV+qijBkY++Pd0PrSWuLgz9EDCAwuctF1XeyHjVsWsO6KGWsXzA5jqgvxA
	4CR2nB+vonFuXPekEHuPdF0FWjcXLGgebg0/hyHebj0bEyKOgLMtcRP96BfMnnrGgNOlAW
	TUAbwbriRyHi1fJyYDEirqwJFRx2Jv/CBYmMH6xRuRpCGwBjIfbiYuyKjJ/2y2JQEbHL7B
	ysQsrRGcoqhNlgkE0KdOj9zCJb3ziwD1LeH+PXYNVynkP1vnHGUNkIH61raiI6YhvbsurN
	KgZgGBv0WSUYyDQB3wJIGgFYlZxU0ApmZMDnA/r/trJj0LXQiV/qt1SGdQUZZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 12/12] spi: cadence-quadspi: enable PHY for
 direct reads and writes
In-Reply-To: <20260113141617.1905039-13-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:17 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-13-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:51:55 +0100
Message-ID: <87tsvvf58k.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_095203_051677_004F15E6 
X-CRM114-Status: UNSURE (   4.54  )
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

T24gMTMvMDEvMjAyNiBhdCAxOTo0NjoxNyArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBFbmFibGUgUEhZIG1vZGUgZm9yIGRpcmVjdCBtZW1vcnktbWFwcGVk
IHJlYWRzIGFuZCBsYXJnZSBpbmRpcmVjdCB3cml0ZXMKPiAoPj0gMUtCKSB0byBsZXZlcmFnZSBj
YWxpYnJhdGVkIFJYL1RYIHRpbWluZyBkZWxheXMgZm9yIGhpZ2gtZnJlcXVlbmN5Cj4gb3BlcmF0
aW9ucy4KCklzIGVuYWJsaW5nIHRoZSBjYWxpYnJhdGlvbiBzbyBpbXBhY3Rpbmc/IERpZCB5b3Ug
bWVhc3VyZSBpdD8gSXNuJ3QKc2tpcHBpbmcgYW55IG5vbiByZWFkIG9yIG5vbiB3cml0ZSBvcGVy
YXRpb25zIGVub3VnaD8gU3RhdHVzIHJlYWRzIGZvcgpleGFtcGxlIHNob3VsZCBoYXZlIGEgc21h
bGxlciBvcC0+bWF4X2ZyZXEgYmFzZWQgb24gbXkgcHJldmlvdXMgY29tbWVudCwKc28gaW4gdGhl
b3J5IEkgZG8gbm90IHNlZSB3aGVuIHdlIHdpbGwgbWVldCB0aGVzZSBjYXNlcy4KCkZpbmUgZm9y
IHRoZSBvdGhlciBjb25kaXRpb25zLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
