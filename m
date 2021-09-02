Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EE4C432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 09:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3192D60FE6
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 09:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3192D60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91qN6NZpFhqXTzwOBb0YnGsGi0TYJ1UCVFlB1lMXkz4=; b=ZSI0MN1IaV9LNk
	l+e0fatGu1d0GYerOsdDNQZ59E2NRfFXaZs8dXVghkCSEWwO9/2vztC9tCtHs4F1glYfd0I0bgNjb
	Pn2I/i0BU+qHW0rqxf8Q8n9+3zzx0Dj+4TR/FGJ8jnj1hbSExVZ+puGSZJ+RI0w7aCs8nRhVRYPE/
	YAwHbj/jgbeaZYC2yMh1iM8IT9v1I4cY6qJIE3DOPeO9W9Z3y/OXAlf8bfVouduwR2cgZmJSXr/p5
	20BSV5rkbhQJoe3pdbeaVFqyY9sqX0d1QXsiq1teObu6ujo464Pqynf2f5HamwHt8cJM0gEMpPOy3
	WS6G78pb9ZUjj6kgb0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLiqs-0093jc-7X; Thu, 02 Sep 2021 09:17:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLiqn-0093iw-Kb
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 09:17:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEA9C60FE6;
 Thu,  2 Sep 2021 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630574256;
 bh=k+p+COLdCn00GYtaVT9P/WwwAYDhVRDB8CAIAw6yoms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n1Xe3/ZvbnEU4ZfeoQNpf1mgJS3OXI+wINpG8dGxyqXJL+E1bILWp5dCVcwSyIUEB
 m8JW+eD5fPi2snq0qhOP46mqCSCutArczb6KC3gUkVyxnuABIX1ExmOjVnDfBlgZ1E
 GYZg4uOW8cnC0jk6k2AljGulapEtRvGhOdct47wAm5GzHhJqn/GFS47SksK3umm954
 JTtG4DzFSvuHiPQe5A2HTkIvHpLMCzv0TXhMx2lWZF5HUx1qR/2gu4A0q4bJkWpbVN
 Q5EKjq39n3Btf/zwqUvrWC9odv9H/9Wq5V9Bc8buWgHo6/5pM5ouYaKJYJ8PqUtydI
 VdTp30wXdpkbw==
Date: Thu, 2 Sep 2021 14:47:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V4] mtd: rawnand: qcom: Update code word value for raw read
Message-ID: <20210902091730.GA10844@workstation>
References: <1630561763-18486-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630561763-18486-1-git-send-email-mdalam@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_021737_774361_D05AF2B1 
X-CRM114-Status: GOOD (  24.43  )
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

On Thu, Sep 02, 2021 at 11:19:23AM +0530, Md Sadre Alam wrote:
> From QPIC V2 onwards there is a separate register to read
> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
> 
> qcom_nandc_read_cw_raw() is used to read only one code word
> at a time. If we will configure number of code words to 1 in
> in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
> its reading the last code word, since from QPIC V2 onwards
> we are having separate register to read the last code word,
> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
> register to fetch data from controller buffer to system
> memory.
> 
> Fixes: 503ee5aa ("mtd: rawnand: qcom: update last code word register")

Commit hash should be of 12 digits.

> Cc: stable@kernel.org
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
> [V4]
>  * Added commit message
>  * Added changelog
> 
>  In commit 503ee5aa added QPIC V2 support. Since QPIC V2 onwards there
>  is separate register to get last CW data. If total number of CW configred is 1 
>  then , QPIC controller treat this as last CW and software shhould copy data to memory
>  via QPIC_NAND_READ_LOCATION_LAST_CW_n register instead of QPIC_NAND_READ_LOCATION_n.
>  Since in raw read we are configuring total number of CW 1, this change fixes
>  this if total number of CW 1 then make this as last CW.  raw_cw = ecc->steps - 1;
>  since ecc->steps holds total number of CWs.
> 

This is not a changelog. Changelog should mention what has been changed
between versions from v1 to v4. For example:

Changes in v4:

* Incorporated AAA comments from X
* Changed a local variable

Changes in v3:

* Incorporated BBB comments from X

Changes in v2:

* Incorporated CCC comments from X

>  drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index ef0bade..04e6f7b 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1676,13 +1676,17 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	int data_size1, data_size2, oob_size1, oob_size2;
>  	int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
> +	int raw_cw = cw;
>  
>  	nand_read_page_op(chip, page, 0, NULL, 0);
>  	host->use_ecc = false;
>  
> +	if (nandc->props->qpic_v2)
> +		raw_cw = ecc->steps - 1;
> +

Sorry, I don't understand how it can work. For reading a codeword like
0, you are reading the last codeword here if the controller is v2. And
you'll continue to read the last codeword only for any codeword
requested :/

Thanks,
Mani

>  	clear_bam_transaction(nandc);
>  	set_address(host, host->cw_size * cw, page);
> -	update_rw_regs(host, 1, true, cw);
> +	update_rw_regs(host, 1, true, raw_cw);
>  	config_nand_page_read(chip);
>  
>  	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
> @@ -1711,7 +1715,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
>  	}
>  
> -	config_nand_cw_read(chip, false, cw);
> +	config_nand_cw_read(chip, false, raw_cw);
>  
>  	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  	reg_off += data_size1;
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
