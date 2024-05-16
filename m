Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994D3C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJy9tcNhkobR/WudjBJ0X+8nGbglWEsTGgLizkP5Sho=; b=ZBpS7q1j8DPKql
	JqXAHkCIBoIpzbXdtcO6wYdiKcwUEMkSZDq5wxw/rL/NMzlcxQMfciAdsErH7AN7Qq95wwQSQ4TGU
	D4iRlCu/BM0WCEk3B2KogT3OO7P3iS0ziXHqMgYkY6vv/ZSnJCKm4gE4qSnYvSKzXLEwkZeqjbtjB
	S9p3sZ5e/CowlQAf7YENvu5KyEz0r47jRcyngjbPySqmcF/MIhUcyNZCMSaaYp2HnUsGCy5yT+JRm
	QuayCwaJqwr7LMki9mBkksk8Xci/pJQhgviH8cb2IiNIvoROGCbxmZLn3wrYWGkXm2SyHRwJh1F24
	N4TsyeARjocQaNkkCnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ahf-00000004uND-3I5R;
	Thu, 16 May 2024 12:59:23 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ahc-00000004uLo-1ABn
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 12:59:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4A0D1C0013;
	Thu, 16 May 2024 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715864356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VYt2HYh+V2OT/jwfpv8GJca1w+iP1kom40uemwth2I=;
	b=eSpQPfoiWXLiVFtiq3Xw9nPRgPt7/bOkaNUviPXkYgdAaJfNYA4i2lMvpKUVqI9GNbrcyA
	3txJ31lbVOne2gRmvLo63GQap7QwRZGPyUUMO2hpa/tfZuK8IHcGRuzVkka9wvyjKMLyuN
	Y64Bue0PtnjoiTqf6SSnuwa9WKNYvFBS6iTMthTI0/kZrtBnUTCUSXs6G4eUztQ/egioeg
	rqCea/g4I7C+bubDhyEh6HBe6w3YwlevvdnpvnohBjhRTVAvqWQ/0RS9acHfN2HgdE66Bl
	qzDE/a2e7LFjt/DLnsM0QUprgHhb4qnaBLcKIbFbm9BAwarf6K75fBylurYl7w==
Date: Thu, 16 May 2024 14:59:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: ipq9574: Disable eMMC node
Message-ID: <20240516145915.10adca29@xps-13>
In-Reply-To: <20240508083637.3744003-8-quic_mdalam@quicinc.com>
References: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
	<20240508083637.3744003-8-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_055920_665045_1A80C6C6 
X-CRM114-Status: UNSURE (   5.20  )
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

SGksCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBXZWQsICA4IE1heSAyMDI0IDE0
OjA2OjM3ICswNTMwOgoKPiBEaXNhYmxlIGVNTUMgbm9kZQoKUGxlYXNlIGV4cGxhaW4gd2h5IG9y
IHJlbW92ZSB0aGlzIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMsIGJlY2F1c2UgYXQgYQpmaXJzdCBn
bGFuY2UgdGhlcmUgaXMgbm8gcmVhc29uIHRvIGxpbmsgdGhpcyBwYXRjaCB3aXRoIHRoZSBvdGhl
cnMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
