Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC1C3DA49
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2024 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aOb9zrFy5tZMAA3VVnIW2c7DEDv59XToOQym/O0qUQ=; b=gtxbtle7G8upcv
	9bwTq+tsZ9H0dtSS6n7VywWn4lU1xuWjS2gSjTuoWXKcJ15yngigJyfiuVWAYFKRqNw23NsxbjTgh
	AOndkEXjHCMgyVP1eJOkgXMgrcVSjvbNyCVyiCZTo0nejbWdQoxo/W5j9Tgame3QcILZHWW2aXBSg
	wTVw4XNYgDrS7DK9bl/R3lABWMvVQKDP/SyDuA0ndFMZ5o0ECk+acY21MVoavwaCg8sLQf+PL6Tad
	k+GnkKzylCrxI0X+cZO/ANKxvhcKfwrPI9ZHPSHnNSlxsJzd8txBhxSege1ePShSiIUVJuzBlmUU1
	n0bzVTDe6UIqwStje68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYkxs-0000000Esld-3gF7;
	Tue, 30 Jul 2024 11:24:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYkxo-0000000Esjn-2PiP
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jul 2024 11:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA885CE0EC4;
	Tue, 30 Jul 2024 11:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8819AC32782;
	Tue, 30 Jul 2024 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722338658;
	bh=FstNwrfsX5X7GY12ufzHw8RhOHEWqp+Zb6hF3L2QyEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q0PC9Yzkm8atb0xilzRFm0z9wGS/xfgYkjlkMxV3TVh2roxXMFMIZBFvo/v8pgR9l
	 wh9xfiIP9GwXvDvE5HIn0DHHmUzOdggPa8ycSXB0bNN0tUi4n3UThc4uXAfPJY86IX
	 NR93f07dSVaIJQkmR0TXtgLOwtbA8X7nt5xCl09XcpbbmKo2oswSsM7/hKsU4Wrx6N
	 H6lTIeE9dLWVPF3axeanttYRCpaqYwZrXhmDY8dwtOIFjtAU7A1Nr6IAgQbZJRQhOS
	 kB8VaDtruP8Q+fgNN+VOEm+tVCBSOgD8fWqf5bFLBZScAL6W0fIp6vjGCObQY0tmNR
	 sbwNvx8SK02Tw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Brian Norris" <computersforpeace@gmail.com>,
  <linux-mtd@lists.infradead.org>,  "Miquel Raynal"
 <miquel.raynal@bootlin.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Richard Weinberger" <richard@nod.at>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
In-Reply-To: <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org> (Michael Walle's message
	of "Tue, 30 Jul 2024 08:51:05 +0200")
References: <20240726185825.142733-1-computersforpeace@gmail.com>
	<D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
Date: Tue, 30 Jul 2024 13:24:15 +0200
Message-ID: <mafs034nr2kdc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_042420_811375_F2C137F8 
X-CRM114-Status: GOOD (  10.71  )
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

On Tue, Jul 30 2024, Michael Walle wrote:

> Hi,
>
> On Fri Jul 26, 2024 at 8:58 PM CEST, Brian Norris wrote:
>> These flash chips are used on Google / TP-Link / ASUS OnHub devices, and
>> OnHub devices are write-protected by default (same as any other
>> ChromeOS/Chromebook system). I've referred to datasheets, and tested on
>> OnHub devices.
>
> Out of curiosity, there is also a hardware write protect switch
> somehow, right? At least that's my understanding how verify boot
> works.
>
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> This looks good:
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Applied to spi-nor/next. Thanks, both!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
