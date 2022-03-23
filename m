Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC667C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqA85ZRIVtMtFyXpxruKWO/muCcwuVcI5I2a3KkCr6A=; b=N0WLFMzIh6d0wn
	6w2BfWtAkBe9yOf0sfaV+BJEvFEjAmK5D7ebCNKfMImGg6Hcx0fwE1+qCRt3oLZo7s/DhC4Koize6
	ukk9Vptm88Jvq2hpAXMHOsIhI3K9nKwNIyGKaKiP2GbFi1AvuvHuv+0hn31QCaV5LpgG8Eq+tpV9C
	odhr2WfEiVkLVxAEE6lt/tPPikvx4izzAiEcpmiZkEXNEeeHKqJLmFtDHFhKFZ4crn9eYSUek+8/g
	mKun6Xyv2OudbEVK8sN9D+RLX3djArKUYrTA1I5YhcRMxgGNnDmeMrEsmhWsLyy6mMTVyeCw6sHX3
	HL5K0wfk38u5/NbUyUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX3Dc-00EA4l-EG; Wed, 23 Mar 2022 15:48:16 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX3DS-00EA2I-AX
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 15:48:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47DD920005;
 Wed, 23 Mar 2022 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648050483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iid4LXrbqTVQGItKFmOr4ZpNsvJYwaMLwdHtcqfoKBY=;
 b=iRPCNWB31mCdh5cGYPlxE/BMcgaKGl1+AOKC7DT0eN5i+l+oqd/t+uwcrnw7dQrbnbCbUv
 /En1s/FZBESYweDiSmmUd0+nXk8VI5rwRb16WYlTY0+65f0Sj3auEI1ZHIFUFILB392RUJ
 MMmc6OBDhmiqXZbRS3rKM0iQPP+lSJozj22b+IVdo9d+3QoBbShFIHNcBqE42dWqkyJw52
 H3G8zVdDXB7vhnHLtOT7Etjar9lIAZ+g0nAOuvwPwJHpa429wBwmw7iAwlGBsR5SKIqW56
 h6mKb1aqehDCs0cwJRgmMJidGNCfh/IeObMSVsV0hOopQYfWdEK00eS6xY1Acw==
Date: Wed, 23 Mar 2022 16:48:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, MTD Maling List
 <linux-mtd@lists.infradead.org>, BCM Kernel Feedback
 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Subject: Re: ECC errors after UBI writes with brcmnand (Northstar with v6.1
 controller)
Message-ID: <20220323164800.508c6b0f@xps13>
In-Reply-To: <2dd15b13-8861-c5b7-b601-890635377c91@gmail.com>
References: <d8a2fc04-b05a-bec9-cd56-ef7d73d904a9@gmail.com>
 <e3bc0832-efef-9e92-3b17-df8cc731b533@gmail.com>
 <2dd15b13-8861-c5b7-b601-890635377c91@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_084806_703891_D461669C 
X-CRM114-Status: GOOD (  10.99  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDIzIE1hciAyMDIyIDE2
OjMzOjQ4ICswMTAwOgoKPiBPbiAyMi4wMy4yMDIyIDE4OjUzLCBSYWZhxYIgTWnFgmVja2kgd3Jv
dGU6Cj4gPiBPbiAxOC4wMy4yMDIyIDE5OjAyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6ICAKPiA+
PiBNeSBwcm9ibGVtIGlzIHRoYXQgdWJpZnMgY29tcGxhaW5zIGFib3V0IEVDQyBlcnJvcnMuIEkg
c3BlbnQgc29tZSB0aW1lCj4gPj4gZGVidWdnaW5nIGl0IGFuZCBpdCBzZWVtcyB0aGF0Ogo+ID4+
IDEuIEluaXRpYWxseSBhbGwgYmxvY2tzIHdyaXR0ZW4gYnkgYm9vdGxvYWRlciBjYW4gYmUgcmVh
ZCBmaW5lCj4gPj4gMi4gRmV3IGJsb2NrcyB3cml0dGVuIGJ5IHViaWZzIC0+IHViaSAtPiBicmNt
bmFuZCBjYW4ndCBiZSByZWFkIGJhY2sKCkRvIHlvdSB3cml0ZSBhbmQgcmVhZCB3aXRoIFUtYm9v
dCBvciBMaW51eCBvbmx5ID8gVGhlcmUgaXMgZWl0aGVyIGEKcmVncmVzc2lvbiAobWF5YmUgbG9v
ayBhdCB0aGUgZGlmZmVyZW50IGNvbW1pdHMgb24gdGhpcyBkcml2ZXIgc2luY2UKbGFzdCB2ZXJz
aW9uIGl0IHdvcmtlZD8pIG9yIGlmIHlvdSBVLWJvb3QgdG8gd3JpdGUgYW5kIExpbnV4IHRvIHJl
YWQKbWF5YmUgdGhlcmUgaXMgYW4gRUNDIG1pc21hdGNoIGJlY2F1c2Ugb2YgYSBjb3JlIHJlZ3Jl
c3Npb24gd2hlbgpwYXJzaW5nIHRoZSBEVCwgb3IgYSBkaWZmZXJlbmNlIG9mIGNvbmZpZ3VyYXRp
b24uCgpBIGZldyBpZGVhcy4uLiBCdXQgdGhlcmUgaXMgbm90aGluZyBvYnZpb3VzLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
