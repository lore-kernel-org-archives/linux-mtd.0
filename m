Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CCDC433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:45:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAFD611AE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 08:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CAFD611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zeOfNnxkVxy4L/TY2fp6xIdr7Pf5gIDhhyfunDmjHvY=; b=R2Lxi3ZMIYXHzpt1vn73SNzy7
	Jakz24xzfB2JqLL2fKsuFoOyL1idMg9fQLnqoEC8HrgkM0MzBipZPIug3qBRkPyIeHv7fzomvvA+u
	Krn7KIZy32fiXy/oCgSqueTEJOX8ZPPbd45uPmXIiY6NyVC0yzyUotjUeQPWBkKeIzbNTEIPKvoeY
	sTKJTL88sv6jcVBnsuhewancqZID/sjsmAtEYeHlF2ibb6DQT3fadAEbHFSuTF/YINX/XQQ3+E37R
	/ijJ4RM4Pkk8JHNwPxoso2r81zj8sruZEcJlxFQ5J2pnu8mifLIndieDu4ap9F9qkwCOfNezalbcn
	oDI2YckdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leD8o-000ema-JG; Wed, 05 May 2021 08:44:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD8l-000em4-59
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 08:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Reply-To:Sender:Content-ID:Content-Description;
 bh=Zs6bTEsthHGrYNOmQw3JowCfV04J0ctXmJBrTw3n9h4=; b=HzI7qprGQg1/5vHmW8Gs2K5IP2
 jcoAIOiLMzH/+RLBEmXgoR54p1SZ71QKGhSVomqr8QX0fhWMata8cP4ebKDUp9aC9PRcrJB6FkxCV
 ErKNunLEjGxJc1un8OKx9EupT4/ue06thOpZiz5uwmTxFfFdecqEENVGDVTB97XefesHqJh6tAWJz
 FKY53cY18+6sHUIVPmOz7WJkU++wDceZwTzHYccOzOowtQsfGAORVRUK1yqGlUFmJIcYpw4sNkSEx
 cWZBEgYGTyABH5KcvAbPFDcnkRbRy0IQ06kp7+swfXPTCY+ir1cF46HijeemOmty0yOxNDyxS0cQ2
 6ZCFBJ5Q==;
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leD8i-004aAy-Gg
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 08:44:17 +0000
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAFAB549;
 Wed,  5 May 2021 10:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620204253;
 bh=Ls1mxiCMabs0Oko9RrHogOR5j7mZE8FeltuOYuqGmW0=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K0NvwlNsdPRGGmLE/m2DbmJ9mcvfCTXxTUqmKjZJeJwJJExzzWPCynTAicUmRZO8Y
 BFVKtDNebsiVoOR1Nb0yZEMCwycjyPUoCQpJk3ykg71DDVScMW+sUJEF+DxAhR22ze
 H7TCB4/x4x1txOaVhYBhCDbA7eX9i7CrDF3sq3eI=
Subject: Re: [PATCH 3/3] Add entries for words with stem "eleminat"
To: Sean Gloumeau <sajgloumeau@gmail.com>, Jiri Kosina <trivial@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
 <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <745aedaf-1954-3b76-a3c7-d5fb193b90b4@ideasonboard.com>
Date: Wed, 5 May 2021 09:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_014416_732823_970F3A82 
X-CRM114-Status: GOOD (  14.69  )
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

On 05/05/2021 05:17, Sean Gloumeau wrote:
> Entries are added to spelling.txt in order to prevent spelling mistakes
> involving words with stem "eliminat" from occurring again.
> 
> Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
> ---
>  scripts/spelling.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index 7b6a01291598..e657be5aa2a9 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -548,6 +548,9 @@ ehther||ether
>  eigth||eight
>  elementry||elementary
>  eletronic||electronic
> +eleminate||eliminate
> +eleminating||eliminating
> +elemination||elimination

These should be kept in alphabetical order I believe.

>  embeded||embedded
>  enabledi||enabled
>  enbale||enable
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
