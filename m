Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E33FD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnw5Rmkepd/qMi3bIOaTfREA59x3btBx3+fmyuMVKO4=; b=MXO92XRfmhvQLT
	kNumHN2L42Q2/1MXXeBzT4PmA5+CQs/A0PIcCVvmH1ZYIWAQgRD7ohG2VBvd2HGW9qp0O8ZcACDJG
	AAurLgb/IDrzE2u962Bp/nmyVZEjCdu67jF0hKv/Ob95es4+0U8QsqYiGl5U3g691J1PhTgzoaXup
	7K+yXGt5dLPlqHrbSqRMS5nNl7nFCnxb/CSfkKQDZMoNbK9nyiH633B1GhpVGe+lShrWMY8LYGYQK
	748ModO/DMjthfoz/Jnqt+qRYbcoq+W+sJatgCjmOqxzPBMreGefqQh/ok4FrwhG+CF0bRp6sEGl8
	2RjiziU4mJnChIV9CQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI5e-00000004ZHx-1n7T;
	Wed, 25 Feb 2026 16:50:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI5c-00000004ZGd-09mT
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:50:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A315D1A1315;
	Wed, 25 Feb 2026 16:50:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 769775FDE6;
	Wed, 25 Feb 2026 16:50:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0009210369259;
	Wed, 25 Feb 2026 17:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hQp/zBOrGxV124AmQ/rsh12ZUEX0VESaRUWKh0AHem0=;
	b=GYy86BktBvk8niSKA+rzeiErIbZtHin4qDr30ytFnE/ZlLxevmmKTl4S5bg2/M/4ULii5p
	CIwVo4agdGi7UhpKLnkcB1N3s/a4pVtf+6f2x0tF5Vi5jSO545neuTXR7X6twYzFuqea+m
	bcNLQL+aoJyxKRs9jJBUlnm0q5KO/z8xTn8fhrjoJTixfKYTOIJ0VhE/xBnTjPrENCUbG3
	GSqEdraXN1HaEW/MbDCegQKDIxyPVHcQeJZM+GhSdzcSDkseHXzZUeJJ/N6MM38HRJQocO
	S0m6MKqp6Fw1tiWjbtrUWPwVsm1kZ7Jg3V5gYuBiqCC6GrU/bVNDefaYEZ8ajg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260221081207.711359-1-vaibhavgupta40@gmail.com>
References: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
 <20260221081207.711359-1-vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: cafe: Use generic power management
Message-Id: <177203821682.1989694.10452993545865940770.b4-ty@bootlin.com>
Date: Wed, 25 Feb 2026 17:50:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085020_209952_2C730F30 
X-CRM114-Status: UNSURE (   5.84  )
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

T24gU2F0LCAyMSBGZWIgMjAyNiAwODoxMTo1NyArMDAwMCwgVmFpYmhhdiBHdXB0YSB3cm90ZToK
PiBTd2l0Y2ggZnJvbSBQQ0kgcG93ZXIgbWFuYWdlbWVudCB0byB0aGUgZ2VuZXJpYyBwb3dlciBt
YW5hZ2VtZW50Cj4gZnJhbWV3b3JrIHNvIHRoZSBwY2lfZHJpdmVyIGhvb2tzIGNhbiBldmVudHVh
bGx5IGJlIHJldGlyZWQuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiByYXduYW5kOiBjYWZlOiBVc2UgZ2VuZXJpYyBwb3dlciBtYW5hZ2VtZW50CiAgICAg
IGNvbW1pdDogZDlhMmE5MmI0MjA5ODM4YzUxM2YzMWVlY2M2YzhiZWY0YTEwN2FiMgoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
