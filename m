Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3953BCD8CA7
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Rn637c0ZEhYvo7D020IX4wLUaYrsUZ3pySZOPBC6DM=; b=KhP2mMDbWTyEwd
	LEtRq5hpZ0pXeLsc2qDFCJs4azfr96qxcn6RAlFGKBrD3c2Mjzr8OQ6HleUVKZ+R2y+qwipIc+B5s
	rIffwE0H5Xzmaz6lL09qwKJAetJ9gURwli+EIWO7oMHwXRqaPHPMahmDG/SLjoXTMc300PVPMc5qn
	kEzz3MJszrutRIXKi/vOctTwEHVbfKeUIURR4AcO4gReJ0SjouASjTKcd0uC5yaCulJACpD9SeL3w
	2BU2K1tUHuZA92R6nNl3o4DKzYck572NDSB9nLvlrv5IawbJC8vX2tfsUoUHEEzsSMWzyvnLMeQq/
	RBPzGObAU16fm2jzaQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGn-00000004zeA-0KvJ;
	Tue, 09 Jun 2026 07:53:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrGm-00000004ze2-2Jh0
	for linux-mtd@bombadil.infradead.org;
	Tue, 09 Jun 2026 07:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=; b=VSFwmLfgGBn7xS+Zj+A+1sndfG
	7SQcapET21T8caRW/PPjrsPwwZgYcbx3kT1Fwbx2ORWNim/ZoN+Fi8jCZk6zgdg8OqtKrqK7aojvE
	rbZ2F4e6pxnnpRyVJmX3j5zlCnvvK7l5Qe39QYymx0jw7QBM5gGlKuHfRKGFOkwNxQlaO/D8qySIh
	eHQBVMWAhqSvccVKCyp0wez77wq5mEYwSO4bYVFi05tq+SeHAeKvUu1y+MQS6ceBqOLNjR8+A/U9S
	B7WRch/4dTAi4hUMyUcixFzboivhABtgm2Dpc8GdA8I3tvrAC5DINSUondm6oUSBdsdfwe09XLYAK
	G4DTGWXQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWrGi-000000027dP-2gse
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 07:53:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A0CF1A37F7;
	Tue,  9 Jun 2026 07:52:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5515FFC1;
	Tue,  9 Jun 2026 07:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9829B106A2AC4;
	Tue,  9 Jun 2026 09:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=;
	b=UCJ+krtitxcJH1aTgMdIj1xuQf1V5COpvq61rhz+lLKjr8ySVV9rsP5QRcGbVq+PAvAoK3
	RuuOz1V+kQXCGU1aELysXAzDtlF/WB2dHC71W60rB7QAXajAd8HWmtkhUxa5FXbvsQaBnQ
	ppwRD+ZV201v1seE0HuTvAkKwXb3b3H+KDBGvAEhqw5fgg2KUZvE9dfHopbxFZjk1OPqZB
	6mTRDvePmYjfZRuRfBfLJQn4/HMD/wHQ3TsbGxt3NVqcDwkmh2HOe9/FiUo3pP4ZdSsJBA
	OU/hjE6TsV2EEJ2nm9/1wdy32hY3/Q8ldyQ6giw4wPmkZLNzC13klf5yrYFZzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <mani@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <20260609-quirky-rat-of-criticism-aea1fe@quoll> (Krzysztof
	Kozlowski's message of "Tue, 9 Jun 2026 09:19:52 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 09:52:51 +0200
Message-ID: <87mrx4b164.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_085305_285640_C346DC25 
X-CRM114-Status: UNSURE (   8.03  )
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

SGVsbG8sCgo+PiBPbiBNRE05NjA3LCB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIGNvbnRyb2xsYWJs
ZSBjbG9jayBmb3IgdGhlIE5BTkQKPj4gY29udHJvbGxlciAoUlBNX1NNRF9RUElDX0NMSykuIFRo
ZSBzYW1lIHNpdHVhdGlvbiBhbHNvIGFwcGxpZXMgZS5nLiBmb3IKPj4gcWNvbSxzZHg1NS1uYW5k
LCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZGV2aWNlIHRyZWUgKHFjb20tc2R4NTUuZHRzaSkgd29y
a3MKPj4gYXJvdW5kIHRoYXQgYnkgYXNzaWduaW5nIGEgZHVtbXkgY2xvY2sgKCZuYW5kX2Nsa19k
dW1teSkgdG8gdGhlIHNlY29uZAo+PiBjbG9jayAoImFvbiIpIHRoYXQgaXMgcmVxdWlyZWQgYnkg
dGhlIGR0LWJpbmRpbmdzLiBUaGlzIGlzIG5vdCByZWFsbHkKPj4gdXNlZnVsLCBzbyBhdm9pZCBk
b2luZyB0aGF0IGZvciBuZXcgcGxhdGZvcm1zIGJ5IGV4Y2x1ZGluZyB0aGUgc2Vjb25kICJhb24i
Cj4+IGNsb2NrIGVudHJ5IGluIHRoZSBkdC1iaW5kaW5ncy4KPgo+IFJldmlld2VkLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+CgpX
aGF0IGlzIHRoZSBwcm9ibGVtIGluIGdpdmluZyB0d2ljZSB0aGUgc2FtZSBjbG9jaz8gSWYgdGhp
cyBpcyB3aGF0IGlzCmRvbmUgaW4gdGhlIGhhcmR3YXJlIHJvdXRpbmcsIEkgZG8gbm90IHNlZSB0
aGUgcmVhc29uIGZvciBtb3JlCmNvbXBsZXhpdHkgaW4gdGhlIGJpbmRpbmc/CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
