Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B8D1D879
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy+FYy0IbProdal6MTt76LfI5De/18AIfUCV6n0lNso=; b=fXRspv9/V4ASh8
	GvMMJguOn99PwivloWfeJcaxABre8chtnOK4kKn46hCEWx77HWW/ztRm1bxpWvmj1KIw7f5cUntYG
	jD4VBQ9awM8iY3rETpkSDydmw6pmDXARFfOLYcD2SlnbUD+QbbptYGyMOeUwKdkvRGMz+DPfW2kFa
	CEsjmgBywFbEO9+2fBeuR0hD7YhmhJ6pXXynPS/LyKiQcmiz+UMk8pKGvMLz0GMvIWZDKNE2n4jeL
	o5Ndtts3+vqhSJRldoz+8MqV/dheUctP5NBZIUyt8TYE0kSUI3t6jxejT0yoUkxmabgay0f8PnmpB
	TfocTLjfwzY9yuAVCRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jVK-00000008iJg-23Kj;
	Tue, 15 Oct 2024 15:30:34 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jUp-00000008i6r-1Hjm
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 15:30:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CDE160004;
	Tue, 15 Oct 2024 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729006198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaVhpW7Ics2MRpfn0xGZsAZUvpMCJ3l4z2GpRV7dQ74=;
	b=Yf1ljXfeEYOrQbZx7F6IwVqbfvTTbBstPv4H2/qmM1PHWssqib5iQVIZD2yh11Jsh+0roP
	5G544rVm5sTzrTjqyLZTy6W3fljWi6MQ4M/a+m/xDlEMmZDuYdF3Xpx5XdBVQJdUbj5yld
	tVfzh5ret3VHVpQopQ5EMYpC+oYkiBUeqXOAdVDDLXfppGC8AETuJBCNasQeSKedgHJ+/k
	KrVGlmm3fu7GZBzcNXPZkzmmUGGNVt3vTE3i7bP4zBLLJ5XtKys5UdXOGxOFUPbRxeir55
	9MXruQO2R34Zb11RN8L+xtvBeGCM8Vcq27LWzJsfz6GDEdIi9fYb0rfzlJtGFA==
Date: Tue, 15 Oct 2024 17:29:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org, arnd@arndb.de,
 esben@geanix.com, nikita.shubin@maquefel.me, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
 quic_varada@quicinc.com
Subject: Re: [PATCH v11 4/8] mtd: nand: Add qpic_common API file
Message-ID: <20241015172955.7b0b6708@xps-13>
In-Reply-To: <202410130129.M8J7VJoG-lkp@intel.com>
References: <20241010070510.1504250-5-quic_mdalam@quicinc.com>
	<202410130129.M8J7VJoG-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_083003_583937_0EC5D554 
X-CRM114-Status: UNSURE (   5.25  )
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

SGksCgpsa3BAaW50ZWwuY29tIHdyb3RlIG9uIFN1biwgMTMgT2N0IDIwMjQgMDE6NTc6MTIgKzA4
MDA6Cgo+IEhpIE1kLAo+IAo+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2lu
ZyBidWlsZCBlcnJvcnM6CgpUaGUgYmVsb3cgZXJyb3JzIHNlZW0gbGlrZSBiYXNpYyBLY29uZmln
IG1pc2NvbmZpZ3VyYXRpb24uIFRvIGJlIGNsZWFyLApJIHVzdWFsbHkgZG9uJ3QgcmV2aWV3IHNl
cmllcyBnZXR0aW5nIGtlcm5lbCB0ZXN0IHJvYm90IGZhaWx1cmVzIGFuZCBJCmFtIGV4cGVjdGlu
ZyB0aGF0IHlvdSB3aWxsIGZpeCB0aGVzZSBlcnJvcnMgYW5kIHBvc3QgYW4gdXBkYXRlZCB2ZXJz
aW9uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
