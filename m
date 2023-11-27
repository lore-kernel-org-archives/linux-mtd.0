Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C547FC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdK4YW8ujZnYLb1rGBYwXs5jk6RQm98CsuUB+mMQy6A=; b=luqik68ILwjdzs
	RwvyfmFk0f5s/xVTGtZCotGh7So40Nj0kRhYRVU3wLGAcx5azYtxz3URZjY1Q8sa9OjWsE8ruXqbC
	JPeaOlG0s0S/rNar408edtK8Ca0oXCA9luHTdUp7kYJsmjjgRq6cJvcSxJsgiUcfsV3bDtaCPNTzz
	7SfIV1vqv8nt/Lt5LqDW4Nqk2ag2Y4thaK2td8i0XTqlmgC44B7v4vwNe0uKUgg+vP3vJOOW021b3
	ORWTnxS1FcrAZVMfkwZYi9cvq7IW4Igsox+ipXhP+c9KOogsBLglv2Chkin4WW+W+AeD6qDDydzyJ
	WwAHiq5wr3C9yL/9fx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7a7i-002Kxp-16;
	Mon, 27 Nov 2023 11:49:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7a7f-002Ksx-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 11:49:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4AC60008;
	Mon, 27 Nov 2023 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701085791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RnIy8k9MAB2CLvTZIM8gcwE0aBRXJQMtbfwoaOjVW44=;
	b=Mb474ih+wVRM18EiHXIYCjN4h188S9wSPREjBRvJ5PtC/4fORROwQ3ELrT3ulSXvDN4eTK
	PYBn/tfU2Ez9kwZ26QtoPcuT3VLz7UPnR5FmhSx9oxKOL6d1WfSNmN+ZdGGx3SLWjJorHv
	4U/6gcAd5G0tIuArS3FLLQyylYDfeSWqSL5Ej0I5cKi+5vtFHhVVjQgBkHQ+cf8R/b9Mnx
	Rs6jXBTyt2UDENtRtQti8Tfq6P1H0X+7BZXF2gXN1fIHSov2G540YXHxC3DeiV/ubIZ78v
	Jhfy+Kdr0SsHgJ3vMp1YO9Zw2V4fjovCxtU+fY5qdzgg23fCJjt4naKqpQ73PA==
Date: Mon, 27 Nov 2023 12:49:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, michael@walle.cc, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 0/2] Hide flash name if it is not set
Message-ID: <20231127124948.163224cc@xps-13>
In-Reply-To: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_034955_522476_1E7B8F55 
X-CRM114-Status: UNSURE (   7.46  )
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

SGkgSmFpbWUsCgpqYWltZWxpYW8udHdAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMjcgTm92IDIw
MjMgMTg6MDc6NTIgKzA4MDA6Cgo+IEZyb206IEphaW1lTGlhbyA8amFpbWVsaWFvQG14aWMuY29t
LnR3Pgo+IAo+IGhpZGUgZmxhc2ggbmFtZSBpZiBpdCBpcyBub3Qgc2V0CgpJcyB0aGlzIHJlYWxs
eSBuZWVkZWQ/IEknbSBmaW5lIGV4cG9zaW5nIGVuIGVtcHR5IChvciAiKG51bGwpIikgbmFtZS4g
SQpndWVzcyBpdCBzaG93cyB0byBwZW9wbGUgdGhhdCB0aGUgbmFtZSBtaWdodCBiZSBtaXNzaW5n
IHNvbWV3aGVyZSBhbmQKbWlnaHQgcHVzaCBwZW9wbGUgdG8gZml4IHRoZSBuYW1lIGluc3RlYWQu
CgpXaGF0J3MgeW91ciB1c2UgY2FzZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
