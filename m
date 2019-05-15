Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D703C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 22:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08BC20873
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 22:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCYTbLOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08BC20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbGZlgZKdcT1MYham/685vagnBZpylMNM5nuhTQ1MY8=; b=KCYTbLOti1yvyd
	HloDXw7/MEOy96/bxbKjyplsT3YUCiVQj/b4j0CND5rj5nywTyMUEhzHMMjbwia+loILSWoXVrXBQ
	pv8Nw4QiwhZLCdxzefllXPh4+oGunQx9CG39C2UgYw2qB4l6t8rz2iTCeMdioD0FKjf6cFN70MPrV
	iqJhAW75+q5tmAAZnLK5SVteCII7UNN+EE+d+uIGH7C6Fhabv9hby72EpuwdUPmv5lhXcqvFK6hLh
	fKnBEKubuhKsRpwZfd5ylD9u6aCIX0GHYJLFsR994vNVPLlz5CsEyTlSUl4cCA9KalaZDr5q1+GoB
	ehkHVrswH7HUUVlrKRiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR2PW-0000Aq-9T; Wed, 15 May 2019 22:30:06 +0000
Received: from smtprelay0060.hostedemail.com ([216.40.44.60]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR2PT-00083X-DC
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 22:30:05 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 992CE837F24C;
 Wed, 15 May 2019 22:29:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: lace66_38b74b7a2e71a
X-Filterd-Recvd-Size: 1692
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Wed, 15 May 2019 22:29:49 +0000 (UTC)
Message-ID: <391f21cf5f04c61b75e739f67c8a308864b4e68c.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Update UBI/UBIFS git tree location
From: Joe Perches <joe@perches.com>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Date: Wed, 15 May 2019 15:29:48 -0700
In-Reply-To: <20190515200423.17809-1-richard@nod.at>
References: <20190515200423.17809-1-richard@nod.at>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_153003_530538_72750F5F 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-05-15 at 22:04 +0200, Richard Weinberger wrote:
> Linus asked to use kernel.org.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c38f21aee78..ba428cd613b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15879,7 +15879,7 @@ M:	Richard Weinberger <richard@nod.at>
>  M:	Artem Bityutskiy <dedekind1@gmail.com>
>  M:	Adrian Hunter <adrian.hunter@intel.com>
>  L:	linux-mtd@lists.infradead.org
> -T:	git git://git.infradead.org/ubifs-2.6.git
> +T:	git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git

Please keep the initial separate git

T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git

>  W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
>  S:	Supported
>  F:	Documentation/filesystems/ubifs.txt


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
