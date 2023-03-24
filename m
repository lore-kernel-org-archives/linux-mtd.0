Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB02C6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5YuONSMKhuFjnywBGdphj6j4Hf3IEMYo+alNtl6tv0=; b=x5EuJu3q1hsCZT
	JUroIVFzz4F8Jje+xDDL1X247w73RbqIBv3PH0Z31MmO9TLQcvVTh+S8JZTYvL92o5klzyIVmV98w
	SmHlJftxH869YQw8QWGrVpZWVcxpLIqITWyTPGUTHR2UoaVbTl+3JAYjfJ78YfxY8l+wq6dhW6Rjf
	g/o8NRQ236OKwy1XIJdGIiKv2+i3f1GVtsOX0gaAswepUfJwqnKVopVIXkH18iZ8dDROE5iTir9bt
	bHA0SMzaXZFpBUyOKOD7UVN92Y+ISLIoM/35Bn65ji2Y8D6FGZJUpihcdel2t7Zr+6CnDh5Yah1tX
	XBr1Ki2/AXztbE+smMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfkEV-004yyG-0c;
	Fri, 24 Mar 2023 16:25:39 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfkER-004ywC-2O
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 16:25:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E9A0624000B;
	Fri, 24 Mar 2023 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679675131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLzWeLxSuEsnoumPpXxnCEwUl43WWezW7vONFSan/CU=;
	b=MrA2p34aD+1+1n6ZmzwtodiD1bIwrXlGZBz9KJaD1qOBCd1d1xkbl0kVYrWvRK9mVQCpta
	zyh7TfW7RdjXZKiWiAdLx8v+IK6xId+N0lj5hTypSvsjc22EIiTTG2SU3BPODUGSGTty9b
	VXJLnAn7KDPf/Emr3zr9PyRm+7M/YGMBU0VQkl6uikJOuESb13jVZQOaHWBkHg5Sf7yc3v
	YnJRzamlfX/aSt8+Huv7/vRwDrWsphlvmIm36yx29XKNbWn6oX4MQxSHPOEarqgDVmG6kY
	G/GPKZEUFLXoyVbwzKGHyZSxbz3dBdUcw9Wp3II+fKCFBpclrvFldgJcAxLxQg==
Date: Fri, 24 Mar 2023 17:25:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: do not support EDO mode
Message-ID: <20230324172528.4d3ccd4b@xps-13>
In-Reply-To: <20230324160918.826452-1-christophe.kerello@foss.st.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_092535_933329_050539FB 
X-CRM114-Status: GOOD (  12.86  )
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
cmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgoKPiBGTUMyIGNvbnRyb2xsZXIgZG9lcyBu
b3Qgc3VwcG9ydCBFRE8gbW9kZSAodGltaW5ncyBtb2RlIDQgYW5kIDUpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29t
Pgo+IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBT
VE0zMiBGTUMyIE5BTkQgZmxhc2ggY29udHJvbGxlciBkcml2ZXIiKQo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
Ywo+IGluZGV4IDVkNjI3MDQ4YzQyMC4uM2FiYjYzZDAwYTBiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBAQCAtMTUzMSw2ICsxNTMxLDkgQEAgc3RhdGljIGlu
dCBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
aW50IGNoaXBuciwKPiAgCWlmIChJU19FUlIoc2RydCkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoc2Ry
dCk7Cj4gIAo+ICsJaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAwMCkKCldoZW4gaW50cm9kdWNpbmcg
TlYtRERSIHN1cHBvcnQgd2UgYXMgd2VsbCBhZGRlZCBhIHRpbWluZ3MubW9kZSBmaWVsZCwKcGVy
aGFwcyB5b3UgY291bGQgdXNlIGl0PwoKPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICAJ
aWYgKGNoaXBuciA9PSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkKPiAgCQlyZXR1cm4gMDsK
PiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
