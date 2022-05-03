Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2918C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3GTXR0wc3PDcgz6QD1Jv4AmMYXYIqNU2kRjzCw3h4M=; b=1Z1uykai84Agmj
	KQxJeMXh2Dv2WzS+3QqETPmoQ2qGprc9avJzsXSSnHYy54aAD7qcRlidu6l3Af2hNXTuP0ZOEZ8Yl
	Ldjm4m8l96ghOORHixLhVUNHxWp6JNgWRejt2BOrMQ2UHNDtIIDyqFcE3Nj6tXNdUcQ1y88kYbmkG
	7V8GsbxsQ7BKEIYAJot8iJM7zLhQX/eKK0X/B60s6y5J5daQS3D392o4YkcjlnYlO8Ydjdnct3A1B
	A5ZgU76dSlSiN2zcHLLGi4LR1l8uCJiT8tXPQ6X2gA0J0yHxrYKbqxTJN3ULh7NtBoWFXZ0k3Ncm1
	t3D0kOUMuAN0u8D8TC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nllFI-003kRz-1k; Tue, 03 May 2022 05:38:48 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nllFE-003kQo-D0; Tue, 03 May 2022 05:38:46 +0000
Received: by mail-qv1-xf32.google.com with SMTP id kd11so11594127qvb.2;
 Mon, 02 May 2022 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sYbCI8Jfawj/+cLFvyH4OtiicE1oM1tlrNoa7PX+yxo=;
 b=JkIqDFEHCLdnyJV6h9j+AROfvdE2y5cJfpVVqKaY51bFHmmV4uVUp5a1kh0CogbCeV
 Eosl8vMySFLmcueevULz14R4Pwvjf59nAIyo7xpAGSZIBz/ZU9qD2hCiS8ktRMijULqA
 INooKVrx/6uPVCo8YdNYHNg/30GsgIQBwPMXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sYbCI8Jfawj/+cLFvyH4OtiicE1oM1tlrNoa7PX+yxo=;
 b=lDFpC/7eUCZuNZTD69fLs6CnuaLnLcF5gULL6sJsBT0mV41jnh7wX7PUvIpO4Lq1WU
 NehYwWB7ZSUOMcOCg2Fam+/iL4OmVIp0vYZh2jP3hwWzPRiQUd5Yr/O1prMjMw50spUC
 NBXfv4BZzuO0o2Vl9YVOEOPIIsLGn1LmdPJXy701DOvDODgwc26h635X9/uxh2La0/Mr
 t1OTbvNQOjo7VHcAxCtqJo71WM6BGxxEKcXKoglQWnGF5Jw+Nav+G/EEd1CG/BLzwOka
 kFMD9SWnyWr+3CZsuPjmkNJ1ZVcgmdpCj77nXHKhHtUZcwuVETnNbkR2GhwFMqy58rh1
 Jm1Q==
X-Gm-Message-State: AOAM533+r7TH6iaaQ+0GRJjaMNXXfagCg6ypy7BfTK2tuvJmY7PRPxng
 Itz7+Vq/SLE5c2vVagMCVMCw4CVJirlIIeIdNmM=
X-Google-Smtp-Source: ABdhPJzXKglgbfvc/y22kbBrPqAYKdyIcG7c6Vcs397WzlemAGmThQTODYEvOIFE9BAsACLJuFhVRSrhAEFAwm+yhpU=
X-Received: by 2002:a05:6214:624:b0:441:84f3:24e3 with SMTP id
 a4-20020a056214062400b0044184f324e3mr12263372qvx.27.1651556321359; Mon, 02
 May 2022 22:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220502081341.203369-1-clg@kaod.org>
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 May 2022 05:38:29 +0000
Message-ID: <CACPK8XfxsXgVHKY3tqgs=-ZX95jkpjcG_4HE=igG4QBULd0vRA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_223845_360915_213066F6 
X-CRM114-Status: GOOD (  11.43  )
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

T24gTW9uLCAyIE1heSAyMDIyIGF0IDA4OjEzLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPiB3cm90ZToKPiBUaGlzIHNlcmllcyBhZGRzIGEgbmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhl
IHNwaS1tZW0gaW50ZXJmYWNlIGZvciB0aGUKPiBBc3BlZWQgc3RhdGljIG1lbW9yeSBjb250cm9s
bGVycyBvZiB0aGUgQVNUMjYwMCwgQVNUMjUwMCBhbmQgQVNUMjQwMAo+IFNvQ3MuCgpJIHB1dCB0
aGlzIGludG8gdGhlIE9wZW5CTUMgeW9jdG8gdHJlZSwgd2hpY2ggcHVzaGVzIGl0IHRocm91Z2gg
Q0kgYW5kCmRvZXMgYSBxZW11IGJvb3Qgb24gUm9tdWx1cy4gSSBhbHNvIHRlc3RlZCBvbiBQYWxt
ZXR0byBpbiBxZW11IGFuZCB0aGUKQVNUMjYwMEEzIEVWQi4KCiBodHRwczovL2dlcnJpdC5vcGVu
Ym1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9vcGVuYm1jLysvNTE1NTEKCkl0IGxvb2tzIGdvb2Qu
CgpUZXN0ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+CgpDaGVlcnMsCgpKb2Vs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
