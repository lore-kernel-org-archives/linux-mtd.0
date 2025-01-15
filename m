Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C538C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Em5f9XkxeFN2uE2qZUh9q68LX2vlLpo/YpmlOfsHT4=; b=ocKLOO3u9o986C
	795UxsEcUeF5p+vBPaX5UwXHZXo0/EIVnl/H98jZ92fST4X7dXpSUNKXEjluP6JIaFwJhkdxAJr0O
	/ynniGPzBrnXqBKnNmX+XSkk5hmwMRNqyURSJfoCAZOCIqbKnmGFe8L9HYlfRLEFFbHgkSCxW8MPw
	eMA1Xdrp3vaUGeb+On8Uym1myYpLRIg+tgXvWHjW3PPNkprj2VfqzmFn/OEGJR+rL0dL/NQ3vfnYq
	oWTGohFi4clkCuYeEwdTuaGcZuaZ/uxEeG2lwsJwkbdVDUIJnXBlcd8CQB1dYIyirh6AHAGooAyEh
	i5X9TjrXLIAzMp0mRuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0s7-0000000BYDv-2yFi;
	Wed, 15 Jan 2025 10:43:39 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0oG-0000000BXZD-3hcl
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 10:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736937581; x=1768473581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J/OWSjf0XNBEykGMNeRNXxNa+eHMYOtoVlDnXA5xfcs=;
  b=E2x/B4F4M1SSmTTYXRj8K80k57u/DRFDwd0U4rZiRje7F1BjLuzjiUqa
   IItuEVLBKsnUFEjeRVdsQROOYTvclmXFMEvNpUHUSvtKEud6MDePt3xQ3
   7uIo4Mc9aiioQFPHL61N+4/GP3Axs4CQvAu5sclVSCGBagnHvJaWG4vRD
   93myBCjq8iLeZRyoN0Kz8VrvUTAsfsSqXSb6dBmiVwyldFsWirXsumsft
   D6g9P9R3bIXeqXkoWo/qP/Ny9X+QVDp9qgB9seXki5YpKYsc9K+s27SAE
   viV4EOsJN3mX6tCXFzHm1tNaX5JrYKF+7oDzTU8hNPENKLx8jODb56OTS
   A==;
X-CSE-ConnectionGUID: sHz1iQjmR+WNHDLuc1DEHA==
X-CSE-MsgGUID: 6dS5h6sJT46CgKNhRlgYfw==
X-IronPort-AV: E=Sophos;i="6.12,317,1728943200"; 
   d="scan'208";a="41063859"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Jan 2025 11:39:37 +0100
X-CheckPoint: {67879069-1F-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 13FDA1A27EC9483961BD22B522224BCE_2
X-Control-Analysis: str=0001.0A682F18.67879069.00C5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 835D516878B;
	Wed, 15 Jan 2025 11:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736937573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/OWSjf0XNBEykGMNeRNXxNa+eHMYOtoVlDnXA5xfcs=;
	b=KkAuld1L2bu8S873gMPOTmV6cCjM0jHawBkHxkA+vJ8l5yTWxvsPwHU1IF9hYltoi4pdIx
	pLqUE7erXU8yTwHkFv1z01vuI+x1tpp55sY2khy2jHAblEpowW2pH8GYPJI6TmSfoBqV3N
	WeVsXRI0ATRMPq0bfnMZBjdsYKc4IpcRC2fwry7p0kTALeLnlyNf5hMERBc8EF1ggWTN2Q
	WRNRaz8VEUNfxln3DBGehd5w9BI0fmbCX3hbcPLIiZ2dwdhcA7/+NjS6V2KxQvOcOG//Ro
	Eb8i6JInRDqDDLfUXbQ5Iivb+H7xC2BhFqmBpwtJ4fIYyDtyAw+CtYYTfFy0sw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Cheng Ming Lin <linchengming884@gmail.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
Date: Wed, 15 Jan 2025 11:39:24 +0100
Message-ID: <2016480.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250115101659.55882-1-pratyush@kernel.org>
References: <20250115101659.55882-1-pratyush@kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023941_631859_4C3D2A74 
X-CRM114-Status: GOOD (  30.84  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 15. Januar 2025, 11:16:52 CET schrieb Pratyush Yadav:
> This reverts commit 98d1fb94ce75f39febd456d6d3cbbe58b6678795. The commit
> uses data nbits instead of addr nbits for dummy phase. This causes a
> regression for all boards where spi-tx-bus-width is smaller than
> spi-rx-bus-width. It is a common pattern for boards to have
> spi-tx-bus-width =3D=3D 1 and spi-rx-bus-width > 1. The regression causes
> all reads with a dummy phase to become unavailable for such boards,
> leading to a usually slower 0-dummy-cycle read being selected.
> =

> Most controllers' supports_op hooks call spi_mem_default_supports_op().
> In spi_mem_default_supports_op(), spi_mem_check_buswidth() is called to
> check if the buswidths for the op can actually be supported by the
> board's wiring. This wiring information comes from (among other things)
> the spi-{tx,rx}-bus-width DT properties. Based on these properties,
> SPI_TX_* or SPI_RX_* flags are set by of_spi_parse_dt().
> spi_mem_check_buswidth() then uses these flags to make the decision
> whether an op can be supported by the board's wiring (in a way,
> indirectly checking against spi-{rx,tx}-bus-width).
> =

> Now the tricky bit here is that spi_mem_check_buswidth() does:
> =

> 	if (op->dummy.nbytes &&
> 	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> 		return false;
> =

> The true argument to spi_check_buswidth_req() means the op is treated as
> a TX op. For a board that has say 1-bit TX and 4-bit RX, a 4-bit dummy
> TX is considered as unsupported, and the op gets rejected.
> =

> The commit being reverted uses the data buswidth for dummy buswidth. So
> for reads, the RX buswidth gets used for the dummy phase, uncovering
> this issue. In reality, a dummy phase is neither RX nor TX. As the name
> suggests, these are just dummy cycles that send or receive no data, and
> thus don't really need to have any buswidth at all.
> =

> Ideally, dummy phases should not be checked against the board's wiring
> capabilities at all, and should only be sanity-checked for having a sane
> buswidth value. Since we are now at rc7 and such a change might
> introduce many unexpected bugs, revert the commit for now. It can be
> sent out later along with the spi_mem_check_buswidth() fix.
> =

> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/linux-mtd/3342163.44csPzL39Z@steina-w/
> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> ---
> =

> I have only compile-tested this patch. Alexander, if you can send your Te=
sted-by
> it would be great!

Sure, thanks also for the great and lengthy explanation.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Miquel, since the bug was introduced in v6.13-rc1, I want to have this pa=
tch go
> in v6.13. So you would have to send Linus a pull request before he likely
> releases it this Sunday. How do you want to take the patch? Do you want t=
o apply
> it directly to mtd/fixes or should I send out a pull request from a
> spi-nor/fixes branch?
> =

>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 66949d9f0cc5a..b6f374ded390a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  		op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
>  =

>  	if (op->dummy.nbytes)
> -		op->dummy.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> +		op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(proto);
>  =

>  	if (op->data.nbytes)
>  		op->data.buswidth =3D spi_nor_get_protocol_data_nbits(proto);
> =



-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
