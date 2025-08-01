Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECCDC87FCA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Aug 2025 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3DtzENj5FM87K3SVTGnM/8bymUvl4gRO1rfMu06Z7E=; b=LQEUPv4lej98dn
	qy1pjvXeQcq4bk6YVFcqjeDhny/jYvF9+bU7AvWuaKFhR28usl+yn3VQAqKJ3JWxHq921UyUTejq4
	UwfvTgpa804S1XXntEpzeP4xEWO5yXjZDi+ItpFSvcB+zS6Vj0w4C9sYk/v/HDiy+f24lBiRNQknZ
	J7hL0Qq6d3PM++4lGg63X6Kp/zZ955dVN7u3eWWZJuX+nJy9Bl+iqazwAwiBlM9h4rdiA8FT+FfHK
	2S/xFXLZgPLNU/JgJwYVAWpchGfSJ8Ua59wy4lMOHt6iGXucb13dlNzAh7+pa4y4clPpOlVXbYcLS
	c63r21AN51xGPqLGeWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhr2V-00000006GeF-2501;
	Fri, 01 Aug 2025 14:47:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhr2S-00000006Gdu-3xMU
	for linux-mtd@lists.infradead.org;
	Fri, 01 Aug 2025 14:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ED5343AF2;
	Fri,  1 Aug 2025 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D5AC4CEE7;
	Fri,  1 Aug 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754059636;
	bh=Ddyqw/s5ggKrSKg4OIUqJSvvkcgF6rzSZdjEDpWeZos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qo3ndn90tNhgmIbqESRyBk4TEnK4nxFrcE9hT8CUeL2b5RLB3BylZHrgYUPD6UUp2
	 f2e+xuSlFdg+TRTNWrTy1F8Acip/IdGujwovCZELII/e9KCQ17kA7il02ppvj8X0AB
	 npQXXeJoOOIKaOcDux3CZEjZUxXYpIFVnL71zeo6r82tZbOccF78WATESmCXUeC+XX
	 LZK//MWp4HoBjQZWsCPReWY1XoPfrCdP8eWdhKqbf/z6yxBCBDYkBOVX5NnfYcmCQy
	 PRFZoSnkh/z0sxeivtIIwrLIB3h1H+3UTaXAyTNmDjkcoAnec2IlPST6zX9lsrqCNA
	 B222y2hHlZiGg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Richard Weinberger
 <richard@nod.at>,  Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Michael Walle <michael@walle.cc>,
  Pratyush Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: Changes for 6.17
In-Reply-To: <87o6t08fen.fsf@bootlin.com>
References: <87o6t08fen.fsf@bootlin.com>
Date: Fri, 01 Aug 2025 16:47:13 +0200
Message-ID: <mafs0v7n7cd5a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_074717_006114_9C947B07 
X-CRM114-Status: GOOD (  16.54  )
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

Hi Miquel,

On Thu, Jul 31 2025, Miquel Raynal wrote:

[...]
> * MTD changes:
>
> Apart from a binding conversion to yaml, only minor changes/small fixes
> have been merged.
>
> * Raw NAND changes:
>
> Various controller drivers received minor fixes like DMA mapping checks,
> better timing derivations or bitflip statistics.
> It has also been discovered that some Hynix NAND flashes were not
> supporting read-retries, which is not properly supported.
>
> * SPI NAND changes:
>
> In order to support high-speed modes, certain chips need extra
> configuration like adding more dummy cycles. This is now possible,
> especially on Winbond chips.
>
> Aside from that, Gigadevice gets support for a new chip (GD5F1GM9).
>
> * SPI NOR changes:
>
> A notable changes is the fix for exiting 4-byte addressing on Infineon
> SEMPER flashes. These flashes do not support the standard EX4B
> opcode (E9h), and use a vendor-specific opcode (B8h) instead.
>
> There is also a fix for unlocking flashes that are write-protected at
> power-on. This was caused by using an uninitialized mtd_info in
> spi_nor_try_unlock_all().

I personally think bullet points are a bit easier to read for changelogs
compared to paragraphs since there is less filler text needed. For
example, my original merge message didn't the "there is also a fix for".
It just said "Fix unlocking of...".

Anyway, if you still prefer paragraphs then do let me know and I'll use
those next time around and save you some editing.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
