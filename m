Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF73BC83F14
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lVNozbVyzZGJRDhYNis3yjU/0YFikNya4LPVocSzwQ=; b=nKChRZEIUpG3KK
	BcuoEWFFATrtSVZsAqm933CEVR+Epwn38Hfe0XKgEHgUCsj+S/9gWfAOmUNrVw6EytK/Jv34BXz+p
	BkwucIpNq+XWbDLvg4f7NE3QWcrur46fGVnzjbIKDZsRgGMyJu8+Hjf6VqFBHcTZ+Au2Bl/ODRkQt
	lm2QT39Kna1mDCJvq/qtBsClopknaMkmOSftsmeXF3E5qnk4LQ0JbJC6vPJN+vTiDNrzRpoxAbp2U
	q/1NRPXSRR/D2wtw7mSPJs1r3c4U+FgDcW+h8xRVthNjT3UqAz4j9ekGIZSTAi7DpO36Ll5LRjiC1
	DYHj6XS4QZ0aBsRHjasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatMg-00AxUI-1A;
	Tue, 29 Aug 2023 07:42:18 +0000
Received: from out-249.mta1.migadu.com ([2001:41d0:203:375::f9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qatMc-00AxQl-1z
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 07:42:16 +0000
Message-ID: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1693294923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzCYK+m1dXoYq1GdX9wRq/xLcjMjzBwHZbogX1zaiXI=;
	b=wx9qXfUOb6FlguPiqwy6R82+yQxWta9+fR66YAQ2/1ZdnqJnQPp1kHU4jR8nRlngim3iOe
	HThmnzNEUSaEuQwHiVi+WxF88JyUG2K+H0WcvTm70cW04LSIUXyP6AZ74VPb7aBxP9rojs
	L1LrBvpa76A1LVLwfY5LHU6MjnCVZUs=
Date: Tue, 29 Aug 2023 15:41:43 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 02/11] xfs: add NOWAIT semantics for readdir
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Stefan Roesch <shr@fb.com>,
 Clay Harris <bugs@claycon.org>, Dave Chinner <david@fromorbit.com>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-cachefs@redhat.com, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org, Wanpeng Li <wanpengli@tencent.com>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_004214_821849_7F30F7AC 
X-CRM114-Status: GOOD (  26.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/28/23 04:44, Matthew Wilcox wrote:
> On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
>> +++ b/fs/xfs/libxfs/xfs_da_btree.c
>> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>>   	struct xfs_buf_map	map, *mapp = &map;
>>   	int			nmap = 1;
>>   	int			error;
>> +	int			buf_flags = 0;
>>   
>>   	*bpp = NULL;
>>   	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>>   	if (error || !nmap)
>>   		goto out_free;
>>   
>> +	/*
>> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
>> +	 * issue IO for this buffer if it is not already in memory. Caller will
>> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
>> +	 * be locked, and no buffer and no error if it isn't in memory.  We
>> +	 * translate both of those into a return state of -EAGAIN and *bpp =
>> +	 * NULL.
>> +	 */
> 
> I would not include this comment.

No strong comment here, since this patch is mostly from Dave, it's
better if Dave can ack this.

> 
>> +	if (flags & XFS_DABUF_NOWAIT)
>> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>>   	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>>   			&bp, ops);
> 
> what tsting did you do with this?  Because you don't actually _use_
> buf_flags anywhere in this patch (presumably they should be the
> sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
> conclude that either you didn't test, or your testing was inadequate.
> 


The tests I've done are listed in the cover-letter, this one is missed, 
the tricky place is it's hard to get this kind of mistake since it runs
well without nowait logic...I'll fix it in next version.

>>   	if (error)
>>   		goto out_free;
>> +	if (!bp) {
>> +		ASSERT(flags & XFS_DABUF_NOWAIT);
> 
> I don't think this ASSERT is appropriate.
> 
>> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>>   				bp = NULL;
>>   			}
>>   
>> -			if (*lock_mode == 0)
>> -				*lock_mode = xfs_ilock_data_map_shared(dp);
>> +			if (*lock_mode == 0) {
>> +				*lock_mode =
>> +					xfs_ilock_data_map_shared_generic(dp,
>> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
>> +				if (!*lock_mode) {
>> +					error = -EAGAIN;
>> +					break;
>> +				}
>> +			}
> 
> 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> And this is far too far indented.
> 
> 			xfs_dir2_lock(dp, ctx, lock_mode);
> 
> with:
> 
> STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> 		unsigned int lock_mode)
> {
> 	if (*lock_mode)
> 		return;
> 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> 		return xfs_ilock_data_map_shared_nowait(dp);
> 	return xfs_ilock_data_map_shared(dp);
> }
> 
> ... which I think you can use elsewhere in this patch (reformat it to
> XFS coding style, of course).  And then you don't need
> xfs_ilock_data_map_shared_generic().
> 

How about rename xfs_ilock_data_map_shared() to 
xfs_ilock_data_map_block() and rename 
xfs_ilock_data_map_shared_generic() to xfs_ilock_data_map_shared()?

STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct 
dir_context *ctx, unsigned int lock_mode)
{
  	if (*lock_mode)
  		return;
  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
  		return xfs_ilock_data_map_shared_nowait(dp);
  	return xfs_ilock_data_map_shared_block(dp);
}



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
