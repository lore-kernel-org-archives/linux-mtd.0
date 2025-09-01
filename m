Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A89DCA1000
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CusLr2PrW7gDEqIbAMFIbB6RSXx7wxXKRdChSvoYZZ8=; b=NdoknyjUVAsPXv
	NmtcPQDcYFFomp0VhjVIRVPzNLC72Q+Ddz5AIsz8P1S18dvV/KqjI7o0F/UbKyR27UOBUXu2Nqrq+
	w0z9076iNKnHhEf8T5vpyGCSVNS+r+mfsPkwLj3J43IxnQDRtGRfPoOqtdci6TfFKeMoNFA/WH+L6
	/P2/cHcNHCSyu2979AY54Ew6a7UJJo8Dc1W68xrIrrgqseux7H+kIeCFvWfQSBDt7+gDSc6kARze8
	NRTC4FY0+l2kXEDeUJ4xXLuf2v9CYM9p5617t3MObP6TUrrvvEeu/WK4/G2XDo1K2jIZQBBWoZd8K
	xjbZ3mGYFxZKUOYhNP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8o9-0000000DVyw-2NNr;
	Mon, 01 Sep 2025 17:59:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5nJ-0000000Csav-1EUv
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B71A4601D9;
	Mon,  1 Sep 2025 14:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0F3C4CEF0;
	Mon,  1 Sep 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756737964;
	bh=ZrNzwXNncDL86GfmLbWuXvCxIbI5rWoZy2g5xqi4krA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iSAGrgwyNYtJJ+TBwt2fE26A8jleq1ST5wfxXZnXaI1NXMFcM2HHbfWsWIPzNQGuD
	 Ub4wl9PTGwgYOMY/iS9zRPhUZyItyOGXN2JTuvHq24l4OosOlDoBEPSAwBeMOAX3oO
	 GkzphnqXeatAnfgKFpaunR0deD08GflqxikFP7jZv+6MUlzPUe2597yS+SizgWkLeH
	 ppX2RwCpO13B1pdN85g2bYITyjSdnzQ1QZwGm+oD/u7zKnSK9ORoI+pOz9naO7QuqO
	 LTiMacrehy3C7ngdgqNh6pbQTR5b0UXrT23ccAiNgEoWagGOYnliRl46bIWFgZDNA4
	 o7eu89F3mnBmQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Maarten Zanders <maarten@zanders.be>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
In-Reply-To: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
References: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
Date: Mon, 01 Sep 2025 16:46:02 +0200
Message-ID: <mafs0plcaw7rp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi,

On Fri, Aug 22 2025, Maarten Zanders wrote:

> Hi all,
>
> On the Macronix MX25L12833F (ID 0xC22018) & others of this family/mfg,
> the CR (condition register) must be read with opcode 0x15. The driver
> currently uses 0x35, which the chip does not recognize.

Is it one of those devices for which Macronix has re-used the flash IDs?
I vaguely recall reading that somewhere. If so, then we also need to be
careful of breaking the older variants of the flash.

>
> Datasheet: https://www.macronix.com/Lists/Datasheet/Attachments/8934/MX25L12833F,%203V,%20128Mb,%20v1.0.pdf
> (p.27, RDCR).
>
> With 0x35 the data line floats and the driver reads CR as 0xFF
> (depending on previous state of the line or pull up/down). This value
> is then written back in spi_nor_write_16bit_sr_and_check(), setting CR
> to 0xFF. One consequence is flipping the OTP Top/Bottom protection
> bit, so from then on, locking the top block actually locks the bottom
> sector. This breaks bootloader updates (in my case) and similar flows.
>
> Possible fixes:

Is it at all possible to discover the opcode from the flash SFDP table
(SCCR map perhaps)? If so, I think that would be the best way forward
since it would be generic.

There is the SNOR_F_NO_READ_CR flag that seems to do what you want. In
spi_nor_write_16bit_sr_and_check(), if the flag is set it does not issue
the read CR command and either sets the second byte to 0 or to
SR2_QUAD_EN_BIT1. The flag can be discovered via BFPT (see
spi_nor_parse_bfpt()). Is the BFPT table on the flash incorrect? In that
case, perhaps we should add a post-BFPT fixup?

> - Make CR read opcode configurable per device.
> - Force Macronix parts to 8-bit SR accesses (clear SNOR_F_HAS_16BIT_SR).
> - Implement T/B bit handling for Macronix (needed for already-fielded
> devices with flipped OTP bit, but complicated by non-uniform
> protection blocks).
>
> What would be the preferred approach? Other ideas? Anyone seen similar
> with Macronix parts?
> A quick fix which can be backported easily and the full implementation
> later on would be beneficial IMHO.
>
> Thanks,
> Maarten

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
