Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388AFD3ABF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 19:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KqBoyL7qiweyTUChdIji2KP0QK/YOI0tjpVrTw8WQ4=; b=urzjy1p7tls1yk
	YCpGi7UjLCvld4RXwzi5b13ph44p/N6B4py8iYKt/3fiiSUEo1q4vF69XW8tQGlYVTiO2a0jCav/F
	eo/3kseS7Fj1fiJz6EjOfXVISztbltYELfhaAHZ+16wzCpO47tbR4Gt7iKh+zzTk1NBHkhuZ0KDGV
	/sc5U76Y9pi+csvoS3CMcnQfk3crjl0g/FVBj4HFklGOaYAXsj5PvUsn4whbkpRIXjCzAcU4aMGoI
	ZtJh9LyEBTLEiWUaR2NNdWauIva1znMEYdRZQgprRgSzyAnbucslIYGH2/jPFMaQGlJuBpGi1FHtI
	9rmtslPjjPTQxJnn25TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZys-000000012Lx-2RFA;
	Mon, 11 Nov 2024 19:21:46 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZyo-000000012Ji-3ppu
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 19:21:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F7DE0002;
	Mon, 11 Nov 2024 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731352899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yshEmQNfo7lf99gQWxM7QIkdoQdSMmzP8GeA7i6xr74=;
	b=Ml4HaV+xJg4aI9v++lFwK6yWYiRMfqAYfZFaigv/ioq+3gIgZrBBR0vcuufs4C2XjnilXi
	KaWJPkAENm2xUD/pyh3Q0q0O5s6V9RJtncgr9QAfV1Tawkf365GjStMvobKxFb8Jdi2sac
	mF5tsODuWCBlQvSUEx1JrQYFADDIciByva2Pi3fNR/j6wdKa5XewG89EDUIjqlD0zkQhyG
	Erf+P8n6qtlqc8JtVSV/5QtwcYOGkEO0jNpw/jNOeP9sve1G1KT62dY+NdZlX4kmIIant5
	bknC2Osy1PwmHbnDAToBF3PDEHshWPdVy/j8I6qY5dnF0ZDfvs8QmIemGOIRiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2 2/6] memory: ti-aemif: Export aemif_set_cs_timings()
In-Reply-To: <20241106085507.76425-3-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Wed, 6 Nov 2024 09:55:03 +0100")
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
	<20241106085507.76425-3-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 20:21:37 +0100
Message-ID: <87ttcdr2ym.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_112143_533269_1F5FCDBA 
X-CRM114-Status: UNSURE (   8.35  )
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

CkhlbGxvIEJhc3RpZW4sCgpPbiAwNi8xMS8yMDI0IGF0IDA5OjU1OjAzICswMSwgQmFzdGllbiBD
dXJ1dGNoZXQgPGJhc3RpZW4uY3VydXRjaGV0QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gRXhwb3J0
IHRoZSBhZW1pZl9zZXRfY3NfdGltaW5nKCkgc3ltYm9sIHNvIGl0IGNhbiBiZSB1c2VkIGJ5IG90
aGVyCj4gZHJpdmVycwo+Cj4gQWRkIGEgc3BpbmxvY2sgdG8gcHJvdGVjdCB0aGUgQ1MgY29uZmln
dXJhdGlvbiByZWdpc3RlciBmcm9tIGNvbmN1cnJlbnQKPiBhY2Nlc3Nlcy4KCldoYXQgY29uY3Vy
cmVudCBhY2Nlc3NlcyBhcmUgeW91IHRyeWluZyB0byBwcm90ZWN0IHlvdXJzZWxmIGFnYWluc3Q/
CkkgZmFpbCB0byBzZWUgdGhlIHVzZSBjYXNlLCBidXQgVEJIIEkgaGF2ZW4ndCB0cmllZCBoYXJk
IGVub3VnaCBtYXliZS4KCkFsc28sIHdoYXQganVzdGlmaWVzIHRoZSB1c2Ugb2YgYSBzcGluLWxv
Y2sgaW4gdGhpcyBjYXNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
