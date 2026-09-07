Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF2C79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeHz3qxuYLGK/LWQoo/FJVFRAwp7hJtBhJusgwjtey4=; b=CJoneFFIzWpmyT
	0RalA5d8XfMQxWGeeVnh6sv+I8A7VRH0XKdO24jv5saBLfMHpq4Jr7B/aZKkN9TT8c9gS6Xo22mjZ
	r3j3aQhS2edLLUGaR8S5c5ejxz6x61xE1MynwY3Xz+WX/Amnj/MkNIwR1trf6yflIlCqlncR0E+LM
	kjgXgxrK23V5PqU7UMTih4R2CJ1GVmAPc8HG0mvcDnO8VW8+ohSB8jxt9X3a7N82SpjDcep5+Y00o
	gPDUH/2NUEoE9KbYNfEdvr9hEgZOWfN2j+7NZ1jdTy/OCnqmY5BO+wArfqTg/Jsx+v3L2nx4N1vXu
	nkiSECky8ysVYB0A80fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U3m-00000006BdM-3q89;
	Mon, 07 Sep 2026 07:46:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U3l-00000006BdG-27IM
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 07:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F53E60052;
	Mon,  7 Sep 2026 07:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711B51F00A3A;
	Mon,  7 Sep 2026 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767192;
	bh=mPGYBNkD8cMF+4f90SXIUITYdvfvRqgffC8CzKH8JYQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oTfQ8tSbUnuU2lq1QIpaXCUq8Za4QCa7TOdAQ1nBV82ROpPCnNqvL2aKvScM0nsgF
	 wYvjgzEemqg/WZjfzBJ6DEiBlADiDyb6lgM1ZHs/z9MYlWy4uP7/gF+q2UCQAuzW1T
	 A/cwEBYKi7ZytnRmSPSB2UwKwhsMdQBlnog16qZy0FOIxewqgkzizMHrrxNqRgr5s+
	 1mvepJ6GwvWxRJYGKbrsC3OIwLQqqZvIGt/fxdrElOL0qiLgrHGppzO/pM5a+fVFE4
	 lRg4Si6Idy/djHG9JSKT1X7J0Ex024ruurXH4mwKd6hYIHqrj5uAQbmiq7T434f5QO
	 URyAIDJGBrnIg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
Subject: Re: [PATCH v6 00/26] mtd: spi-nor: Clean Winbond W25QxxJV family
Message-Id: <178876719018.3543902.8336415524965434948.b4-ty@b4>
Date: Mon, 07 Sep 2026 09:46:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Fri, 04 Sep 2026 19:18:53 +0200, Miquel Raynal wrote:
> Thanks to Winbond collaboration, I was able to test almost the entire JV
> SPI NOR family. A few chips could not be sourced, I decided to apply the
> very same logic than the other chips, all of them behave identically as
> shown in all the logs that I am sharing in each and every commit.
> 
> This series is pretty straightforward, it is here to cleanup the JV
> entries by:
> - Aligning the comments and "fixing" the chip names in them
> - Reordering the chips by density and family
> - Testing and showing all the SFDP content and passing all the SPI NOR
>   tests to ensure a good level of support.
> - Adding all the locking information when it is missing.
> 
> [...]

Applied, thanks!

[01/26] mtd: spi-nor: Fix spacing in function call
        commit: e42bfc080d96eb36520f5b4f50b50767837bc1e0
[02/26] mtd: spi-nor: Garbage collection during sfdp parsing
        commit: 0fb499b527cdcdb87188fbe54684e258bb98b9f1
[03/26] mtd: spi-nor: Init flags before manufacturer late_init() hooks
        commit: 4df380710b8c8a076923050a948b41715ef09b5f
[04/26] mtd: spi-nor: winbond: Move W25Q01NW to its right place
        commit: 9bae0fe02ea8abf11ab8d86ca2ca6b907a874077
[05/26] mtd: spi-nor: winbond: Normalize names
        commit: 0f3a2567a10609b720bffea15e80de53c1f686fa
[06/26] mtd: spi-nor: winbond: Properly document the chip names
        commit: 2267f0161e60d3052e94a63f9c71a45d77be1d27
[07/26] mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
        commit: 9f071bb8fadc1f09c4d5f075d3c1f91b6f6bf0c9
[08/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capability
        commit: 66c36f35633dd5b6fb8412697229996d14973d9b
[09/26] mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capability
        commit: 8218e55d31725f5768f54e91e6b865c53e7295f8
[10/26] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capability
        commit: e9f96f43214094c4b9227acffca55b9abbf2f30b
[11/26] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
        commit: fc9f75c1457b9ea8f80db77c8292b2ed84116589
[12/26] mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
        commit: ab7242e3dc6ec73f657f03d03e0f97277664d910
[13/26] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capability
        commit: 9b65f84c62f0377dc2311919fc63b37ba0e9c03a
[14/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capability
        commit: c9aee7f457c3e37ca8753c10e13653ff297e9f4a
[15/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
        commit: 151aa1a5953adaec73c793c25a6b881e98e12a73
[16/26] mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
        commit: 3b1fba74306b3a0d0d4052c00940b6e3c74dd2ca
[17/26] mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
        commit: 4a6aab1f7335dd8a54b768fdbcbcce0ad454d2fa
[18/26] mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
        commit: 08ce407217371994f738ab6c391f8af0f8a2eb2b
[19/26] mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
        commit: 5eaaa72edec1bd5517808a8cb16d4c334ec69aff
[20/26] mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
        commit: 2e9abc448c2b6bc22d9d77eb20fcaa2cc05da6f9
[21/26] mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
        commit: 860fd661dff43cd4d85eec4e7ad1c0bbfa9d1c98
[22/26] mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
        commit: e2e9dcab5505e8e4fc55404d9f329c5933001588
[23/26] mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
        commit: 0d8f65aa9a44574e0cabf89aa6aa37a7e3a19cfe
[24/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information
        commit: d5212797429d43c5ad3859f5b14683e52ab686a7
[25/26] mtd: spi-nor: winbond: W25Q512JV-M: New chip
        commit: 6648e64c6efe6a0b11a080ef1a87e26147085774
[26/26] mtd: spi-nor: winbond: W25Q01JV-M: New chip
        commit: 41d96c2da5970f7e25b7818710d7732f5035cdb4

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
