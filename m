Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE12C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 19:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D672221D56
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 19:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I333u4bB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D672221D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/3ykgobWqO6v+DQjFKQ0svXl/+WcGfxZnMkQ1A0vgY=; b=I333u4bBGsefC9
	ZIODmyXv6v7diTx6WucyJ47VhSQwTOZ3WMkIbgxNtwaohcmVdHymjKVyeUPQCuZp/fBrKOxUPDnaO
	Unus/OpbNGapoDufErffRemIV8HEFJcUA5QprSR0I7AxQyBTMn0iINl/L5xmtNpJKanUpLHsaLS2y
	FHvoexF4MRLTSsi7lCDGT1MHBHR4Fjk43WlPw6B7v7yGhF1eMKNl+yD4c7auWTvSjpVE2Y0UVn/BU
	LAqRVv16tkbfd8/lCV58oV8YfFiGc42JYqi6SZtUfHsFE1uFBFw8zEMrm9yjuj68CXRea0J20FJiD
	i355EHLu8sPrHK3RAMag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBkXO-0008Jc-Vb; Tue, 10 Mar 2020 19:27:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBkXK-0008Gh-Lk
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 19:27:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7DC2828EDD2;
 Tue, 10 Mar 2020 19:27:27 +0000 (GMT)
Date: Tue, 10 Mar 2020 20:27:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operation
Message-ID: <20200310202723.16b48f4b@collabora.com>
In-Reply-To: <1583220084-10890-2-git-send-email-masonccyang@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
 <1583220084-10890-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_122730_875674_2A864D84 
X-CRM114-Status: GOOD (  19.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, frieder.schrempf@kontron.de,
 miquel.raynal@bootlin.com, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  3 Mar 2020 15:21:21 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> Add nand_lock() & nand_unlock() for manufacturer specific lock & unlock
> operation while the device supports Block Portection function.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Reported-by: kbuild test robot <lkp@intel.com>

Reported-by on something that's not a fix doesn't make sense. I know
the 0day bot asked you to add this tag, but that should only be done if
you submit a separate patch, ideally with a Fixes tag. If the offending
patch has not been merged yet, you should just fix the commit and ignore
the Reported-by tag (you can mention who reported the problem in the
changelog though).

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 36 ++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/rawnand.h      |  5 +++++
>  2 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index f64e3b6..769be81 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4360,6 +4360,38 @@ static void nand_shutdown(struct mtd_info *mtd)
>  	nand_suspend(mtd);
>  }
>  
> +/**
> + * nand_lock - [MTD Interface] Lock the NAND flash
> + * @mtd: MTD device structure
> + * @ofs: offset byte address
> + * @len: number of bytes to lock (must be a multiple of block/page size)
> + */
> +static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +
> +	if (!chip->lock_area)
> +		return -ENOTSUPP;
> +
> +	return chip->lock_area(chip, ofs, len);
> +}
> +
> +/**
> + * nand_unlock - [MTD Interface] Unlock the NAND flash
> + * @mtd: MTD device structure
> + * @ofs: offset byte address
> + * @len: number of bytes to unlock (must be a multiple of block/page size)
> + */
> +static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +
> +	if (!chip->unlock_area)
> +		return -ENOTSUPP;
> +
> +	return chip->unlock_area(chip, ofs, len);
> +}
> +
>  /* Set default functions */
>  static void nand_set_defaults(struct nand_chip *chip)
>  {
> @@ -5786,8 +5818,8 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	mtd->_read_oob = nand_read_oob;
>  	mtd->_write_oob = nand_write_oob;
>  	mtd->_sync = nand_sync;
> -	mtd->_lock = NULL;
> -	mtd->_unlock = NULL;
> +	mtd->_lock = nand_lock;
> +	mtd->_unlock = nand_unlock;
>  	mtd->_suspend = nand_suspend;
>  	mtd->_resume = nand_resume;
>  	mtd->_reboot = nand_shutdown;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 4ab9bcc..bc2fa3c 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1077,6 +1077,8 @@ struct nand_legacy {
>   * @manufacturer:	[INTERN] Contains manufacturer information
>   * @manufacturer.desc:	[INTERN] Contains manufacturer's description
>   * @manufacturer.priv:	[INTERN] Contains manufacturer private information
> + * @lock_area:		[REPLACEABLE] specific NAND chip lock operation
> + * @unlock_area:	[REPLACEABLE] specific NAND chip unlock operation
>   */
>  
>  struct nand_chip {
> @@ -1136,6 +1138,9 @@ struct nand_chip {
>  		const struct nand_manufacturer *desc;
>  		void *priv;
>  	} manufacturer;
> +
> +	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> +	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  };
>  
>  extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
