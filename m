Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139ADC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 09:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00E060EDF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D00E060EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhmEoJEgwRnakSOq9ZYVRHiN/kKrt7/A8I+J8gZxflM=; b=UcD2Ofylhj32Yl
	pdhD14jSDza9/9nGmle1PSoWC5+D+Q4bqOeZAOnm3MA6CNjuvAw9ceYyMLQIi66OFf89ImgjCgn9L
	osDfEC6VmdmdeP5i050M9cTEHE1aWW9zAlS+6RxoOzu1kZugKgPwEdkrjKSTKdV92p0WUxN+Psbrw
	fWG+APK4SbdQTYOENNG0yjKzK4XKHw9QWw7cZG6IrtfHXBQ229Wdu+xXT86xijGLHD3U+hn9cJoTA
	sN+xk+QHU3PSHR3A0xn7RjrOvewRcArHwWG2NAux7CXgUO/NfWMGUl4CNnd1mT+BWS9iZh+9cajhq
	v96CMPZcjRFOn1WQosKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffXM-004TNr-Bs; Wed, 27 Oct 2021 09:48:00 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffXJ-004TMa-0d
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 09:47:59 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DE75D1FD40;
 Wed, 27 Oct 2021 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635328073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPAOC+AGYpK7cN4JnD4gRZanlYWPHwNJlRBhzVQdha8=;
 b=aKXPiluYUxmVEspGqvlEOh9ULlgxVH6w0YN5t0n2njK0lJa5cYEMg5g5MIGFisOCPH3keW
 ebAnC0C6KDOML+QcC/xsTfZBLhsHdUE8GpYFfB977bpZ7iWEqAfPeZ+HLOJnPXndLz3nEB
 H+6StryAAns95yE84QDP5lhJ3bjkch4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635328073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPAOC+AGYpK7cN4JnD4gRZanlYWPHwNJlRBhzVQdha8=;
 b=ahlWei9NSuVMm0nMCVPEDWSL8griO/AvExEmsWoqfeHPy1D0D4NvVw0U+DmCdbikh1AtQ+
 gTJejWkhoTMvAXCA==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id A39CDA3B83;
 Wed, 27 Oct 2021 09:47:53 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8A0B21F2C66; Wed, 27 Oct 2021 11:47:53 +0200 (CEST)
Date: Wed, 27 Oct 2021 11:47:53 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: simplify bdi refcounting
Message-ID: <20211027094753.GB28650@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-6-hch@lst.de>
 <20211022090203.GF1026@quack2.suse.cz>
 <20211027074207.GA12793@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027074207.GA12793@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_024757_243243_027DD694 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed 27-10-21 09:42:07, Christoph Hellwig wrote:
> On Fri, Oct 22, 2021 at 11:02:03AM +0200, Jan Kara wrote:
> > On Thu 21-10-21 14:44:41, Christoph Hellwig wrote:
> > > Move grabbing and releasing the bdi refcount out of the common
> > > wb_init/wb_exit helpers into code that is only used for the non-default
> > > memcg driven bdi_writeback structures.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > Can we perhaps add a comment to struct bdi_writeback definition (or maybe
> > wb_init()?) mentioning that it holds a reference to 'bdi' if it is
> > bdi_writeback struct for a cgroup? I don't see it mentioned anywhere and
> > now that you've changed the code, it isn't that obvious from the code
> > either... Otherwise the patch looks good so feel free to add:
> 
> Like this?
> 
> diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
> index 33207004cfded..a3d7dd1cc30a1 100644
> --- a/include/linux/backing-dev-defs.h
> +++ b/include/linux/backing-dev-defs.h
> @@ -103,6 +103,9 @@ struct wb_completion {
>   * change as blkcg is disabled and enabled higher up in the hierarchy, a wb
>   * is tested for blkcg after lookup and removed from index on mismatch so
>   * that a new wb for the combination can be created.
> + *
> + * Each bdi_writeback that is no embedded into the backing_dev_info must hold
				 ^^^ not

> + * a reference to the parent backing_dev_info.  See cgwb_create() for details.
>   */

Otherwise looks nice. Thanks!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
