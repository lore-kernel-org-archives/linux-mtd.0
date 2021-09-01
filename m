Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47520C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:57:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BB36103D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 08:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0BB36103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FO7LKvfkboaadRUYbenbOoED9dp3ZToXtg7EYYXsLek=; b=4s3zpbpJ5LI5Yu
	ZNc2WompdAgJOpEhXWaEryZyW3Xbs9mkAvdxWyEFRJCkNDgyU7xg0SkjorHtveTKtKwM4+d5sbiZy
	arFsnjIN/qtvvvrSs4SZlmSAlMk+dc3N8jDGw1TQ/2Yq8pfcfRqJLjbSWjaFaKw43vHuzcnpiHX5Z
	nQYvV3iBo9haA4YK9MprFW6zM/x+pDsmuknfA3RIl3Cabw6nE7DPWNhAfxvwVNYz4sr6xueUn7556
	B16DJFgfUhGoJkYRD2SIPBcdVtqEBIiKPlZFxoXXkjMvPk+UQgOzP3v7WLNCHVkNqaSE16b5zzk05
	Hg5mVJegBB+CFYwoXl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLM2r-004h1C-FD; Wed, 01 Sep 2021 08:56:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLRa-004XAh-M2
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 08:18:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9F8760698;
 Wed,  1 Sep 2021 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630484282;
 bh=GN6JRgy0rHxRTizsSUkISXXfC+FJ/NBJUSoc2dRDr7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xIZkGOmGCE/bunr/cFptL+5FjMPJ7LXz1r467yWZRHpobP/JKN4rq8eN8UcfHwo5T
 y8LATeNg6XgS82riUxzVxhzN3vD/httFgED35ka2QI/ZXDhPRqc1O7l733i9624Xtm
 BFnK5IA+FW6ejqllALDbXeFkwzPqX3HZd6eNTjlQ=
Date: Wed, 1 Sep 2021 10:17:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, stable@vger.kernel.org,
 voice INTER connect GmbH <developer@voiceinterconnect.de>,
 Alexander Lobakin <alobakin@pm.me>, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, YouChing Lin <ycllin@mxic.com.tw>
Subject: Re: [PATCH v2 5.10.x] mtd: spinand: Fix incorrect parameters for
 on-die ECC
Message-ID: <YS83NzasS7jExTya@kroah.com>
References: <20210830130211.445728-1-frieder@fris.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830130211.445728-1-frieder@fris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_011802_819434_03C4E374 
X-CRM114-Status: GOOD (  12.68  )
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

On Mon, Aug 30, 2021 at 03:02:10PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The new generic NAND ECC framework stores the configuration and
> requirements in separate places since commit 93ef92f6f422 ("mtd: nand: Use
> the new generic ECC object"). In 5.10.x The SPI NAND layer still uses only
> the requirements to track the ECC properties. This mismatch leads to
> values of zero being used for ECC strength and step_size in the SPI NAND
> layer wherever nanddev_get_ecc_conf() is used and therefore breaks the SPI
> NAND on-die ECC support in 5.10.x.
> 
> By using nanddev_get_ecc_requirements() instead of nanddev_get_ecc_conf()
> for SPI NAND, we make sure that the correct parameters for the detected
> chip are used. In later versions (5.11.x) this is fixed anyway with the
> implementation of the SPI NAND on-die ECC engine.
> 
> Cc: stable@vger.kernel.org # 5.10.x
> Reported-by: voice INTER connect GmbH <developer@voiceinterconnect.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Changes in v2:
>   * Fix checkpatch error/warnings for commit message style
>   * Add Miquel's A-b tag

Now queued up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
