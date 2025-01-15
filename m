Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9817C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6rk4byzPb4e2QiuupwHLDO2ps9RKW83CQSI0pDhL9Y=; b=tloBJEtNyQe6Ww
	v298dgMJDa0Gji9rklyyMKCdp5rGl6c0SPEXxYyO4jCP7tQ7YH1g9Fm10Xnnbkd5oAhCRkXAbCQBy
	+liqMi3CCBcf9CCdRHMTEB+sRhUDlUhUqboWtXVClvByzSazpKnz0bEk9+wtUJFRvfpP3QKFQzC6V
	Q+pb7EHLitiYWeO/Qox+Nv9zvU1PwT3ohZEeam8+jAZpIvbpMphTEZyyUoL9VAoulrJJ4rQywXyIW
	TrHeRTxoPeCUt2WT/pg2ideImCrjdf1W6MOO2kSi6ETQ0w5PeYs6bU1hJEfVelvqVex015uvGfmyA
	v5lRF7QQTASgwyRadPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0yN-0000000BZZv-0k7n;
	Wed, 15 Jan 2025 10:50:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0yJ-0000000BZZT-42yG
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 10:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2FB15C5507;
	Wed, 15 Jan 2025 10:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FE9C4CEE1;
	Wed, 15 Jan 2025 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938203;
	bh=kmRUx+T9z5hOdY53lps5YelMiPZ/R3uuXcRBKA9ZxK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P1HrxVrfTQ7oAQTq/YgYe8rkzguo/akbWeQxglq7lPnPMITTwkI6MIDhTTzhRbnbS
	 MzCNHtH5KDBrI/O1rVFWYO/uBayzC2uX8kxdSS0VTE3SVBNI5p8JYZJqr5yVb5m+03
	 jno6V7THXeB1Lr6vNDHmbUFxwCmtDk0Qgjj327Xnzmfb2F5+eNCaevuNTZoosYtVIo
	 4/JVcts/92iteghjbsNYtVLSKUTfnBDlo9TbHyKOMIseyvH6ezHeDgbOENP9QMgCHF
	 yvsEu0XDYD5+WYmTq/U8jBzfyBTppMA8a52T5YoMUTW7faLJ640a1VcgHo6q10zTNA
	 O29JUl3g+xA2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Cheng Ming Lin <linchengming884@gmail.com>,  Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from
 addr to data"
In-Reply-To: <878f66c3-83a4-4f83-88d8-ea2917d82d76@linaro.org> (Tudor
	Ambarus's message of "Wed, 15 Jan 2025 10:29:25 +0000")
References: <20250115101659.55882-1-pratyush@kernel.org>
	<878f66c3-83a4-4f83-88d8-ea2917d82d76@linaro.org>
Date: Wed, 15 Jan 2025 10:50:00 +0000
Message-ID: <mafs0cygo5p2f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_025004_091176_1FDB5A3B 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Jan 15 2025, Tudor Ambarus wrote:

> On 1/15/25 10:16 AM, Pratyush Yadav wrote:
>> This reverts commit 98d1fb94ce75f39febd456d6d3cbbe58b6678795. The commit
>
> "The commit" on a new paragraph please

ACK, will do when applying.

>
>> uses data nbits instead of addr nbits for dummy phase. This causes a
>> regression for all boards where spi-tx-bus-width is smaller than
>> spi-rx-bus-width. It is a common pattern for boards to have
>> spi-tx-bus-width == 1 and spi-rx-bus-width > 1. The regression causes
>> all reads with a dummy phase to become unavailable for such boards,
>> leading to a usually slower 0-dummy-cycle read being selected.
>> 
>> Most controllers' supports_op hooks call spi_mem_default_supports_op().
>> In spi_mem_default_supports_op(), spi_mem_check_buswidth() is called to
>> check if the buswidths for the op can actually be supported by the
>> board's wiring. This wiring information comes from (among other things)
>> the spi-{tx,rx}-bus-width DT properties. Based on these properties,
>> SPI_TX_* or SPI_RX_* flags are set by of_spi_parse_dt().
>> spi_mem_check_buswidth() then uses these flags to make the decision
>> whether an op can be supported by the board's wiring (in a way,
>> indirectly checking against spi-{rx,tx}-bus-width).
>> 
>> Now the tricky bit here is that spi_mem_check_buswidth() does:
>> 
>> 	if (op->dummy.nbytes &&
>> 	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>> 		return false;
>> 
>> The true argument to spi_check_buswidth_req() means the op is treated as
>> a TX op. For a board that has say 1-bit TX and 4-bit RX, a 4-bit dummy
>> TX is considered as unsupported, and the op gets rejected.
>> 
>> The commit being reverted uses the data buswidth for dummy buswidth. So
>> for reads, the RX buswidth gets used for the dummy phase, uncovering
>> this issue. In reality, a dummy phase is neither RX nor TX. As the name
>> suggests, these are just dummy cycles that send or receive no data, and
>> thus don't really need to have any buswidth at all.
>> 
>> Ideally, dummy phases should not be checked against the board's wiring
>> capabilities at all, and should only be sanity-checked for having a sane
>> buswidth value. Since we are now at rc7 and such a change might
>> introduce many unexpected bugs, revert the commit for now. It can be
>> sent out later along with the spi_mem_check_buswidth() fix.
>> 
>> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Closes: https://lore.kernel.org/linux-mtd/3342163.44csPzL39Z@steina-w/
>
> fixes tag please

Hmm, I thought a fixes for a revert might be pointless since we have the
commit hash in the message anyway. I don't have a strong opinion, so
will add the below when applying:

Fixes: 98d1fb94ce75 ("mtd: spi-nor: core: replace dummy buswidth from addr to data")

>
> with that:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
