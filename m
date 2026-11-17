Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC0F606A339
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0l0BrE0X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cCIqqaj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KBH+GVA9sfYnfYKIw6WAlxhMV9zPfJWSzg59T6rQdN8=; b=0l0BrE0XC2aQYXbUueFCGLUdtw
	Cv/Jfj0ZIxg/CDssXfcKKxEl3fwKlBKooahg1k1cFmR8BXHMECFicBfTdwX+lIIFqxqqYPj+H/LNS
	iDuYyJeLT9MtNoHW9L1S1JT49AUy1Qlvhvz2H7ayeVz5jpV14qG1r4ZboPGznhElfYAPIdYXWgAhE
	dw5kY5Lcd80Kn8pFl9clWYH75f+9WAe5yaKZFMMTT3/Z4pR5i+93/EkpFEYZQSxW7FnS1Ajwqy1DJ
	/FprBMvdPslA0okvcix+akd0c7zjhipzWb4yjkHIUagV3Ml/7Ed/DahFeC2x7S9xANqe+hw7hg5Xt
	XihuDwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5d-000000066aX-2Wta;
	Tue, 17 Nov 2026 14:23:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5a-000000066YC-3bEm
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 13A5C1A167E;
	Tue, 17 Nov 2026 14:23:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBB7A5FD6A;
	Tue, 17 Nov 2026 14:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4261311BC0024;
	Tue, 17 Nov 2026 15:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrWoECbha8X9JRX7ekZ+k7/8LWlVHPYUraFEer9XzG8=;
	b=cCIqqaj0+C9IYVbN9b6tKoRe3UqF/1LfewzM8nNUK589zDX0LK/1Z5IYzx/qnU96ByTe8D
	TkwwCTFDjmj0Pn6QJSlu3K2kncmrsx6uwp1WeuQvMPp2qZc4AYV65Vuf2wjYt18UcWL4Mx
	4sXFVrJv3f8JxFAIn0Hiq+KbizlsYhLD6WrEPuujbhAVCrOqHP5JnmT9gcVazkC1N6r7gq
	rS01nsqf0xw43KqTUDzTkEsIryUetX8ylGfxF6ClPWbIa+KOsMuLjt1nvRYOcXKp0eLE8s
	vmX8oeCKvz3ciTAIHtrEBD/wjRDmFLVtXzAI56oKyWNIwL0wambgziuWFmUNKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, tglx@kernel.org, kees@kernel.org, 
 Mihai Sain <mihai.sain@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013094339.7285-1-mihai.sain@microchip.com>
References: <20261013094339.7285-1-mihai.sain@microchip.com>
Subject: Re: [PATCH] mtd: nand: bbt: Use pr_fmt() for consistent log
 prefixes
Message-Id: <179492538991.2259780.5651031170487195541.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062315_211351_7B464A3D 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAxMyBPY3QgMjAyNiAxMjo0MzozOSArMDMwMCwgTWloYWkgU2FpbiB3cm90ZToKPiBE
ZWZpbmUgcHJfZm10KCkgaW4gbmFuZF9iYnQuYyB0byBhdXRvbWF0aWNhbGx5IHByZXBlbmQgdGhl
IG5hbmRfYmJ0Ogo+IHByZWZpeCB0byBsb2cgbWVzc2FnZXMuIFJlbW92ZSByZWR1bmRhbnQgc3Vi
c3lzdGVtIHByZWZpeGVzIGZyb20KPiBpbmRpdmlkdWFsIGxvZ2dpbmcgc3RhdGVtZW50cyB0byBh
dm9pZCBkdXBsaWNhdGlvbiBhbmQgZW5zdXJlIGNvbnNpc3RlbnQKPiBsb2cgZm9ybWF0dGluZyBh
Y3Jvc3MgdGhlIE5BTkQgYmFkIGJsb2NrIHRhYmxlIGltcGxlbWVudGF0aW9uLgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4KPiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25l
eHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDogYmJ0OiBVc2UgcHJfZm10KCkgZm9yIGNvbnNp
c3RlbnQgbG9nIHByZWZpeGVzCiAgICAgIGNvbW1pdDogMTc4YTMxN2ZjMjg1MDlkNzM2MDQxOTYy
OWExZjA0M2EyM2M4ODhhMQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
