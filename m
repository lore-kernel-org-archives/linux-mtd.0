Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33332606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kM3foRVU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cM5VgeY6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ZvDtxeNMyuPHMAYy6MBBsnR3VHw/zL7uZVQHc6jU20=; b=kM3foRVUKZf7SFk8sHmj7uknD1
	mm9sKZoxVwAD59pBeB364rwTX+fgbz+WvwaBYDxXlpNzn8Cwe89VXR8B6i/eOgD0D0QBleY+XdicH
	7999KTl3Af4HXmTd0LFxQdj22HnNxZqVRhSN4Tp7KPGebgIYh8ZiZDWmDWaEcYW49LQzsERZOC4t0
	Igxti0PdJgmCjMBzzWJAkohbqMVI3DDPI4583WF/pXCp/iM0+YCTWKzl3KiM7vCMw7F8tQ033hr6z
	pdaagdEVXsGX1W6gima4DWjODr0rxI4VBYzd1ZtTCIWgXLxoI+wNmYu/dg3FRYUUYtIRZtQCklKdZ
	tluWnQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvbg-0000000GDbX-22VB;
	Fri, 27 Nov 2026 13:03:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvbe-0000000GDaN-0Wrv;
	Fri, 27 Nov 2026 13:03:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17598C2AC4C;
	Fri, 27 Nov 2026 13:03:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DDF06049C;
	Fri, 27 Nov 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F79011E68760;
	Fri, 27 Nov 2026 14:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795784584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7UVakvOp4wpiznroxVZYXkTEATKSGQujHq3lj0XSlRk=;
	b=cM5VgeY6Qci2ljmxqJH2dWDlf8hXi2XInC/iuzimk3N43ziiTXtiMMiKedJf5R5pYNvGxo
	Ba144VRx1Z4nzcfrgeAwVxPCnf67yr8iKuUVCrqJhp8X8vYXfT7cuoRwDd++MeDSNAYXqB
	dcrSTVCBTamAakYw3wbGqr6fxQZufiwpAjnm1GQh990665j2EmAE3ONzv+S26KrJozd0CU
	uE5nvBl438K4yS5xx8AciV3xr3B1IjR5frJp3hnbF2Fbsr7xDsk98qp9HhCPupN0sWxEzN
	XAe4fBjrLxm8X48WHk4LSNUBBZvWJApyARHisZtjduTr56v2v3QlnPTY4BIAbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Feng Chen <feng.chen@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
In-Reply-To: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org> (Tudor
	Ambarus's message of "Fri, 27 Nov 2026 11:33:09 +0200")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 14:02:54 +0100
Message-ID: <87cxrqtojl.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050314_302393_7E6DFDD1 
X-CRM114-Status: UNSURE (   9.52  )
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

T24gMjcvMTEvMjAyNiBhdCAxMTozMzowOSArMDIsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDExLzI1LzI2IDc6NTEgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IFRoaXMgaXMgb25seSBidWlsZCB0ZXN0ZWQgZm9yIHRoZSBtb21lbnQgYW5k
IHNlbnQgYXMgYW4gUkZDIGJlY2F1c2UgdGhpcwo+PiB0b3BpYyBoYXMgcmFpc2VkIGEgbG90IG9m
IHF1ZXN0aW9ucywgdGhlcmUgbWF5IGJlIHRoaW5ncyBJIGhhdmUKPgo+IFRoZXJlJ3Mgbm8gYW1i
aWd1aXR5IHRoYXQgdGhpcyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uLCBjaGFuZ2UgYnl0ZXMgd2l0
aAo+IGN5Y2xlcy4gQXMgYSBtYXR0ZXIgb2YgZmFjdCBJIHRyaWVkIHRoaXMgaW4gdGhlIHBhc3Qg
YXMgd2VsbCwgcG9zdGVkCgpUaGFua3MhCgo+IHNvbWV0aGluZyBhbmQgdGhlbiBjb3VsZG4ndCBh
bGxvY2F0ZSB0aW1lIGZvciBhIG5ldyByZXZpc2lvbi4gWW91IG1heSB0cnkKPiB0byBzZWFyY2gg
dGhlIHNldCwgaWYgeW91IGhhdmVuJ3QgYWxyZWFkeSwgYW5kIGNoZWNrIHdoYXQgdGhlIGZlZWRi
YWNrIHdhcwo+IGF0IHRoZSB0aW1lLgoKSSBoYXZlbid0IGZvdW5kIHlvdXIgc2VyaWVzLCBidXQg
SSBmb3VuZCBzb21lIG9mIHlvdXIgYW5zd2VycyB0byBTZXJnaXUKKGlpcmMpLgoKTGV0J3Mgc2Vl
IHVudGlsIHdoZXJlIHRoaXMgdmVyc2lvbiBnb2VzIDotKQoKQ2hlZXJzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
