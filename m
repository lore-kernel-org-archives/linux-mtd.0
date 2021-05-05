Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6392C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:40:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DF861155
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DF861155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m50OiGHDFefQe7IJBuMO65q725jU1digluDQHUUQj0U=; b=LcNsJUTstwAuP7rNcePVcYRb9
	XD1XYs4/Wfi1ASgrogfYvVewq50SwB6zsJx8kztY4rIsgtni7t+VGOwgtaRkaF/D4Pv8nnbf/eMSi
	HCw8Cg+1RvOz+KNGVrFoReuAeb9qLrRx06Sgav8ftCGGYYOmoal9iJoqTa0T5mLKBdUuXcfGOsuEb
	5CUx427YwhlnCdAwdnA0SMLreLPqWnfbnm5I7Bxjcym3FH1TLixNxIMHgmEITaptdCKFZZrEP732J
	6XDB+73ys5erRXWC3IXhl5cH3vX57CXE+uSYTCdgNOHRy4pFenHn+t/l2eysWCvjDtxGFWk+iKCjf
	Cpl7GV4Gg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leD3m-000eNX-4O; Wed, 05 May 2021 08:39:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD3Z-000eN3-Hy
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 08:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Reply-To:Sender:Content-ID:Content-Description;
 bh=SgPjapuffPZkRCTdRQkoHUQEdDttcMmxNQWWtifLfIE=; b=3hcZqsZaHQdzR6n6hJBVTPycWf
 HhSOFQuYjuoLrKpgRtoYu93WZt780UACfEvqwd3ilW89R4foivlG2lLK4+UAwpkTqeTQAQYXBqcDd
 HF835tQVwlUunheFYNv389oDL+xvpwDRT91Sk8v3mfLGO9MhhnMUwnJ0QU055R9rFAw6lfldNl5g1
 nm8OxhlqGQJzAHfbgh6Yaw4jQrPLkUH0yzkU6DzA3o3eJdsMDck5j12eRKYEqhaxtIXLBNUZGAG/C
 A1lVANWkzx15nmUlekAAeBYsAD5q41sXnE26ax7nbN6x5I8iBJGYY9RT3f/BlJztu2t2zmWBtvBfT
 0wmHNT6g==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD3W-004ZtI-R1
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 08:38:56 +0000
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9ECC2CF;
 Wed,  5 May 2021 10:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620203929;
 bh=QdqoNvph4DT3PiPWxxcQ72QkJnI2p554Kaxscdfp82U=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bbUUuwfLhb1szjyCIUvFrBFEhlODc5k1bWnH2TVW94jpf0mwsDMV7rXVF4wGJfn1S
 /okzETMj9agF17aPlIIGk/IpfBXHaHGBj5He3hfsJBZQMpPZjnpaB0yun2OU66MZWg
 urOqPldpCQZXlBSgNzlqjGUWZmC6kM7IYpGLqxdE=
Subject: Re: [PATCH 1/3] Fix spelling error from "eleminate" to "eliminate"
To: Sean Gloumeau <sajgloumeau@gmail.com>, Jiri Kosina <trivial@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
 <21caf628a8aeec21ea9d3f06c95f712a7e7ce7fa.1620185393.git.sajgloumeau@gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3fc4016e-53a9-fd30-3073-5b8955f49be9@ideasonboard.com>
Date: Wed, 5 May 2021 09:38:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <21caf628a8aeec21ea9d3f06c95f712a7e7ce7fa.1620185393.git.sajgloumeau@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_013855_064314_5A013E28 
X-CRM114-Status: GOOD (  15.77  )
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

Thank you for the patch,

On 05/05/2021 05:15, Sean Gloumeau wrote:
> Spelling error "eleminate" amended to "eliminate".

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
> ---
>  drivers/net/ethernet/brocade/bna/bnad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
> index 7e4e831d720f..ba47777d9cff 100644
> --- a/drivers/net/ethernet/brocade/bna/bnad.c
> +++ b/drivers/net/ethernet/brocade/bna/bnad.c
> @@ -1764,7 +1764,7 @@ bnad_dim_timeout(struct timer_list *t)
>  		}
>  	}
>  
> -	/* Check for BNAD_CF_DIM_ENABLED, does not eleminate a race */
> +	/* Check for BNAD_CF_DIM_ENABLED, does not eliminate a race */
>  	if (test_bit(BNAD_RF_DIM_TIMER_RUNNING, &bnad->run_flags))
>  		mod_timer(&bnad->dim_timer,
>  			  jiffies + msecs_to_jiffies(BNAD_DIM_TIMER_FREQ));>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
