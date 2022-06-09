Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 03:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuRufmdEdDBDsiftWYzySiMF2D5h67mG2YaVZPt53oQ=; b=fjuzNCxEq6IbC1
	IQ6gpO+6aShGOgI2MlUNS5N4SHsxflkSwbr2JZhND7aQxwqWU4v3ishvSx1k7cUKe3l3Kew34Z41J
	ibra3roYDJqaqn283DbhezP71flVy6FBFhIXsSbfWD8Y69rF/9JMFlz4Hdw+KUioWoiGT6LZhpQxq
	zPWAhKZ6B3q5Ir0avd4AMPAjfAn+iJXTYh+T9AA0ALcyzYMepcolsK8dCdG1MHcXhiIhs0Xb826E1
	vc3xZiBCF8MIGsUuJDhjJLYfNK3WL92bvs2mBrGsmqLFdDO8tMvpjYwY0p2+l19fTj0Ap2/2YBxto
	w/TYu3A//1Cq9xOle2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9EQ-00FzJc-3T; Thu, 09 Jun 2022 03:53:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9EM-00FzDt-I0
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 03:53:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so25625304pju.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jun 2022 20:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=;
        b=RQ0R70N1jS16HKNC0Ol/Snkv+fFPQxMu+sR7KyTPcd0AtJQdfRDJChe//d33ePjW42
         NUwM+6AWLf4HFFg8nnACUzLphwGwod4E04VS00IvvGGhoglI/uAdn0OmVESO9k7YbA87
         WXoB0WPSZJwIZQYNTDVCrIBlg3nJFEaNR0URvRoZ6V+qEZfc2gJFc0HlrIL1W1WW+rDF
         1/Yc7ng+dbkR+XlDUC9pFMzh9gCVKqODsRZejDoKKLodOa0wkJ1V/grBLEapqp/wFCIH
         /I5BMumfmT4H9nCNsQOMZJKoI5zjOM9KkgLVSCyM7AwYZxsmplXtAzqYRAkSkI1RVqcd
         8nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=;
        b=NdNONjj+RJbA3u1Ip5jc/pQLsFYSEZFPjduVoKhgyTR+ahKTlYOcLixeBwt15eDMAS
         gkkUN+InGovqY1bxS/LgDpl6SOMFYtU9FbVQzIJTjUEg1zlNlI0FzjYenW3S82crtGEW
         zUYz29XU2+RqmUR0wMLmtc05bkgY+dLLChweDVaClFl/Mbk3dX11/Jnv2LyWRWXMgOx1
         bWtVTaLQJH29eAGTY+aHFZqjQyx5QhjG3YWc8UxY2+HKxLbspDqriTYbrKKpnUH0IrzG
         MDcLaN9aZuF7wmiKCmfAYgVJ1YGZgXBBwd8+iEA9rHm/TTqWGbyQ0HozMz2edcnYRcss
         vtog==
X-Gm-Message-State: AOAM532qrKGOGXUOaeuDKvH1BzcKQa4kT8PPMpug3oh95zq3qGlrf+w3
	mSX7sjLRwEEAFhTKlMmEolLuSQ==
X-Google-Smtp-Source: ABdhPJz3/PMx3RZgt3QHHTiA/K9+ZXI01CeV4NC4DLpNFuQQZTFyqHCu1obpFa9lx3Ct5QRSUsQXvQ==
X-Received: by 2002:a17:902:e748:b0:164:1b1e:28fe with SMTP id p8-20020a170902e74800b001641b1e28femr38251973plf.116.1654746785210;
        Wed, 08 Jun 2022 20:53:05 -0700 (PDT)
Received: from localhost ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id a20-20020a170902b59400b001664ce47e11sm12584649pls.210.2022.06.08.20.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 20:53:04 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:53:00 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 16/19] hugetlb: Convert to migrate_folio
Message-ID: <YqFunLBBKbZN9uD9@FVFYT0MHHV2J>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-17-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-17-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_205310_649890_30C5BA60 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 08, 2022 at 04:02:46PM +0100, Matthew Wilcox (Oracle) wrote:
> This involves converting migrate_huge_page_move_mapping().  We also need a
> folio variant of hugetlb_set_page_subpool(), but that's for a later patch.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
