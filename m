Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25487C2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GF4GKrYpUnGjldqCa1qBMMNul6KBZD+HckkdSPdGCIg=; b=rjh2kaWgXqvI6w
	hunzeplnmBL8zcqIKgUw7Leehu7514Z9UIl/2wVyP3Cuu/mpx2nfNbe1Sbo7M008xfLpas+t0Wfag
	ynU22i37iRBanhf5MYm+92OhLmKkV9r1csgjSiKt/p3TQXplpTQPGi5o8Cdps0mkaygencUWMikgi
	zKGcWHqzSNfuy6KlB2TK7Wa8UsEYOu60ZYtQP0R7RSP0VGVs6COdQJ5yiMVt5FosiXGmIYu8FT7Fa
	Epgv53LBgaB9EALLlpuiAUWpp8oelaAMA0nexy83AVU85pGVrFAjlYM2mRg6o45RU7VLGW3fgI9m0
	277ByZEqL8nwy89v1VIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL02-00000008BZL-0fsX;
	Fri, 07 Aug 2026 13:52:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKzz-00000008BYn-0bfp
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 13:52:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7E0C1A14AF;
	Fri,  7 Aug 2026 13:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8412B603F0;
	Fri,  7 Aug 2026 13:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14CE011C37930;
	Fri,  7 Aug 2026 15:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786110751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sehs0JKZLsbalEcA9TUivsHXpW1w+ZYuJOQ3N5kVZPQ=;
	b=QlbZQhdwmGgDiYJFMAWWNgp/uTEZZrszwepZBY6UslDw9OAWqa5/FU894DpHH03v+uBI2U
	LTmKfbLPqHtu7rT5obB0UIlmN8nRLy0aYMgnkj30is3H2iyEomcWRd5Ews7GfpydbjyMG/
	ybGLNxFzBUn28DTI2g+Y/7G2kqWV8mxR2Oi0ehwliyx6UZ7kf0HzIEBtsk1e5PHE65H9TK
	BrMvFgW/WqJSaoAdfeeQrrPIFHlhmfj8WTyB3P3yF3GqEoXxxv8bjBqA8voIIvc2FOMs+e
	7XO44GLigf+UgIF4sm+stJEMpSXrAT90v0uy9awFH4+L5aox531HrieE5VZToA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  s-k6@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
In-Reply-To: <20260807064339.1632249-2-md.alam@oss.qualcomm.com> (Md Sadre
	Alam's message of "Fri, 7 Aug 2026 12:13:38 +0530")
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
	<20260807064339.1632249-2-md.alam@oss.qualcomm.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:52:12 +0200
Message-ID: <87zeyyavhv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065235_318482_59B89616 
X-CRM114-Status: UNSURE (   3.07  )
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

T24gMDcvMDgvMjAyNiBhdCAxMjoxMzozOCArMDUzMCwgTWQgU2FkcmUgQWxhbSA8bWQuYWxhbUBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKCj4gQWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1TjA0
TFcgNEdiaXQgU1BJLU5BTkQuCj4gSXQgaGFzIDgtYml0IG9uLWRpZSBFQ0MgYW5kIGEgNDA5Nisy
NTYgYnl0ZSBwYWdlCj4gKDQwOTYgYnl0ZSBtYWluIGFyZWEsIDEyOCBieXRlIHVzYWJsZSBPT0Ig
b25jZQo+IG9uLWNoaXAgRUNDIGhpZGVzIHRoZSAxMjggYnl0ZSBwYXJpdHkgYXJlYSksCgpUaGF0
IGlzIG5vdCB3aGF0IHlvdSBkaWQgYmVsb3cuIEJlbG93IHlvdSBkZWNsYXJlIDI1NCBmcmVlIGJ5
dGVzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
