Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:41:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F2A60EBB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 07:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F2A60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q0dhjth0ft68osjQT/SXlsO9uwxDJvHdaCUdtU82E8=; b=JwQp3EQrpTKiFC
	80bRowVkTT68P4NGyiyiDzj71os8yoHxKlh2oBid8/f+3ZwJ5s/81SShsjFCg+f0ZY+Go52kR/wl/
	EXVaa+fq3BI0+B3T4vbWc7FZ4FlQWPoJ2v8hMABrOVsidojLAry+yz4dfvIvKCqy88Y02qNO+4JgY
	NyGGr4iU13dht8uqgwA/UIZZTwl9IkndHAWqOW1JFkk9QMUPJULaj6jeMJ9xSJoAyNCeJGEbG+c25
	CD0ixkMQbdewOdyiY8HMXVQPJHf4VhY8PFwZKaRRO8kNvixZAB9Vo13tIfXmwNARDRAcPCb/ozNou
	1J+mFX6BWwmZbFtSQQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhRwM-00FZAR-5S; Mon, 01 Nov 2021 07:41:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhRwK-00FZ9e-08
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 07:41:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8FA071F42B21;
 Mon,  1 Nov 2021 07:41:06 +0000 (GMT)
Date: Mon, 1 Nov 2021 08:40:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211101084059.5b703b8b@collabora.com>
In-Reply-To: <20211026055551.3053598-4-sean@geanix.com>
References: <20211026055551.3053598-1-sean@geanix.com>
 <20211026055551.3053598-4-sean@geanix.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_004108_203186_FC325308 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, 26 Oct 2021 07:55:50 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> @@ -1406,6 +1423,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>  		    const u_char *buf)
>  {
>  	struct mtd_info *master = mtd_get_master(mtd);
> +	int ret;
>  
>  	*retlen = 0;
>  	if (!master->_panic_write)
> @@ -1419,8 +1437,12 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>  	if (!master->oops_panic_write)
>  		master->oops_panic_write = true;
>  
> -	return master->_panic_write(master, mtd_get_master_ofs(mtd, to), len,
> -				    retlen, buf);
> +	mtd_start_access(master);
> +	ret = master->_panic_write(master, mtd_get_master_ofs(mtd, to), len,
> +				   retlen, buf);
> +	mtd_end_access(master);
> +
> +	return ret;
>  }

I suspect panic_write should be an exception, otherwise a panic in the
suspend path would never be able to write its data to the flash.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
