Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A929C55185
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 15:30:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46DFC20776
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 15:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Klu1LX+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46DFC20776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybgNmlv0p2ANj4vEdOFqrUY857gJnDjs4uJZRUKhlXI=; b=Klu1LX+vkVF10y
	j/s25xrMJu61eXj8/jYH9JsvgI2iw2G5mhMphSAP5EtUM0ZUTg5R4N/u07MgGRkXymUjQJ7vOJo9N
	Rb6ha0HVXtbtdZNljpKhsoj2/J7ZV7Sq2GhvuAF4PxtyYe+tUwexrOCnED3I5mTeFAVNkUC2MJQdB
	82Bxg+PiDVBnQ1jf+tq5qfIZPGYV8+ySQmN+NczSTxLlYddHDShB8/fvrM8CI5GNlMaAEAFFR21s5
	uo6GtodZ22VEUrJX34r0UkINvirmNa/K4wbTiNGbaZ/tDAmdW74LkD98d4mzpJOGrIsRac7DsEwGs
	7Owh3YIzYEaIK6JvWmcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRHK5-00079O-5s; Wed, 22 Apr 2020 15:30:01 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRHK1-00077e-UF
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 15:29:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 496krg2xvLz1qrMW;
 Wed, 22 Apr 2020 17:29:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 496krg1fS6z1qr44;
 Wed, 22 Apr 2020 17:29:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id gpc7EwN5kMR7; Wed, 22 Apr 2020 17:29:53 +0200 (CEST)
X-Auth-Info: VZnIEV8jQsmO1NWOjpCi2rkjveYliaMIX7iFMxDCgX0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 22 Apr 2020 17:29:53 +0200 (CEST)
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before latching
 incoming data
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <20200317071821.9916-1-yamada.masahiro@socionext.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6093dfab-1e9e-824a-b639-33d340b377f9@denx.de>
Date: Wed, 22 Apr 2020 17:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317071821.9916-1-yamada.masahiro@socionext.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_082958_136099_87D27D44 
X-CRM114-Status: GOOD (  17.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/17/20 8:18 AM, Masahiro Yamada wrote:
> The Denali IP have several registers to specify how many clock cycles
> should be waited between falling/rising signals. You can improve the
> NAND access performance by programming these registers with optimized
> values.
> 
> Because struct nand_sdr_timings represents the device requirement
> in pico seconds, denali_setup_data_interface() computes the register
> values by dividing the device timings with the clock period.
> 
> Marek Vasut reported this driver in the latest kernel does not work
> on his SOCFPGA board. (The on-board NAND chip is mode 5)
> 
> The suspicious parameter is acc_clks, so this commit relaxes it.
> 
> The Denali NAND Flash Memory Controller User's Guide describes this
> register as follows:
> 
>   acc_clks
>     signifies the number of bus interface clk_x clock cycles,
>     controller should wait from read enable going low to sending
>     out a strobe of clk_x for capturing of incoming data.
> 
> Currently, acc_clks is calculated only based on tREA, the delay on the
> chip side. This does not include additional delays that come from the
> data path on the PCB and in the SoC, load capacity of the pins, etc.
> 
> This relatively becomes a big factor on faster timing modes like mode 5.
> 
> Before supporting the ->setup_data_interface() hook (e.g. Linux 4.12),
> the Denali driver hacks acc_clks in a couple of ways [1] [2] to support
> the timing mode 5.
> 
> We would not go back to the hard-coded acc_clks, but we need to include
> this factor into the delay somehow. Let's say the amount of the additional
> delay is 10000 pico sec.
> 
> In the new calculation, acc_clks is determined by timings->tREA_max +
> data_setup_on_host.
> 
> Also, prolong the RE# low period to make sure the data hold is met.
> 
> Finally, re-center the data latch timing for extra safety.
> 
> [1] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L276
> [2] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L282
> 
> Reported-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I tested it on the AV SoCFPGA, this seems to work, so feel free to apply.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
