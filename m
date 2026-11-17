Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8B606A880
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pikS0d3A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YyG73sLo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ta8YtZ+NC2KaXYLVbHYnrs6gvPJWTyPyPIHhpj4OLoY=; b=pikS0d3A4ddtsy8xPSUeeEEk0E
	4Xguwc26zjmry1+GsrA7Pvx04kw6rid7oNFB6oriqt7rKeHN5eICD++aseIeKR6EBvEHNFBj8lQnn
	8hKUBLBSHTUPWqMu0yjR1Z3MCJv+m0kqBL4012mX3oqVisFtaZHjOVFsMs+rPT9loNw4D/IeBeSN9
	Yx5MKNBWQlLG1qKd3UCUrmmKY46eAIM48obiCx5dEWKVVkiJpOV0fNd4DhHqiGQUBvySS/2G+PSb+
	mkZwXY+bCvSiR2l938Q0t8SANcdhqbyaHXen9i9ic9gaBMdTMtoO8NKcfJoastgITr9xlWcYtl1K6
	zyoDguUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJMv-00000005xpk-2baL;
	Tue, 17 Nov 2026 13:37:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJMt-00000005xoy-10ey
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67348C79A97;
	Tue, 17 Nov 2026 13:37:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01DC85FC81;
	Tue, 17 Nov 2026 13:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D1AF11BC0008;
	Tue, 17 Nov 2026 14:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fPo62Pw6yLg3/n/Fi75BDdM3/HcM72LhtHakOFqTjOo=;
	b=YyG73sLoz6bnuTXHN6uw+OtCVQk5BUqSoBO2o7JfUE6pNpbgd4exj4wLNiMUjQCRwb8DCE
	UHEEIArk/8q0IlyoW8xKxXeFFOG7wJxWEMhDqCQzunGR6VZo8qopFTR0djoHi2sWNFskSa
	8lclcE5lBI0dR/Xz2/1KHQG3/BcKrCvEH+2U9boDp6RHywYbvPYupnkfY7ZpSnOxh30dZt
	9CN2Ueg7uxGks2hQ5sEaJBSCz8wIq3V5wzNlgdR7eRcx3dxLcen/a0OnCD2lhNaxYSf/ja
	2l0njUhvmhU7/iQS+qKmHacCKhDC4iaCZMm4HI3fTanc6mQNzZfYUehrw459Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
References: <20261013-qcom-smempart-ignore-mask_flags-v2-1-01b7e133f273@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: qcom: drop setting of partition's
 mask_flags
Message-Id: <179492261371.2237190.6788840618567953868.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:36:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053703_444332_C7D2B376 
X-CRM114-Status: GOOD (  10.10  )
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

T24gVHVlLCAxMyBPY3QgMjAyNiAxMjozMjoxMiArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
VGhlICdhdHRyJyBtZW1iZXIgb2Ygc3RydWN0ICdzbWVtX2ZsYXNoX3BlbnRyeScgaXMgOCBiaXRz
IHdpZGUsCj4gc28gaXQgaXMgb25seSB1c2FibGUgdG8gbWFzayB0aGUgbG93ZXIgOCBiaXRzIGlu
IHRoZSBNVEQgZmxhZ3MuCj4gSG93ZXZlciB0aGUgTVREIGxheWVyIGRvZXMgbm90IGRlZmluZSBh
bnkgbWFza2FibGUgZmxhZ3MgaW4KPiB0aGVzZSBiaXRzIGF0IGFsbC4gQWRkaXRpb25hbGx5LCB0
aGUgbWVhbmluZyBvZiB0aGUgYml0cyBpbiB0aGUKPiAnYXR0cicgZmllbGQgaXMgbm90IGRvY3Vt
ZW50ZWQsIHNvIGl0IGlzIG5vdCBldmVuIHBvc3NpYmxlIHRvIG1hcAo+IHRob3NlIHRvIHRoZSBk
ZWZpbmVkIE1URCBmbGFncy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtz
IQoKWzEvMV0gbXRkOiBwYXJzZXJzOiBxY29tOiBkcm9wIHNldHRpbmcgb2YgcGFydGl0aW9uJ3Mg
bWFza19mbGFncwogICAgICBjb21taXQ6IGI3Y2Y3NDA2NWY2OWQzNGVhODE3ZTBmMDU1ZjY2Nzg2
ZDVlY2ZjZjkKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQg
YW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBj
b21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
