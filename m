Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604D9C6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXKVaYwEquWC3FLiSuY90wWe0cpm5v4cj0CrSx3bev0=; b=YFSoa3315kE0om
	1gW6EYyPsXAiZwQPTala8z0REXRPSp1s11841ddzWngDcSEQMsTXWnG+Qxh/bNpmsLudInDzgpV8W
	wX28pCey8878IUVMJoCsk5cf+uBr4hczekAHR40I41Vra1zQOf0szDITts/OPm7HLrIhCwQ5SvcsC
	HbDOb3bmVfIKQsPJFPRGYGaU2K53DbHnGMiVv2VfgCM62hIRrS83ngry3w8vQCXy/x1vnVW3RIHI0
	aIo2GLegNeCY1TLbBTINgGIVKhONJqeXnJmXGn/2f34C9zx96E4s5XGRaVAAsIL9Nhblsm2Drjqww
	IepYrUKFdQ0r20DbDnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjt4-004wbT-1w;
	Fri, 24 Mar 2023 16:03:30 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjt1-004waq-1L
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 16:03:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F3B29FF80B;
	Fri, 24 Mar 2023 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679673804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/Ot0XeBt4bh9S+cBPdCZ8iwvY0dcGmED6USv22SRnM=;
	b=BN22IGMZfMTPJUAD9JudirnCVZS8EtGHY8K8BBURZujAXY/BvR54yys/qrYZIVCxyYflSP
	AikEEJ4YmqmlZbNOMemXEdao26esr6xDfEmVdFz+KufTp8PQoHKUVNBYvdzzHU/hadKb1n
	rJzyQwdn75aimiV0tljZA6qnou0wBE06O3hApQj6gYT1QRn+MAmFrNbqHW8Bs/MvUaLBNi
	7MO4Hzpik1h27xB8Q1Ugzn/kyTe44hWlD+zhz1y2ARNpqq76PBoYJ0jZNg2XJ0HHHAHzla
	SsEwmYFrxf+m345laNq4FEbaPEJM0oO8DGAl1Ii8K7HvoaqDetBZ1lJRYYf39w==
Date: Fri, 24 Mar 2023 17:03:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <krzysztof.kozlowski@linaro.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 0/2] depends on ARCH_STM32 instead of MACH_STM32MP157
Message-ID: <20230324170320.5087c223@xps-13>
In-Reply-To: <20230324155105.826063-1-christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_090327_621680_29CB883F 
X-CRM114-Status: GOOD (  11.39  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBG
cmksIDI0IE1hciAyMDIzIDE2OjUxOjAzICswMTAwOgoKPiBUbyBiZSBhYmxlIHRvIGNvbXBpbGUg
dGhlIGRyaXZlciBvbiBhbGwgU1RNMzJNUCBTT0NzLCB3ZSBtb3ZlIHRoZQo+ICJkZXBlbmRzIG9u
IiBvbiBBUkNIX1NUTTMyLgo+IAo+IENocmlzdG9waGUgS2VyZWxsbyAoMik6Cj4gICBtZW1vcnk6
IHN0bTMyLWZtYzItZWJpOiBkZXBlbmRzIG9uIEFSQ0hfU1RNMzIgaW5zdGVhZCBvZgo+ICAgICBN
QUNIX1NUTTMyTVAxNTcKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogZGVwZW5kcyBvbiBB
UkNIX1NUTTMyIGluc3RlYWQgb2YKPiAgICAgTUFDSF9TVE0zMk1QMTU3CgpJIGRvbid0IHNlZSBp
c3N1ZSB3aXRoIHRha2luZyB0aGVzZSB0d28gcGF0Y2hlcyBpbiBpbmRlcGVuZGVudCB0cmVlcyBz
bwppZiBub2JvZHkgZGlzYWdyZWVzIEkgd2lsbCB0YWtlIHRoZSBzZWNvbmQgb25lIHRocm91Z2gg
dGhlIG10ZCB0cmVlIGFuZApsZXQgS3J6eXN6dG9mIHRha2UgdGhlIGZpcnN0IG9uZSB0aHJvdWdo
IG1lbS1jdHJsLgoKPiAKPiAgZHJpdmVycy9tZW1vcnkvS2NvbmZpZyAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
