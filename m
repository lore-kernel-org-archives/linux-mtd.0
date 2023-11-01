Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4626C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoD0scIZOsp5GCJYPyGWwulVOqO13hf/tiF9OOU/89A=; b=5Dbloda/AopFSVd4F2HJuvKYup
	sf9BuQe9rAAOxWq8CWsdWmSDtP7zaR54fOcRNPCjpLpq5SOEDIaWZDgzBJm3kyNo/k0MSAFHBv/wk
	YTc0QiAIN2bwCIld2LIGuOYC2PxpxsfdLj991nB7c0170u7tY0nlwupiOnVXcFbsJMM0yUBN1ozZc
	BK3/in16TyKC2M/fwYtAAM1yAH6lUDPRqJnbq3HEFWlXs0bkYmh1wB0t+gWqvJV8S6Rl/ThgPhP16
	i2o+yukOQaWkapC8rgr3/WgI8NSdbEofQMkPEpNVpejbpnbkRR7ewFJMHntTuFFx4R4r/aLKxyMc9
	4y4yFJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAki-007XX8-15;
	Wed, 01 Nov 2023 12:55:20 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAka-007XTK-1v;
	Wed, 01 Nov 2023 12:55:16 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C466B8718D;
	Wed,  1 Nov 2023 13:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698843304;
	bh=q/INPc4YkebUc0YG4M/zNDqxE0OEQndtHNx879BDS/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=evvmBMxUIc+0fyuQvr35w5FBU1YWUSCRFv6BWXOD+Aolzgv4UP5mA0GctXjkAakR8
	 uG3SBjjEmZ2HqVYe/U+mUos6EStEWe9cSQ8yyTYCg/6bLwfk8Kv5F3jTkJakpMJAUP
	 2d6gRjLPLx6IT7KrlhqafsDORAPz/ZuZ1auopjBDx/Vu0/NJq0o9SmhAM4MHqTER9j
	 /GQAIdzSeKm3rQtD/Lf/Me1qVbgjmrmWOOre24AQo8KxHktdbFd+QhXJ9pG0916VE3
	 SEpYPXfamz3vQMvt+Eu4XJO/662uFYxN7Rekih2QHto+/iBudNqIXiqmc8Amp+o3T2
	 0reBJyOmC1onA==
MIME-Version: 1.0
Date: Wed, 01 Nov 2023 09:55:04 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com
Subject: Re: [PATCH 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <05fb3eac-0f1f-44f4-83b8-6ac5914c73c4@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
 <20231101094325.95851-3-tudor.ambarus@linaro.org>
 <05fb3eac-0f1f-44f4-83b8-6ac5914c73c4@linaro.org>
Message-ID: <56dd3e191743caf2b94a4bef7938df37@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_055512_864263_CD79EBB6 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi Tudor,

On 01/11/2023 06:48, Tudor Ambarus wrote:

> oops, here I wanted to check for null, when null, set the default.
> Takahiro and Fabio, would you please update when/if testing?
> 
> 	if (!nor->params->chip_erase_opcode)

I applied this change on top of your series.

flash_erase command completes very fast:

~# flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 -- 100 % complete

After that, I run 'hexdump -C /dev/mtd0', but I see that the original 
content is still there.

Thanks



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
