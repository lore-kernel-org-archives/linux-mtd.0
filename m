Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7B5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJMA3Ph+U8dCtY4S7l8tgb0LqFFeGErTQreQlGXaDUQ=; b=ECBGrtdqu5BQfH
	hTEzGMgDKxdZWwD8Tn9XNIdcbH4vRq67k8uS/7OnPTBYJ9tBcCKxfTy5DrPobgZr3TeyGhDPhxQrs
	tNN0HB+DubPncLgvF9WyNlE3wseF8O/E8amGuIYopfC11wtRLQGJA+R1AAY/LJxmamJTwIF5E4lpk
	kNeyZNHPga4AKqTOz2Erm3qEDcHKbkYVeheeDuNLboc4DbZlSM0oOOHgI7CM58YzJtKIEbej9P/No
	4g+3aIVt8fgGWmsHMtftXkVRcEMADq/wx33NDA6tNxFhYRW4AusLq0z5RFwnH86xhS8I770U7xIuo
	xED2W+dUckw8t9QB5nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzRHU-004WD1-LS; Thu, 09 Jun 2022 23:09:36 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzRHS-004WC8-3s
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 23:09:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A49541FF09;
	Thu,  9 Jun 2022 23:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1654816172;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=;
	b=I4/06b2ltiKrPbL7GgKqUfyrBDeCyX3UBUG59EJr4ULzJeSHMklpbChcFfJ1kbSeucBXix
	La6qOv94FBGz6zARxy9vvZ/rfr+o4fJAO1+4sOg84lO5ESeVeDRRH4GNx2iw82Lzfy4RBp
	n/81rXgBPEK2N99/Wl5n9BN9FjCnnSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1654816172;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=;
	b=L3W4XRXz86YAqVEeWGz5ZqCwllS9CYkUvRzkZLgLEjLQjJDb2qGw16RPUqD736ufsddkqi
	GP6X1OhCsdJk3BBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31C9113456;
	Thu,  9 Jun 2022 23:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kuItC6x9omLpJgAAMHmgww
	(envelope-from <dsterba@suse.cz>); Thu, 09 Jun 2022 23:09:32 +0000
Date: Fri, 10 Jun 2022 01:05:01 +0200
From: David Sterba <dsterba@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Cc: dsterba@suse.cz, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
Message-ID: <20220609230501.GY20633@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
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
 <20220609163323.GV20633@twin.jikos.cz>
 <YqIwjEO1a0Sbxbym@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqIwjEO1a0Sbxbym@casper.infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_160934_347547_1DE5DB37 
X-CRM114-Status: GOOD (  22.57  )
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

On Thu, Jun 09, 2022 at 06:40:28PM +0100, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
> > On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> > > Use filemap_migrate_folio() to do the bulk of the work, and then copy
> > > the ordered flag across if needed.
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > Acked-by: David Sterba <dsterba@suse.com>
> > 
> > > +static int btrfs_migrate_folio(struct address_space *mapping,
> > > +			     struct folio *dst, struct folio *src,
> > >  			     enum migrate_mode mode)
> > >  {
> > > -	int ret;
> > > +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
> > >  
> > > -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
> > >  	if (ret != MIGRATEPAGE_SUCCESS)
> > >  		return ret;
> > >  
> > > -	if (page_has_private(page))
> > > -		attach_page_private(newpage, detach_page_private(page));
> > 
> > If I'm reading it correctly, the private pointer does not need to be set
> > like that anymore because it's done somewhere during the
> > filemap_migrate_folio() call.
> 
> That's correct.  Everything except moving the ordered flag across is
> done for you, and I'm kind of tempted to modify folio_migrate_flags()
> to copy the ordered flag across as well.  Then you could just use
> filemap_migrate_folio() directly.

Either way it works for me. If it would mean an unsafe change in folios
or complicate other code I'm fine with the migration callback that
does additional work for btrfs that could be changed later.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
