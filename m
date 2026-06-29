Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34CC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KbdoNkJMK95sc4I8Cn2Jx3FhRx4mukHHcvmSFud63Y=; b=QcnG/k66nNdtS4
	WWUen9lUVYSgkqonX/Hs0eNhd+OdmaZnQiBnMOujfXdwCVfbmTkXCxJDxC+UfJhDtaZpBDZbZNjGX
	tTvHmVQA/lvz3qYo5AemNBkDw9oTZ39BkoxAv8/i6ihB4jDAUrs/qfA8cBMj7ygzJfh4cT4bRIR2A
	+KJ9x/eROScnN2cWFVd/veSsSjF9NETlP5x2m+2TOfR2bDlCyUp42qzK0/yy6+Nx3MAY8HvoRAhup
	FUCRWcx9q8Ze2s9gw6AWx0A1NjZQOPwTy37EB1Yo/8YCEBJ1hAqBpzVsUOnB4918Dq3qFW5tiwB86
	1M9dJVXYoRWH6O+Pj21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weECS-0000000F7HX-0lfZ;
	Mon, 29 Jun 2026 15:47:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weECQ-0000000F7Gu-2I3a
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DC1E41ED2;
	Mon, 29 Jun 2026 15:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61431F000E9;
	Mon, 29 Jun 2026 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748026;
	bh=Zwf2F0ty3yV6emjhTjpwsHP7jJr8cgRnPZK3E9IHM8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K30e3ASXk3Uqd8wptw5/q4d3OfVyGIaifmMIO0sZx4XzC0nRXsLZyvov1vUNo0l7O
	 fqPB5kA+GuR3/IYyPUFwwCuqdgfPeDx8auQNBbolikD1bNFCC4UGFq78nE+/h9zyPo
	 FTqbEacmru9UWhrRJF0K5q25jNDHlJH0V+RGpLuH+w9bQ25mjjtnmdQ4rFG4M04ilS
	 0exPBjE2JdqYREtuvCtYPe7FOwer93BEBrFVJabP+jsZmfS3GJij0Z1wSf0Jq+lrBw
	 WRAUgeNd+AZJDHcWZzNbh4Lm6VeRSfFHsHJamRB8fdSYTpAOceEMCMq9wAIn9Ojk7J
	 5lxTuTPo9WbRw==
Date: Mon, 29 Jun 2026 17:46:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
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

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMDM6MjA6MjFQTSArMDIwMCwgU3RlcGhhbiBHZXJob2xk
IHdyb3RlOgo+IE1ETTk2MDcgaGFzIFFQSUMgdjEuNSB0aGF0IHN1cHBvcnRzIHRoZSBPUF9QQUdF
X1JFQURfT05GSV9SRUFEIGNvbW1hbmQsIGJ1dAo+IGlzIG1pc3NpbmcgdGhlIHJlc3Qgb2YgdGhl
IGhhcmR3YXJlIGNoYW5nZXMgaW4gUVBJQyB2Mi4gVGhlcmUgaXMgYWxzbyBvbmx5Cj4gYSBzaW5n
bGUgY2xvY2sgdGhhdCBjYW4gYmUgY29udHJvbGxlZCB1c2luZyB0aGUgUlBNIGZpcm13YXJlLiBE
b2N1bWVudCBhbmQKPiBhZGQgdGhlIG5ldyBxY29tLG1kbTk2MDctbmFuZCBjb21wYXRpYmxlIGZv
ciB0aGlzIHNldHVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhh
bi5nZXJob2xkQGxpbmFyby5vcmc+CgpZb3UgY291bGQgYW1tZW5kIHBhdGNoIDEncyBjb21taXQg
bWVzc2FnZSB3aXRoIHRoZSBpbmZvcm1hdGlvbiBJIHNoYXJlZCBpbiB0aGUKcmVwbHkuIEJ1dCBu
ZXZlcnRoZWxlc3M6CgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtl
cm5lbC5vcmc+CgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k
4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
