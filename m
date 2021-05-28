Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FE4C2B9F7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 13:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40FA9613B6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 13:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40FA9613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nM17moS9s+pLbeSLl7WJ8Eys4U41z6dnJ95O3iz63g=; b=GDSaFeGY+fIhL4
	2feT17Cr/b2+F+pjYai8oUANGbDGB3mRHIN2dZFZEL13Z4gr6rKZT06fVBufwxNPzXvCrPN+RgyGA
	VwriBPPdTg2Y7QLn1ZBL3UFn26A9/ktch3YuLJI63wN+nG3dJYcZsYcR+lNkXgR8LBSlzt9HZWQvK
	j5HumZBXB/xTdJXihbJzSwFyQ0z/30I7AOaXVZVcvdu0gyUat6Anrd5t9+Y+gsfMd4WydQC4+PpDN
	7+paFAyqQX8YMnoo527Lp0nS8rtby934W0b0Y2ysNEoZoyC77plOIEk1/53b+60K5lUANJOKsLiZX
	8kLxDxP1L4EA9KEJ5A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmciP-00FqY2-82; Fri, 28 May 2021 13:39:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmcMS-00Fhr0-Nh; Fri, 28 May 2021 13:17:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SDH1rJ008626;
 Fri, 28 May 2021 08:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622207821;
 bh=KF6yZbuvWoHQNXUVivVR6Y1MSRapQUxyWpoZwH2+GjY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Uwy0HDIeILYv0B1lXoif0bl02X6s/PIF6ef/Fi771FifGNgQGtEfITIKzG7JkqjdK
 qKETZmKMxETgSB3fXzB9b2IsRWe2/xX1O4B0Bw6KZ0+xUri8ot1rGc4fJBcsKFIkdq
 c0Tw3M1kFzJH7f1SrHhSQuBj0vteCLoxQUIeIAHg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SDH1Y1086672
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 May 2021 08:17:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 08:17:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 08:17:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SDH0YE057370;
 Fri, 28 May 2021 08:17:01 -0500
Date: Fri, 28 May 2021 18:47:00 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v3 3/3] mtd: spinand: add SPI-NAND MTD resume handler
Message-ID: <20210528131658.jtveyvdtxrwj2lgx@ti.com>
References: <20210527161252.16620-1-patrice.chotard@foss.st.com>
 <20210527161252.16620-4-patrice.chotard@foss.st.com>
 <20210528120508.f6viglv3gkzgweqq@ti.com>
 <3238725c-d7ff-c000-23d1-f18298e1556f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3238725c-d7ff-c000-23d1-f18298e1556f@foss.st.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_061712_943068_88498F27 
X-CRM114-Status: GOOD (  34.61  )
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

On 28/05/21 02:51PM, Patrice CHOTARD wrote:
> Hi Pratyush
> 
> On 5/28/21 2:05 PM, Pratyush Yadav wrote:
> > On 27/05/21 06:12PM, patrice.chotard@foss.st.com wrote:
> >> From: Patrice Chotard <patrice.chotard@foss.st.com>
> >>
> >> After power up, all SPI NAND's blocks are locked. Only read operations
> >> are allowed, write and erase operations are forbidden.
> >> The SPI NAND framework unlocks all the blocks during its initialization.
> >>
> >> During a standby low power, the memory is powered down, losing its
> >> configuration.
> >> During the resume, the QSPI driver state is restored but the SPI NAND
> >> framework does not reconfigured the memory.
> >>
> >> This patch adds SPI-NAND MTD PM handlers for resume ops.
> >> SPI NAND resume op re-initializes SPI NAND flash to its probed state.
> >>
> >> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >> ---
> >> Changes in v3:
> >>   - Add spinand_read_cfg() call to repopulate cache
> >>
> >> Changes in v2:
> >>   - Add helper spinand_block_unlock().
> >>   - Add spinand_ecc_enable() call.
> >>   - Remove some dev_err().
> >>   - Fix commit's title and message.
> >>
> >>  drivers/mtd/nand/spi/core.c | 33 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>
> >> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> >> index 1f699ad84f1b..e3fcbcf381c3 100644
> >> --- a/drivers/mtd/nand/spi/core.c
> >> +++ b/drivers/mtd/nand/spi/core.c
> >> @@ -1099,6 +1099,38 @@ static int spinand_block_unlock(struct spinand_device *spinand)
> >>  	return ret;
> >>  }
> >>  
> >> +static void spinand_mtd_resume(struct mtd_info *mtd)
> >> +{
> >> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> >> +	int ret;
> >> +
> >> +	ret = spinand_reset_op(spinand);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	ret = spinand_read_cfg(spinand);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	ret = spinand_init_quad_enable(spinand);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	ret = spinand_manufacturer_init(spinand);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	ret = spinand_block_unlock(spinand);
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	spinand_ecc_enable(spinand, false);
> >> +}
> >> +
> > 
> > I don't think you quite get what me and Miquel are suggesting.
> > 
> > The helper should call all these functions like read_cfg() 
> > quad_enable(), etc. So it should look something like:
> 
> Yes, this series was sent too quickly on my side, and i misunderstood 
> what you suggested, sorry for that.

Ah, I thought this was the v4. I see Miquel clarified already in reply 
to this patch.

> 
> > 
> > int spinand_init_flash()
> > {
> > 	ret = spinand_read_cfg(spinand);
> > 	if (ret)
> > 		return;
> > 
> 
> The new helper spinand_read_cfg() must not be called in spinand_init_flash()
> but directly in spinand_resume().
> This because spinand_read_cfg() only performs a REG_CFG read without doing the
> memory allocation of spinand->cfg_cache.
> 
> In spinand_init(), spinand_init_cfg_cache() must be called as previously as it does spinand->cfg_cache
> memory allocation and call the new helper spinand_read_cfg(). 
> Then after, spinand_init_flash() can be called.

I think it would be simpler for spinand_init_cfg_cache() to just 
allocate the spinand->cfg_cache array and then for spinand_init_flash() 
to call spinand_read_cfg().

> 
> > 	ret = spinand_init_quad_enable(spinand);
> > 	if (ret)
> > 		return;
> > 
> > 	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
> > 	if (ret)
> > 		return;
> > 
> > 	ret = spinand_manufacturer_init(spinand);
> > 	if (ret)
> > 		return;
> > 
> > 	ret = spinand_block_unlock(spinand);
> > 	if (ret)
> > 		return;
> > 
> > 	spinand_ecc_enable(spinand, false);
> > }
> > 
> > Then spinand_mtd_resume should look something like:
> > 
> > int spinand_mtd_resume()
> > {
> > 	ret = spinand_reset_op(spinand);
> > 	if (ret)
> > 		return;
> > 
> > 	return spinand_init_flash();
> > }
> > 
> > And spinand_init() should look something like:
> > 
> > int spinand_init()
> > {
> > 	...
> > 	spinand->oobbuf = ...
> > 
> > 	spinand_init_flash();
> > 
> > 	spinand_create_dirmaps();
> > 
> > 	...
> 
> As explained just above, spinand_init() will look like :
> 
> int spinand_init()
> {
> 	...
> 	spinand->oobbuf = ...
> 
> 	spinand_init_cfg_cache();     => perform cfg cache memory allocation and read the REG_CFG
> 
> 	spinand_init_flash();
> 
> 	spinand_create_dirmaps();
> 
> > }
> > 
> > 
> >>  static int spinand_init(struct spinand_device *spinand)
> >>  {
> >>  	struct device *dev = &spinand->spimem->spi->dev;
> >> @@ -1186,6 +1218,7 @@ static int spinand_init(struct spinand_device *spinand)
> >>  	mtd->_block_isreserved = spinand_mtd_block_isreserved;
> >>  	mtd->_erase = spinand_mtd_erase;
> >>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
> >> +	mtd->_resume = spinand_mtd_resume;
> >>  
> >>  	if (nand->ecc.engine) {
> >>  		ret = mtd_ooblayout_count_freebytes(mtd);
> >> -- 
> >> 2.17.1
> > 
> 
> Thanks
> Patrice

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
