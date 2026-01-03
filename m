Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A76C2A061
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jan 2026 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3rlxEvnlnspct/+DBIThG/ik8o45PESx2yocPJ2PdlU=; b=C8nb2oDlYCaJYObvZ3CJEqkjX8
	eO4LZuHpM6Htnv3BE98nWO2aCkJbg1OSoU5+1EYW3jD+JVBuCDMN/sCFViwNSFrLqvUM6+YGGNRI6
	JBwW12UV6nI6whEw132+AKcXPWrITnGY/6krxtcoybN93Y/BJjIcMxg3ETBpp8Lka3gW8NGa/3rtx
	YzsDbB6F86+lnWphk1JluYwoWks4Hxn4tjGQv56QmDoOLTgqjje9AFHIoSHVpf8QsfGbSYTwkyKnF
	eDcvVJGg98LXjFxCrBS5cgEYq+kQ3Tnq6+3cyFpPJQH1CurLFk12SFbaCtONSX8/FG9IYInXGnIvH
	TTZ1iCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcB48-00000009trr-1DRS;
	Sat, 03 Jan 2026 23:29:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcB44-00000009trP-1Pw5
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jan 2026 23:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AA3F4406D;
	Sat,  3 Jan 2026 23:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E30FC4AF0B;
	Sat,  3 Jan 2026 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767482981;
	bh=yrlIZZmC5Lkf636QMdCK3gAWLqc/QTEizMpkoKTohjo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=E9U15b9RxY6HTYs6wpRuWwsmCm4OU8ivllYcEyE2knOFNPiBusMUjUKDpZz6g2cs2
	 60/u4xJvoMD9fO1XPikWOC6Td8bT8qpS0ZnDjvM9XoFfnIWQu3aPZNLVfZCv3JSu7v
	 vNmBkg55lYvymbtUXxIg0vVaKerIC5AMKQ8ZyjRNcVYtGot3A72L1sMdczTc8gSrt7
	 5YNfVDOH6fQV3uiSZbN1lkLXo7u67gTGl4i8kF81pfNJnbk5EUc3CH+sFc1nrlq403
	 SwXAJdbQewUUPyaNeJIRp77912vc+uRumzuKe6nSZqGTgNUg+XBWVRtsEEyQa04zTj
	 xodVamwZZpnZw==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id B831BF40069;
	Sat,  3 Jan 2026 18:29:39 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-12.internal (MEProxy); Sat, 03 Jan 2026 18:29:39 -0500
X-ME-Sender: <xms:Y6ZZaeesRuDLLoCJ67QcNN-RasOsGOFeJ3Vhg79_u5ZPi7alvY7DWw>
    <xme:Y6ZZaTD88Y8d0pPH5o6dmhda915lkc3vzwY9TN8u_FPx3kHgpdw0x0u1lvM_PqwOV
    1KioqlqL2qgwL-M1VaT7eBaRzewVdr6DoQNNA-jCFUgE_VRkTrELzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfrrhgrthih
    uhhshhcujggruggrvhdfuceophhrrghthihushhhsehkvghrnhgvlhdrohhrgheqnecugg
    ftrfgrthhtvghrnheptdelledvjedtieduhfdtveefueejhffgteelieefffelveettdeg
    veekhefhledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgvodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddugeejfedujedt
    tdekqdeftddvleekfeeitddqphhrrghthihushhhpeepkhgvrhhnvghlrdhorhhgseihrg
    gurghvphhrrghthihushhhrdgtohhmpdhnsggprhgtphhtthhopedvvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtth
    hopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohep
    sggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtg
    homhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhr
    tghpthhtohepphgruhhlsegtrhgrphhouhhilhhlohhurdhnvghtpdhrtghpthhtoheptg
    homhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehh
    rghrvhgvhihhuhhnthhnvgiguhhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitg
    hkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthho
    pehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:Y6ZZaQ7mQXPQkcM4NvdmDqFOL812AD7VtG0uOOwUNuaOKuldo7cKrA>
    <xmx:Y6ZZadcuuUbRXaECpqepJDIaKplrZbJZa4BxI7qZ0jPeNJOZS4zSTw>
    <xmx:Y6ZZafe3HOucT5EYIwZCRjzwdVLXkIFe_j6Eoe9LeTskBgOVbqUp6A>
    <xmx:Y6ZZaaExh7RtaodQZNUCVajs76K9DnvNnhTpsnGk-iPIQVV9lr1H6Q>
    <xmx:Y6ZZaWHYvgqSjc0X8gGrH6Fx_Kfz73xdC9aa3PF1PZU_GL1Y392Hn-Qm>
Feedback-ID: id4c94969:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8F3E63020061; Sat,  3 Jan 2026 18:29:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A8SErWKoyjPZ
Date: Sun, 04 Jan 2026 00:28:48 +0100
From: "Pratyush Yadav" <pratyush@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Brian Norris" <computersforpeace@gmail.com>,
 "Kamal Dasu" <kamal.dasu@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Harvey Hunt" <harveyhuntnexus@gmail.com>,
 "Paul Cercueil" <paul@crapouillou.net>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Stefan Agner" <stefan@agner.ch>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Michael Walle" <mwalle@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <230bd4a1-7ccf-479e-acbb-8eb8440ec0e1@app.fastmail.com>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child
 loop
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_152944_425383_0549B21D 
X-CRM114-Status: GOOD (  15.46  )
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

(writing from my phone so please excuse the formatting)

On Sat, Jan 3, 2026, at 1:38 PM, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>> 
>> Thanks for the cleanup.
>> 
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>> 
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>> 
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
>
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.
>
> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.

Dunno. It's the first time I'm seeing these. So this was my first reaction. I think the patch would read nicer if you explain why the new variant is better even if it is widely used.

Anyway, I don't want to waste either of our energy arguing this, so if you don't want to add the one liner, that's fine by me too.

>> 
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
