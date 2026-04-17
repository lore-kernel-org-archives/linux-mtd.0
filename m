Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E7DF99C60
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 20:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1jduEXTo2BkL/h0kaWC5jJH+ImujL8DGtaH4jC10Gk=; b=w3ro08BnM4B0pl
	FH2qnD+HRCVxJ/IXX/rm/zJXYFQhxfjtiZNaNwWhAX+n+UI9J6Jkg0UPDaIHqRR0zmAnwoMVb/687
	Vuv6mUVNnjTzQp3yMPMaqDTaKBrxJcZ6ywpVzeJ+5aHSJNEc3gyC1cTA+DbHUnEqNYqaZCq2Cr+gC
	PRq91jSBQg9w972zS4zTbL7JA2EFOENBumOIS6YmjBSzO1UUzjajmYZ76Xd0qGSRn3r6ETfWq/sas
	h86aUFbDR4lEdevFUPZFIK2LuuhVGUE3VuEM+cAizXKH72NjrnG+FSw33/VsA3IEMxwYYDywArJ5K
	tZCVjJn04wYzv/HQFKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpOz-00000004R7h-2O5W;
	Fri, 17 Apr 2026 20:02:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpOw-00000004R74-1M4f
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 20:02:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E6EEFC5C3EC;
	Fri, 17 Apr 2026 20:03:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46E0260497;
	Fri, 17 Apr 2026 20:02:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAFFD10460A90;
	Fri, 17 Apr 2026 22:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776456170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tm5OXVBCIZYVoQz7FxJMVStjBJSL59brnNGVsbiF6CI=;
	b=ZE2qDuBUNBqncC+Tpvn3G5i5mhKP/f8FoeqZHAN6jQQB2gRGm2qbTaiMJZ807PsOOThx8j
	VUrCWiQDLDdlE7XYCUVmODZYIauQX/3Fzugt228iCmZbZ4tAq/lTg1Je1pv/0RCwBTdSjq
	wuXsJFd8moGSOzfh4RvLhOROm0aoIjDmmObnHXR9F/EcFmE2R/EawLaPgml5FmKmlLfVu/
	VB9PnaDTpcwAAhGGZXi7u2yCULdo2Ts6gv1qP0eySvmmXkNqMHR+ShcV5Zaz4IdbrmRLlZ
	PAJLrORuuIBGD9DwH/xvv53G3L9Uql2gaw+5FPPEnZVBeaqMVHF6snhiwke8sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for 7.1
In-Reply-To: <2vxzo6jtac4p.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	08 Apr 2026 12:07:50 +0000")
References: <2vxzo6jtac4p.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Apr 2026 22:02:41 +0200
Message-ID: <87mrz18ie6.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_130254_551096_69C51C47 
X-CRM114-Status: UNSURE (   4.07  )
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

SGkgUHJhdHl1c2gsCgpPbiAwOC8wNC8yMDI2IGF0IDEyOjA3OjUwIEdNVCwgUHJhdHl1c2ggWWFk
YXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBIZXJlIGFy
ZSB0aGUgU1BJIE5PUiBjaGFuZ2VzIGZvciA3LjEuCgpQdWxsZWQgaW50byBtdGQvbmV4dCwgdGhh
bmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
