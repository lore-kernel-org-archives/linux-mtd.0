Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53A5C05027
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BO/Ndt/2bTkd9qtfJ1+rjKEsfXdU+PdmsdqPEzjrwH8=; b=wyPno9Cu3ZF+8w
	YT6t0GHNHKeTrhEEeaj7EEwCXGu8ExWpTN9v/OO8kYouQJjXLHcQlDgAycyZ5Fo3FHOvhHoVBOFl3
	9MWYzwhBI7ePeETwCavqEwwuM2bwzO1jDgi10NBRuriglFLKknodmtEbM0j9xOr7MdhhxzD/kJmP2
	Dkf/6bL+/Ikb7TJmEVrszQepU5uumS5z8FUV695fxW9xC6QJcDw4QDQZumARYCbZNcbCLbgkonbP4
	Wj+eph2yjRFVpNxlrmNPpH5n3x99+xc63gyEoTGtq+u9iPEusLoS0ss6H4eoej5T5ncGcDvgj7iSd
	+jYM9iSwKmcWPy3AqV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzN1-00CSP7-BF; Fri, 20 Jan 2023 21:56:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIzMx-00CSMs-JV
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2023 21:56:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id b6so5150522pgi.7
        for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2023 13:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGNJEGDFz1cjsLBt+NNryYCoKoOF/RVQ/lQuQsch//k=;
        b=L/BW+mAyEV3p14j1f2jtadpvlBWh5uXc0b8JmkSWBPtboKDozKkyIdrNb5y0a68WIK
         BT0FnCbCEEQVW/qEjmNYRjIw6oFT28MOzOeyDUDgFQPebxWe2Jo9R+QGGKqwXWtF8obQ
         zt8GBAMSMcoHN+A1d8jTxpJAU4JnVPNzgIKvoCBK5qKKWO0c8UjhWooce7Tbsnx+0ZZ4
         hsKXYoFxdcB8zEZg5m5DM4TVrRQOCsq+SjEr2hIVGpSzoJ8tIx3E4WZ4lvR6BZv2sRgT
         vKMxwtkCmyoAkUYRhrPoZYruWKWTqagBlU5WSO5thbfg4V78+IQgmrF8i3XJ4z3miOi9
         CMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGNJEGDFz1cjsLBt+NNryYCoKoOF/RVQ/lQuQsch//k=;
        b=VgQig6vQl1QTFI6nC1wcFnDYBpYuzRNzUKTefQKMJE6R+Lp4ypxqyyGWY/udpPh7MW
         KxQG1Koj9GzSGTyIiAR/+pXrp0Nv61DjXZnQKkvMJoqqU03D4tP1veZu+I+TtWDiWyBs
         rr77Sllku0DCcY/mfMSXt8o1cs07M7S/f1QW8hegQPlGI+RGdj3f4kQFp7MRiHmrby8A
         U279HIZT9rqYM8DuDPjqeswGz97YQM73O5l+693FoTv/DKpowg2EzW+kaTRa12+Z8cId
         7bjbuOL8YedykIcbBJsWAgmtiDQDRro9gADUekk8SnGKGbphRnNPsFUUavtmoBD0GMl5
         6lJg==
X-Gm-Message-State: AFqh2kq59fmjPUT+qSZOdUbQVq2clvWitFpp5mnIyh1WXvhJRTsBWHSY
	DFL0+tpCWpwMIkBhH8u6JMG4gA==
X-Google-Smtp-Source: AMrXdXs3PJMrbzdU0Ub/KNe+utb/Ewp35P7/JaGtlrIPnr6lTuko3xWlKIVKkMFnFWf9sDokVATMOA==
X-Received: by 2002:a62:1901:0:b0:582:5b8e:533 with SMTP id 1-20020a621901000000b005825b8e0533mr36698547pfz.16.1674251772955;
        Fri, 20 Jan 2023 13:56:12 -0800 (PST)
Received: from google.com ([2620:15c:2d1:203:bab1:9588:b389:30ad])
        by smtp.gmail.com with ESMTPSA id x10-20020aa79aca000000b0058a0e61136asm20535178pfp.66.2023.01.20.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:56:12 -0800 (PST)
Date: Fri, 20 Jan 2023 13:56:07 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, tim.gardner@canonical.com,
	lkp@intel.com, re@w6rz.net, nathan@kernel.org
Subject: Re: [PATCH linux-next] jffs2: reduce stack usage in
 jffs2_build_xattr_subsystem()
Message-ID: <Y8sN9+0BvZfsEq1v@google.com>
References: <20170509203003.11986-1-fabf@skynet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170509203003.11986-1-fabf@skynet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_135619_685525_3D15260C 
X-CRM114-Status: GOOD (  23.88  )
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

On Tue, May 09, 2017 at 10:30:03PM +0200, Fabian Frederick wrote:
> Use kcalloc() for allocation/flush of 128 pointers table to
> reduce stack usage.
> 
> Function now returns -ENOMEM or 0 on success.
> 
> stackusage
> Before:
> ./fs/jffs2/xattr.c:775  jffs2_build_xattr_subsystem     1208
> dynamic,bounded
> 
> After:
> ./fs/jffs2/xattr.c:775  jffs2_build_xattr_subsystem     192
> dynamic,bounded
> 
> Also update definition when CONFIG_JFFS2_FS_XATTR is not enabled
> 
> Tested with an MTD mount point and some user set/getfattr.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Hi David,
Any chance this patch can get picked up? It LGTM, and I see multiple
reports of this issue on lore:
https://lore.kernel.org/lkml/?q=jffs2_build_xattr_subsystem

Reported-by: Tim Gardner <tim.gardner@canonical.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Ron Economos <re@w6rz.net>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  fs/jffs2/build.c |  5 ++++-
>  fs/jffs2/xattr.c | 14 ++++++++++----
>  fs/jffs2/xattr.h |  4 ++--
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
> index b288c8a..f88e0bf 100644
> --- a/fs/jffs2/build.c
> +++ b/fs/jffs2/build.c
> @@ -211,7 +211,10 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
>  		ic->scan_dents = NULL;
>  		cond_resched();
>  	}
> -	jffs2_build_xattr_subsystem(c);
> +	ret = jffs2_build_xattr_subsystem(c);
> +	if (ret)
> +		goto exit;
> +
>  	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
>  
>  	dbg_fsbuild("FS build complete\n");
> diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> index da3e185..95c0496 100644
> --- a/fs/jffs2/xattr.c
> +++ b/fs/jffs2/xattr.c
> @@ -772,10 +772,10 @@ void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c)
>  }
>  
>  #define XREF_TMPHASH_SIZE	(128)
> -void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
> +int jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
>  {
>  	struct jffs2_xattr_ref *ref, *_ref;
> -	struct jffs2_xattr_ref *xref_tmphash[XREF_TMPHASH_SIZE];
> +	struct jffs2_xattr_ref **xref_tmphash;
>  	struct jffs2_xattr_datum *xd, *_xd;
>  	struct jffs2_inode_cache *ic;
>  	struct jffs2_raw_node_ref *raw;
> @@ -784,9 +784,13 @@ void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
>  
>  	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
>  
> +
> +	xref_tmphash = kcalloc(XREF_TMPHASH_SIZE,
> +			       sizeof(struct jffs2_xattr_ref *), GFP_KERNEL);
> +	if (!xref_tmphash)
> +		return -ENOMEM;
> +
>  	/* Phase.1 : Merge same xref */
> -	for (i=0; i < XREF_TMPHASH_SIZE; i++)
> -		xref_tmphash[i] = NULL;
>  	for (ref=c->xref_temp; ref; ref=_ref) {
>  		struct jffs2_xattr_ref *tmp;
>  
> @@ -884,6 +888,8 @@ void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
>  		     "%u of xref (%u dead, %u orphan) found.\n",
>  		     xdatum_count, xdatum_unchecked_count, xdatum_orphan_count,
>  		     xref_count, xref_dead_count, xref_orphan_count);
> +	kfree(xref_tmphash);
> +	return 0;
>  }
>  
>  struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
> diff --git a/fs/jffs2/xattr.h b/fs/jffs2/xattr.h
> index 720007b..1b5030a 100644
> --- a/fs/jffs2/xattr.h
> +++ b/fs/jffs2/xattr.h
> @@ -71,7 +71,7 @@ static inline int is_xattr_ref_dead(struct jffs2_xattr_ref *ref)
>  #ifdef CONFIG_JFFS2_FS_XATTR
>  
>  extern void jffs2_init_xattr_subsystem(struct jffs2_sb_info *c);
> -extern void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c);
> +extern int jffs2_build_xattr_subsystem(struct jffs2_sb_info *c);
>  extern void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c);
>  
>  extern struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
> @@ -103,7 +103,7 @@ extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
>  #else
>  
>  #define jffs2_init_xattr_subsystem(c)
> -#define jffs2_build_xattr_subsystem(c)
> +#define jffs2_build_xattr_subsystem(c)		(0)
>  #define jffs2_clear_xattr_subsystem(c)
>  
>  #define jffs2_xattr_do_crccheck_inode(c, ic)
> -- 
> 2.9.3
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
