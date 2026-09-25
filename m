Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9990C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRckVBrSKha+ZIOJLjGTm7+kseWbzPjufB30QwGMUTQ=; b=ntm6SRxPEpX1bZ
	LfWUD2F9PxpbrEhklHWwYNn+Mkg13p3tU6sx9hxAJVyGtH2JeNI2mY7qvG5z0So0KSY7UkSVprY3n
	JkaM1lySIZQUrMnX0dKfSzLySdvjcWf40FsWOyLxTLgUIhM5MYxt08IpaTLw21A2/WcD6O3kZWPTp
	VBwlzphxqfsamIAJnKcCYpkx8COorKSgnOCVe97BBIQ0yHvtV6ypE7s5bTwUsT09XnU6XB+0J/QG5
	vNAmZ4pQ7H937Q2OJfexmiD5YijqMqxTMMoIpiG43sgkCqfhXjxnZXtaUdC3KMWkf0sfJZpqcMPU0
	3QHX/SgF8uWRaD/mhj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vk-0000000DaXw-0Rdi;
	Fri, 25 Sep 2026 14:29:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vY-0000000DaO3-1xGX
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B0A7C653FB;
	Fri, 25 Sep 2026 14:30:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0A586073B;
	Fri, 25 Sep 2026 14:29:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5793D102F19F8;
	Fri, 25 Sep 2026 16:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5YQghMkQxKVMxZ3HXy4f6WO6qALFgb2czJJHSaPe1cw=;
	b=VKUmlsyKXhsNGflv+JcrbtODY5kyVbE0oBnq666f8Ek13qonjW71+8EW8rmx26seoqAzUe
	PXxWdjtZLCNmCrIaJjuDClfEYb1R7LQ5bMVypmYnEUobW+B0D+qjn8BTcrEZ0X+fvugR46
	M0qFVxPylFXekugeywTaSSIN7TA9UFwPlXgAFDyeUq/7eJkFiojLmUzUtJHgwUmuKjphHU
	dRoubdI8mNt6/o+yKHc1gCKYvu4TIRU4Bg3WXqbhBKZwIgRqJrteI9lfz12aRoPp5t7Qai
	AAbpnBhAxeKicDQt314EuVzMCQ0rEDi1OfcEZCUBLoPBQBX/apDf9F2uHaj6ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
References: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: concat: use container_of_const() in CONCAT()
Message-Id: <179034656384.1166139.12762954308681250790.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:23 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072928_679987_C2C30D5B 
X-CRM114-Status: UNSURE (   6.18  )
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

T24gVGh1LCAyNCBTZXAgMjAyNiAxNDoxNDoxMSAtMDcwMCwgSGFyc2hpdCBNb2dhbGFwYWxsaSB3
cm90ZToKPiBDT05DQVQoKSBjdXJyZW50bHkgcmVjb3ZlcnMgdGhlIGVuY2xvc2luZyBzdHJ1Y3Qg
bXRkX2NvbmNhdCBieSBjYXN0aW5nCj4gaXRzIGVtYmVkZGVkIHN0cnVjdCBtdGRfaW5mbyBwb2lu
dGVyLiBUaGlzIGFzc3VtZXMgbXRkIHJlbWFpbnMgdGhlIGZpcnN0Cj4gbWVtYmVyIG9mIHRoZSBz
dHJ1Y3R1cmUuCj4gCj4gVXNlIGNvbnRhaW5lcl9vZl9jb25zdCgpIHdpdGggdGhlIG5hbWVkIG1l
bWJlciB0byBtYWtlIHRoZSByZWxhdGlvbnNoaXAKPiBleHBsaWNpdCBhbmQgcHJlc2VydmUgYW55
IGNvbnN0IHF1YWxpZmllci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtz
IQoKWzEvMV0gbXRkOiBjb25jYXQ6IHVzZSBjb250YWluZXJfb2ZfY29uc3QoKSBpbiBDT05DQVQo
KQogICAgICBjb21taXQ6IDJlNTY2YTY4MzBiODJkOTU4MzdjNGQ2NjljNjNhMGMxYWJmNzY2YTkK
ClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwg
YmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMg
YnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
