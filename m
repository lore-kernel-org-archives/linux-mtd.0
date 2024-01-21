Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279E4C47422
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2Qs/C2xjYLAfxFQ0K/nbp7j6QKzdaArUJWPwjehf3s=; b=4/x9Hi5uwWSexZ
	X+KjW/+L9L3KzzzLutr0sUzZZOZ9Wk2C4wKcMlaX1dq5h8VwRHG+DlOWhNObTUzKwUgEWjDnkiC4E
	1K7KtfUjl+8429qKMefjW08cQG8sJy5XxzeawL4WnsCNwBJToBy/NLBdMOyX57n3+ypMgedBqpy9s
	JUZgFaDgUnBx/578i66tDFcNghFCyFLFbrlJl7JesSe74BIzGuf7fHYpkhWwH1hsRjW6ccKk6F3us
	ODY51qWga0JJ+OwaSa76KZnDSYlqteibHXgVVTYc39hiwyZJcoNaCH8HHbrglXUWDfauR5GTq/+s2
	MRVuyBZWW7o+34er7Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRULu-0099gA-20;
	Sun, 21 Jan 2024 09:42:54 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRULn-0099fX-1y;
	Sun, 21 Jan 2024 09:42:51 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rRULZ-00050W-CV; Sun, 21 Jan 2024 10:42:33 +0100
Message-ID: <4c69cb61-1a43-4bfe-b01a-8118967ddbaf@leemhuis.info>
Date: Sun, 21 Jan 2024 10:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Content-Language: en-US, de-DE
To: Guenter Roeck <linux@roeck-us.net>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, git@amd.com,
 sbinding@opensource.cirrus.com, richard@nod.at, lee@kernel.org,
 tudor.ambarus@linaro.org, amitrkcian2002@gmail.com,
 linux-sound@vger.kernel.org, james.schulman@cirrus.com,
 rf@opensource.cirrus.com, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, claudiu.beznea@tuxon.dev,
 linux-spi@vger.kernel.org, michael@walle.cc, david.rhodes@cirrus.com,
 pratyush@kernel.org
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1705830167;30d84ff9;
X-HE-SMSGID: 1rRULZ-00050W-CV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_014247_813414_81645F1F 
X-CRM114-Status: GOOD (  17.39  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12.01.24 20:11, Guenter Roeck wrote:
> 
> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
>> AMD-Xilinx GQSPI controller has two advanced mode that allows the
>> controller to consider two flashes as one single device.
>>
>> One of these two mode is the parallel mode in which each byte of data is
>> stored in both devices, the even bits in the lower flash & the odd bits in
>> the upper flash. The byte split is automatically handled by the QSPI
>> controller.
> [...]
> With this patch in the mainline kernel, two of my qemu emulations
> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
> controller and thus fail to boot from SPI. The error message is
> 
> [    3.006458] spi_master spi0: No. of CS is more than max. no. of supported CS
> [    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@1e620000/flash@0
> 
> The problem is no longer seen after reverting this patch.
> [...]
> # first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9
#regzbot title spi: qemu emulations quanta-q71l-bmc and almetto-bmc fail
to boot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
