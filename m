Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DC1C83F26
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jul 2025 03:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3vuygEFqCoh9Jj1u9ZIYRnRXNfP20DEXJsVDkR808w=; b=MW3Yv3S8QF0/ev
	VyjqoN2M5f9ITTk3o952/0kL6EPaXBXYNNbZhIdDSoAJ8PhTSkfflu4A7y4oVP9CDtjCZqMS8CZ8G
	hlDyZx23nGGgUq1TrcC+utZdi1BVQ9Rn1qU+n8TDhHx/d5L+RA+weyBaTJICrCK9QHbRVFlbDEhNW
	wj41a/nUuMkrmLcJK8fWCgjF1rs59MsaRIq8F6yC1wdt/KV8p7n87G+0rbUnoFLhrC94uxlO0W+V5
	cm3CzamjBmyRvQDd+LF1or6R/ca6+r/9SDPp7ra36uDEZsoLeRXT9OFVmBeDXdDuNNZhRHBzBeW92
	iPawTVOpVvU7ooUu7dKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbPh-0000000FriI-1uXP;
	Tue, 29 Jul 2025 03:54:05 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbNp-0000000Frdg-2M74
	for linux-mtd@lists.infradead.org;
	Tue, 29 Jul 2025 03:52:11 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4brhHK40CNz9tYZ;
	Tue, 29 Jul 2025 05:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753761117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/mrZr0k1CH1wBQQfdXAImWXil90dxRbLtJqXjKs7gYI=;
	b=rzGUbzf1QNkYSJ+O4AXWqnJoWe1NR7WsIsgvkSGDKBDjZdp5NNId59nAGx4LYudZxAGHvu
	VNvNUg+JH5jrGUFHDPaRLCVKCM3TLYMY3/FKkiAP6AZWlHWfsdZvKJRwLDakr1lI2vP+H9
	nZy3pI5XAWLrd2ITilDowrcsMkuR1v4ggSZQQkRWuRkTs7aeqcGsiX6c2gaDpuPj5QjWEi
	m+XD7FigCaIGUkhxH/CZ0jIKoJqGK5rCWFrjS6LQGN/H6bSOEnz5iy2qEKesb2J9PbOIYD
	Y1AubsLwLpK3p7mI1Gh0hvsDTpojC6DGziC6S4CgO0wzn2YC4I//vKtomMgQBA==
Message-ID: <d592e97a-fad2-4269-b854-d3e82d985035@mailbox.org>
Date: Tue, 29 Jul 2025 05:51:55 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
 <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
 <0d0cd3cb-61e5-4ec6-958b-ec48b82429bf@mailbox.org>
 <DBNH88949QTH.3I3MSOA019UJL@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DBNH88949QTH.3I3MSOA019UJL@kernel.org>
X-MBO-RS-META: k9gc1ikgent8pos756noof5a6xn5qegr
X-MBO-RS-ID: 9cb17900f721a6b5267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_205209_821537_FFCDC887 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/28/25 8:32 AM, Michael Walle wrote:
>>>> I have limited supply of these devices, so OTP is untested. The flash
>>>> does have OTP registers, that's why the .otp entry is there. Why should
>>>> I remove it if the OTP registers are in the chip ?
>>>
>>> We only add tested features. I'm just the messenger here :o. Anyway,
>>> OTP is not really one-time-programmable here, you can write and
>>> erase it again as long as you don't lock it, if that was your
>>> concern.
>>
>> So how do I test the OTP without locking it ?
> 
> flash_otp_{write,info,dump,erase}, just don't use flash_otp_lock.

Thanks. flash_otp_dump -u /dev/mtd0 returns zeroes, so I suspect the OTP 
is not working. The chip does work even without this entry and the 
content /sys/kernel/debug/spi-nor/spi0.0/capabilities and 
/sys/kernel/debug/spi-nor/spi0.0/params did not change, so I think the 
best way forward is to drop this patch, until I can figure out the OTP 
on this chip ?

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
