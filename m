Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE55C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhDpFnCEocznEepEemyozXN76bT/crFBZeCsF0wVY40=; b=PUjzZTGuGOMHm1
	A+RTWWWGP925bIGcmlgTuGedhSvRVE4BoI6qzRYbk+ks2aV7ZAcF9yBoi/nlOEwTxhk9yJDdxHrNm
	+NYcF70k2xw1WGtwg+uLGxH+jGL1hTVvYLe6SVgocoxLB8JOZBRvUfyeeHjipRTiq2vLSNWEzZ6z1
	4IRrW9kTqlf8Pk5kXJUnT+lDsAvVz1gZWLQG3X18EYIwScrXGqXp1Tpi5BpmTG/VWhgjKQ4r0hkxz
	J2PHHwWVEMTri5uCfwHBIfk/zhUTr+uvAx7XsAX2RiTqs6FDV1Y3mol+bt2Uq4wZNA+cB/4oI8E24
	3pllrz3lVoWXKYTBBcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1751-00Gnzd-JE; Fri, 02 Dec 2022 14:31:55 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p174q-00Gny2-BK; Fri, 02 Dec 2022 14:31:46 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2BF74849CD;
	Fri,  2 Dec 2022 15:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669991501;
	bh=ApsMLtcwaIPedBPlT18dKOcSMuvH1AkPIvYODnI6wpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GyOowWd7DS4kgOEghgX1k8FniZ6k7udIcaibVbiFQyy4H5d0eISqa9DYsuc72WsWf
	 DvRZhJ664XbiySi5IMHzkW4609PXD9fz8DcjWwa9cngovwHVl5zhGFU5V1vujBQmPW
	 nMMqEofTTNW+BQmXcjMgBmQoCpWrtsOIXcTbWtY1SrgAqben2cyhohloxI9LKQPNg0
	 mP5FIPCVc6BjxPBFKW3Ae1d0zc5qx596kEGn/7W73am7Y7wwLMxf/AHx53UEnE2Ajk
	 QlE9IgtwoSe13e9UAd7rtssx0PuT5POG4qgJGE/WK7lphCF1H5EWp+RNUpMluSCPKG
	 sI3xmsn5VhtoQ==
Message-ID: <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
Date: Fri, 2 Dec 2022 15:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221202150556.14c5ae43@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_063144_800216_24373F98 
X-CRM114-Status: GOOD (  25.17  )
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

On 12/2/22 15:05, Miquel Raynal wrote:
> Hi Francesco,

Hi,

[...]

> I still strongly disagree with the initial proposal but what I think we
> can do is:
> 
> 1. To prevent future breakages:
>    Fix fdt_fixup_mtdparts() in u-boot. This way newer U-Boot + any
>    kernel should work.
> 
> 2. To help tracking down situations like that:
>    Keep the warning in ofpart.c but continue to fail.
> 
> 3. To fix the current situation:
>     Immediately revert commit (and prevent it from being backported):
>     753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>     This way your own boot flow is fixed in the short term.

Here I disagree, the fix is correct and I think we shouldn't proliferate 
incorrect DTs which don't match the binding document. Rather, if a 
bootloader generates incorrect (new) DT entries, I believe the driver 
should implement a fixup and warn user about this. PC does that as well 
with broken ACPI tables as far as I can tell.

I'm not convinced making a DT non-compliant with bindings again, only to 
work around a problem induced by bootloader, is the right approach here.

This would be setting a dangerous example, where anyone could request a 
DT fix to be reverted because their random bootloader does the wrong 
thing and with valid DT clean up, something broke.

> 4. There is no reason to partially fix a DT like what the above did
>     besides trying to avoid warnings emitted by the DT check tools.

Note that the 3. does not partially fix the DT, it fixes the node fully.

>     If
>     complying with modern bindings is a goal (and I think it should
>     be), then we can modernize this DT without breaking the boot flow:
>     Instead of only setting #size-cell = <0>, you can as well define
>     in your DT a subnode to define the NAND chip. NAND chips are not
>     supposed to have #size-cells properties, but in the past they did,
>     which means #address-cells and #size-cells are allowed (and marked
>     deprecated in the schema). So in practice, the dt-schema will not
>     warn you if they are there, which means you can still set
>     #size-cell = <1>.

I am really not convinced we should hack around this on the DT end and 
try to push some sort of convoluted workaround there, instead of fixing 
it on the driver side (and bootloader side, in the long run).

>     Please mind, the tools have been updated very recently to match
>     what I am describing above, so they will likely still report
>     errors until v6.2-rc1, see:
>     https://lore.kernel.org/linux-mtd/20221114090315.848208-1-miquel.raynal@bootlin.com/
> 
> Does this sound reasonable?

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
