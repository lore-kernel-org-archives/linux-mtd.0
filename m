Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D9DC47089
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1z68CXuDPDwZaFAJFgICJPV5uqPe3OWKIoc1m8C22I=; b=T7LR29q3QtetbJ
	K26HIlb56E4tMdyXWZj1mSXjCQpZhqRROUMMXB3RIhGkV4iuGKmaJbpf4P+uYQSczFzS3XK1jgeHb
	wwZrsWMCB3PXGv6L3k0dsi3Q0tsZUxiOH4NMnDeb9W/6VCQZUFFTTuvtmDRtzB5kzcHFgbGjt/2cn
	QYOd/cdDBuhht6PhpPtEZXuXaCg1hOQMENu+dVyNvEXkRDUCnWtR9Z0MjIVm76T5TQxp6w7thzjQl
	m8+fdkcDGjkbrwarSkxzS62Kqz7xqIhur7cdVSebmifbuwz6zkE+3YanlqgQMk0Kd82B2jGHZOrAB
	WZeWGkhImwCBAry+4U0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EHb-006SPN-4T; Mon, 05 Dec 2022 16:25:31 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EHP-006SKG-4V; Mon, 05 Dec 2022 16:25:20 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B918A851A4;
	Mon,  5 Dec 2022 17:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670257512;
	bh=XRBQL3ANkfRLt1ZmdDnM6T1k6QmnmvivFD5ygRvJDCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=frp3kYFpF3zHArqSezOQzPXl0Nasq2nlca2xDcecLT0QFUNSHHgvL171nFR/+B58E
	 Z2HdD6qX77I4JbtU6TtPQwScPhvt3iJVsXaF3m7jwK1I1NbMC9mX8zKz3kcbpukQJF
	 kOqG3E5rD4DGb5YoGB9eNajiyRsKc3PV0WOG+4Fi6grgTwr0pKZCczhquSV7nDfCr6
	 3onvhm2hZS1Jo06fZe3ax/OxfayBJ7NvdhmutzcJ/QO15lfND4D9b4zuiPhLSzVg13
	 1Cx/kY8SwxMzhZJh7OHo/C4+7OHE2BnEZhajpONGYo0SpAbA6cELzmo/LMl9UGflQl
	 N2q6vhg0S81TQ==
Message-ID: <ecca019d-b0b7-630c-4221-2684cb51634c@denx.de>
Date: Mon, 5 Dec 2022 17:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
 <20221202174255.2c1cb2ff@xps-13>
 <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
 <20221202175730.231d75d5@xps-13>
 <7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
 <Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
 <20221205144917.6514168a@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221205144917.6514168a@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_082519_495983_031A2054 
X-CRM114-Status: GOOD (  23.16  )
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

On 12/5/22 14:49, Miquel Raynal wrote:
> Hi Francesco,

Hi,

> francesco@dolcini.it wrote on Mon, 5 Dec 2022 12:26:44 +0100:
> 
>> On Fri, Dec 02, 2022 at 06:08:22PM +0100, Marek Vasut wrote:
>>> But here I would say this is a firmware bug and it might have to be handled
>>> like a firmware bug, i.e. with fixup in the partition parser. I seem to be
>>> changing my opinion here again.
>>
>> I was thinking at this over the weekend, and I came to the following
>> ideas:
>>
>>   - we need some improvement on the fixup we already have in the
>>     partition parser. We cannot ignore the fdt produced by U-Boot - as
>>     bad as it is.
>>   - the proposed fixup is fine for the immediate need, but it is
>>     not going to be enough to cover the general issue with the U-Boot
>>     generated partitions. U-Boot might keep generating partitions as direct
>>     child of the nand controller even when a partitions{} node is
>>     available. In this case the current parser just fails since it looks
>>     only into it and it will find it empty.
>>   - the current U-Boot only handle partitions{} as a direct child of the
>>     nand-controller, the nand-chip is ignored. This is not the way it is
>>     supposed to work. U-Boot code would need to be improved.
> 
> I've been thinking about it this weekend as well and the current fix
> which "just set" s_cell to 1 seems risky for me, it is typically the
> type of quick & dirty fix that might even break other board (nobody
> knew that U-Boot current logic expected #size-cells to be set in the
> DT, what if another "broken" DT expects the opposite...)

Then with the current configuration, such broken DT would not work, 
since current DT does set #size-cells=<1> (wrongly).

> , not
> mentioning potential issues with big storages (> 4GiB).
> 
> All in all, I really think we should revert the DT change now, reverting
> as little to no drawbacks besides a dt_binding_check warning and gives
> us time to deal with it properly (both in U-Boot and Linux).

I am really not happy with this, but if that's marked as intermediate 
fix, go for it.

How do we deal with this in the long run however? Parser-side fix like 
this one, maybe with better heuristics ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
