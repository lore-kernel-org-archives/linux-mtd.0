Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3545C55838
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75uyBy3a3aA62trZqy3NipCJlXDNiqKBbrWFU0W3CLM=; b=Xz6gCnZccbYSod
	cBPa8+fEP0w2UD9N5o7PTfefrZcqVroaDF06d3kwBF2x4PE34O9wS+LLpreWh6FVPa5oW9sUEgquL
	oxS/8p9Fg2nkuvq3Ji/S3QiUyxLwlM2rusNVOrQeNlaniISwzWlPt/mVB1OP46RqtlyK1iWmT0rqr
	v4N3sCmj+xDENFdUzG0o2SO8nmgjw81Bh8aLUjQFihwtyOhbL0Gw2yQo5mORQfY6/01pXL7MX+/07
	4sLLfEAXfxDiVbkJnc/U1p3Xa1Ux5MTQ2oTSBioioDPgbLENu9lMGbALcSZT8lpyFpr1TVACZWV49
	YoFXHM8D/J/LSyntn6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFaR-00000001yd8-0CV8;
	Tue, 04 Aug 2026 13:53:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFaO-00000001ycm-31FW
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 13:53:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77ECA1A13F7;
	Tue,  4 Aug 2026 13:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48D7C6029E;
	Tue,  4 Aug 2026 13:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9318F11C32CA9;
	Tue,  4 Aug 2026 15:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785851612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DLm0ZIP2XqJJ7QFhwp5mVOqsmoUFT3UUjj8NYu5NnR0=;
	b=dAWSvZYVgF5VFdSCQ0kIVFKsBaBZBR/F2l2R/IFpS6jUh1FS7OEiiDhifqxlYGB5ZfKqiO
	4fv2xyHC7Q/Qx7V2cg8k9up4Vbc9WZgLo4HM684cmSuZjp1ufX7t96m7d2vytt72D3U7sS
	9ijFpEMyqw03vycVUkqOPcptzr7LTd5oDiLCw2GJPUz8k0Evxj4q2ZF4hhS4U84ZByPF5i
	tV3eV+SRggDYjM75ueSAZ9SlOWVWoToFSbm1vloAJbPyUAb0Md4JFeyleS3hKC1u63t4OV
	0ApgQ3UMWCvKAH3dVL2hPnMbfNW7i5pW+DQ/PdCiHk3Sa7wmvjPxhLE8HwWKaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/27] mtd: spi-nor: Clean Winbond W25QxxJV family
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
	(Miquel Raynal's message of "Tue, 04 Aug 2026 12:58:58 +0200")
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 04 Aug 2026 15:53:28 +0200
Message-ID: <87tspaf0vb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_065340_938138_F10F728E 
X-CRM114-Status: UNSURE (   4.34  )
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

SGksCgo+IFNpbmNlIHYzLCB0aGVzZSBXaW5ib25kIGNoYW5nZXMgYXJlIHByZWZpeGVkIHdpdGgg
Y29yZSBjaGFuZ2VzLCB0byBtYWtlCj4gdGhlIHdob2xlIHN1cHBvcnQgd29yayB3aXRoIGxlZ2Fj
eSBjaGlwcyBhbmQgU0ZEUCBjb21wbGlhbnQgY2hpcHMgYXQgdGhlCj4gc2FtZSB0aW1lLgoKU2Fz
aGlrbyBjb21wbGFpbmVkIGFib3V0IHNldmVyYWwgYXNwZWN0cy4gVGhlcmUgYXJlIDIgcmVsZXZh
bnQgY29tbWVudHMKd2hpY2ggSSB0b29rIGludG8gYWNjb3VudCwgSSBhbSBhYm91dCB0byBzZW5k
IGEgdjQgd2l0aCB0aGVtLCBwbGVhc2UKZGlzcmVnYXJkIHYzLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
