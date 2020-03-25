Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E0EC1975A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 15:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B6120714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 15:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KttcECHB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B6120714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgQ2iHHVxZAS41yFlCrGrE+2zG6pQzBu5hg2mY9Yb/w=; b=KttcECHBSspaFc
	CO57/Dm+4mg/pMQ3Esy4qdx57/dxwqpdESh3Wb8Ad76UoyuTDmrbf/0siUValwi/S2nc0y77amgKU
	zKa/wwqHFqfbcceQ9N9iIILDtw4+oAzzlJlpTT+Ts3Xe9wVYwpv3fKHbNbuS5a3LDHbd15uwgXF78
	AB8X04EKZWk8nQ9zrtMf+o66ATmcArOXlkfbPRom4ozUSB9TqR6ybH8iYH6EuCxsQGQe1Ar+01LRU
	xOfjy8Qbw0EygtWL93vdSeJANsTdglWRBDLbuKECr3ta7jeqgcU4zUwr/qcJn3Lc6MZo7h1a2XPrU
	mDm+aYKUk54pvXUDK7Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH7Ws-00012p-S3; Wed, 25 Mar 2020 15:01:14 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH7Wp-00012M-RC
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 15:01:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6EDE168B05; Wed, 25 Mar 2020 16:01:08 +0100 (CET)
Date: Wed, 25 Mar 2020 16:01:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 2/4] fs: avoid double-writing the inode on a lazytime
 expiration
Message-ID: <20200325150108.GA14435@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325122825.1086872-3-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_080112_028962_8C151960 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 01:28:23PM +0100, Christoph Hellwig wrote:
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1448,6 +1448,11 @@ static struct dquot **ext4_get_dquots(struct inode *inode)
>  	return EXT4_I(inode)->i_dquot;
>  }
>  
> +static void ext4_lazytime_expired(struct inode *inode)
> +{
> +	return ext4_dirty_inode(inode, I_DIRTY_SYNC);
> +}

FYI: this is inside an #ifdef CONFIG_QUOTA, so I'll have to respin even
if the overall approach looks good.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
