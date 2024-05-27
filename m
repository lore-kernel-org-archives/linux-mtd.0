Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E00C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00stEscRwj+ahqFzGv4g1hmVCLbqpC5vW02v8HAuaUE=; b=Fxos4KHm6C8GOk
	jdrBTwCMoWjR9crRM85hpD6NTBIzhNcg0VkfbHxbIa4300ZO9unM3OOgJUIHFZ3Xn/5gRL5xf14nS
	SPHb3WFydtyIZYXMXbEfC7W+r2dwxXRVW6ktS+ke35ZMut3gk4iySvJkPMgSV400+UIIB8jUjRq7V
	A73nwscurQtBMsU05BlBPxiHmt4hInmgLystImkdNzDupzAs7Cb0sOpDZYM37JFsVLcJ7e8J9+5yG
	5tgP4KzkNn8D7RXRgTudb9YnIxUGjHJDusy4Q9sAl31lVHMicYzmlaO5aOYku4toMmfrF0GsbuxCx
	QfMf/QZ6eBU9y7B5NNAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbPq-0000000FOfX-2XgH;
	Mon, 27 May 2024 14:33:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbPo-0000000FOds-0u0p
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 14:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A9FBCE0F93;
	Mon, 27 May 2024 14:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778C7C2BBFC;
	Mon, 27 May 2024 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716820408;
	bh=S0TBfxjUtfuVEbYgXZOiLFontODzcJL+M7Q4Hl3IXRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bzAdraRGohEIH3y+D1Vl5PXrkEGVsueuZciQhCH0pHkrz1zTJoJ9c+AfE/p1ZH7Wy
	 1UVDEP11Z89Zbrj/a2XL5PDFU1PD8j0lMO64aR6Li76qX8X4WvZZEHfeK+vxixENPw
	 ROFu6qkY6rxmaZeD0fYzoBF1ccjMsMfsUaGccNTjOTe5f4q4eVhjaeB3qXDhfyYfSR
	 8ab6Us7ChKC8p4lrShwl70/46ZlhxFYaQ5tNcOTuYnnyvmLbLcxs2d+hvk12H71jTO
	 IBWtXH+SaJznQsDR/0uQBmSEmXkymZXicM56gE95nL/L0iYR42Q93aCc+KxwVuH1Pq
	 yL21heGWNLkkw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 4/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
In-Reply-To: <494daaab-a93c-44cd-a437-d306a8269251@linaro.org> (Tudor
	Ambarus's message of "Mon, 22 Apr 2024 06:59:56 +0100")
References: <20240419141249.609534-1-mwalle@kernel.org>
	<20240419141249.609534-5-mwalle@kernel.org>
	<494daaab-a93c-44cd-a437-d306a8269251@linaro.org>
Date: Mon, 27 May 2024 16:33:26 +0200
Message-ID: <mafs0ttij1g09.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_073332_508700_209159A6 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Apr 22 2024, Tudor Ambarus wrote:

> On 4/19/24 15:12, Michael Walle wrote:
>> The evervision FRAM devices are the only user of the NO_FR flag. Dro
>
> everspin is evervision?

Looks like a typo to me. Evervision seems to only create display panels.
I can do s/evervision/everspin/, both in commit message and in code when
applying.

>
>> the global flag and instead use a manufacturer fixup for the evervision
>> flashes to drop the fast read support.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
