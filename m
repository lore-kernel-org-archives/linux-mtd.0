Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE8C25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJKlgY6wzaXfFcDJyNmZ0dw8sTSFWF9CjqzYGjDqGmI=; b=X6cOXthC4UBkWp
	FT/POPZeuBAqTBzD5/Gaqb7J33g4YQhPNefnLfvCoYQ8yny7yN162neXpWfb97WtFEo7aKCaJTz1V
	Cg17Qr9rGSsoDL1fGaC4AhI+o18OHj6/nMbq1GkNkwP5HIM5L9iLdSD2kIRN17AAOKhP4JzcvfY3R
	eCqi34rauVdTZhRHDmcBSKeBV7FqeaKGOzVojRBA+xd0ZEg1ng85nzLpdoNvq9xLzr1RkqiDHWn+T
	6zgRyegZ2oTPJa3ErP+RBVqOfpJkaDviXyNXp4TwQPSiAR6YHrc8T97klSmb99X57w0UKRuZ6HxTt
	PqJ+XIpdQoqHFAIN7eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Ozo-0000000HV4n-1Xih;
	Tue, 21 May 2024 12:53:36 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Ozm-0000000HV4M-1WMU
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 12:53:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F7FE2000F;
	Tue, 21 May 2024 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716296012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgDiOgPFq8VFi3B4aIXbFrjhcBMxVHtHlXhQpFMcXhU=;
	b=NxecRWZ90FMduVzjE8WaLnyMzssesC41tfBRcOF3bxHW+6C0AwIS1e+GrufILjbKDVdBT7
	fD3QWNVhis1s/9ok7VGH5A3TulZdgYHtQkp23PpSGV4bGviVmi0l8ur+2WjzF3h+q9aDaY
	9LvwWQGVIPQn6mHgi883Xq0Pn2ENocGZDc/dgKfBE44z8G9Jp32l8Mn6RXxtxXWpZs8uHy
	LKw6yohy6QxNwnpwGPgwx0BMvGDG5/PTLRF24mPJCnu5jnfqor9T2fKwVAtJ2n/0zZ/JiC
	gBG3OGw13uPoSy8wOyEvMm3Uk19NHOSPvhaE9BOZp4Tu6TY4/5ppK1Jgw83v1g==
Date: Tue, 21 May 2024 14:53:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com
Subject: Re: [PATCH v6 5/8] drivers: mtd: nand: use FIELD_PREP and GENMASK
Message-ID: <20240521145327.745f8b50@xps-13>
In-Reply-To: <20240521105532.1537845-6-quic_mdalam@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
	<20240521105532.1537845-6-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_055334_564913_6089ED53 
X-CRM114-Status: UNSURE (   6.84  )
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

SGksCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDIxIE1heSAyMDI0IDE2
OjI1OjI5ICswNTMwOgoKPiBVc2UgdGhlIGJpdGZpZWxkIG1hY3JvIEZJRUxEX1BSRVAsIGFuZCBH
RU5NQVNLIHRvCj4gZG8gdGhlIHNoaWZ0IGFuZCBtYXNrIGluIG9uZSBnby4gVGhpcyBtYWtlcyB0
aGUgY29kZQo+IG1vcmUgcmVhZGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxh
bSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4gLS0tCj4gQ2hhbmdlIGluIFt2Nl0KPiAKPiAq
IEFkZGVkIEZJRUxEX1BSRVAoKSBhbmQgR0VOTUFTSygpIG1hY3JvCgpNYXliZSB5b3Ugd2FudCB0
byBpbmNsdWRlIGxpbnV4L2JpdGZpZWxkLmggbm93LgoKT3RoZXJ3aXNlIHRoYXQncyBhIGdyZWF0
IGltcHJvdmVtZW50LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
