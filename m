Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BEAC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW+4XIehsfawEawhbD6ZE/Z04Ukx1GB2jdlWvEJSsr4=; b=1TaHPYNgVw8ohT
	bHHf1QE2Bvb+g1r/+/S0IeWcC90fLumNp3q/Pmmf5R3Apfod4hZJ8p5dBKB76MJC27/yCaYF5N2kO
	R2QX+3Boik8yDD9gu77mmdWmtWDiurUyKYszX4LN5aNJVJNDzlR0r8LCFhF028nEq/6w0EWYDsS6Z
	XPdiZBG1DuorKghDBqgerEoy4Xu3zRlWupLIdbORI5+csKEzHrEVOCRhokkLTreI2NVeJKs6gak5v
	7j/NJC69sqNvUaCxCIGYxOKt0uk2JcyBCz7AHgqTZYwKq9TTakPI/3PffleUj+ZtzhYBjUm2ygiqx
	5J5jPgotiUZClvIboPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Qv5-00ACEB-0T;
	Tue, 23 May 2023 12:15:15 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Qv2-00ACBL-0D
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 12:15:13 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 19DE95C0067;
	Tue, 23 May 2023 08:15:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 23 May 2023 08:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684844106; x=1684930506; bh=kA
	Ht+x8T70GQYnDSilrxwAJfF+iMwu+ILOsuFlWX27k=; b=deLIeor9mA+9amW33f
	LaNq3Uiu0xp+FUf1hZdSkFIRcPBUtbIsfchH0AydLqLdoO2ctMhAmFaCmDnLxxB5
	EeMzSuJPZic4ghBaYZQHCFy0x7janEbDESDGPmcacHdoLNVwPrMfcLswdu6rRx3W
	Qbcjp1tPGLq9TpikHCwma6ZceEaY6n37Km2aTq0gS3AZXADrq9ERsHWQQaMth0eK
	8SJ+ggMEJRoc5ygZb3BZGxNLfZ63AVTqsSGhWmgAYNOQrC5UFBemSDyKQmZwWsCG
	35k7evKNcjNlJsGTJQwz59GArwjDYSge9a32hMOssx1eBgziy1ki+J6+HqD40lHD
	x0VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684844106; x=1684930506; bh=kAHt+x8T70GQY
	nDSilrxwAJfF+iMwu+ILOsuFlWX27k=; b=J/X0Rp5vSLHvL02D95wXQVdpyufk4
	fPZqG90TzuBX+ls/kl0eOMjQqmIm9/BcAfskIOILBZc0PjscaPOJMbjR4JmgNtl9
	qiMfKeYqJfEOA5SmHvy2DK7I8uvCqiZTZhCIK5SZR+8sg37SljFNYR3kBfULLiGY
	M/UMdDHURRcsVS4L1BT43v9BfupXZ5RdZGw5+XGlNIwpfM5LpDmGUn+IbA8cRXbs
	htB1LANzq/nTDXUQsACGnK/8q1M/btmR6PmZ6JdludD1s1S28otDREPeUYHcXC4n
	+Mpgy5sr4/9jldOgnh/Zr2cxay/eOcO/2noaQ1lW3JOVNqym740SjwemQ==
X-ME-Sender: <xms:Sa5sZLms-AerBjtHcDsFovCAxL1bnO_DEBtDWD0o_C9NZFJdm6AjtA>
    <xme:Sa5sZO3ckcCcLQ6axu3pVpQx31YJ-OUgU8ndwMp9b7CS1uyFXv2u8k_ul7WwGK1uz
    HDKhB_BuDK3dVMtj2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejfedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Sa5sZBpXdDJgpmhr-SxGBtktcWW4AN4ltXRJ5YmnBTKWRGoKk_gCwg>
    <xmx:Sa5sZDnepR50fV5yc4DEpnFI7-XV0HJVupo0wl8rMwzukkFyIqiJVg>
    <xmx:Sa5sZJ2YFplueT419rIsYwfqgpJKdJihAtq6bQb2xJfSPx3i6lTViA>
    <xmx:Sq5sZEQ7vMTV343nx7kcUSnmGN1N32jAeNmvX9WvwMMdY42q0iTTkw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 69D27B60089; Tue, 23 May 2023 08:15:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <688172c5-fedf-42bb-9fcc-5ec28e83b164@app.fastmail.com>
In-Reply-To: <20230522174635.7acfb42c@xps-13>
References: <20230417205654.1982368-1-arnd@kernel.org>
 <20230522174635.7acfb42c@xps-13>
Date: Tue, 23 May 2023 14:14:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 =?UTF-8?Q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdchar: mark bits of ioctl handler noinline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_051512_414013_FD0A4B7B 
X-CRM114-Status: UNSURE (   7.44  )
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

On Mon, May 22, 2023, at 17:46, Miquel Raynal wrote:
>
> I am about to take this as part of my next fixes PR, should we Cc:
> stable? What is the current policy wrt gcc version issues?

I think in general we do want stable kernels to work with the latest
gcc, so please add the Cc:stable annotation.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
