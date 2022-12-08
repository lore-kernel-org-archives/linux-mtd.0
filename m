Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CF1C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JuJvvxzW6pq5wAKRdX34RvhcWAUhWkxu5GfrZfGc/I=; b=ffn+ZA1TzLQ9/K
	uL0qgq3Fyg37yodM5BQsILaGfNOezl2wUbErlpsFXPXnhm/utK18oLszLaXI7Vb/JD5NXhMEZcA/L
	zltT7Iy/wug984nYsrPrBaHzgEB5glFU9p0LzDC0kh5yZNjMgs5iXN/0UUpW1lER3/6Y73NS7Lgge
	xq5ujPnSjJMH8KnWDh3mCk+/effmKXVy0GAXgSGviVHFAOCDi8EH2mNA56UKs+Q4uQgct3XzRsxn3
	gvemX2eb5TFpma58NmjNvS+gew3GVaplRhja24apN5jV+3xKPPcgf1rhMPeHDgN6k2NSwk0OKdktB
	HV36jfRjrV7UmOTfB/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IOz-002gAj-Jo; Thu, 08 Dec 2022 15:01:33 +0000
Received: from smtp-out-08.comm2000.it ([212.97.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3HHs-001Kon-1A; Thu, 08 Dec 2022 13:50:10 +0000
Received: from [127.0.0.1] (unknown [158.148.10.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id 77488426880;
	Thu,  8 Dec 2022 14:49:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670507400;
	bh=yrY8+zB2euV2PqldD+sp9PnBqV0DhXW1r1yjIerNFjs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=s+jRvvfe5Jkbrebh5saE+jW8Mm2qGM5ECakblNalqFZ8GTIVCztjIIzGSf271VdxG
	 QHLT7cIwWz2Y4iUicPEt8THQBlSFjWw+IloVVFl68S56JNIndVLaVdWdjbh+mVqKOU
	 DNNfMVaAGtgMhEeRUJd6/wsQmvyPNEeWgT/k45hxHT1pvyqLiTyRcR1Gn5Pm7ivkCl
	 eg79TsGiCCJknYSfGJU8lZpxIygkhND6XbSldKlj3csFy5RZgb3lZbQhNxwZQbG12g
	 hlIw7IqNJRlYX7oUhys2qQQXaUbuuETTZ+c0fRNDoGOwWVH3dvc6aN1L8GQ/luV5DE
	 pqEQOMY1Cxevw==
Date: Thu, 08 Dec 2022 14:49:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_Revert_=22ARM=3A_dts=3A_im?= =?US-ASCII?Q?x7=3A_Fix_NAND_controller_size-cells=22?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2a6c5a08-1649-3f80-cc37-a425f09f3a67@denx.de>
References: <20221205152327.26881-1-francesco@dolcini.it> <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de> <20221208115124.6cc7a8bf@xps-13> <2a6c5a08-1649-3f80-cc37-a425f09f3a67@denx.de>
Message-ID: <544539BE-F7C2-4484-9588-6428EFA8A537@dolcini.it>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_055008_561982_A33A3E55 
X-CRM114-Status: GOOD (  11.22  )
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

Il 8 dicembre 2022 14:21:31 CET, Marek Vasut <marex@denx.de> ha scritto:
>On 12/8/22 11:51, Miquel Raynal wrote:
>> Hi Shawn,
>
>Hi,
>
>> + Thorsten
>> 
>> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
>> 
>>> On 12/5/22 16:23, Francesco Dolcini wrote:
>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>> 
>>>> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
>>>> 
>>>> It introduced a boot regression on colibri-imx7, and potentially any
>>>> other i.MX7 boards with MTD partition list generated into the fdt by
>>>> U-Boot.
>>>> 
>>>> While the commit we are reverting here is not obviously wrong, it fixes
>>>> only a dt binding checker warning that is non-functional, while it
>>>> introduces a boot regression and there is no obvious fix ready.
>>>> 
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>>> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
>>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>> [...]
>>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> [...]
>>> Acked-by: Marek Vasut <marex@denx.de>
>> [...]
>> 
>> As discussed in the above links, boot is broken on imx7 Colibri boards,
>> this revert was the most quick and straightforward fix we agreed upon
>> with the hope (~ duty?) it would make it in v6.1. Any chance you could
>> pick this up rapidly and forward it to Linus? Or should we involve
>> him directly (Thorsten?).
>
>It seems neither Francesco nor me agree that this is the right approach and rather the fix should be the two-liner change to the OF partition parser, so maybe this should not be picked ?

I think that the 2 lines change might not be good enough to properly handle the U-Boot generated OF partitions in the general case, even if it fixes my specific issue.

Given that I would do the revert as an immediate first step.

Francesco 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
