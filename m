Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD49C04FF0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCQQUL8L1elw4jS+Ay+rjRzLFWxWzRteRAEa/n9+UQ8=; b=uOLNg8LzlrUYqa
	L5K+YX8uZwteCdECIJ40AsDWmCMauADBNWs1j8FlwMukg00mdYKd8TOpVJ1C5AAox/dj54JdWNiv0
	E/D8bYctxfXOoYB6bXXF12xm7w2APfpWQnOVKkR5C1h5NMfbKBR2mPVMj+gjrrNdj8SqyXB8XIYJz
	aMYusw4WbXPss+rsmHFDK86hXpELmRG8jVj7Oe/Y88ximtr7/f3ukTU8ZKGMfUQb7h4vyy1flzWoE
	gvfaWesQksxUdJRE04agQh00AIo1JDSCwaXZixLhrrqIFO5CuCFOtIZDBgRKDdXsgW7CWAx3bCbXr
	IP06ZJ4N19BqqVJKNRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxX9-0000000D95U-3FmS;
	Thu, 11 Apr 2024 16:44:19 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxX6-0000000D91a-0JN3
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 16:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1712853812; x=1713458612; i=markus.elfring@web.de;
	bh=8mOIOrcpTE4F/7rNflGHUTplie+JZBjQPhk37lNYj1A=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=IpSGw3Va7lx9pZL0ic2y1E7w+dmHgwke/sRDAjqIHKHipidXyrRQTLcmcheUQpYL
	 aoAne8U+37ScE60uEhhUbJHbxDZyaL+KtSVUwsKEfxKGBT/UXnpYp6wfPCjQrqDN0
	 bR6DFJoVeaZYUz8HGvA1+n9WLwvso7PWJbP4gz2qoAHFaC6DTMUmm1QxNR7lDQBu2
	 GVKV8RYdj1jUdRLnWrJgRuj5o9fKOaWYZHaUJP8MEt/exWKlPOWDOoxZ8G55mYZ4t
	 QezDv2+hm/sGqiHNOU3kAB+DXF9TU/ty1GGwuReOR6yLcltFn/bTna+5zsSlxoTNo
	 /gMLgjMX2YIYv9+Rjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myf3v-1sgjU11LIr-00z0sJ; Thu, 11
 Apr 2024 18:43:32 +0200
Message-ID: <3eef0167-5dd3-443d-80aa-f450a75550df@web.de>
Date: Thu, 11 Apr 2024 18:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Ben Hutchings <ben.hutchings@mind.be>,
 Daniel Golle <daniel@makrotopia.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240411031903.3050278-3-chengzhihao1@huawei.com>
Subject: Re: [PATCH v2 2/4] ubi: ubi_init: Fix missed ubiblock cleanup in
 error handling path
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240411031903.3050278-3-chengzhihao1@huawei.com>
X-Provags-ID: V03:K1:QlmEVZ2NncpGVwcZQl4z4ehY4fK4uOZghUxiEaN4yE5ZajFSLMT
 lnPZqsnzskvgbHrAgIffyBbmnTlbmMV0ZIqjiJ9VpsOCMhbdDhl4S8vX+sUl4OxH+6pNGFp
 pDuyguo5udjibqch/aOKbqifAsf/RLcYvnsGe8cFWkiFk3zKaV9PjYA844bekR0WCLl/lCA
 tmSVYf/QAvoWcZ2woJpjg==
UI-OutboundReport: notjunk:1;M01:P0:/pmq13PeoG4=;UUwsLfyMu2kkGJeeT9w86o5neLa
 ejn0s48ReSKJwzAs2HSb34/gFO1zh9g2sjYB9Zi6zdN6ic/OZOXfM5OLnZdjmXlECpta/xT48
 XAwF6SfNxyfrlQI/Lx33fmBtqVhgLnLoY1f28T21E1SFJj1hvl7VE0C1ATkpM5isXuUMEXnS8
 xd4G6nEYJ1oH5LALtbHzvflF5jUPafO9GUgOMDCOl+20hLPN/CqfkyiLIPQngp/e8z3DkL8up
 eH4OM5kghxQpbp1XuY1YFuYboNyR4XbMWub954BnDAQx+wjglt8h/ulQoxqKKkoKBumikaNLz
 hTwMlmKMHkbWdOTEJ2qiDL0TvQWaOrO7586kHPGm4dkaYjbnbS+OOo0aMiKA5ukU54u1v2u17
 PsRMi/JE6Vz+lVtPIopCKX+4+CfCvGulUHeVWp/vHEtUJSRdwUatecwTvDsRDjF1KGJclHWak
 qeL/EqN9XvGRm1RMSFTorbJb7bxWwZmWknT/qwptX2PU78PapiEQlFImp+SsUT/IX+yPw1HiV
 vYocOjFFI4hI5n3llsK5sQDHHzs7cmgzMKpoJf+A9gMXrLWyoy9+DPc/6Fr4Alh049pZ8cigc
 gkSShubCVlHYUDKGT1EPbTgzjSMxMdqCm1DA06wySezfoUO/hZYdq8ytjzCZSY+xV3Ig5+5fV
 VOOdGbsnBwucpsQjvu7dB3/Rwchi9Wwm6T2YU2xcOamQbNQmZP/aah5IwUtQHnGmi3riMG/E2
 wz86451CS/TidNalmiWovqK9C303Oo3+Rp8SkOdW7fGOXUyBHBDgiXtoff/5oQ/KtCnRCv9nx
 1wyv/hZ3tdIdYV3KXxgNgBNQfp1I+icL6M1oDCHA9TWIc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_094416_556160_AA76DCC0 
X-CRM114-Status: UNSURE (   4.14  )
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

4oCmCj4gU2luY2UgdWJpYmxvY2tfaW5pdCgpIHJlZ2lzdGVycyBub3RpZmllciBhbmQgaW52b2tl
cyBub3RpZmljYXRpb24KPiBmdW5jdGlvbnMsIHNvIHdlIGNhbiBtb3ZlIGl0IGFmdGVyIHViaV9p
bml0X2F0dGFjaCgpIHRvIGZpeCB0aGUgcHJvYmxlbS4KCkkgZmluZCB0aGlzIGNoYW5nZSBkZXNj
cmlwdGlvbiBpbXByb3ZhYmxlLgpXb3VsZCBhbiBpbXBlcmF0aXZlIHdvcmRpbmcgYmUgYWxzbyBt
b3JlIGRlc2lyYWJsZSBoZXJlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
