Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC23C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 23:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W23RiGHR5+gHfmw8mzSN1cFfU42FPNIn7kyyEtAynWI=; b=PtTWEVcWo1n0o6
	PzWUXytV3Af+MJ72yY7GvfhfnXA7sjFEILRutJGzDO8j7tXiD96FA6EUwmmWfArQDRScAaCNRIW9u
	NLeqFhtAaK41tlawsKvKe1OQcUIfd3CuHs5TUu963I3Kee84jxhHefVqCpaKlxXqRNSCElePTDfII
	Zr4dbkATpyP71Ic7RYJGtFQySAzlHCBST6/7mwbOinikd7I8RX9yvOx3cD3spYoQMPqF8913d4IwW
	LGhrijlHBufim+drg6xKtbrakcv9y3+Vf96cfSSErNj8xHvahrcrq2EY4237e6uo96r2PKpDMgM5k
	ZSeXmO6l6ynFfffAQG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1yEz-00F13v-2B;
	Wed, 24 May 2023 23:50:01 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1yEv-00F11k-1H
	for linux-mtd@lists.infradead.org;
	Wed, 24 May 2023 23:49:59 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 32FAA2C0288;
	Thu, 25 May 2023 11:49:47 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684972187;
	bh=4a27tZpGUeVAxwbKAxTrxpyuPQrRyNv6hwKJVC39hRU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fnWb9dxs2Y/WJyV8dK/t5Ogo1L0uvd9MOaeY/oyMOG8rKpqL2222aPCU3dqccjWhm
	 WmStHOAINnNHWI1K1v6ArXpYiyAJn6FIbka14mYkwLQm5piQKaJWVxsPIzonOIaief
	 zGTyBhIuaNSQ5HKDqFoLdUdIYDUSU4L8qW0TnZYz5hoplBVSZg6G84+TaHW2ooKcc9
	 rFEEQB/JVZRidJgAKZvnqvJ86YiIkCjUNUGfOrDSOeoUY6nFqcRPAs8VfUba2fDivF
	 1vB4GRG+uwISfLS72w+P+8pobpMxYalYXnRKmFx0LEn7HpzVUKL98GzDIgs/ExVteR
	 ncka8Fej8qCRw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B646ea29b0000>; Thu, 25 May 2023 11:49:47 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 11:49:46 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 25 May 2023 11:49:46 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: ensure timing values are
 written
Thread-Topic: [PATCH v2] mtd: rawnand: marvell: ensure timing values are
 written
Thread-Index: AQHZjdODNtokZcXnnEuLkFH94ISxpa9pUAUA
Date: Wed, 24 May 2023 23:49:46 +0000
Message-ID: <9372c8df-5604-0284-ba3a-74af4ca435e3@alliedtelesis.co.nz>
References: <20230524000551.581491-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20230524000551.581491-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <0E716FB8D48E644196FB08B558227153@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=P-IC7800AAAA:8 a=CjQ7iZMe9_sfGYb6nLMA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_164957_928941_A3FF488B 
X-CRM114-Status: GOOD (  26.21  )
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


On 24/05/23 12:05, Chris Packham wrote:
> When new timing values are calculated in marvell_nfc_setup_interface()
> ensure that they will be applied in marvell_nfc_select_target() by
> clearing the selected_chip pointer.
>
> Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>      This at least gets me to a point where I can illustrated the problem
>      reported to me. It appears that despite the chip correctly reporting
>      support for SDR timing modes up to 4 the observed tWC is 20ns. I've not
>      seen any actual problem running in this state the only complaint is that
>      the datasheet says the minimum tWC is 25ns.
>      
>      If I make a change to my bootloader such that the NAND Clock Frequency
>      Select bit (0xF2440700:0) to 1 before booting the kernel _and_ I remove
>      the extra factor of 2 from the period_ns calculation I observe tWC of
>      about 60ns. If I don't remove the factor of 2 the NAND interface doesn't
>      work (can't write BBT).
>      
>      Changes in v2:
>      - reword comment per suggestion from Miquel, add fixes tag

Actually thinking about this I should probably also include a change to 
drop the unconditional NAND Clock Frequency select. Some marvell_nand 
users probably aren't getting the best timings without this change but 
those with a system controller will probably end up with timings faster 
than intended (which may work depending on design tolerances).

>
>   drivers/mtd/nand/raw/marvell_nand.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index afb424579f0b..f1fcf136ad03 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2457,6 +2457,12 @@ static int marvell_nfc_setup_interface(struct nand_chip *chip, int chipnr,
>   			NDTR1_WAIT_MODE;
>   	}
>   
> +	/*
> +	 * Reset nfc->selected_chip so the next command will cause the timing
> +	 * registers to be updated in marvell_nfc_select_target().
> +	 */
> +	nfc->selected_chip = NULL;
> +
>   	return 0;
>   }
>   
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
