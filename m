Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3906DCCF9EA
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdlfsaks/YNBRRNucJ0B+NLVZeaPneTRD/xTKYk4jRY=; b=DIiRaG0iy1bkdX
	xHTmOQNlXzN5lgEwH6qWOJKyxP5Unkdvi8i4A7zvXfTWwEAgHaP2NmWjV/UDbBPY2/5rycpWno1jG
	W5a3NyI9rZS2Uns5g3MYKRKewPsXb1OxjuiT8WVQ/GRotYqAKFqhY7He41aCiS1yxWs3PPFWxNUvQ
	ouPHjAlCgQeV61rPd8hLM7LBBbZZs0TGdmEsk/jlyWHhbGAW6qK7U2OLtS545qbwbQduS7qJ8smz5
	443YTB2T+HCiMVvLIg48x/TZlVmE5yKOVZ8og62utral65GNwS9kgyPi6QM0Iv3127ciaXJZg9cnS
	9C39+LcXOdwi7iqLMpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVoM-0000000EsdI-2Ck3;
	Mon, 27 Oct 2025 22:35:34 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVoJ-0000000EscW-0nPx
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 22:35:32 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwSy3710gz9tLj;
	Mon, 27 Oct 2025 23:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761604524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GaGZVblvCm/OcLSaKGf5lp7BDqmDx1e43b0GhqkmEM=;
	b=hnalsCzzPvwCIr4fjo2MOUMgZpF5nOKDiFG8PQgHHTMSH+4RldyVYMT2in+7CGRBbLl9uE
	OwLpHI09ef3CiZntjFGe0ygTiQkoGa61X77fUwyXxdH3IOECodCxTR9Y+0aaDKr+tfm7Lt
	oM0UvuQq7XhvWFuI0Zu4WFFCAYyadUlqIzMp0lqVIU2kAG87o4GQTJj1VK90/oY3WGGcGb
	6pWJhMVxuBQIgUISngusghaljHByUeLyIk8W3adSQ1OQmMRD2L99ggy+VdNP4wd1Yunfc2
	uJdKgN9p8tMLNYxlmdfjaIizauByjBT9pp3d11XyLu8zb0gWVaB74Hbe9cdEaA==
Message-ID: <347d6f05-d590-492f-b373-672f9c057f3d@mailbox.org>
Date: Mon, 27 Oct 2025 23:35:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
 <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
X-MBO-RS-ID: ac05771e1f633d13e89
X-MBO-RS-META: powe4k17sy84ombz649hudc68wdg61p4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_153531_396426_385032F7 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/22/25 12:13 PM, Takahiro Kuwano wrote:
> Hi Tudor and Marek,

Hello Kuwano-san,

I apologize for my delayed reply.

> I have submitted new series.
> https://lore.kernel.org/linux-mtd/20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com/T/#m2fa41b89e36d6061df9e979f49c573e46fd0d5c4
> 
> Please review and test then give feedback.

With the patchset applied, the readback looks as follows and the map ID 
seems correct now:

spi-nor spi0.0: i = 0, buf = 00, map_id = 00
spi-nor spi0.0: i = 2, buf = 02, map_id = 00
spi-nor spi0.0: i = 4, buf = 00, map_id = 00
spi_nor_get_map_in_use[800] map_id=00000001

Thank you for your help !

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
