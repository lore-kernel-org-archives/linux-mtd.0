Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E5ECD8CB9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2026 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjyZjMsIai8Xb+DVha5hAn+gTHW5p2IX60uFglQf8mc=; b=sbthhX07yajYje
	Z8yRLDUYR3OtaUaXhft1hT6YuMJ95A0OKtVV7KCEIwqJKzvtYmI2YomSgt7CjuTBsSP9F9JaAaPap
	GTw4ByX15/UvAJrZ+bbqFg3qqPmy4hGncUmHy1nUCjTe7+GIWEMCCQi2VMCBy1ljruQSBvGqjXZc8
	oTu6Ug1vwkRPqHrfVBwbYO9ElI5GqkxOfRO0xsjKrYTPoMy51o+661fVv4syYbYST0td2ofr9RZ5y
	q2GQgiRklOU5deG0rTQz6Tvx93OGvg4jKwSys6+j9GZAIW1KVwHOl1cdlA4t9S09ckbZpJsDBs7sU
	T44nEgLx/BpZjGPFup0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZho-00000008roe-205C;
	Thu, 11 Jun 2026 07:20:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZhl-00000008rnJ-0H8C
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jun 2026 07:19:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D38D91A38A1;
	Thu, 11 Jun 2026 07:19:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A78765FF03;
	Thu, 11 Jun 2026 07:19:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7B30106B9E27;
	Thu, 11 Jun 2026 09:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y4C2XaOwSWICaavjGpI7KW/vZmmvms/DqEIwXcxJDhg=;
	b=WOKtpctVcctiUma9Ed7sNQA2XMSdS5BZo7Ya5PlviZtvgSI43BoTLrmTQdDrg84+M1mFYT
	eYyq9BBWX01M1URzgFqeC/f8DIuUWlVw85NLTj9pCMDBCLBVdIKQyiaCFo4kZhELvP38sI
	F9NjowtaphCBitO1jST2LRQ5mxRH6csQqSjBZ/e7/thAQLtqR0ZrLGxQBuUiGX9lLr/nTs
	JeFcbd4i6bV2kk+B9Nc0KYQT9VIEoEwwEBY5e8bnHC8IIfSmoDdTbAdhP/vPyNksBe4JrV
	zg+GL4irEVukn2UFhXRk08MFpIKeko2n0dUFy5qDfKTO9r/wxUuVfQ+d48xKlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: chleroy@kernel.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260602020723.533971-1-rosenp@gmail.com>
References: <20260602020723.533971-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: use ioread32be/iowrite32be and
 allow COMPILE_TEST
Message-Id: <178116239253.420941.14745096482092072324.b4-ty@bootlin.com>
Date: Thu, 11 Jun 2026 09:19:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_001957_238637_F6AE5622 
X-CRM114-Status: UNSURE (   6.88  )
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

T24gTW9uLCAwMSBKdW4gMjAyNiAxOTowNzoyMyAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
UmVwbGFjZSBwcGM0eHgtc3BlY2lmaWMgaW5fYmUzMi9vdXRfYmUzMiB3aXRoIGdlbmVyaWMgaW9y
ZWFkMzJiZS8KPiBpb3dyaXRlMzJiZSB0byBtYWtlIHRoZSBkcml2ZXIgcG9ydGFibGUuIEFkZCBD
T01QSUxFX1RFU1QgZGVwZW5kZW5jeQo+IHRvIGdldCBidWlsZCBjb3ZlcmFnZSBvbiBub24tcHBj
NHh4IGFyY2hpdGVjdHVyZXMuCj4gCj4gV2hpbGUgYXQgaXQsIHJlcGxhY2UgNHh4IHdpdGggNDR4
LiBUaGUgbGF0dGVyIHdhcyByZW1vdmVkIGEgd2hpbGUgYWdvCj4gYW5kIGlzIG9ubHkga2VwdCBm
b3IgY29tcGF0aWJpbGl0eS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5r
cyEKClsxLzFdIG10ZDogcmF3bmFuZDogbmRmYzogdXNlIGlvcmVhZDMyYmUvaW93cml0ZTMyYmUg
YW5kIGFsbG93IENPTVBJTEVfVEVTVAogICAgICBjb21taXQ6IDRmMjY5MmE1MzgzZTRiZGQ0M2Fl
OTQwY2RhMDEyMzYwZjcyMTdhMmQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
