Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA8CC4708D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phKu5/GAznAfakUt3tm7wrQDTyJtQc6uH4TC1N+C8xU=; b=Lt8a4Oby7NO8i4
	Mgs316M5+qs5etHOyd8sVD/uxjzQ+ta6wbVWTDRMBBeGW1KAg/SBTqlKcIeJ2tw5rkluVAyKtQN8s
	lB23cOHrSl8j421BKYatd/XO1vbwCcSOrsVrTliZabNTwYpJHwI7Nfou+9j2CbSjoJhvQKR5IQNGa
	X0bUUeDY/YFT2AoH9WjDMf0JrO+5j34Vhb4cMgUfAIhuFk+AFHS8IoxW20znyNVIjAo2yWL22Snpr
	7uPsbMG522fVFgfDspi4INxawHrrL3HYChGThYL7WAb9rmnQXVUcfMmBk5dPEgZp/vps4x97F09Hn
	jIp3HkfWEDXJHdJRlEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDp47-009Z89-7i; Fri, 06 Jan 2023 15:55:31 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDp3w-009Ywn-A9; Fri, 06 Jan 2023 15:55:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B56EA1BF211;
	Fri,  6 Jan 2023 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673020513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEq7hIKT0a2IddjeblncUpOT0+Vv9GyxbJZahF32HwQ=;
	b=Sm7g3iYV12qVzkFbT03mayB48DX0Kjowrm5cEiwxhRu+zSEbBSv4kWlNRVrwLixP/h7xmS
	ZYVhROV+6uoYm7/k8JPfGkeiGMVeKagjE62gDCRfWNmH+h6Hidizh/0K/jEtwLrg4aWn6W
	GkMNOp8wou5/bIWym1SOFf/aaQaxbBaf498mzku28JqsiDA2bowdmbTHeXfTA8ja2sl609
	BYG9Meu2YZQayBRTcbth47Q9FMcJ8MdSShl7FRKvrC/24mjjH1+IGflHzEqCldFBbg0uPy
	KOfsqQyp1O5N4sOZvnFASdJKRXelcqr7Rh4sPWzRTwLzcQkPs/KL6sGztEegSw==
Date: Fri, 6 Jan 2023 16:55:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: arnd@arndb.de, richard@nod.at, krzysztof.kozlowski+dt@linaro.org,
 herbert@gondor.apana.org.au, robh+dt@kernel.org, akpm@linux-foundation.org,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <20230106165506.0a34fa78@xps-13>
In-Reply-To: <678ad800-7a3b-e2bf-6428-f06d696d8edb@linaro.org>
References: <20221226144043.367706-1-tudor.ambarus@linaro.org>
	<feb09bac-0ea4-9154-362b-6d81cba352a8@linaro.org>
	<678ad800-7a3b-e2bf-6428-f06d696d8edb@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_075520_689536_726E3CDA 
X-CRM114-Status: UNSURE (   6.25  )
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

SGV5IFR1ZG9yLCBoZWxsbyBhbGwsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24g
RnJpLCA2IEphbiAyMDIzIDE3OjQ1OjIwICswMjAwOgoKPiBNaXF1ZWwsCj4gCj4gU2luY2Ugd2Ug
ZG9uJ3QgaGF2ZSBhbiBhbnN3ZXIgZnJvbSBBcm5kLCB3b3VsZCB5b3UgcGxlYXNlIHF1ZXVlIHRo
aXMgdG8KPiBtdGQvZml4ZXM/CgpBcmUgTUFJTlRBSU5FUlMgY2hhbmdlcyBhY2NlcHRlZCB0aHJv
dWdoIGZpeGVzIFBSPyBJIHNlZSBhIG51bWJlciBvZgpleHBlcmllbmNlZCBwZW9wbGUgaW4gQ2M6
LCBJIHdvdWxkIGxpa2UgdG8gaGVhciBmcm9tIHlvdSBmb2xrcywgYmVjYXVzZQpJIG5ldmVyIGhh
ZCB0byBkbyB0aGF0IGJlZm9yZS4gSWYgeWVzLCB0aGVuIEknbGwgZG8gaXQgcmlnaHQgYXdheSwK
b3RoZXJ3aXNlIEknbGwgYXBwbHkgdG8gbXRkL25leHQuIEknbSBhbGwgZWFycyA6KQoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
