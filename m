Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76035C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 06:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F17613CC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 06:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F17613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhAk5iuj8HicQ6KVRqpPr5DJMQK/TATteKmoMbsRCII=; b=Jfb3SZ85ZAgX+5
	/nW3WWLR1w9CK0NeUu8SHyz808g4ylhNZePMLSNMUl0N7xorISl7S+jrF/m0oRoejN906qXXiLRvq
	hMO/khOux3jDiFuzLxZBtwfkRMOB6N5G4hqQfq8j3sP3Y2bJmSuvo/ZvDlyx7TQc5urrVwHBcAlNJ
	rkk1draClYe1gb3+n4AgpyuztQ4ZLLS0bQ0P+QLPtzPlcX7Cc3xrp37IOIkesiKIJ7pDSFLnWuNdQ
	88Sy/s9tkDsH9ZexH1f/vLVJiL7pHZWcp6iq/Mu8fhuFN1id+Rnn0A7fabn1kyzqLfom3iQHCzHAj
	ESQjAtmXpRADViYiosIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmd9-00BQ0t-9P; Wed, 26 May 2021 06:02:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmd6-00BPzB-E5
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 06:02:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46290613CC;
 Wed, 26 May 2021 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622008975;
 bh=Px4RLhRm+fl/7hIdMPYO+uGgtTr0sXe6bUIxzTzzwQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEMmgUWHwEVFXB1PkX1xij4Xz97EIBpu0xIngzEIpiwZHJnUjowxHp89dkSv2XWjb
 MmkiK+rlLYmsOAxSP3apdMVwmzIgg96RbtgglKWkyJlwWUdQwa/3BwSr6OHGcpUCaO
 NzvWwdpz/qq6EnGNgjAaBIRAijjRmb2Fv8Cb8z9cpjqhRusb+5K691cC6+G0b+8FHn
 Y1iPRtsE0wXkW/W4O0gNvcsdsDHQV3wY/uIWi5BUd0Hnx++c3vEj9Tv0WJ4anolKry
 Eiq4AtxxfbAheIHtW9j0yatm+C6ZovTgbvm2Ydq5w2620YSY1lFXecaom6+x0L2vfj
 sFJQOiVWckFvw==
Date: Wed, 26 May 2021 11:32:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: parsers: qcom: Fix leaking of partition name
Message-ID: <20210526060246.GA10723@work>
References: <20210525230931.30013-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525230931.30013-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_230256_538870_88123E22 
X-CRM114-Status: GOOD (  20.84  )
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

On Wed, May 26, 2021 at 01:09:31AM +0200, Ansuel Smith wrote:
> Add cleanup function as the name variable for the partition name was
> allocaed but never freed after the use as the add mtd function
> duplicate the name and free the pparts struct as the partition name is
> assumed to be static.
> The leak was found using kmemleak.
> 
> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mtd/parsers/qcomsmempart.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> index d9083308f6ba..06a818cd2433 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -159,6 +159,15 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	return ret;
>  }
>  
> +static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
> +				   int nr_parts)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_parts; i++)
> +		kfree(pparts[i].name);
> +}
> +
>  static const struct of_device_id qcomsmem_of_match_table[] = {
>  	{ .compatible = "qcom,smem-part" },
>  	{},
> @@ -167,6 +176,7 @@ MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
>  
>  static struct mtd_part_parser mtd_parser_qcomsmem = {
>  	.parse_fn = parse_qcomsmem_part,
> +	.cleanup = parse_qcomsmem_cleanup,
>  	.name = "qcomsmem",
>  	.of_match_table = qcomsmem_of_match_table,
>  };
> -- 
> 2.31.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
