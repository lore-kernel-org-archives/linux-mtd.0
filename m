Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB045C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FnAeg8i07gm7lD3LAmDbziCdwovu/oT+YYWRWX1bDw=; b=rP4jvUR1Nwvw/o
	i886uUzMpqb9JDgLDO6in9BEKt13QvRF5Ra8BCUwo9Pr/OaJXlsbox3kWaAGwj1V2vXFk4SecTJcC
	/pZXeyocyE/WWVR2vlmEo7UKgb5PC4fK006VVAXOh2im96cXdfN63uhJxuJqzmvakBK/TpdYr4SG/
	2UHpPuBYZ3cShnxzuK+Tkyo6tV091SzUCj/EFfmWMtjvlTT04rzpvb8C4W+aX06SJgK5o/SAMu2M8
	B088OkpWufbS1gMdya5VV1oTEPzsNbf5zMbeGo9MyRmHrU5TBmqxX+zIuya4TnX5g1AMvcwi4XVPd
	K+aocfWYP06BWO/GjCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69eS-005zEi-TR; Tue, 28 Jun 2022 11:45:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69eP-005zDG-Cn
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:45:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C48CECE1F7F;
	Tue, 28 Jun 2022 11:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EE9C3411D;
	Tue, 28 Jun 2022 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656416695;
	bh=tkn/x7mAlpHdjLr2Gtx9mB2/XObG6QonIO0VzrwKPsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fhfjsvvz/Wem+sRfzqIa7kvoEX/7O9yyiyqdAXYaZkFio+GNwvn8RsI+uyqL7Fv3J
	 CzxSGhMCqmBo8HkrYxsaxJXm5Lie871sigZIiNTb89aQef6jzFJ0o5H/LFWKgJ6jBM
	 ISA+E83RGsAIlyufZAefTicOl3VAnAuMRHH7+JoEWF5Oyvgm4YefQ0HvF/jzaXbxgw
	 Q3d0M3xfkgFnt9CyuKGdga0c/7KymwJtkk8PRIyUVLNqVCGGCxodZ/7ozvsrgKKflx
	 C9xLIpX5EoN/HoDERssJd3JTA2d3UD/rsoXR/u0bOm0evKAavz5g3a4sVUJUZK1yPH
	 5g9OZwtKU/raA==
Message-ID: <72686231-c372-a4fe-347e-39470790fa65@kernel.org>
Date: Tue, 28 Jun 2022 14:44:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: raw/omap2: erasing issue
Content-Language: en-US
To: Yegor Yefremov <yegorslists@googlemail.com>, linux-mtd@lists.infradead.org
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, miquel.raynal@bootlin.com
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_044501_851341_ABAB7C16 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Yegor,

On 28/06/2022 13:48, Yegor Yefremov wrote:
> Since linux 5.17 I get the following issue when doing ubiformat:
> 
> # ubiformat -y /dev/mtd5
> ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> libscan: scanning eraseblock 2028 -- 100 % complete
> ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> ubiformat: 2 eraseblocks are supposedly empty
> ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> 31, 32

I'm guessing these bad blocks recently added due to the offending patch?

> ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> attempt to erase a bad block at page 0x00000d40
> ubiformat: formatting eraseblock 28[   33.658809] nand:
> nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 34
>            error 5 (Input/output error)
> ubiformat: marking block 34 bad
> ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 35
>            error 5 (Input/output error)
> ubiformat: marking block 35 bad
> ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 36
>            error 5 (Input/output error)
> ubiformat: marking block 36 bad
> ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
>         error 5 (Input/output error)
> 
> ubiformat: error!: failed to erase eraseblock 37
>            error 5 (Input/output error)
> ubiformat: marking block 37 bad
> 
> ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> # [   36.322563] vwl1271: disabling
> 
> git bisect pointed to the following commit:
> 
> a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> Author: Roger Quadros <rogerq@kernel.org>
> Date:   Thu Dec 9 11:04:55 2021 +0200
> 
>     mtd: rawnand: omap2: move to exec_op interface
> 
>     Stop using legacy interface and move to the exec_op interface.
> 
>     Signed-off-by: Roger Quadros <rogerq@kernel.org>
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> 
> :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> 
> Info to my NAND flash:
> 
> [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> [    5.702193] nand: Micron MT29F2G08ABAEAWP
> [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64
> [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> using UBI block devices instead.
> [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> consider using UBI block devices instead.
> [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> consider using UBI block devices instead.
> [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> consider using UBI block devices instead.
> [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> using UBI block devices instead.
> [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> using UBI block devices instead.
> 

What platform are you on?
I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
