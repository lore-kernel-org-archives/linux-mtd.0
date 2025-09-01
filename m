Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62577CA1009
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBKrxF5Pj2CjWxVurGbg4nx0LF25cF7rJ2RxwZZI6J4=; b=WoI5Gn5xuva97Y
	60Vxu5P+KsBJZpcz3uSm/BeNptvQKthudMKJY5sHnVpQEYumDkQi9QzLsgte1xzA3v5v3wl+ZYNlk
	MrWQ/rHd6zd1e2hjUIxs5DYT09c6XmkJmDpwLN21bsyeVE3V43h1vMaGpAiJH8d9f9EVCG3EOFjjN
	aujsC/QDbjLToXKm5honcbBlumYYw/l0F8d5BIytL0/Xpgtg4vVw573mvEWVOC90kuy7temXSF2LU
	xHbgrqu9I5S/Dq1Bd73zlduOnbvB2Vuwy4ZI3c1qMe0Le3QLX3gM2M9NR0ckFmdn0z5/X1IFT/EMe
	eGjfFU0j0AQ9YgPXCTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jE-0000000DLI4-38Ky;
	Mon, 01 Sep 2025 16:50:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4Ca-0000000CcT6-41Ce
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 13:04:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F18C1C8EC58;
	Mon,  1 Sep 2025 13:03:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C797960699;
	Mon,  1 Sep 2025 13:04:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E05C1C22D9A3;
	Mon,  1 Sep 2025 15:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756731840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IgnLlO7jOt0FD4jUzFN4p+RS1ZzKoUQ5W4E4v5dt5GY=;
	b=k1oKLpPB/xN0+LSXuE9pFlMVOUwjjpm7z8hAbcHZtb0psY9101Tjrjs28FX958mzmZUq8x
	j+gzj3qdRTLpgo4ok9b2M4wGzhsOcTn3dLwI/XfvMuy9C8UUoiaPqYKHReFkhFb4jX4mKw
	xIa5XkhNemDk0/EnwoEeFeRxF9WyDFFiEoKVHa85brb9FxSZD2vm+MmmIIyl+hE1l0I5DM
	dE4XNUduk70udDE+jSkvWrVjQnrV/cjMC+9xGGijQJflgcj7gtEEsIge2U0eVTdp/fhl7c
	IotwMfSHozv8JMWEu0XdK65xQ8LPdUeLPtg0IRykP9WJACUU1sSIRKgkVRVf3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Mon,  1 Sep 2025 15:03:48 +0200
Message-ID: <175673179165.52555.3449710772627669678.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_060405_163293_7B924E1B 
X-CRM114-Status: UNSURE (   9.43  )
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

T24gU2F0LCAzMCBBdWcgMjAyNSAxOTowMTowOCArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBEcm9wIFMzQzI0MTAgTkFORCBkcml2ZXIgYmVjYXVzZSBpdHMgb25seSB0d28gdXNl
cnMgd2VyZToKPiAxLiBTM0MyNDEwIFNvQzogcmVtb3ZlZCBmcm9tIGtlcm5lbCwKPiAyLiBTM0M2
NHh4IFNvQzogZG9lcyBub3QgcmVmZXJlbmNlIHRoaXMgZHJpdmVyLgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEK
ClsxLzRdIG10ZDogcmF3bmFuZDogczNjMjQxMDogRHJvcCBTM0MyNDEwIHN1cHBvcnQKICAgICAg
Y29tbWl0OiA3NzNiOTIwMmRlMDEyNzQ0NGZjODgwMmE2MTFhMTk2MzdiN2ZhMTJmClsyLzRdIGR0
LWJpbmRpbmdzOiBtdGQgc2Ftc3VuZy1zM2MyNDEwOiBEcm9wIFMzQzI0MTAgc3VwcG9ydAogICAg
ICBjb21taXQ6IDQ1MWYxMTg0ZjhmNmE5MGM3MDFiOWQ4YzhjMDU1ZjZhMWQ5MzA4YmIKWzMvNF0g
bXRkOiByYXduYW5kOiBzM2MyNDEwOiBEcm9wIGRyaXZlciAobm8gYWN0dWFsIFMzQzY0eHggdXNl
cikKICAgICAgY29tbWl0OiBkNDA5MzRiZWE1NGNhNTUwOTEzOGQ0MGFiNTMwYzY3MDBjODMwODAy
CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxs
IGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5z
IGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
