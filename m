Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D73C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 09:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76DC206A4
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 09:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5EyYv5g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76DC206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FafjjhOigJpUUS0fzKrTltxP51Aq8b5DX3ragMcfg+w=; b=q5EyYv5grOhYAC
	gleqJmxOUcvYAYn8LfaDLnwA6gjJe9thUdlBrBk28SOeOuTWO0MyAhvSEjmXvylgfiaiJuTh3PNwD
	j1rEPeSgpQcOo6Jv11TM+YgoDd88r5YLQjfrBgP28Pf5XUS8SXFBFxRgYcsLBq+pnYwth3CS2+5Yj
	AKWwAIa+ddq14I8agzIdQuwVKWTNXI8fpjLsUb/dp2sxaMHJEg8Q3kgOK21tYmHR2XaxoYTeBdu7Y
	OKCXyrxhKvP7La9bq+YG1NQz7DFYnkCFBjRgCu74/mJul4xoJ05j41EAdzzIpuDvrwYLvaBQ5qeE4
	c0AXUAnKyReyqYVlR+QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg39E-0003or-Ci; Tue, 02 Jun 2020 09:23:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg39B-0003oR-M5
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 09:23:51 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jg39A-0005ra-3Z; Tue, 02 Jun 2020 11:23:48 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jg398-0002X0-Ul; Tue, 02 Jun 2020 11:23:46 +0200
Date: Tue, 2 Jun 2020 11:23:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH] ubi: fastmap: Don't produce the initial anchor PEB when
 fastmap is disabled
Message-ID: <20200602092346.GK11869@pengutronix.de>
References: <20200601091134.3794265-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601091134.3794265-1-chengzhihao1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:00:25 up 103 days, 16:30, 118 users,  load average: 0.77, 0.35,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_022349_720899_59996C9B 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jun 01, 2020 at 05:11:34PM +0800, Zhihao Cheng wrote:
> Following process triggers a memleak caused by forgetting to release the
> initial anchor PEB (CONFIG_MTD_UBI_FASTMAP is disabled):
> 1. attach -> __erase_worker -> produce the initial anchor PEB
> 2. detach -> ubi_fastmap_close (Do nothing, it should have released the
>    initial anchor PEB)
> 
> Don't produce the initial anchor PEB in __erase_worker() when fastmap
> is disabled.
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Fixes: f9c34bb529975fe ("ubi: Fix producing anchor PEBs")
> Reported-by: syzbot+d9aab50b1154e3d163f5@syzkaller.appspotmail.com
> ---
>  drivers/mtd/ubi/wl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 5146cce5fe32..5ebe1084a8e7 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1079,13 +1079,19 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
>  	if (!err) {
>  		spin_lock(&ubi->wl_lock);
>  
> -		if (!ubi->fm_anchor && e->pnum < UBI_FM_MAX_START) {
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +		if (!ubi->fm_disabled && !ubi->fm_anchor &&
> +		    e->pnum < UBI_FM_MAX_START) {

Rather than introducing another #ifdef you could do a

		if (IS_ENABLED(CONFIG_MTD_UBI_FASTMAP) &&
		    !ubi->fm_disabled && !ubi->fm_anchor &&
		    e->pnum < UBI_FM_MAX_START)

And I am not sure if the IS_ENABLED(CONFIG_MTD_UBI_FASTMAP) is necessary
at all because we do a ubi->fm_disabled = 1 when fastmap is disabled.

Regards,
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
