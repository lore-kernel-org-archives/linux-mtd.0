Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C77C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFkYNmMPODgaJhgXSX0nsSNMdTXyCxOs1mw3ooEoTxo=; b=ZJS4LsbZpuHTPJ
	OKPXWJ7MlmB+sBOiyw4gIA7ymBqcuyClmsw232ZuU4gkzmh8NS5pc7WQ6N4Qc6A0U9f2erf4t69Gz
	ViB0lkzfO/VO+ufy3+S4zNR+eIzm2nUE18uK7PIpFRgUIHGZ+AsqLh/7ePEsX4GbQOXGmzL1AroF3
	b0n2pbJAqFxTyZ7SFSlKkLY2I1Mt/4PCcb5HZZTbgbowmPaUi0fVJTreWkzGAaNBOnkZtplH9kRfo
	Jrw44TiFKH1XXrCxwp0iOqL4ddFEwWAfrcTGKxKRscwt4+SYl/mLbBniljU++6ZEwW4utaRpMV59U
	4Sa6eoAhivbig7y1Spiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9o9v-004Xrk-Cg; Mon, 26 Dec 2022 14:08:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9o9r-004Xpp-QP
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 14:08:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3155060E9F;
	Mon, 26 Dec 2022 14:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0ABC433EF;
	Mon, 26 Dec 2022 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672063730;
	bh=WgE3wZgAHUl/gKyjp23JER88T1526mBiE0T1Iykkz38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taJyy+s7uK/lD3YOByTJxjLKteXyIUD5+wDENClcCWSBIx4BiySdI1K01uDfcjVQY
	 ARx+0vB01R0os4X3dWrhUb6JXbnGBlTgRnkJfVThQHxu519jGCEI9lsBa32MxWNyqm
	 RkZWxSneFA52MNp7PpjNohlFfNBFEOzRxVT+PNCdo4QpdMNvtJsk8RMpNvheDiYE8w
	 ETb+BFHhNE0i2t8dRQOx0YM7omXLRPFYbz4zsUFX4aAm11ECFr6O7L5X+y9uMxPmik
	 XtBycNVsMd9SPOjOM+ogM6VhoIFX5qT9aY/gswfjs86/1zHZSwEQ/Xpz7g/e2qx7Oa
	 j+S6IVU0RrxVA==
Date: Mon, 26 Dec 2022 15:08:45 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
	michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to
 SFDP_DWORD()
Message-ID: <20221226140845.nhvjxkceg4665kaq@yadavpratyush.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
 <e42feac840fe3a31187419e91b2d514d9f259d15.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e42feac840fe3a31187419e91b2d514d9f259d15.1672026365.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_060852_071533_23BF7C71 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On 26/12/22 01:01PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> BFPT_DWORD() converts 1-based indexing to 0-based indexing for C arrays,
> and is used in BFPT parse. Per JESD216F.02, the conversion is applicable
> to other parameter tables than BFPT. This patch renames the macro to
> SFDP_DWORD() so that we can use it for other parameter tables than BFPT.
> 
> Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
