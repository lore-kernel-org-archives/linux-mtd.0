Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F971C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:43:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14373611CB
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14373611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m7/9Tyb2v3/GhhdzYGmXf8tUCDcuz4ew3TOSnP47+dE=; b=quvBvNtRGnwTE8nd13r6CF/kW
	2O70TbgKW67omVlVSB9u/j0qrlB5zqnMFrWeZ0au7MxlpoHsAHIpyO+OV4rPE7y5vB2PJs2wKJzgZ
	FU9KtCiEiOq9Oxq2KcH+CuO9Ie1h07AqlGR/KVZa5g0sdFTSf6cYqfIlxAg6OhoZHsVkZtCpm/sjs
	J48gvDXqjwtcKqz4H5ePJwMbWr14Rqa0Hax2H6lB50zf4DkLN+7yLVdTRreIkaIdIT3t0bpqX/nwE
	Mr1WLG3SXcd8Dr9se9mifNdT0sMfZC1UMpTTFmDDD8CEThqKCuW5AE/z7T7ACPr3myBgE+RQe67st
	FJCl5eFaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leD6x-000ebo-Th; Wed, 05 May 2021 08:42:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD6u-000ebY-LA
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 08:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Reply-To:Sender:Content-ID:Content-Description;
 bh=Lnd+7Mmju4kVYl+qAwmET3DNgG+1z9V2zYEO6z+mgKw=; b=eQzylM0ouFz9P/ymj37HhdiOxN
 RddcfInqrWX4fAHT+ASaAn1dtXuXqGOM+fiLwr5INbMikRXOnEsmtZjq7SpeBQvSMjFlyA/eo+5RK
 NH0WJ3urrNbLEdGaZ0Qvf0W+R8glg/3xRp5fmDjwDsnBRwFVX2CAgo9Yk72/Dkjnnb5VeX8OrIIaN
 ziyVvo00kbmBy7uYFqEhvFA/yWpsTNKaxbZmT5hBD+JKfackX/mv+fUhDN7x/R22lEnAyEnNkXbKD
 YGEjpDcI5LZ882KK03L9RtCNQpCrz49yzay7+cG385LaXh4l/aCrjie4CsilL0FmormHnby+/o7Re
 ZJn4jXJw==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD6s-004a3o-22
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 08:42:23 +0000
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19B89549;
 Wed,  5 May 2021 10:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620204140;
 bh=qmu9oxq4GfKWLVnwiqcpJds5vjoid5EI4o9dBr9EVPM=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qxh75Rjxr8ZmKGBIcckODbfKvLXdXVplxdvjE/RVGoiG0btFoH42rcMeCQCRXxRo5
 HpMWhLPXm/qvwRsx2MPtYCuBu9jxHxE49ufKELSGoZfVdSgtqWaffjEFAx7wQLafXF
 W3o2h8fje6PkcTF1O82xdCiQcIkS0CNreXrp00/Q=
Subject: Re: [PATCH 2/3] Fix spelling error from "elemination" to "elimination"
To: Sean Gloumeau <sajgloumeau@gmail.com>, Jiri Kosina <trivial@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
 <f1220eaedbc71ee8d19e35b894c21c161e7a33fc.1620185393.git.sajgloumeau@gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <72b39028-f340-1cc7-40e0-0efadb57d729@ideasonboard.com>
Date: Wed, 5 May 2021 09:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f1220eaedbc71ee8d19e35b894c21c161e7a33fc.1620185393.git.sajgloumeau@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_014222_279615_EF14A9D2 
X-CRM114-Status: GOOD (  17.05  )
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sean,

On 05/05/2021 05:16, Sean Gloumeau wrote:
> Spelling error "elemination" amended to "elimination".
> 
> Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  fs/jffs2/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
> index 9d26b1b9fc01..027e4f84df28 100644
> --- a/fs/jffs2/debug.c
> +++ b/fs/jffs2/debug.c
> @@ -354,7 +354,7 @@ __jffs2_dbg_acct_paranoia_check_nolock(struct jffs2_sb_info *c,
>  	}
>  
>  #if 0
> -	/* This should work when we implement ref->__totlen elemination */
> +	/* This should work when we implement ref->__totlen elimination */

I wonder if anyone has worked on or is working on eliminating that
ref->__totlen so that this code isn't left as dead-code.


>  	if (my_dirty_size != jeb->dirty_size + jeb->wasted_size) {
>  		JFFS2_ERROR("Calculated dirty+wasted size %#08x != stored dirty + wasted size %#08x\n",
>  			my_dirty_size, jeb->dirty_size + jeb->wasted_size);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
