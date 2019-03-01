Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AA4C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 19:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2251720848
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 19:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXwGgZh9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2251720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWqesiou72UXtQUJVCPv3FEr/6zHEqtKl+Ig4MjdLHQ=; b=JXwGgZh9fNF9NY
	jlJk7w2a3NeVAok2cs5wdJM9IOe+Nk0bk9MBigHceqiGi9Kk16b84noCf4POayfuYwbqKeY9Dkab8
	r1YbnvU4Hfv9MLZrfSnJtKIijX9bbdq1Ds6YsDXdEcHXHkMXM0dQzrk3Ml3IsvwZk+upHIt4i9kQ1
	zY+gb5AfXG9GfDDxuGuPPNV/kkAbz0hud5eP2L4iBrv9Mc6Buv9lkJ8JPMPqbkfj/OUvLLgGH41cA
	w8suZQFMqcW/FV9K8PTfC8CnaH+3fObxkVYhaz8eVEmbn7RPvr3CkpBRUHkBsu9ohU488WSHVLOL4
	5Jp5JK/LYgwHh0NkVCLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzoHM-000896-6b; Fri, 01 Mar 2019 19:57:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzoHI-00088Q-K7
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 19:57:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4DB8B26BEED;
 Fri,  1 Mar 2019 19:57:01 +0000 (GMT)
Date: Fri, 1 Mar 2019 20:56:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liu Jian <liujian56@huawei.com>
Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Message-ID: <20190301205658.2ed6cf24@collabora.com>
In-Reply-To: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_115704_796627_815EE322 
X-CRM114-Status: GOOD (  15.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: keescook@chromium.org, joakim.tjernlund@infinera.com,
 ikegami@allied-telesis.co.jp, richard@nod.at, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The "mtd: " prefix is still missing. Should be "mtd: cfi: ". If you
send a new version, please fix that.

Thanks,

Boris

On Tue, 26 Feb 2019 22:00:48 +0800
Liu Jian <liujian56@huawei.com> wrote:

> In function do_write_buffer(), in the for loop, there is a case
> chip_ready() returns 1 while chip_good() returns 0, so it never
> break the loop.
> To fix this, chip_good() is enough and it should timeout if it stay
> bad for a while.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> Reviewed-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> ---
> v2->v3:
> Follow Vignesh's advice:
> add one more check for check_good() even when time_after() returns true.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6..3da2376 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1876,7 +1876,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> +		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum))
>  			break;
>  
>  		if (chip_good(map, adr, datum)) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
