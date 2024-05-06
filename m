Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0430DC4345F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxjfbs8ypgLHY6tf+nVqKxnz9cP6SyMqSvahz78ufKo=; b=xfc1eg5TUGPKir
	9jO1Nv+zqK336Xu+s+JNbgZWMUiE37jjWdc1VzeCgjphGAK9Udcme9rs2s0zuGtN+HlqYU/f8kpJ3
	i4N8hIzodB8nSX/3o8qtSQlZqUqajL7E5ubCwz7SqQQCUMULIs700uBZRk4jsbmqMTkaxx4VZVfTF
	iS983GhSOJX9RVQLpYlZY+g1fGjMdGt2TPre7dVXVdzt993g45GrTRSXYGftYlnuA3KPodOO3zu1D
	dc8XHN3hXtUZtxZZPrOe9ZmEybXl9bp8z/LCrbJ+BsBBKFrwEcLBFaDW2ffr6PbVTesCD8HMjIHrA
	Pv+Tb1Tg0x937/UZH6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sbl-00000006QZZ-1CwR;
	Mon, 06 May 2024 07:17:57 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sbh-00000006QZ3-2dfd
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 07:17:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49146E0006;
	Mon,  6 May 2024 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714979870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TiNw7b/eFI6QFHmACKnQ+Lmgs4hhHYmLO5oH7iZKc=;
	b=lzRZVz0GLJ74p8N/yXNAbwpykF1XLxu8H/V9Js14qzM39RB9kJCAuDpmQlhEenmwFS7TjV
	JSj8VWp1/vVwl0OkoaO2gRSYGxPP0ojRNPo7HEfbT3psARgLBOtqS509Pi44nuJP6lRvLf
	3w2FpUyTrs7F8ANoNczAOSHuMdy/Bt+rfBfWa6Jpqv+/n87JGnvfRwBaewZxoyOl7RP4is
	WPeJi+13YO7K6tYgOAao8N6766fP2KYxj/VfQp5lWvN3hj9hVOyX72E7Wqjnoquy2B7cJu
	FUrWhxcS4fHDgYrTran1/Q9etQUgavYLi8sV5xmMFcrlsWHY+smJTGdZI5KKAQ==
Date: Mon, 6 May 2024 09:17:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when
 reading subpages
Message-ID: <20240506091748.18c120d5@xps-13>
In-Reply-To: <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_001753_828837_2C8825D5 
X-CRM114-Status: GOOD (  10.42  )
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

SGksCgpkZXZudWxsK2tlZ3VhbmcuemhhbmcuZ21haWwuY29tQGtlcm5lbC5vcmcgd3JvdGUgb24g
VHVlLCAzMCBBcHIgMjAyNAoxOToxMToxMSArMDgwMDoKCj4gRnJvbTogS2VndWFuZyBaaGFuZyA8
a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+Cj4gCj4gbmFuZF9yZWFkX3N1YnBhZ2UoKSByZWFkcyBk
YXRhIGFuZCBFQ0MgZGF0YSBieSB0d28gc2VwYXJhdGUKPiBvcGVyYXRpb25zLgo+IFRoaXMgcGF0
Y2ggYWxsb3dzIHRoZSBOQU5EIGNvbnRyb2xsZXJzIHdobyBzdXBwb3J0Cj4gbW9ub2xpdGhpYyBw
YWdlIHJlYWQgdG8gZG8gc3VicGFnZSByZWFkIGJ5IGEgc2luZ2xlIG9wZXJhdGlvbiwKPiB3aGlj
aCBpcyBtb3JlIGVmZmVjdGl2ZSB0aGFuIG5hbmRfcmVhZF9zdWJwYWdlKCkuCgpJIGFtIGEgYml0
IHB1enpsZWQgYnkgdGhpcyBjaGFuZ2UuIFVzdWFsbHkgbmFuZF9yZWFkX3N1YnBhZ2UgaXMgdXNl
ZApmb3Igb3B0aW1pemF0aW9ucyAod2hlbiBsZXNzIGRhdGEgdGhhbiBhIGZ1bGwgcGFnZSBtdXN0
IGJlIHJldHJpZXZlZCkuCkkga25vdyBpdCBtYXkgYmUgdXNlZCBpbiBvdGhlciBjYXNlcyAoYmVj
YXVzZSBpdCdzIGVhc2llciBmb3IgdGhlIGNvcmUKaW4gb3JkZXIgdG8gc3VwcG9ydCBhIHdpZGUg
cmFuZ2Ugb2YgY29udHJvbGxlcnMpLiBDYW4geW91IHBsZWFzZSBzaG93IGEKc3BlZWQgdGVzdCBz
aG93aW5nIHRoZSByZXN1bHRzIGJlZm9yZSBJIGNvbnNpZGVyIG1lcmdpbmcgdGhpcyBwYXRjaD8K
ClRoZSBtb25vbGl0aGljIHRoaW5nIHdhcyBub3Qgc3VwcG9zZWQgdG8gaW1wcm92ZSB0aHJvdWdo
cHV0IGJ1dCB0byBoZWxwCndpdGggdmVyeSBsaW1pdGVkIGNvbnRyb2xsZXJzLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
