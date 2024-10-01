Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F12CEACFF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J85IX2zBIVeOCI6ByNMUwSZ2vQZiNktnRhLZNYCveqo=; b=rQfGMBrbVqcEKY
	/SNqPxLQi1K6YQ7K2Y4pUgVkU+mX+Uu/zF9Lfw/3DxQdFe08b/T3vzZ2yjVz+vXy2ZwWbbRyfM+QE
	8AIIF4+DgWqDwySVDMK5kXqfXJ65ZWmJIGVHV/EkFVShKymARfl1KEHs076UxdVX2KWzWUEaiZc6X
	v+Z1Yy9T7xvaaa/pP0PcD5yjEmlPvPwsOVhOvyML28aZJ9kmnl0DQlNmNuJVrksPADQAHuzXdA76x
	Ri4XKAfs5E7ISUsLRHnDynSf534KoGmzX3wAzRfl10BTVSH1npzK7VZltXCFdA3sRAWscv2ItPPHm
	ns02mloR4XK0pB4M2Rkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjCi-00000003xYN-2dGM;
	Tue, 01 Oct 2024 20:10:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjCf-00000003xXk-3Qta
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 20:10:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BF6FFF802;
	Tue,  1 Oct 2024 20:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wciwjokDugAnsWeKdaqfhfP5WiHTbppV884jMM94Ra0=;
	b=pJvNdWxl4CIRZtaAqKyVjFpDtqhO7S5V282fRVAkWEPq1EjGEGWrkg5tqpQUN9ZjwKj/wZ
	5y10EzL2mBeKRmqBEfg62vQNJiV41laisO4NRr3oWSxg1li6qu1qqxG2FRTWCAMuYiTUs3
	Ul+aPkNA3E37TElAmTBPeGJvGtrlyjmHctkJe4ITohWh6QA8T6TIbRsY8WvXy7Yp2nDlWB
	JLgrJIX/fTmTcMG06pRjluk3udr1Q+nsk8VfBfnWbtlnlPDmhPK77h9Dyc+MHa1XunTbbp
	Sd/ZokFCPRudEV+ykPvritiOrRfJszeBjWxScYBT5E1vn07sVMUGgb3+arfz5w==
Date: Tue, 1 Oct 2024 22:10:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: mtd: davinci: add support for on-die
 ECC engine type
Message-ID: <20241001221032.525be1e4@xps-13>
In-Reply-To: <20241001-ondie-v1-2-a3daae15c89d@gmail.com>
References: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
	<20241001-ondie-v1-2-a3daae15c89d@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_131038_014534_F02BFBB1 
X-CRM114-Status: GOOD (  12.44  )
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

SGkgTWFyY3VzLAoKbWFyY3VzLmZvbGtlc3NvbkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAwMSBP
Y3QgMjAyNCAxMjo0MjoyNyArMDIwMDoKCj4gU29tZSBjaGlwcywgZS5nLiBNaWNyb24gTVQyOUYx
RzA4QUJCRkFINCwgaGFzIGEgbWFuZGF0b3J5IG9uLWRpZSBFQ0MuCj4gQWRkICJvbi1kaWUiIGFz
IEVDQyBlbmdpbmUgdHlwZSBpbiBvcmRlciB0byBiZSBjb21wYXRpYmxlIHdpdGggdGhvc2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWFyY3VzIEZvbGtlc3NvbiA8bWFyY3VzLmZvbGtlc3NvbkBnbWFp
bC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZGF2
aW5jaS1uYW5kLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9kYXZp
bmNpLW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9kYXZp
bmNpLW5hbmQudHh0Cj4gaW5kZXggZWI4ZTJmZjRkYmQyOTAxYjNjMzk2ZjJlNjZjMWY1OTBhMzJk
Y2Y2Ny4uOWFmZGE1Y2Q5NTY0OTRjNmIzMTcxYmRiYWVjYWViMjg5YWNkNjRlYSAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2RhdmluY2ktbmFuZC50
eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2RhdmluY2kt
bmFuZC50eHQKPiBAQCAtNDQsNiArNDQsNyBAQCBSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzIDoKPiAg
CQkJCS0gIm5vbmUiCj4gIAkJCQktICJzb2Z0Igo+ICAJCQkJLSAiaHciCj4gKwkJCQktICJvbi1k
aWUiCgpUaGlzIGZpbGUgaXMgdmVyeSBsZWdhY3kgYW5kIHRoaXMgYWRkaXRpb24gd291bGQgYmUg
dG90YWxseSB1bm5lZWRlZCBpZgp0aGF0IGZpbGUgaGFkIGJlZW4gY29udmVydGVkIHRvIHlhbWwg
ZWFybGllci4gSnVzdCByZWZlcmVuY2luZwpuYW5kLWNvbnRyb2xsZXIueWFtbCB3aWxsIGF1dGhv
cml6ZSBuYW5kLWVjYy1tb2RlID0gIm9uLWRpZSIgKHdoaWxlCnN0aWxsIG1hcmtpbmcgaXQgbGVn
YWN5KS4gV291bGQgeW91IG1pbmQgY29udmVydGluZyB0aGlzIGZpbGUgcGxlYXNlPwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
