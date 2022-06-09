Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B816C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2j3vKOlaiR7ON9POI3PMwapazMGoibnk4WPPnfZoxU=; b=Lf60lpXc59lHaI
	PwBbAEPQ6XQ9rqndHifg19KzY7kgq7nQvoxU2MiOWHQQwuhKAJkppJ69+bAU4CDoCu3/lyIg98GZ/
	4KgwgyksKogivE/3B571g1p4mzz4rUcmVTitioO2QnGAgG59HA80/L6hfK8J8A4XU2+T8Lkk7spaW
	Ea/BiOS64mxygwHnDYorp/LR9dODKWdQ9AtewHyn0nYMyerD6syPSTUnSVuj0oVGiG/cdeJm+0El3
	ZEcFRTLQMrrDW3amAky/vQN3hCY6EVaACugnAkmXX8gPc/JXk3RYKYZfNpftCS2j4E3MFrqQBDPHe
	1ecglc86U6D46dy4LULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLAV-002uHn-9Z; Thu, 09 Jun 2022 16:37:59 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLAR-002uGb-SM
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 16:37:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 65EBB1FECD;
	Thu,  9 Jun 2022 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1654792674;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=;
	b=b2KEX6ZCINZeKoHTynlrz3FMDUbnVbIkotULQQM8wta+qakmo0wc5ILD3yfYynBGt8D1yz
	HYV/+JhfacH7KcZ34tTxnGAMq0+073DU9INO4NM3aBmmmH1cmHo9hWrrTnPyGWxZmapSer
	hIaGVqCWyAZ99ysi+fFP8RhgxxrPFtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1654792674;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=;
	b=Irv56z+I7t/5vmpdqARm0xsfrzoUND1o/lJUqjcW0uNId73f8zXP/st70yGmLiPVj3W5Qe
	j8Fgd9g+H7+p0iCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9F2713A8C;
	Thu,  9 Jun 2022 16:37:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sFfPN+EhomK4KAAAMHmgww
	(envelope-from <dsterba@suse.cz>); Thu, 09 Jun 2022 16:37:53 +0000
Date: Thu, 9 Jun 2022 18:33:23 +0200
From: David Sterba <dsterba@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
Message-ID: <20220609163323.GV20633@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-13-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_093756_138334_DAE0ABD9 
X-CRM114-Status: GOOD (  15.70  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> Use filemap_migrate_folio() to do the bulk of the work, and then copy
> the ordered flag across if needed.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Sterba <dsterba@suse.com>

> +static int btrfs_migrate_folio(struct address_space *mapping,
> +			     struct folio *dst, struct folio *src,
>  			     enum migrate_mode mode)
>  {
> -	int ret;
> +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
>  
> -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
>  	if (ret != MIGRATEPAGE_SUCCESS)
>  		return ret;
>  
> -	if (page_has_private(page))
> -		attach_page_private(newpage, detach_page_private(page));

If I'm reading it correctly, the private pointer does not need to be set
like that anymore because it's done somewhere during the
filemap_migrate_folio() call.

> -
> -	if (PageOrdered(page)) {
> -		ClearPageOrdered(page);
> -		SetPageOrdered(newpage);
> +	if (folio_test_ordered(src)) {
> +		folio_clear_ordered(src);
> +		folio_set_ordered(dst);
>  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
