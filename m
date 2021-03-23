Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7EBC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:23:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9EE619A9
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9EE619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v6XqVEcdNo83OKkm0QdeBFOmN6ZmoXp6e47fjlBUjn0=; b=COysCGnIBTSEosb3rX7C+I/c8
	Kes/UqAGjEKGadg73KuQELLe390YHl8DyjYNucLidEBR024/v3iH36hCmxSkVpPdWmAZfTPthXjZV
	5pJ5d2apCeM2Q9ecCCeGapnYweZjna5wnuPB05TAfEP3KUerSoJ3ew2crnDaXqbTp0BQ5RBSZq/wh
	b1V5MHequ6AKtlrlwN+ocJV12916c4JoGnxUOaejHSA6XXJYp39rPwRwu/oz66lZSjzVpji+QgQz5
	w+euVd11BGWYtRaSy1GMLfk0JUeHExwSpaztwgcJdhOr35J+YTjIt7kFn1R0Lx8YEE2pFaw8Z27FE
	xxax4Rzxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOhve-00F9aZ-95; Tue, 23 Mar 2021 14:22:42 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOhvY-00F9ZK-UV
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 14:22:39 +0000
IronPort-SDR: 7o/2w7VgFuGBIJNb4JpQ7k+mNQZFgCVUImizObYf5ImLxyDs6KOL9URlQLcg62RmEUQrlibWdY
 +5baHmaOhjfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189886671"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="189886671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 07:22:13 -0700
IronPort-SDR: iv+HvTurjOnEkDLuhu8g2pBp4rv9JtBbVxD/AQB5x/EDymNpe9Q1GjpFxkl0iT2HQz07X9zoQJ
 mxiNKD+QJn7w==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="513758880"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 07:22:02 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 23 Mar 2021 16:21:54 +0200
Date: Tue, 23 Mar 2021 16:21:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-usb@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] thunderbolt: unlock on error path in tb_domain_add()
Message-ID: <20210323142154.GW2542@lahna.fi.intel.com>
References: <YFnqyqDzSHenVN9O@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnqyqDzSHenVN9O@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_142237_365393_0522F9A8 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Mar 23, 2021 at 04:19:06PM +0300, Dan Carpenter wrote:
> We accidentally deleted this unlock on the error path.  Undelete it.
> 
> Fixes: 7f0a34d7900b ("thunderbolt: Decrease control channel timeout for software connection manager")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Julia also reported this yesterday and I was just about to send a patch
that fixes it too :) Applied this one now, thanks!

> ---
>  drivers/thunderbolt/domain.c | 1 +
>  1 files changed, 1 insertions(+), 0 deletion(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index a7d83eec3d15..98f4056f89ff 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -493,6 +493,7 @@ int tb_domain_add(struct tb *tb)
>  	device_del(&tb->dev);
>  err_ctl_stop:
>  	tb_ctl_stop(tb->ctl);
> +	mutex_unlock(&tb->lock);
>  
>  	return ret;
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
