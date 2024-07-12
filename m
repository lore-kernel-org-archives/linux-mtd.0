Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C86C3DA45
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqZEKIIuLpn9yXQkiOPSgJDHR3KDX70ealb63GwzEY8=; b=V3e2WCGQg5anBs
	J6bwANFK5+XbC3Ap/q96V0nU0PoRTPneYZFcMzY/lYOU/12HJUkGAmZVsBHEdHyAKDGw7Y3QuivGZ
	Wc+z/sLF2ifkkFeG4UpN0m4B8IOufCOqV/CKwvHZi+RsvicHM/UnnkOjSoJpxuZbhFxHA7mE6CvcP
	vVdrQ9P8ZM//A0M9njl1MIBjksdcTSSvzi3u3XcmjkIR8y2NJkKHzLflRUZG14dyCWX3jEm4waDPu
	SOqxHB86zqOJWb34LWLOddck4G05PqZP5gNThtq+UTPc0jOQ99FZk7FKLO3j9JMCMLnMEvqoEUGn0
	BqSu3hPTBGlQjGeXSgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHP8-00000000Lbx-2mAL;
	Fri, 12 Jul 2024 14:37:46 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHP6-00000000Lay-1sLz
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 14:37:45 +0000
Received: from cwcc.thunk.org (pool-173-48-116-79.bstnma.fios.verizon.net [173.48.116.79])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46CEb8Pq026641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 10:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1720795032; bh=1Gn6aaaJtlJEaxDX5RF5pO/WPW2zmse3sX2wC3biWbQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=H+YYV5EgAW5YM8jOjPb5/kXfHSNhicmHQvMULSGWZvaL5Jrop5oNBR7HRvskjJZ5u
	 4JFfxYEjjwFeoKEaGdxxpLXj8WvHtpLcqXEuTYGOaJeocdS6VXclSwn8l4XwAFEfeN
	 pTO3ioXk3hG552FmpcbcHaflew3b4fgYCj/Xiuc98EQqM0Q4r5C5MzMjMHxVVer0TE
	 dgXs8jPrHEDiiWDHfIFOrDPHtTS8h95cNU3YkJDgHKvXR+gQ8z3R00yVQhctBzyinJ
	 RKTs684wIDVGAGwbS+y2+nc4jdvkFxRW/bKSItJrLUPfwBUpW9M21AqoStEwRRNVPa
	 G9z+tHBGyuJbQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 9F99D15C27B4; Fri, 12 Jul 2024 10:37:08 -0400 (EDT)
Date: Fri, 12 Jul 2024 10:37:08 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Zhihao Cheng <chengzhihao@huaweicloud.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-ext4@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>,
        Christoph Hellwig <hch@infradead.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        Richard Weinberger <richard@nod.at>,
        "zhangyi (F)" <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>,
        "wangzhaolong (A)" <wangzhaolong1@huawei.com>
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the
 inode lru traversing context on ext4 and ubifs
Message-ID: <20240712143708.GA151742@mit.edu>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_073744_649946_47D081EF 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Jul 12, 2024 at 02:27:20PM +0800, Zhihao Cheng wrote:
> Problem description
> ===================
> 
> The inode reclaiming process(See function prune_icache_sb) collects all
> reclaimable inodes and mark them with I_FREEING flag at first, at that
> time, other processes will be stuck if they try getting these inodes(See
> function find_inode_fast), then the reclaiming process destroy the
> inodes by function dispose_list().
> Some filesystems(eg. ext4 with ea_inode feature, ubifs with xattr) may
> do inode lookup in the inode evicting callback function, if the inode
> lookup is operated under the inode lru traversing context, deadlock
> problems may happen.
> 
> Case 1: In function ext4_evict_inode(), the ea inode lookup could happen
> if ea_inode feature is enabled, the lookup process will be stuck under
> the evicting context like this:
> 
>  1. File A has inode i_reg and an ea inode i_ea
>  2. getfattr(A, xattr_buf) // i_ea is added into lru // lru->i_ea
>  3. Then, following three processes running like this:
> 
>     PA                              PB
>  echo 2 > /proc/sys/vm/drop_caches
>   shrink_slab
>    prune_dcache_sb
>    // i_reg is added into lru, lru->i_ea->i_reg
>    prune_icache_sb
>     list_lru_walk_one
>      inode_lru_isolate
>       i_ea->i_state |= I_FREEING // set inode state
>       i_ea->i_state |= I_FREEING // set inode state

Um, I don't see how this can happen.  If the ea_inode is in use,
i_count will be greater than zero, and hence the inode will never be
go down the rest of the path in inode_lru_inode():

	if (atomic_read(&inode->i_count) ||
	    ...) {
		list_lru_isolate(lru, &inode->i_lru);
		spin_unlock(&inode->i_lock);
		this_cpu_dec(nr_unused);
		return LRU_REMOVED;
	}

Do you have an actual reproduer which triggers this?  Or would this
happen be any chance something that was dreamed up with DEPT?

       	      	     	       	    		- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
