Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CE6C44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aTFo6CD9FOyNTdOTddno9LNnX12izcoxvou0xKgBUCc=; b=WnrkQzCe+pDrpkgeMYaa4NySy2
	UjZJa529MviqDAjZVDMrIUlI6lSHKPFIFqSiwHyr0AH2/Bf2GX8VMmmIUQVpC8v4Vc52qSX6xvi4P
	LK7JBsgep+r7ENLdJA6VCpj8bQQnbo/+nFelwi52vM21G7PYbnuTFrvZeFuEpEFHcAKfapf6oAwot
	juJw5liapR1Lc+goXxlG9mPUf3hk0M4wGkHrhKtN+oNY7KRF1HdCrP0OrSXX5LUoPMCWu/TuePj8o
	Cy6vSc0U2T0h98pSSm+G2/xcx7zHpeu7CUbwkRRUvRNGSidARWKIZB3MrSb59VgxDP3b4iwR2WAY2
	qdNo+g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXTw-0000000Bxqw-3p0J;
	Wed, 22 Jul 2026 13:59:32 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXTu-0000000BxqT-0Iok
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:59:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 96F04EC00C5;
	Wed, 22 Jul 2026 09:59:28 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 09:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784728768;
	 x=1784815168; bh=ZjQqzrSpMksQWhCHTMwSsJ2dLHBzAZvZCNW0GxQaKq0=; b=
	WOOcIci4Zxc2BHxqMK+hJHLxlWVerGXBGA+mT9r0wTxvwdiFO6xqE+I3XyUSbrlw
	cajXYV/1wxaVc+CW+9zH4hM7yfpxPLb/YUHzha787Y23JTpMlAGHjZEZiK/5X1mY
	2aWK8+oc4HAx4VUAKEGZyGJVgeSlN+nBDAtfpr/gU0HhDGtSDQlemEIhKjJPVhck
	iBWDkogAczyRIj5sFs/F5e/e3dyh4TLfFNG5v9rrkY5+u7FSoiQVAZsKq4gSJ0xg
	6O6o88+wEl3v35HCYrjR87YyxtfBi9Zy9UMtnzuD3qeqV1m3yC9B9cY40MmyE32T
	a+61cc2CVN6KXfIiBvyglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784728768; x=
	1784815168; bh=ZjQqzrSpMksQWhCHTMwSsJ2dLHBzAZvZCNW0GxQaKq0=; b=e
	S+17ND9RfFQZXz4iysC1n3ho3fXssDaK4mZ6VH/Z7EhdMa2UmK+ZywSsuzJ097Yk
	rRJl4YDwdgtXBAQg6lJEufQ3Xcke1GICSIys6W14qSEI+0dwIJlKfyh6aRqq4Wlp
	QcHzkTr/hb/S/t/VB+QMsdV/7HAOn2Zs2bAeYj0jlbPcdfuRKX76zkWmCLXEzyKc
	eG/D/kmz+PH/3gf3z9pnxjNkynscm2pnDr20MAi9iuQ0oOBRG6c6gp6aWBv88xQw
	9rmSaChlPWKvgqwbf+DEXpY4h/qUvYQ7g7CKYXU+NaaFliegrsnE+Ptz6CJLEKtD
	6lmkTe5Jl7TUfNXb+32KA==
X-ME-Sender: <xms:v8xgag5i64LEwRuCUml3zCRPYvGsTpqzaao6g-dH9wmkGm8qTMJSCg>
    <xme:v8xgassnyJxpCoMwIU_sTTqkbe_RZKSl5fGpcRIwtHS-186Fo1veQAY59SPL7OcWE
    CtfoNm0m5X8NY-_c5ItsNKPC44USK8ZdE7zVeHwgajiRfoX0s8VS-U>
X-ME-Proxy-Cause: dmFkZTGUhtrtoVD2jkJmJGwt8fqeRIHpvUz2JzQzoT5s4ogssT4ztvCq+T6thZAUhYkyMe
    9UGAwMTQDh/IC6Z0cdjW0hR6BaJHIWmZXpG1N6gK/KaEMzyi+lnyRlUUtYRfbcoIXTddZA
    JKuRQhIhmn9ukrJXkdF48oPQ6+LMVUF+98AjBrWzzjQLVLHibIt5Qeb0NxZ10etlSWX05m
    tEzpqwsmh/jQ9ss1auiwRp9bmQ4RN4D+OaP/VVlCJkR+uSbLvIuXuhxrlNaPfyUVkj677m
    vs3QrkwqXLzgyL2zqocDFJKmEbkZ8DJXzCvJS9EUgukEHN6c/eA0pKjwBeg3ybFAkEpqYb
    xU+chhCxClZOc5QzF6TTDLI+TbskSuvMMzmSONCliH9IDyOxjFZU+zWTwlSVBtbUkv02TY
    TfSh5ZMJnqS6VFQXUEJR/QURdT+vJBt46egxf26v/uP/0R2S292S+mzvPd847W6bewrBI+
    1iOl9DTkb/MidMUmDnvruNJ2y32QXXPQSqEMcEdR+ZzycTdMkP7Ku+/a9QZgitpaLpZwMf
    hZD97kYrl1msntMxwNXlDulFEeV66IGyVHxMe8GSpz4nUWGDgPpVUuWWbmT8POOhheMbhO
    RTBG/zBYpMAE999wmVBZlwYgLePl6fLiMJg/aPGdP9HFc8Xik8KhoQV0iOWQ
X-ME-Proxy: <xmx:v8xgaicTK7ifpNC7Z0LiwAMkZ6YSP_uyT97SPJQQF63TiUQiaZGCwQ>
    <xmx:v8xgakZC8lkGvEQgvJC_ytDref1Yg50PsVCo87wxGVnJ2TtTjsdTlQ>
    <xmx:v8xgavHds0nf4TX3bW9-aMIRO35Ie31WYxc76lf1XNEoyhTu51_69g>
    <xmx:v8xgaqmLoPX8KDNHf60Aab9MmJ2v8tuEKxX8xI1oIzcc8F-I3fPrtQ>
    <xmx:wMxgajFtO1pLaYJY1D3uCEdHOqhKNa6Tp-cCr3IrT5qRr-Ej8SWcnv8M>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DB8E182007E; Wed, 22 Jul 2026 09:59:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOU3aoS2vECw
Date: Wed, 22 Jul 2026 15:59:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Sean Young" <sean@mess.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com>
In-Reply-To: <64f0f609-9b24-4830-b0c6-c7ec0a01028a@gmail.com>
References: <20260722001003.36598-1-julianbraha@gmail.com>
 <73b310a6-e97c-4bcc-ba82-9ed781f4bba6@app.fastmail.com>
 <64f0f609-9b24-4830-b0c6-c7ec0a01028a@gmail.com>
Subject: Re: [PATCH] mtd: maps: fix dead select of MTD_CFI_BE_BYTE_SWAP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_065930_536181_9F70E6E6 
X-CRM114-Status: GOOD (  12.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026, at 15:43, Julian Braha wrote:
> On 7/22/26 08:42, Arnd Bergmann wrote:
>> config MTD_CFI_NOSWAP
>>         depends on !ARCH_IXP4XX || CPU_BIG_ENDIAN
>>         bool "NO"
>> 
>> config MTD_CFI_BE_BYTE_SWAP
>>         bool "BIG_ENDIAN_BYTE"
>> 
>> config MTD_CFI_LE_BYTE_SWAP
>>         depends on !ARCH_IXP4XX
>>         bool "LITTLE_ENDIAN_BYTE"
>> 
>> endchoice
>
> Actually it is currently possible to have:
> MTD_PHYSMAP_IXP4XX=y
> MTD_CFI_BE_BYTE_SWAP=n
> CPU_BIG_ENDIAN=y
>
> by not satisfying the dependencies of the choice that
> MTD_CFI_BE_BYTE_SWAP is part of,
> for example, set:
> MTD_CFI_ADV_OPTIONS=n
>
> then, none of the choice options are enabled. This is the
> configuration that I had compile-tested (but cannot runtime test).

Right. In older kernels that would have run into an #error,
and I tried to express the same with Kconfig logic but clearly
failed here.

> In any case, should I send a v2 removing the select, and leave the
> rest of the little-endian ARCH_IXP4XX changes to you?

Sound good to me, if that helps you get through your list
backlog of known issues, otherwise we can just do my version
and drop yours. Hopefully Linus Walleij can give my patch
a spin on one of his machines.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
