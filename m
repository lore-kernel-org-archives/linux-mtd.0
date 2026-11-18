Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8A60A2628
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OhcArJh+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Dc1niph0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0LUdrUjf/mC7oI+gqToTl/Xp9FlthqcX0MbwVl4ZFk=; b=OhcArJh+AkqAL1+3EV3bgM/tZC
	HlMh48xURq3OIUQB5wo27kGfdZ+8T21Uqu7Uc9+v5QGN9AZICaet93TpkuLKeN2FKMAqzZfMycfOG
	D/YDVoWVTf3t2loWcpbGF9rSEL5qo/RlB+f8nXcL24132Lx+VxgAZKhSTpTfRo3bMjCuOZA7fqg1m
	VqpHCoZfm3XWhIRV2O0zckMf7B9XyeICEoKwjDEl0ckcXshYblzB1IZQNS7UHstyZ6GzNNIYPPMWQ
	ON7Qe+qoGY6y64K4EfBM9+7Sk3MlmjPMqgW8A86mho+U8TNXm8fzmyOZ8rkyqqsEmUpTi3BTnMGBE
	VuYkdmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgb7-000000095xC-1i1v;
	Wed, 18 Nov 2026 14:25:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgb5-000000095wa-2I6h
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 14:25:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D6A381A16DA;
	Wed, 18 Nov 2026 14:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AA9E5FE9B;
	Wed, 18 Nov 2026 14:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC8311BC2239;
	Wed, 18 Nov 2026 15:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795011909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOaxTdk7bxxGSDn8LW/SZyhasTfS18Dof7TxoTx8zm0=;
	b=Dc1niph0ZFZ34oDPTdnK5z6fDSrSSc1vpQk9LQane7jtoPsFAmPTompMCfsyk9feYGDnl7
	qOuDCeiCkhVGGv+hDmpfsrtK9pt4HbfnhJwNWmHOV5jXkD/EQnh5L7QB9IV4ccG+aTsgyA
	Rb1qkIpHzGv0Tm331ajYM7/MdSKps61QdvXPWSYmDS0Rql6f5W4VUGR3BGhy1iiLbFtC0c
	JEn4XpKzLYdnIlvhOGAuQ/9ldyIG3yRpywT6GpUFcR5MMOHv/zHUMdZze1W/kCGFeJmagS
	e6iTlMd0U1CLLkwAujVA7Y5xXukPkFCCCpcxEsxn95vGmpwXJXQD998hsrm37Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
In-Reply-To: <DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org> (Michael Walle's message
	of "Wed, 18 Nov 2026 13:25:08 +0100")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
	<DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 15:25:05 +0100
Message-ID: <875wxui5dq.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062515_730052_9FA6C739 
X-CRM114-Status: UNSURE (   9.06  )
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

T24gMTgvMTEvMjAyNiBhdCAxMzoyNTowOCArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUdWUgT2N0IDEzLCAyMDI2IGF0IDY6MzQgUE0gQ0VTVCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gRHVyaW5nIHRoZSByZWNlbnQgcmV3b3JrIG9mIHN0YXR1
cyByZWdpc3RlcnMgaGFuZGxpbmcsIHdlIG1vc3RseSBmb2N1c2VkCj4+IG9uIHF1YWQgY2FwYWJs
ZSBkZXZpY2VzLCBwYXJ0aWFsbHkgc2tpcHBpbmcgT0RUUiBkZXZpY2VzIGluIG91ciBtZW50YWwK
Pj4gbW9kZWwuIEl0IHNlZW1zIHRoYXQgbWFueSAoaWYgbm90IGFsbD8pIE9EVFIgZGV2aWNlcyBo
YXZlIG5vIFNSMiByZWFkCj4+IG9wY29kZSBhbmQgaGF2ZSBvdGhlciBjb250cm9sIG1lY2hhbmlz
bXMuIEJlY2F1c2Ugb2YgdGhhdCwgdGhlIGN1cnJlbnQKPj4gc3VwcG9ydCBpbiBzd3AuYyBpcyBi
cm9rZW4sIGJlY2F1c2UgcmVhZGluZyBiYWNrIHRoZSB3cml0dGVuIHZhbHVlIG1heQo+PiBvciBt
YXkgbm90IGxlYWQgdG8gdGhlIGV4cGVjdGVkIHJlc3VsdC4KPgo+IElzIHRoaXMgc3RpbGwgdGhl
IGNhc2Ugd2l0aCB0aGUgcmVjZW50IGZpeCBmb3IgdGhlIC5yZWFkX3NyMiBvcGNvZGUKPiBmcm9t
ICBIYWlibyBDaGVuIFsxXT8KCldoaWxlIEkgYmVsaWV2ZSBoaXMgZml4IHdpbGwgcHJldmVudCBt
eSBjYXNlIGZyb20gaGFwcGVuaW5nLCBJIHdvdWxkCnN0aWxsIGJlIGluIGZhdm91ciBvZiBrZWVw
aW5nIHRoaXMgcGF0Y2guIEkgc2hvdWxkIHByb2JhYmx5IGhhdmUgd3JvdGUKdGhhdCBpbiB0aGUg
Zmlyc3QgcGxhY2U/CgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
