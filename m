Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AADED58D5F
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6eGAOciL4ub5oAcM90qYr2HuvL/jToVh1e5UuscqB8=; b=LJKYV2IQm/W1NH
	0Qxzw3UPvCeHzdGzs9wuz08SkdCTnI2/ixJrAuXpPizPE51axL9dv7CGcZuyL1+3CGOz5gab4ngtC
	KmpLrr/ciupEQGLGJreajPH+v9DoAD5RHXokEg8ChKyQBDUbooSrZ4T6R3kp4CbPYZivxwyM0oQwH
	DPlhFo98sEKzDMroAR22V/MfF1MehPO4us2J2BpS2IWVQCrFfPo/sfNVw25u+/55/PltPxbL35Dwg
	7uu0Pau9Gl+p2hgDqNEHnwBPNb56s0OU9SaLekJN6hzTg1KNwD8ZQWCODJ2hgCWOn+F4WukPM1Yhi
	KdbIPxbsuxlfxRLo9C6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbaX-00000008bAL-40qL;
	Mon, 25 Nov 2024 16:05:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbaV-00000008b9W-1yLX
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 16:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7865CA41835;
	Mon, 25 Nov 2024 16:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45079C4CECE;
	Mon, 25 Nov 2024 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732550722;
	bh=6FLs9s9AV390UvyL/FFHvWCqP3rQvptl3DSim8EuBVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mc8I1J3Fj1BoW3esPIM8kZ4kHxD6reYQZfC2BL3MRgKyojejeqFmX27H/GfaTAocc
	 J8Qei9XLUwwvzc3snNdJwehWDejaKTxmuT76pyLbSYwso3sw04Abaj/bMRcAdFd0v6
	 lKyvwfGuYKmxWaOuF3WjsCcgOfsbE+SpsWMxlQ3IKyCNAjkYhaTc5sWXZmnnZAqRCs
	 In6CwCcM6/n7S3Ku6DcuMxUdkTpiKcV6UjdQX4F44MZFg0zlVXdCjldWwf9DJ5RHBx
	 P4hpnIwwix3V8gcWXVQabXbmpZyxMiEiNp57+A/1aukUra6f6gLzRK5KYd4nS9OveN
	 1SM0sD0tOqNig==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Mark Brown <broonie@kernel.org>,
  <linux-spi@vger.kernel.org>,  Steam Lin <stlin2@winbond.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Sanjay R Mehta
 <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
In-Reply-To: <20241025161501.485684-2-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Fri, 25 Oct 2024 18:14:38 +0200")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-2-miquel.raynal@bootlin.com>
Date: Mon, 25 Nov 2024 16:05:18 +0000
Message-ID: <mafs04j3v5mf5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_080523_634139_F372CA0B 
X-CRM114-Status: GOOD (  33.29  )
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

On Fri, Oct 25 2024, Miquel Raynal wrote:

> In the spi subsystem, the bus frequency is derived as follows:
> - the controller may expose a minimum and maximum operating frequency
> - the hardware description, through the spi peripheral properties,
>   advise what is the maximum acceptable frequency from a device/wiring
>   point of view.
> Transfers must be observed at a frequency which fits both (so in
> practice, the lowest maximum).
>
> Actually, this second point mixes two information and already takes the
> lowest frequency among:
> - what the spi device is capable of (what is written in the component
>   datasheet)
> - what the wiring allows (electromagnetic sensibility, crossovers,
>   terminations, antenna effect, etc).
>
> This logic works until spi devices are no longer capable of sustaining
> their highest frequency regardless of the operation. Spi memories are
> typically subject to such variation. Some devices are capable of
> spitting their internally stored data (essentially in read mode) at a
> very fast rate, typically up to 166MHz on Winbond SPI-NAND chips, using
> "fast" commands. However, some of the low-end operations, such as
> regular page read-from-cache commands, are more limited and can only be
> executed at 54MHz at most. This is currently a problem in the SPI-NAND
> subsystem. Another situation, even if not yet supported, will be with
> DTR commands, when the data is latched on both edges of the clock. The
> same chips as mentioned previously are in this case limited to
> 80MHz. Yet another example might be continuous reads, which, under
> certain circumstances, can also run at most at 104 or 120MHz.

It's been a while so I don't remember the specifics anymore, but IIRC
some NOR flashes had the same issue. Some commands could only run at a
lower frequency.

>
> As a matter of fact, the "one frequency per chip" policy is outdated and
> more fine grain configuration is needed: we need to allow per-operation
> frequency limitations. So far, all datasheets I encountered advertise a
> maximum default frequency, which need to be lowered for certain specific
> operations. So based on the current infrastructure, we can still expect
> firmware (device trees in general) to continued advertising the same
> maximum speed which is a mix between the PCB limitations and the chip
> maximum capability, and expect per-operation lower frequencies when this
> is relevant.
>
> Add a `struct spi_mem_op` member to carry this information. Not
> providing this field explicitly from upper layers means that there is no
> further constraint and the default spi device maximum speed will be
> carried instead. The SPI_MEM_OP() macro is also expanded with an
> optional frequency argument, because virtually all operations can be
> subject to such a limitation, and this will allow for a smooth and
> discrete transition.
>
> For controller drivers which do not implement the spi-mem interface, the
> per-transfer speed is also set acordingly to a lower (than the maximum
> default) speed, or 0, to comply with the current API.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
[...]
>  /**
>   * struct spi_mem_op - describes a SPI memory operation
>   * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> @@ -95,6 +98,9 @@ enum spi_mem_data_dir {
>   *		 operation does not involve transferring data
>   * @data.buf.in: input buffer (must be DMA-able)
>   * @data.buf.out: output buffer (must be DMA-able)
> + * @max_freq: frequency limitation wrt this operation. 0 means there is no
> + *	      specific constraint and the highest achievable frequency can be
> + *	      attempted).
>   */
>  struct spi_mem_op {
>  	struct {
> @@ -132,14 +138,17 @@ struct spi_mem_op {
>  			const void *out;
>  		} buf;
>  	} data;
> +
> +	unsigned int max_freq;

So we limit the maximum frequency to roughly 4.2 GHz. Seems reasonable,
considering the top end NOR flashes do up to 200-300 MHz.

Didn't look too closely at the code but the idea seems good to me.

Acked-by: Pratyush Yadav <pratyush@kernel.org>


-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
