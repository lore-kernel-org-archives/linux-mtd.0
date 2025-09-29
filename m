Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA935CAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+n+5soqyCkb5AEz6xfvnTwy+DQLVNvVvA//JBaRevg=; b=hyqHHvQ440Lzyh
	LFUbKfI+1tG5DIBvwIQNdIVmoTiofNHcYlbiv5WmeksMYls1ywkQKGnNo+chU76Z8+Jr2MmgrDmkf
	ufcRV24jDkI4C+7dlE59Hseri5Ku8GI9saJV0HGR9Tu1u5aQ/ftYcsZ7gvqS5+/hgHY/ehcN63wBJ
	6Waqljmr2I+WmO4CaX0Piz7xTVfE3VO/L0gdvi7MGfycI4E/U/5NQ9gYlRigr7YHfLfDAU7zKtXaV
	ZUavFvRhazNUKKGFm5PykfZ/nAzzBe8sAJQb2ISlvtQSaZv/Wpoy+2qa7Ye3Z7/CCS/qrt4ca23M4
	hkdkwo9QEWnasM4wrtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHD-00000002s9J-01R8;
	Mon, 29 Sep 2025 15:58:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHA-00000002s8d-1lZN
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:58:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F05544E40DC1;
	Mon, 29 Sep 2025 15:58:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6699606AE;
	Mon, 29 Sep 2025 15:58:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7569102F198F;
	Mon, 29 Sep 2025 17:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ZoQEWBSlDHoAaP3uTh3gtYfZh/RbiEHvtLwh/dwqqU=;
	b=eSrVNUfU2kbyx/WmNGHNJQO076LcrN5+0X0skr+i19j0jj+vqZPoeDnSW+FdXqNzTzzFrk
	qiBavXTsCEE4/K8d0oDtfEpCCnHBzPFobDl+uAmcHbGLY4ASofsANpodQyyKQVpp+9K4DK
	qVpVwXkN/Ye6JE/E1hgbU+/u7a9Y8XBO/iKLZP1J0BfxzNDDZqmvX+7hZ6GQsvmyMleqLb
	aM5FcyZfIfKtDxv2iUae0itfystZH+hnH8LRc8K62GYKHv5HVjB/RwoMgLU7uPvZSvs5lp
	zk5A3dQIsm3wNfExbCPSugUqdC77qZppBXvYBr4gmB0oCKf/ScKkSi3wMGdVjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Han Xu <han.xu@nxp.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  stable@vger.kernel.org,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
In-Reply-To: <20250922153938.743640-2-maarten@zanders.be> (Maarten Zanders's
	message of "Mon, 22 Sep 2025 17:39:38 +0200")
References: <20250922153938.743640-2-maarten@zanders.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 17:57:50 +0200
Message-ID: <87ecrpi741.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085856_599071_73DB3124 
X-CRM114-Status: UNSURE (   8.73  )
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

SGVsbG8sCgpPbiAyMi8wOS8yMDI1IGF0IDE3OjM5OjM4ICswMiwgTWFhcnRlbiBaYW5kZXJzIDxt
YWFydGVuQHphbmRlcnMuYmU+IHdyb3RlOgoKPiBDb21taXQgZjA0Y2VkNmQ1NDVlICgibXRkOiBu
YW5kOiByYXc6IGdwbWk6IGltcHJvdmUgcG93ZXIgbWFuYWdlbWVudAo+IGhhbmRsaW5nIikgbW92
ZWQgYWxsIGNsb2NrIGhhbmRsaW5nIGludG8gUE0gY2FsbGJhY2tzLiBXaXRoIENPTkZJR19QTQo+
IGRpc2FibGVkLCB0aG9zZSBjYWxsYmFja3MgYXJlIG1pc3NpbmcsIGxlYXZpbmcgdGhlIGRyaXZl
ciB1bnVzYWJsZS4KPgo+IEFkZCBjbG9jayBpbml0L3RlYXJkb3duIGZvciAhQ09ORklHX1BNIGJ1
aWxkcyB0byByZXN0b3JlIGJhc2ljIG9wZXJhdGlvbi4KPiBLZWVwaW5nIHRoZSBkcml2ZXIgd29y
a2luZyB3aXRob3V0IHJlcXVpcmluZyBDT05GSUdfUE0gaXMgcHJlZmVycmVkIG92ZXIKPiBhZGRp
bmcgYSBLY29uZmlnIGRlcGVuZGVuY3kuCj4KPiBGaXhlczogZjA0Y2VkNmQ1NDVlICgibXRkOiBu
YW5kOiByYXc6IGdwbWk6IGltcHJvdmUgcG93ZXIgbWFuYWdlbWVudCBoYW5kbGluZyIpCj4gU2ln
bmVkLW9mZi1ieTogTWFhcnRlbiBaYW5kZXJzIDxtYWFydGVuQHphbmRlcnMuYmU+Cj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKClRoaXMgcGF0Y2ggZG9lcyBub3QgYXBwbHkgb24gbmFuZC9u
ZXh0LiBDYW4geW91IHBsZWFzZSByZWJhc2Ugb24KdjYuMTgtcmMxIHdoZW4gaXQgd2lsbCBiZSBv
dXQ/IEknbGwgdGFrZSBpdCBpbiBhIGZpeGVzIFBSLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
