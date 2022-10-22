Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324B8C04A95
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4fLgOzLT82cvHMyXsJBRf0Bs5TwcAFOzOAJ4/vmtmA=; b=VygUy6ZGt9hQ5c
	7ZdRpoUYJohyLVZdIB26R5kwztLlgPwb0a5pMpnMzmq+7t5Eh2VTjmGzPOdm+SIVPyJApdWSj5S85
	ZEeGwX5kGTOjqNJ9XU1MK2aH3iz5Nyvolpv9akbKF+OkftedHGFGvX7Pt258R2s7ZxzGyepJDZL1J
	vE15yfNWtAOMx0xJBqreiI5XZGm000fYbF6RCRT7bbwbmGDI+AFNbSbS+3E0egUoWIa7FmYGf7i0M
	80c1Q8fNITmPQ1v03MlIJ5Nt0EV8Jau+tHcm7V6hV6QLUw7Qw76CsRAMK0yLu99B52qqVFJn0BNGs
	eOe8pcuGCf1oylhjKlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omKUL-00Dfv1-Uu; Sat, 22 Oct 2022 19:48:58 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omKU8-00Dfr5-QR; Sat, 22 Oct 2022 19:48:47 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6AD1458012A;
	Sat, 22 Oct 2022 15:48:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Sat, 22 Oct 2022 15:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666468121; x=1666475321; bh=UGS1Mg1RbR
	rjg7l/C4uODk6tRvKSFxQmBze4CDiRUok=; b=R769R20cvAUvCJzdLxBnDkwPBp
	EbTpyCnh90ePwkW/W271GgnujcaxKPNlKUZTD1QiMzbOX6UUmX5GBGQy5YnoG3Hz
	7bIbm4GGSebbV6RK2kBgjxCEhVjRMxNaLgKsw+7i5e4f4W2C2HsQFTmKv8S+gZdE
	jcEJHfdX99rjFuuQuzOPTEkJYLvC3gJ1f7jx+9U6cwktdP6NSfqNvxTgarEWxD1c
	GFRrikCndHmtZnFVFspin0GH0nBuno9DFl/vX1YEuWJJ1DmabcJBI+QgW+pFl13L
	PUlTUh21czWS+IFSiTNJyGJ4p7ipLzCb7UJepNPQ1EVgfsLevgq5To41FFEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666468121; x=1666475321; bh=UGS1Mg1RbRrjg7l/C4uODk6tRvKS
	FxQmBze4CDiRUok=; b=DZdlxJQ1/OPf/Y6KDYWPfdC+mu56NzIOlbXghWxjCj9D
	9CPMuzFO6wSIpYXaVVKO5ogBmtK5zrRUpai6gPg5qF7aq51p1Tf8zgVV+aEGQIpg
	Le7lvLJR+05feR3Q+7owk4RsmE3rzpsqGg/UOGa7xGgp5BzvreC3G8OxhZ0WzoTZ
	kHVkLu1P+KTSJm4dYCrODRLVTVeSHwuFqAuyI9eyO0UD5B3tL3/NipBn2AFumQvr
	+xjvFjLrJEOmbNOFedB+o0knlGPPR7li0EwNxPvDXhDL0DJhj4plmQqEZJg8uEWZ
	ljUtVQj8llXCVqwnpTmY8Mpk0y+FjFMyLlNEuZEfiA==
X-ME-Sender: <xms:GElUY9vt3ItviEp5AJXQjYcX0YyV47YTITTgtkGjjNw0aSie0vzYkg>
    <xme:GElUY2cknoJTeDpYvjbC4RFS-FtPGbyfFDbbyjNFIChdDqrc0xYFVavFYI99vu8kl
    0KtHqNspAg1e6vBhwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedttddgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GElUYwxiXoqPMILm1SZ_32__qu1Q5l_zrlV4KYN9jBrAlex9SwSKIg>
    <xmx:GElUY0PzOcbbrTlSQkCZ5j1lrS1Cnv1p6FZXhLQlA1lHQyiDXRQGng>
    <xmx:GElUY9-JQg9pRkXJG00aarf_3pC2T4jG_plPdMl-YxzKsRcEtsxZ9g>
    <xmx:GUlUYyKFp-5FR5wwM3xl6nutJeKlKU0pfMGHX_pxDvaIG8i-amMB_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 90C24B60086; Sat, 22 Oct 2022 15:48:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7c4531b8-a296-4ea3-9564-b094704d10b2@app.fastmail.com>
In-Reply-To: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date: Sat, 22 Oct 2022 21:48:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Ben Dooks" <ben-linux@fluff.org>,
 "Simtec Linux Team" <linux@simtec.co.uk>, linux-doc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_124845_333562_BC908C78 
X-CRM114-Status: GOOD (  12.76  )
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

On Sat, Oct 22, 2022, at 17:18, Krzysztof Kozlowski wrote:
> On 21/10/2022 16:22, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The s3c24xx platform was marked as deprecated a while ago,
>> and for the s3c64xx platform, we marked all except one legacy
>> board file as unused.
>> 
>> This series removes all of those, leaving only s3c64xx support
>> for DT based boots as well as the cragg6410 board file.
>> 
>> About half of the s3c specific drivers were only used on
>> the now removed machines, so these drivers can be retired
>> as well. I can either merge the driver removal patches through
>> the soc tree along with the board file patches, or subsystem
>> maintainers can pick them up into their own trees, whichever
>> they prefer.
>
> Just to be sure - do you expect me to ack the series, or rather as usual
> pick them up?

I think in this case it is easier if I pick them up with your
Ack along with the other platforms I posted, as there are
some minor conflicts between Makefile/Kconfig changes where
I remove adjacent lines.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
