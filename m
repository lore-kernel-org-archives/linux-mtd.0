Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD97DE77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9GmdgXba9xKm5mIx+nuen3lr63w5QW/uGjr5MMLjpI=; b=fBpBs07VeoTXtI
	o95Gw57d3FwG6rDvcgOrBP1mWxWpSBRpPcAN3shrMnereR/3nHkoLQ3EIN7KyJeWBMaOjkha9tYD9
	HfRpOEalt3qU/LQdzQPBZxI25RIznYFsWIFF54Z4oEI5X7u/Brx5xIvoFb3x1oskjeft+lM6iJuzo
	ij1s7znitn2pYG11H2tnVFUnpjcre8/8104udQXuRtpeKbPEkJSAAmk8GyVUD8cpmNQYR8sSPPlBq
	KRsLk5a1hK7U611i5cTvfmjEDFymEMApZ+KuD3Hw42V4jM6J4sA436RceMAWyWT6T78l68De0bAya
	YUBqacAdMTTHNkvi0Jcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaH9-00000001z30-0B38;
	Fri, 06 Dec 2024 15:29:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaG6-00000001yy6-28DQ;
	Fri, 06 Dec 2024 15:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E277AA403F2;
	Fri,  6 Dec 2024 15:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1952C4CEDE;
	Fri,  6 Dec 2024 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733498925;
	bh=75VoOWoRJIKu6T8F6k92wIh/D91+NMx6NbfhF3/ourI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LUmrYELUfO1OT9T4glnELW2f/9s2IjjaLgsD+dEv2yWustyBnzzjT9UTwUBrsVplB
	 yptbdtXbHmThJHdqGYYQFYWtxyBkrAlD+icDzvMu1d3S/b1LlOgrPIeu2PXQBI4A9W
	 kJ45I2OWzm/uzhm8y30Yc+hPoyDSi1vy08bvQ1Jwm1qpzEduJVyXYyxlkr3gP0JHOR
	 74eoDuMyAiJSFtb5cO8Mv8/DS4/7IZOLDSB67cui57yuV4G9ZLKaztdB00PrY5jKI1
	 bHw4U8kJ4YfNoxCexzErJu9sBfs3hrI+tk//9h7fODwQqDQwsdfCaXcF4kzwhadEgB
	 C526D4ovWRTCA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: atmel: add at25sf321 entry
In-Reply-To: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com> (Marcus
	Folkesson's message of "Sat, 16 Nov 2024 11:55:55 +0100")
References: <20241116-spi-nor-v4-1-3de8ac6fd0be@gmail.com>
Date: Fri, 06 Dec 2024 15:28:42 +0000
Message-ID: <mafs0bjxo4yqd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_072846_605918_A5AE337D 
X-CRM114-Status: UNSURE (   7.32  )
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

On Sat, Nov 16 2024, Marcus Folkesson wrote:

> Add entry for the at25sf321 32Mbit SPI flash.
>
> This flash is populated on a custom board and was tested at
> 10MHz frequency using the "ti,da830-spi" SPI controller.
>
> Link: https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
