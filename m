Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E3606A33D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWUDoSNC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CAIR+2uE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D3y99nsh+v8hDSyZfSMl9TFKborTOhEocmmMqI2we0k=; b=xWUDoSNCknGF5gjowZ4svIbkUi
	6D5GT3xiDw8kiQYAsxHqd2Pd3+uqkkMdsVMTbZvCUJr9JNEeuQMN3zSOdFB7JfilWLTY3VDHnoW6j
	PGbh3VRYTVtOHBBZzwKjFnyYlFlGXllTKNEC9Ld0Z85iy9i8JZqmnR+PrT4AWXggqBqgOe3ahShes
	BUwVFG5s7Ed/Uv1wA6ZFTEoZmEmSZlzyZ/hp+DEsQstlQ5VZN5aUsTjx2ECGCm7t/zL0nTP/vMiFV
	3Pa161cldAXHJB4SEWJO6aBJrcORDmNvIfqWnFuOhRyvK47bMkRqk3WPFILC9S/jyHs0qGVtNoTLg
	Ykqfi5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU44L-0000000CSA1-47zO;
	Thu, 19 Nov 2026 15:29:01 +0000
Received: from out-73.mta0.migadu.com ([2001:41d0:1004:224b::49] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU44F-0000000CS7a-3hHI
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 15:29:01 +0000
X-Envelope-To: linux-mtd@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xstZUCpagJm1EvnCuEHUwHSA5x2dm2sB96xZUJUAL50=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795102130; v=1; x=1795706930;
 b=CAIR+2uEwTXazYn2CoAM6aGyMboKmP/VT4odluvBCO1k6QqlvH/DJA1DHZjGDHiHaRrW/GUq
 ai6jTx+PP4QZVu3Ms/9K8qEnjIXT4eR5Xi6fySeImWWrXRl5N+9K+hX/3PDJfqXBSpGPC/tYefV
 ikT7EEry5SDtUanVbfSf8RLg=
X-Envelope-To: linux-mtd@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c83126158e430bdc;
	Thu, 19 Nov 2026 15:28:50 +0000
X-Mizu-Trace-ID: c83126158e430bdc
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f262ab4-9431-4720-9422-0ee2155fa933@linux.dev>
Date: Thu, 19 Nov 2026 15:28:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/58] mtd: acquire an MTD handle from a referenced
 class device
To: James Hilliard <james.hilliard1@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
 <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072856_342236_CFCF0088 
X-CRM114-Status: GOOD (  22.64  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 01:27, James Hilliard wrote:
> PTP OCP locates flash through the device hierarchy and uses driver data
> directly. A class-device reference does not keep an MTD registered or own
> the backing object needed by an erase or write.
> 
> Look up the exact device under mtd_table_mutex and acquire an ordinary MTD
> handle before returning it. Use that handle for the OCP update and release
> it on every exit. A removed device cannot be confused with a replacement
> that reuses its name or number.
> 
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Jonathan Lemon <jonathan.lemon@gmail.com>
> Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/mtd/mtdcore.c   | 23 +++++++++++++++++++++++
>   drivers/ptp/ptp_ocp.c   |  7 ++++++-
>   include/linux/mtd/mtd.h |  1 +
>   3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 30b16f135f07..620326279957 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1329,6 +1329,29 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
>   EXPORT_SYMBOL_GPL(get_mtd_device);
>   
>   
> +/**
> + * get_mtd_device_by_dev - acquire the MTD associated with a class device
> + * @dev: referenced MTD class device
> + *
> + * Return: a referenced MTD, or an error if the device has been removed.
> + */
> +struct mtd_info *get_mtd_device_by_dev(struct device *dev)
> +{
> +	struct mtd_info *mtd;
> +	int err;
> +
> +	guard(mutex)(&mtd_table_mutex);
> +	mtd_for_each_device(mtd) {
> +		if (&mtd->dev != dev)
> +			continue;
> +		err = __get_mtd_device(mtd);
> +		return err ? ERR_PTR(err) : mtd;
> +	}
> +	return ERR_PTR(-ENODEV);
> +}
> +EXPORT_SYMBOL_GPL(get_mtd_device_by_dev);
> +
> +
>   int __get_mtd_device(struct mtd_info *mtd)
>   {
>   	struct mtd_info *master = mtd_get_master(mtd);
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 3d26ec1f7b9e..459aeb24ae6b 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2083,7 +2083,7 @@ static int
>   ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   		      const struct firmware *fw)
>   {
> -	struct mtd_info *mtd = dev_get_drvdata(dev);
> +	struct mtd_info *mtd;
>   	struct ptp_ocp *bp = devlink_priv(devlink);
>   	size_t off, len, size, resid, wrote;
>   	struct erase_info erase;
> @@ -2091,6 +2091,10 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   	const u8 *data;
>   	int err;
>   
> +	mtd = get_mtd_device_by_dev(dev);
> +	if (IS_ERR(mtd))
> +		return PTR_ERR(mtd);
> +
>   	err = ptp_ocp_devlink_fw_image(devlink, fw, &data, &size);
>   	if (err)
>   		goto out;
> @@ -2120,6 +2124,7 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
>   		resid -= len;
>   	}
>   out:
> +	put_mtd_device(mtd);
>   	return err;
>   }
>   
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index cd7b4671c456..745655e0d462 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -684,6 +684,7 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
>   	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
>   extern int mtd_device_unregister(struct mtd_info *master);
>   extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
> +struct mtd_info *get_mtd_device_by_dev(struct device *dev);
>   extern int __get_mtd_device(struct mtd_info *mtd);
>   extern void __put_mtd_device(struct mtd_info *mtd);
>   extern struct mtd_info *of_get_mtd_device_by_node(struct device_node *np);
> 

Acked-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
