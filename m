Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC29CCD199
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtMaSlylQw/ASWx/XKDtIw02UyV4fL9t4NRL8ihdeyI=; b=0SVvwW3fFWDyJU
	g76hdM8aoewAekEJzNqI8fqCZeXVwhnUeoHGRY385scuKh1fI78Fi35WPC6bo5m16B+iMOkB3YsJc
	OPukRIQ8eKOE+Oh51mT9Ncs7ZIHmNMPTBIXOVB0UGab7Fm8jI01QeScSzd9LkSAtRThzgyaCwSKRC
	XYAqVLeuST+TS7FtkWn8shlDEBuEoXRYHquNmzdF06xUXLhZMPOSdSmf39RtUCJbHcX3ldPemgA4e
	G1T61cnZ7ydtxpl6ifxjwKgBnpY9TnzkNcECANBd7RUpQT4PJzuPOxh30ZoZB3nvIMgM21YOaH43m
	WN4fZdwqem7ihiyD6KRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfs-00000008VCX-2KBo;
	Fri, 17 Oct 2025 16:51:28 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfm-00000008V7S-3yj5
	for linux-mtd@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cp9ng5HpGz9srJ;
	Fri, 17 Oct 2025 18:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jIKeB5CQhhRPKbeo1qJepeHkfAJbZnPhMPeHkZf6nQ=;
	b=BWF3yg54b3Lnhf2AJh2Zr+YdNBLmsxPtolOLfuJYp9ya/vYL4edsOiiP9K5g7R8IwJQz+w
	banMzejlrNxzfscA1LJQ05ybqG+oBwsO3u0/DMG7XBHXDunU89Bklym7OCizeBoHy8RrWK
	5/I2sZTJ+7Rhzx0wLb2gT3WQ2tGst1jqtMOoF7hgRu2zO6tnkw0c+/e5UC06ARjGnpfvWl
	ycSRgOV9gfGzVNUmH9ALoLZWEPL4MFyw26NVaC0t4pSeAKRqCbkRetHJe8TXkqYL/oP7YF
	IU31I1EXb1dMvcINvSq4XfUb8TTmCESfsLrp/I5E3PjBFwMPWgm7aF4SBEspjA==
Message-ID: <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
Date: Fri, 17 Oct 2025 18:04:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
X-MBO-RS-ID: fd004e20aedda8e2407
X-MBO-RS-META: 6mzo15prrcdzk15kadqathdwyffz8kmb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095123_133252_ED9B8277 
X-CRM114-Status: GOOD (  15.08  )
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

On 10/13/25 5:41 PM, Tudor Ambarus wrote:

Hello Tudor,

>>> The "Index Value" shall be the map_id that you passed in the code:
>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>
>>> Can you please print the map_id value that you obtain without updating it?
>>
>> 0x4
> 
> This translates to CR3NV[3] = 1, CR1NV[2] = 0,  CR3NV[1] = 0.
>>
>>> Let's also print the values of CR3NV and CR1NV.
>>
>> Both 0x0 and 0x0 .
> 
> But here CR3NV is 0, it contradicts the result from above.

Maybe I messed up and was reading it the wrong way ?

> Maybe it's the same problem that Takahiro identified: the flash needs
> 8 dummy cycles, but the code uses zero dummy cycles, resulting in
> reading garbage data, depending on whether your IO lines are pulled up/down
> or floating.
> 
> Can you redo the test with the following please?

Sure, although I saw some further discussion between you and Kuwano-san 
, is this still applicable ?

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 21727f9a4ac6..85443c903e59 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -752,7 +752,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>   
>                  read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>                  nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
> -               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
> +               nor->read_dummy = 8;
>                  nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>                  addr = smpt[i + 1];
>   
> @@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>                   * Configuration that is currently in use.
>                   */
>                  map_id = map_id << 1 | !!(*buf & read_data_mask);
> +               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
> +                       i, buf[0], map_id);
>          }
Sorry for the late reply.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
