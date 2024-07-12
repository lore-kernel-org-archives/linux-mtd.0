Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27FFC3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+y9L/jplbz2719yHbualYzJ3FpaH6y/UOvmcdBGmiA=; b=ANo6c3iuTKn92g
	fu07qglIHDHGqH9REMPrvE8Nhmd/2k2tB6mRIddxzenBR8uh4Q8FKa8CjrMw7n2yQ/cFLtLsS6VZy
	8hNRSS7083xT+H1OdrOkT1IJqYY4LaoJECnXTURMhYwsnrMu+IN+HJFxLpa9X1bokiWARtq9yL0ey
	T65hZEW0sqRkQLr730rvHxpcB9MiRkl6acmqliDljz7fwOgBeu4bjz/GMqbRrnAbx/6c7UBEqxadV
	p0uEprAh6ktZnTLjZGU+6So0njHvoGYKle57lww1tUObDUP90Fp0gkpdyeB8FD0A4JTodbVmx85nY
	BAjth37Y4nLIhGcU6WWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCVQ-0000000H4gj-26Oz;
	Fri, 12 Jul 2024 09:23:56 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCV7-0000000H4d3-2s6P;
	Fri, 12 Jul 2024 09:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=seUtUt8wtCgGSXRuO9f9GPjRFi6hmGW1WMrsIz6qVxU=; b=WFJLOz1yQ20NEyeLNqgA72tiOB
	6dxGB9k1aqHLI8c8KVeto+PtYNvWis27PowutcGqR3ID2PtB2b3xNYGjoxEDMKRmlrAyQTJxL+Pom
	AI8n2vYwDxJefTF2EB2OTmZXdF1hGkHJ9UomV0vty4mKhDOFZMMKPxxlwQbIqH673aDmk4RP6O6BJ
	wfDZuUvVn0db/4ENTgqh6tNVPt+7eVNB37NpOiuX20T3fAaBYYYJ4TAHaEPbEjCPQjqCy53WpoEer
	TXaf4OG9Kq0kD7xH4Q6cTsRq9m/VDk+AWFWwPMzx1LXSt2WkWnJlaFqpqdMNchsByF5cxpPKu4tSV
	Kh9BIz/w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sSCV4-000C7z-Ie; Fri, 12 Jul 2024 11:23:34 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sSCV3-000MXE-2k;
	Fri, 12 Jul 2024 11:23:33 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for
 optional SFDP parsing
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
	(Esben Haabendal's message of "Thu, 11 Jul 2024 15:00:14 +0200")
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
	<20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
Date: Fri, 12 Jul 2024 11:23:33 +0200
Message-ID: <874j8vvu96.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_022337_743709_985C9020 
X-CRM114-Status: GOOD (  17.91  )
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

Esben Haabendal <esben@geanix.com> writes:

> With all drivers converted to the new SPI_NOR_TRY_SFDP flag, we can remove
> the old deprecated mechanism for triggering optional SFDP parsing.
>
> New flashes must use SPI_NOR_TRY_SFDP to get this behavior. Hopefully, all
> new drivers will be fore pure SFDP flashes, so no or at least very few new
> users of this flag is expected.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/spi-nor/core.h | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dfc81716e068..f4a76f42051a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -719,24 +719,7 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
>   */
>  static inline bool spi_nor_try_sfdp(const struct spi_nor *nor)
>  {
> -	if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP)
> -		return false;
> -	if (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
> -		return true;
> -
> -	/* Deprecated/legacy way for triggering optional SFDP parsing.
> -	 * If one of the no_sfdp_flags indicating dual, quad or octal read is
> -	 * set, SFDP parsing will be tried.
> -	 * When all drivers have been converted to set SPI_NOR_TRY_SFDP where
> -	 * needed, this deprecated mechanism can be removed.
> -	 */
> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> -					SPI_NOR_QUAD_READ |
> -					SPI_NOR_OCTAL_READ |
> -					SPI_NOR_OCTAL_DTR_READ))
> -		return true;
> -
> -	return false;
> +	return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)

Sorry. Bad cherry-pick here. Due to other reasons, I am testing out of
tree :(  The missing semicolon will be added in v4.

I assume we can still discuss the idea here in this version.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
