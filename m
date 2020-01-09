Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE08C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:31:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CB642051A
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:31:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pit39omv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CB642051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oe1BYxOuSFREfK8Y56AKfdRyUeXEeDQzZeW96KVuF3k=; b=pit39omvpDgSmZ
	nTFE2WcHHi7EmZxUQkQIZOTOyQlRC1E+v4jQmScAcY0d0FzovSLH6qrvJAMzn+5s6+dT5Ckly371/
	oYHH5CFh9SFKoosumkl+8Y4bWFcQ5JA2zs5tPxREMTZGClw0biXb12tzbIoZg6s+uIQD+RoZGVxlS
	gNIU0lYchY0hfKROObEK4Aw/CJsBOr/wzINybnz4ksZ++2tA3DpOILCc1g4mf4zOLJW+HOMh2gh/S
	spLgNr/6N8IOsXDylPVrAsywBuR5FTTJrNYhOvzeFryc7eODTMbkF6y7l1YMAZiTovB80Po55edTz
	qYG2xYoqUQ+LxUl5ecfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdWI-0001IX-3H; Thu, 09 Jan 2020 19:31:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdWF-0001I1-K1
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:31:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19D4E2934E8;
 Thu,  9 Jan 2020 19:30:58 +0000 (GMT)
Date: Thu, 9 Jan 2020 20:30:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operatoin
Message-ID: <20200109203055.2370a358@collabora.com>
In-Reply-To: <1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_113059_782896_7CC1A644 
X-CRM114-Status: GOOD (  10.84  )
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
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019 17:55:24 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

>  /* Set default functions */
>  static void nand_set_defaults(struct nand_chip *chip)
>  {
> @@ -5782,8 +5810,8 @@ static int nand_scan_tail(struct nand_chip *chip)
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
> index 4ab9bcc..2430ecd 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1136,6 +1136,9 @@ struct nand_chip {
>  		const struct nand_manufacturer *desc;
>  		void *priv;
>  	} manufacturer;
> +
> +	int (*_lock)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> +	int (*_unlock)(struct nand_chip *chip, loff_t ofs, uint64_t len);

Please drop this _ prefix.

>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
