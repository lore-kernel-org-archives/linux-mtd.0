Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EE9E7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtX4/XrRh7kGDLguxy1pARnqUoh/09s/nA+wmm5WV48=; b=WsBAximHbe/MsJ
	s+ejeRxYq8IVRl3Op3MjKL7L9RBB3crYQU/qHd+PCNsvpn5Jchmig66+Goy3onZdCXHV6ndcFEmms
	cEYDGU4mqff7Vbu++8dR9FzsGuwYY8O+yEbYe1BYf9aC2ofVkzlLgQybH0CBbaX+jMsqoSbHMJpiN
	GXFmHWPuel1E4cYCCL+tLTeUW1gori0ItpgZmn7iLrbhlyUMLhBERbRrSr18YGw2sqTBFLxPN85hE
	gk6Fa0vKbroC/TB38wiVxj0Gatmk7T1VOV6K6Hscl/sXuPuAQlyZ2kCTV0p9Vt9zHzAD/BVp8d575
	JiiqNw6Qau669L4/35ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfuV-00000009o9J-46Wx;
	Mon, 23 Dec 2024 10:43:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfuT-00000009o8k-30b0
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 10:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45E2A5C57FB;
	Mon, 23 Dec 2024 10:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65946C4CED6;
	Mon, 23 Dec 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734950616;
	bh=BafwGgpb0v2NHuqlcPPFCrAI2l+jiEUl4dTXxGW7f+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sIr1sX9SqTNjpDVL1ZJhGAyU/A4Gt+nHbX2cP5g/hR5gVI4TnOCPCz6gRAzzjj0rj
	 xMp0PGFecuuYTu8UFzTJSr/x+/xc5kGsDCEljQb9Zo9CheG1ZWRqAuDQBZoTyiQgGE
	 IHE4QLmGlazLdrcxxXsk2HjMccPwU4piVWah7J+VW6uYsZ0Aa1MhxXHFAiAm2zN3ZL
	 Kr9by7hBtjeK2vfAl1WmRUw/GgyFIMxSeCStCGvRYaqSZKn0djY41/e0CYPhlmLIPB
	 qrLT1XULnna2Lnkm/tM/9zd3JnFjQMbQFy3qibgjsTsZyWDiVcLxCROxsYAnyaIQpn
	 euap8pob1AWVg==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Add support for S28HL256T
In-Reply-To: <f052b04693f1100e725e076fd8a0ae339f8002c4.1734588106.git.Takahiro.Kuwano@infineon.com>
	(tkuw's message of "Thu, 19 Dec 2024 16:06:15 +0900")
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
	<f052b04693f1100e725e076fd8a0ae339f8002c4.1734588106.git.Takahiro.Kuwano@infineon.com>
Date: Mon, 23 Dec 2024 10:43:34 +0000
Message-ID: <mafs04j2u8ysp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_024337_810208_1597E5CA 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, Dec 19 2024, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Infineon S28HL256T is 3.0V, 256Mb Flash device with Octal interface.
> It has the same functionalities with S28HS256T(1.8V).
>
> Link: https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_Flash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c8fc2dd9c018fc66787aa0657
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
[...]
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 5a88a6096ca8..f8d8a908c92e 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -957,6 +957,10 @@ static const struct flash_info spansion_nor_parts[] = {
>  		.name = "s25hs02gt",
>  		.mfr_flags = USE_CLPEF,
>  		.fixups = &s25hx_t_fixups
> +	}, {

Even though we don't add name for new flashes in the flash_info, I think
it is still a good idea to have a comment above an entry for which
flash(es) it is for. This would make it easy later to track down more
information about a particular entry.

So unless someone objects, I will add a comment above the flash entry
with the name of the flash in both patches before applying.

> +		.id = SNOR_ID(0x34, 0x5a, 0x19),
> +		.mfr_flags = USE_CLPEF,
> +		.fixups = &s28hx_t_fixups,
>  	}, {
>  		.id = SNOR_ID(0x34, 0x5a, 0x1a),
>  		.name = "s28hl512t",

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
