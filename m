Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AAEC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVzCeZ7U38Rl7nFa6fDTsxht3BBMrSeJB7mSoL5EWLA=; b=3TRWouNhYmeXsY
	HbACXbjLePe8LX6PdaMnEYoD3tVkpg6jKI2BtuTn/Q10WCE+OozryRc6twa9FwWgSSv+KsE/OmUFe
	7wXpUuswcp0OeIQp8Cj5ra1vqyht2soBiN7FQ/D4bh1mwqC8JaQPtHeJeq2gMl4AwMztWGgn6gEY+
	LLqpCCJEx0MuRmLqwPe4ffHkKL45vcjBvM4JG5jtZFslwwOuISu0HxtQcT3yiQMELafR+Ju6V74FC
	kKMEwu1CS1POt8nbY8PfAHQhMJAh/JTKBo22hmICjZN1EbRbc8pdE5ngkNKBfYQKn09dZXUMdc3HD
	5FllDvzBwtPgxpfATRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckp-0000000BbtE-12ZB;
	Mon, 06 Jul 2026 06:24:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckl-0000000BbpF-2xCG
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33DDE4E40CA5;
	Mon,  6 Jul 2026 06:24:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03266601A2;
	Mon,  6 Jul 2026 06:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3BA311BB9890;
	Mon,  6 Jul 2026 08:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3bOyRrRg5NIlkC5Gzfb0zGlziitAdyLpprj4mRwqvjg=;
	b=pvRygfjRsbhnPbjgQMAL1BobYAHz2+arIhrGO1DgS3B3ozPBukv2jm5F0UBoWWrLuomOnC
	dcJriaqYD0ry2xhp0blTjPRbJ4eq5Cfm+3Tmi75PtDbolpHDg6lo7JeMrB+N7sGq7BGpth
	11o4FJUofilF5j2cKg1pCSpyZfRulA1aYXJV8JQz6UMqKfr3QtuhKmdl+mum6ZzHas0QqS
	qAvP9uOOkULVL6Omn5PQ4pYDHtUOTKRnbuWaV55npFKCx4U3whfZDPfHxGpzc5TLCfvvtz
	DTFyks8KuZPEP2gmCFi/uOEjD/b9BXjyRlkST4lCnT0mAfEoBhIdALDheRntUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@kernel.org>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703073943.43373-1-pengpeng@iscas.ac.cn>
References: <20260703073943.43373-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_slc: fail DMA transfer on
 completion timeout
Message-Id: <178331906452.868671.4337256162199028270.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:24 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232427_910990_98CA1051 
X-CRM114-Status: UNSURE (   6.13  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxNTozOTo0MyArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IGxwYzMyeHhfeG1pdF9kbWEoKSB3YWl0cyBmb3IgdGhlIERNQSBjb21wbGV0aW9uIGNhbGxiYWNr
IGJ1dCBpZ25vcmVzCj4gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkuIEEgdGltZWQgb3V0
IERNQSB0cmFuc2ZlciBpcyB0aGVyZWZvcmUKPiB1bm1hcHBlZCBhbmQgcmVwb3J0ZWQgYXMgc3Vj
Y2Vzc2Z1bCB0byB0aGUgTkFORCByZWFkL3dyaXRlIHBhdGguCj4gCj4gUmV0dXJuIC1FVElNRURP
VVQgd2hlbiB0aGUgY29tcGxldGlvbiB3YWl0IGV4cGlyZXMuIFRlcm1pbmF0ZSB0aGUgRE1BCj4g
Y2hhbm5lbCBiZWZvcmUgdW5tYXBwaW5nIHRoZSBzY2F0dGVybGlzdCBzbyB0aGUgdGltZWQgb3V0
IHRyYW5zZmVyIGNhbm5vdAo+IGNvbnRpbnVlIHRvIGFjY2VzcyB0aGUgYnVmZmVyIGFmdGVyIHRo
ZSBlcnJvciBpcyByZXR1cm5lZC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRo
YW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogbHBjMzJ4eF9zbGM6IGZhaWwgRE1BIHRyYW5zZmVy
IG9uIGNvbXBsZXRpb24gdGltZW91dAogICAgICBjb21taXQ6IDE3YThjZTg0OTY0ZjI0M2M4Zjg5
ZGM3MzUzYWM3ZThkMzEzN2JjNzQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
