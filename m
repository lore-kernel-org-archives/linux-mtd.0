Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C128CCF9F8
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7dYh/0a/SKFdujFc9Vj54mNHjCTQkkySv2Po8lwJx0=; b=ANwn4FcfZIIFV5
	jyw9P1uISOGkTFr/+D+v4TgMmgN3kq8ljNtqcosSa9P5FSo/FcYVSsW20Lq/5d6Y88qtUcB99JxlK
	sdBIRrSgjSTJhj8t+s8PqTHxgO3Qtku+JkRh2uWJ9DFqY4I86DXB9GolBhfzpFvHOnlEVEZViMZtb
	qGfGPbJT027ByWlntQ6vv6625MqoYbvuOkwCAcBKA1vpYAjw++KbihFyB+lZJM5MA4Eud1ou9hCyS
	z80Zj0BGVcNIb7dx6CizEGFMwKv7yPI1VBbUj5Tvmf/jVafe9L/ngsXADSP8NHlNSJTiD8sfQs79i
	QveTgSRbp7FnUkyaLJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFry6-00000009e0G-30Id;
	Mon, 03 Nov 2025 10:39:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFry3-00000009dzR-1FOS
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 10:39:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72F061A183B;
	Mon,  3 Nov 2025 10:39:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48CA760628;
	Mon,  3 Nov 2025 10:39:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6397810B50048;
	Mon,  3 Nov 2025 11:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pjoQF6Z2Piwu1ua0g1e4fPfIoIQtxuXgSgmVey2wobA=;
	b=YzZwQ52WqCYjNNhztDGM5T4EnlHiA+K+R8X14AH6mEmPBUquJ+rWAKG6qKlEjhNjtfsB3D
	x+13KkKneAw7DVPV0Qx4SY8bmtwicvsmJ+HVSjV+0hPiyCKSe4tHgqmmqt3hcV8UfM9Lqa
	h7lw3DzWEVmcSs+KufpwQhXzUCCHDNIgykKeKw2/sAm08gDvgTjbxwVIinsja/JcTU2oNx
	/5fw6NVFTW4XEy9+Vu7OFrgpLqpoKuHQfUYihN+k3KOO5QYC/WoEEtn6SqxFckzm93hpgs
	OVmXQQOnbelZvbVTbD1uAnS69X8XrgF3dugX7iwuL2VhHZN0+Mt8IRLt3Mt30w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kyungmin Park <kyungmin.park@samsung.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aQYKXGSoLqCLNqKg@stanley.mountain>
References: <aQYKXGSoLqCLNqKg@stanley.mountain>
Subject: Re: [PATCH] mtd: onenand: Pass correct pointer to IRQ handler
Message-Id: <176216635321.908445.5469559454267528784.b4-ty@bootlin.com>
Date: Mon, 03 Nov 2025 11:39:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_023919_465935_A5E35F68 
X-CRM114-Status: UNSURE (   9.47  )
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

T24gU2F0LCAwMSBOb3YgMjAyNSAxNjoyNTo0OCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGlzIHdhcyBzdXBwb3NlZCB0byBwYXNzICJvbmVuYW5kIiBpbnN0ZWFkIG9mICImb25lbmFu
ZCIgd2l0aCB0aGUKPiBhbXBlcnNhbmQuICBQYXNzaW5nIGEgcmFuZG9tIHN0YWNrIGFkZHJlc3Mg
d2hpY2ggd2lsbCBiZSBnb25lIHdoZW4gdGhlCj4gZnVuY3Rpb24gZW5kcyBtYWtlcyBubyBzZW5z
ZS4gIEhvd2V2ZXIgdGhlIGdvb2QgdGhpbmcgaXMgdGhhdCB0aGUgcG9pbnRlcgo+IGlzIG5ldmVy
IHVzZWQsIHNvIHRoaXMgZG9lc24ndCBjYXVzZSBhIHByb2JsZW0gYXQgcnVuIHRpbWUuCj4gCj4g
CgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBvbmVuYW5kOiBQYXNz
IGNvcnJlY3QgcG9pbnRlciB0byBJUlEgaGFuZGxlcgogICAgICBjb21taXQ6IDk3MzE1ZTdjOTAx
YTFkZTYwZThjYTliMTFlMGU5NmQwZjkyNTNlMTgKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxh
YmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJv
dmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
