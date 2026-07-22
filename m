Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BFCC44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIW2ytWP9FDXoSzmd1VGkGZTtLZT10CR7u9RZe0Gt/g=; b=0iCcTkie0GjFh/
	oZUCU8/yC2o5t4+3dI0Sn/AhRJ8eXf3rk65Eq+2UxUrDd8CUJADRLBXxuyVBOTWEpt7osFNCYOCkJ
	musEOvsXEeu1q/asQehr9W0yx7jB67wCNIHUnjkUiBeT8hm5LQfPKEYLJfNP9N1w2zfzgBMbby0RZ
	Lt2iRCfXDzbaa7zKuMjJCp0KiOHJ/yt6BDcj3Uv7kmOlobvHAc7mZyPwXovYiiKG2FM3DznU9hKGD
	/34CJahu3aUa5xukqg5S4hNIRMY2/N4GafQNNvMjExoOPBErcM34bwSNu9ZkZjazWOIb7vM00hxjW
	Nwsilhf6UQVnQ1rWid6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWYt-0000000Boyb-1OIt;
	Wed, 22 Jul 2026 13:00:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWYq-0000000Boxq-3rgm
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:00:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 729E51A1159;
	Wed, 22 Jul 2026 13:00:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 405E860388;
	Wed, 22 Jul 2026 13:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D92C011BD3B79;
	Wed, 22 Jul 2026 15:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMa5Z/hZxcEcWXiwocve4mdsYEjt3gg8I4J6F+aa7fE=;
	b=OfouKOlBS7GeucAn4RVS460M1Cm4Bw5Rm7pkvX+MaSFrWANE/vQq6+zOyi+fIhziFk1XF/
	nqcAoxamEtIgslrA9YasbZwBrk1iE3RkXzahltgGLpqmuVxR5XH/9GO1VKW1dmFp6p6pf2
	KEwPVKrYJlOoz0YVrb+2/hxp4e+bxbwZGgWrPAlaV16VLXid9qka2aCHoZU8StbuCNS3YG
	tAWHMBFcZs3jj+LGCefTP0WX67iHiQ0ng/20iqaOtzJ3uab5cWtzr77rqGy8SBYtDJD1Le
	8w5QxXu1U6PJchrirHnYzVrEGXe1S25omV7r7bBGiFdX5Jdoo19WE823E0V9Lw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Drop
 redundant data
In-Reply-To: <DJRJU0NR8VX6.KP54519F454X@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:13:52 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-5-87e5d3122244@bootlin.com>
	<DJRJU0NR8VX6.KP54519F454X@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 15:00:28 +0200
Message-ID: <87wluni3gz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_060033_102968_0E936B2F 
X-CRM114-Status: UNSURE (   6.64  )
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

Cj4+IFRoaXMgY2hpcCBoYXMgY29ycmVjdCBTRkRQIHN1cHBvcnQsIGFsbCBmaWVsZHMgYXJlIGNv
cnJlY3RseSBmaWxsZWQgc28KPj4gd2UgY2FuIGRyb3AgdGhlbSBmcm9tIHRoZSB0YWJsZToKPgo+
IFlvdSdyZSBmb3JnZXR0aW5nIHRoYXQgInRoaXMgY2hpcCIgaXMgbm90IG9ubHkgdGhlIG9uZSBt
ZW50aW9uZWQgaW4KPiB0aGUgY29tbWVudC4gU2VlIHRoZSBvcmlnaW5hbCBXMjVRMzIsIHdoaWNo
IGRvZXMgbm90IGhhdmUgYW55IFNGRFAKPiB0YWJsZXMgYW5kIGlzIHVzaW5nIHRoZSBzYW1lIGlk
LiBFZmZlY3RpdmVseSwgd2UnZCBkcm9wIDRrIHN1cHBvcnQKPiBmb3IgdGhhdC4KClNpbmNlIHRo
ZSBwbGFuIGlzIHRvIGtlZXAgbm9uIFNGRFAgc3VwcG9ydCwgd2hpY2ggSSBhZG1pdHRlZGx5IHRo
b3VnaHQKd2FzIG5vIGxvbmdlciBhIHJlYWwgY2FzZSwgSSB3aWxsIGluZGVlZCBkcm9wIHRoZXNl
IHBhdGNoZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
