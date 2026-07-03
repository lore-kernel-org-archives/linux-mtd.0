Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA67C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yhw73PwtwjfW0whVBgNH/lusW1yWyIc+mymFHM/SdTA=; b=E6WFd0yyAikwh3AIbYquayj3te
	G0kVNtermxf/sdmjCv5TWIvYDJnnQcK5+HrXZs/x6JelAnwNA+eHz2kXhrTuUxdr9QUrz/3e4xGzx
	7F4/PtP6RE61YlUY4sd8NKf75OgSZL7nVh0zI5OPA5XgJNL34xYFcEb19b6GRB3gFKVBneTS1TyUP
	HSNm+O0uaAm2L5p5Kran0VDJAa75FMKmSSUtDNEREGwRd729XIOOoGYlQ8wVaZdGO62MLahkPCIEu
	dGxLTFeqR1q1NL/4eLXAeoqxAlRgHFbWbqP+OhFajzM2617WM5ut3Rfy9x0fR6NebbHLHJbWB/PW9
	xEC7BELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcFA-00000006p5f-0AN3;
	Fri, 03 Jul 2026 11:39:40 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcF6-00000006p4j-1dZu
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 11:39:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 516501D000D8;
	Fri,  3 Jul 2026 07:39:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 03 Jul 2026 07:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783078773;
	 x=1783165173; bh=E0DUuVBe706Y0g0OP2l7n9pogSykeei7BnhKPzmbPGk=; b=
	eXSb42ZTvuUf1tp0olMbxF9i7XQUElDr41ppZnliAGgpyyn3LLWicBFAHDOe+SI8
	wETror884risZZqCppeqr6Iw/afXWLtTi5TqIuKIwY1NRrtPhwi82mh6dasfBFbl
	jKAImYGXr/9yyCG03TO2puoE26NLy3ACqD4RX41Wy8yGONZ+Li8kQi+FnU1n4Onu
	0hIbto+YfqdHQdXuOlJPojcpolT241XC2Z6yerEofTqPfu43gvpjbQLD7rZCVboh
	J5IXQ8/Fb3M2HBuDcfwf6nsHqtrv/DPNLoYce0zOUgBh480D+AUa2p/CzQchum6L
	tmvSs4JkeeM/z9mEL0dXmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783078773; x=
	1783165173; bh=E0DUuVBe706Y0g0OP2l7n9pogSykeei7BnhKPzmbPGk=; b=Z
	sui55ezBi8ahCVNnQZJwUdJ+ZTie+M5Nz6K23c6Uqs3t3VhJpVIznFbitteIsYGP
	HENhEUhsyVcEnWaPmOd/6C53NYK5ZdgQh+yWQmYVra8sqWLQCKkEx1KE8MDvyfJu
	H6OOdQPmm+TMCx5MTcoaP+ThlGlzzrIZeqVJK5LQotRMh2hFKrBQH2jX0KNQtRwX
	kXu/d3/+zrBRE07v54BH6i//k3iSF3eZ1xF6AOYS/ioXwN865OQayagn3fvGS0qT
	op6uI2dx7zlTybqZ7C/ESHk1djykov4Q3WRNechUmCSsi8Ycof7Ahvmjp4TvFnYp
	SdP/ZD61lPVympKbUMS4g==
X-ME-Sender: <xms:cp9HaqmCqQUi9QCBl4Wv3wWlUOy_y5ZHzFBIZnrF00gUbCfg9cgEdA>
    <xme:cp9HaspL65GNIaZRf04yRavtm49JuBN7p-iliBaBPh-WK36U__hxhQo1g5C5oLaXa
    kOvQGmBanhIA3cmcdbSW8eAtiOS1Jiv6Q_AyhdVAWMKZ_FObNr93g>
X-ME-Proxy-Cause: dmFkZTFE3P5996lWf29oNJB+TDEEv3GwUoSUvht5WquyZrpG3f1YCGHJ4pq8IWBsiKxf7j
    HWZjmlfyPrgEMqF90Ynk89A0Jt9cy/2FKpOwnf4eq5DLlOKt+ti+kDBWRLZwUOdHbYD6kh
    dKBGfm1fmOJoF3v8iOrhzIFO3tMMo6BQl4lNIR8FGwywxQ1rVTYbCykPhm6E3LuydMYE3g
    3Zl5h6sZCPxJqqd4vUMKSoftfTmQnnfLnb6Ipm911jHT7sfeAgabsA5u30m/nJONGIUBGf
    yw6LNhqqWUOyPBeF6LKSeoIcGPKIfq+onh6t+w0QkW6zffHc8Gg4VQ0qw1SC/OPUaKR6t9
    LnvOVRLkE9ZLjXL9sN/KvYv6i11l4DPwHHSZt9ekTZZw4D93lkgj3onaG5zp1IfhENdoKC
    5TYPcLxGisdVbVVNKGwEtj1S+6bal4z5skv9YVJOj0EDlqbwU01yIzF6eQGBXdzLLLdSJT
    Wbl9nlnb2AwvWOiDeUKQZVWhZQi0qk7+y5M7iqKAsSgScaAQiclnUosPc4Ji5V0uNVmsKw
    iv5qEEn8mf6AZHRKJ/Qr8C5hcLUNIPOA1SGtX8U8nNZIJhEkK4FPJMIROTBINF2Nz7hPqa
    w4qvVMI0rCA6ApFXDl409idflR106R4XgEEkZtxAGh0CQtBMuDoOj3knj72w
X-ME-Proxy: <xmx:c59HaigBV8LYxziXcfJCGowhlRJFZDhUJZZ2evPOO-sVfBfislqsYA>
    <xmx:c59HapbsX_3ge3p11imjg9jO3bDrsfllL5M5Xg2anyypnWv6VAbrLw>
    <xmx:c59HamWhnrujTU-31QzRFN5F0iPn3prgQ6-Kqz9cMLU2Ls_t0KxNUA>
    <xmx:c59HapEVFSxzrx661tf5bLHl-O7tqohr8Cecw3kCsLBssI5gAnv_JA>
    <xmx:dZ9Hau7p2fONJaFx1aF4Jg10u1mODPCghghczJeJsDGKf1FBhiayClt7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E4F48182007E; Fri,  3 Jul 2026 07:39:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASdx1_WPg8_k
Date: Fri, 03 Jul 2026 13:39:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Greg Ungerer" <gregungerer@westnet.com.au>,
 "Arnd Bergmann" <arnd@kernel.org>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Message-Id: <51944741-dbd3-4d4a-aeef-e2de2ff942f7@app.fastmail.com>
In-Reply-To: <871pdknw1c.fsf@bootlin.com>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
 <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
 <871pdknw1c.fsf@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_043936_828190_948F62E1 
X-CRM114-Status: UNSURE (   7.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 3, 2026, at 13:37, Miquel Raynal wrote:
> Hello,
>
>>> Can we get this reverted?
>>
>> Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
>> can you just apply one with Greg's explanation and my Ack?
>>
>>      Arnd
>
> Just sent a revert, I hope I got it all right.
>
> Link: 
> https://lore.kernel.org/linux-mtd/20260703-perso-revert-uclinux-map-v1-1-2b7d46f20465@bootlin.com/T/#u

Looks good to me, thanks!

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
