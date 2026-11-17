Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA5606A329
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SWGBUsZG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PvIUBGhZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z3lls1UBgxhvQwPkp0NNy0F5E+LzM4VQlougqA/vIfA=; b=SWGBUsZGOaMw3z2a/V6eYrYhID
	sMaMvgBK/QA3E4qTAdyazFHwXWVj7layxMvKW8+g2TteQVW3crLPZMskfHemaPl3BQ56rwrQDuBSH
	3x0wLt8e661k1ORhfRZ4Oto6VWzHcCxk1OyWEo0J8hKfDpqEB7XrsA1Pb+tKMjFclxtP3LP1TccYG
	+no8Iki0idv3FQaG3q5J6h8lnPclONgasrTzcvYtr2xoR/gXUZic4ovqfqhq0T+crS2CB9/TAz9+8
	Fd2dfz+ANmbGPGk0d2FNj31D8EojS8SGWZ2XmOxzfxIKTueBw9vhjZUbA4FYQ48U+HjSZc8e1nDbA
	wKycCMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXh-000000060xv-1QGl;
	Tue, 17 Nov 2026 13:48:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJXe-000000060wC-0i0V
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:48:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D059FC79A9B
	for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFB05FC81;
	Tue, 17 Nov 2026 13:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4053A11BC0024;
	Tue, 17 Nov 2026 14:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794923288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eZZUM9YB8PMCl+JKN9NrZ4U0JkC5KAvryISSRWv1/Hw=;
	b=PvIUBGhZick+POTs/Gp9cj6M+DZvZtPrOylizZsgMTQQC1zD1jtAz736xHptxVfWiLmMJ3
	kQATMI/JiqOAJ3OzlfSqwvbMhHM2c+5Q3G/Csps0C45IzRkVXOqUCxFw3WBb6D2I9cdqEt
	5m9XKPuPv4WJPXA7Kb4+VIOPUSgJ1N812YxPSjFtOqCEfAx7f64X1PNyVkjiJkcL0n83oh
	eZ2jWlPUBksATe+34leG+oxUS5zJhmVc7q4RjJJjleZhN5+YlAjXaq5W8kn5KMsxAOxRAk
	n04i83fTH7ziHFlsR2cv+MiT+Pgbhij99tKEHrGBJ4czYc1BqbxdbtCn4XiwKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107174940.3323868-1-orgads@gmail.com>
References: <20261107174940.3323868-1-orgads@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: also clamp the write buffer
 of an x16 part strapped to x8
Message-Id: <179492328718.2243972.12776553428549966068.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:48:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_054810_373347_8061C731 
X-CRM114-Status: UNSURE (   9.78  )
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

T24gU2F0LCAwNyBOb3YgMjAyNiAxNzo0OTozOSArMDAwMCwgT3JnYWQgU2hhbmVoIHdyb3RlOgo+
IENvbW1pdCBjZmM1ZWJjOTU0MGUgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogY2FwIHRoZSB3cml0
ZS1idWZmZXIgY2h1bmsKPiBhdCAyNTYgYnl0ZXMgb24gYW4geDggZGV2aWNlIikgbGltaXRzIGEg
V3JpdGUgdG8gQnVmZmVyIHRvIDI1NiBieXRlcwo+IHdoZW4gY2ZpLT5kZXZpY2VfdHlwZSBpcyBD
RklfREVWSUNFVFlQRV9YOCwgYmVjYXVzZSBkb193cml0ZV9idWZmZXIoKQo+IHNlbmRzIHRoZSB3
b3JkIGNvdW50IGFzIGEgc2luZ2xlIGJ1cyB3b3JkIGFuZCBhbiA4LWJpdCBkYXRhIGxhbmUKPiB0
cnVuY2F0ZXMgaXQuCj4gCj4gVGhlIE0yOUVXIHRoYXQgY29tbWl0IHdhcyB3cml0dGVuIGZvciBp
cyBhbiB4MTYgcGFydCBzdHJhcHBlZCB0byB4OC4KPiBUaGUgcHJvYmUgcmVwb3J0cyBpdCBhcwo+
IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBjZmlf
Y21kc2V0XzAwMDI6IGFsc28gY2xhbXAgdGhlIHdyaXRlIGJ1ZmZlciBvZiBhbiB4MTYgcGFydCBz
dHJhcHBlZCB0byB4OAogICAgICBjb21taXQ6IDc2MGQyZWZlOTFhODQzNjNkMjVjMTA1MWExMDU3
MjI0MmU3NWZlODYKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
