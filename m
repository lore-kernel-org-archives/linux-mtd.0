Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042EC606A33D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YEakFW7j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iyQlEKLk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cYuVkFyk/3K6fKtAg/7XM2hyUKSYz52v9aQ/RFls6VI=; b=YEakFW7jlZzZG5skn4TZeGLlEU
	O7VdrLf5FLGp1saZ7ja2FKybg18j6wH8yyTt+Sqxfbf4z9buJONo1wfHv61SqgzuSGYvfZSLDizA0
	hNCxVam4XWeESYIJODgWhJqKq5AEjhvA8CJiXGVY97aIIsJiKI3Ay02dVFAf+ip40w27vGsHxQ7hs
	+wMJbfrbsx0Sae1eRu02sQOxUYMVoczjhsFAQu3/B0Ujt5wFiYWRkmVFNAjVmurHb1YUgg5+FUK9a
	lobZfR0I6hzqHTjcot/3dpvkJ6BFvB6HTibsglBkUxIarDZtnqtLYjvAVAFugLzF5hw5OAIkcu9GH
	XDt4riJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgZH-000000095RR-1lf9;
	Wed, 18 Nov 2026 14:23:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgZD-000000095Qa-2UmZ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 14:23:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 99E20C4CBDA;
	Wed, 18 Nov 2026 14:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF0D25FE9B;
	Wed, 18 Nov 2026 14:23:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 095CB11BC2168;
	Wed, 18 Nov 2026 15:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795011792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zM15f4uyf0Cdm+4FPizmEwlym4Qzt4AjHjSfK0g234Q=;
	b=iyQlEKLkTd8DttUlP7gz+c0smOLZPYcU3pJviyb/l17DIdDjSg+OmQwnTH9gEM3z1FGvmo
	J0gClc4UGIqxz1ylEnaKdXKKdF7zuaMVdETrUo3uSkE3O8NxyumntfDm5/HYKif+aBE5Rp
	RHvGDQ8dYyc8ixNe5qvimOtZ07WJOHw47URZ4sHbxbvfW/k7vkvtcqSiJKofFFYSVjijqc
	B8lPrxO4lAvUxhYUVJitf6a9rmLsa2xqJuU0CyZb/TTwYrk6yGw1fQ+y1Yd6x1gNkarfqR
	YhXZu/PImaI2zzM3xEob3nWoUyPwR2w9RlIXpAT05Y/VTBVNmwo06K9MAE5ewQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Itai Handler" <itai.handler@gmail.com>,  <pratyush@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <takahiro.kuwano@infineon.com>,
  <tudor.ambarus@linaro.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <stable@vger.kernel.org>
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around
 spi_nor_restore()
In-Reply-To: <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org> (Michael Walle's message
	of "Wed, 18 Nov 2026 14:33:44 +0100")
References: <20261029210153.3986211-1-itai.handler@gmail.com>
	<DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 15:23:09 +0100
Message-ID: <87bj7mi5gy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062319_794020_B4811F11 
X-CRM114-Status: UNSURE (   6.77  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4+ICtzdGF0aWMgdm9pZCBzcGlfbm9yX2xvY2tfYW5kX3Jlc3RvcmUoc3RydWN0IHNwaV9ub3Ig
Km5vcikKPj4gK3sKPj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJcmV0ID0gc3BpX25vcl9wcmVwX2Fu
ZF9sb2NrKG5vcik7Cj4+ICsJaWYgKHJldCA9PSAtRVNIVVRET1dOKQo+Cj4gVGhpcyBpcyBhY3R1
YWxseSByZWFsbHkgaGFyZCB0byBmb2xsb3cuCgpZZXMsIEkgdHJpZWQgdG8gcmV2aWV3IHRoaXMg
cGF0Y2ggYW5kIGV2ZW50dWFsbHkgc3RvcHBlZC4gUGxlYXNlIHRlYWNoCnlvdXIgQUkgdG8gbm90
IG92ZXJlbmdpbmVlciBpdHMgc29sdXRpb25zLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
