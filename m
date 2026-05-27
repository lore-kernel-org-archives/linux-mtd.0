Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE09CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjzxE8X0GtlXmjg8fiFi4rJlQ1XubEmSOCtEpLrCbiA=; b=cQjLrrbLFe46Gh
	MsOl4iy7hHiS3Rzstr1tKfGAwW4XOepjnCBto/uNtODFc8xiOdHIpbUy1xWrePMg4RHZ973cDvFVp
	Yhv0Y21XmSxDeImvophzmsjxKKmpVJmPcdU1VJktv/NmMfztr8mn0+F/5X8rjnkqnkI6iGSN37q73
	uCSIzt9qntqpYAFxTAlpBXjB27vMenVSJiPF7qcvTvU8igU1U0rqy5X9qpZYeYzHDBPYTV4ej7i7W
	dZIsTZnKhiyjuzxvt8piSRzBw40HIk+/R8yvpg0Ka5gLJwfCKJHSxj2O2gZKaXWHwpfduOtWbzg9i
	OLN3o1+6nSkhbtl6bHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE9-00000003ayG-0nGq;
	Wed, 27 May 2026 09:07:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE6-00000003avu-22JZ
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:06:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 050984E42D19;
	Wed, 27 May 2026 09:06:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA7B601A1;
	Wed, 27 May 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFCD81088845E;
	Wed, 27 May 2026 11:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779872814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0a/+PfGMT4nGVYJzfWGP+b1yQsfSh6fdeD4bxph3NkY=;
	b=qhPldFNdc/avpvYFSkY+2yo8oNUvjDEcwBrLPde6M8Wn+S3m8zWI0l+6kBMV3YoeQsXVds
	KwZjcX8vWzXBa2paW9j/ZfQB55SKs2Ez/0jkXLU6I+u+Xo5aAeS4RazfcQ/YFCwokxsW64
	KtclivLVwIzYV3qoOF+22xFixwLc9wU1DEnQyopq7nxAP+FCtx5Z4cjYAQ15M19gpJv9we
	5W6x/mhcaliPJA3LnXzpvBT/cXdtEBK8+oq9fEISa1x5P45bRUMBFVSc4BFp1s9ob+o2xV
	LU7x87JCskJJDvbboB/slcPeC7YFccZk03yEUvDfB4QfYl4rBg6SbctpPN65Xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
Subject: Re: [PATCH v10 0/3] mtd: spi-nand: Add support for randomizer
 feature
Message-Id: <177987281081.3978880.9593755261770176193.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:06:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020658_663805_3FDF6ECD 
X-CRM114-Status: GOOD (  11.13  )
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

T24gVHVlLCAwNSBNYXkgMjAyNiAwOTozNDo1MCArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6
Cj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiAKPiBU
aGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHJhbmRvbWl6ZXIgc3VwcG9ydCBmb3IgU1BJIE5B
TkQgZGV2aWNlcy4KPiAKPiAtIFBhdGNoIDE6IGFkZCB0aGUgbmFuZC1yYW5kb21pemVyIHByb3Bl
cnR5IHRvIHRoZSBnZW5lcmljIG5hbmQtY2hpcC55YW1sCj4gICAgICAgICAgICBiaW5kaW5ncy4g
SW5zdGVhZCBvZiB1c2luZyBib29sZWFuIHByb3BlcnRpZXMsIGl0IGludHJvZHVjZXMgYQo+ICAg
ICAgICAgICAgdWludDMyIGVudW0gKDAgb3IgMSkuIElmIHRoZSBwcm9wZXJ0eSBpcyBvbWl0dGVk
LCB0aGUgZHJpdmVyCj4gICAgICAgICAgICB3aWxsIG5vdCBpbnRlcmZlcmUgYW5kIHdpbGwgbGVh
dmUgdGhlIHJhbmRvbWl6ZXIgaW4gaXRzIGN1cnJlbnQKPiAgICAgICAgICAgIHN0YXRlLgo+IC0g
UGF0Y2ggMjogYWRkIHRoZSBpbml0aWFsaXphdGlvbiBsb2dpYyBhbmQgdGhlIHNldF9yYW5kb21p
emVyIGNhbGxiYWNrCj4gICAgICAgICAgICB0byB0aGUgY29yZSBmcmFtZXdvcmsuIFRoZSBjb3Jl
IHdpbGwgbm93IHBhcnNlIHRoZSBkZXZpY2UgdHJlZQo+ICAgICAgICAgICAgcHJvcGVydGllcyBh
bmQgZW5hYmxlIG9yIGRpc2FibGUgdGhlIHJhbmRvbWl6ZXIgYWNjb3JkaW5nbHkKPiAgICAgICAg
ICAgIGR1cmluZyBzcGluYW5kX2luaXQuCj4gLSBQYXRjaCAzOiBpbXBsZW1lbnQgdGhlIHNldF9y
YW5kb21pemVyIGNhbGxiYWNrIHNwZWNpZmljYWxseSBmb3IgTWFjcm9uaXgKPiAgICAgICAgICAg
IGNoaXBzIChNWDM1TEYvVUYgc2VyaWVzKSB0byBoYW5kbGUgdGhlIHZlbmRvci1zcGVjaWZpYyBy
ZWdpc3Rlcgo+ICAgICAgICAgICAgb3BlcmF0aW9ucy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBu
YW5kL25leHQsIHRoYW5rcyEKClsxLzNdIGR0LWJpbmRpbmdzOiBtdGQ6IG5hbmQ6IEFkZCBuYW5k
LXJhbmRvbWl6ZXIgcHJvcGVydHkKICAgICAgY29tbWl0OiBjZjQ5NmViZjEzODBiZGU3MDBjNWQx
NzkwYzMxOTE5ZWVhMmY0ODUxClsyLzNdIG10ZDogc3BpLW5hbmQ6IEFkZCBzdXBwb3J0IGZvciBy
YW5kb21pemVyCiAgICAgIGNvbW1pdDogODc0YWE4ZTRiODMwN2NkOTIyOTc5YzIwZGM3OGRmMjZj
MDVmM2MyOApbMy8zXSBtdGQ6IHNwaS1uYW5kOiBtYWNyb25peDogRW5hYmxlIHJhbmRvbWl6ZXIg
c3VwcG9ydAogICAgICBjb21taXQ6IDQ3NGVmNmM1MTk2YTJkOTIzYzc1Y2IzMThhYTgzYmE3OTBi
ZDM4MWYKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
