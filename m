Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZdxAz-0001sX-Iq
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 09:14:22 +0000
Date: Mon, 21 Sep 2015 11:13:55 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Jan Kara <jack@suse.cz>, viro@ZenIV.linux.org.uk, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 36/39] ubifs: implement ubifs_get_qsize to get quota
 size in ubifs
Message-ID: <20150921091355.GA9028@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-37-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916100007.GD13325@quack.suse.cz>
 <55FA6A5F.1010702@cn.fujitsu.com>
 <20150917120044.GC32280@quack.suse.cz>
 <55FBABD8.9030002@cn.fujitsu.com>
 <20150918112006.GA16306@quack.suse.cz>
 <55FF88F5.5070703@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55FF88F5.5070703@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon 21-09-15 12:35:01, Dongsheng Yang wrote:
> On 09/18/2015 07:20 PM, Jan Kara wrote:
> >>.... TBH, there is a little different with other filesystems. I did not
> >>use the "disk" space, but the file space in ubifs quota, although dquot
> >>means disk quota. Same with btrfs quota. If we use disk space for quota,
> >>the most common problem from user is that: why I did not reach the limit
> >>but I can not write any byte. COW in btrfs or out-place-updating in
> >>ubifs makes this problem much worse.
> >>
> >>So I choose file space here for ubifs.
> >
> >OK, so these are really two separate questions. I understand your choice of
> >using file space as the amount of space to account for quota purposes and
> >I'm fine with that choice. Another thing is that regardless of how you
> >decide to do quota accounting, you must maintain i_blocks / i_bytes to
> >contain proper value because dquot_transfer() uses that information to update
> >quota usage when inode owner is changed.
> 
> But if we don't use i_blocks to get qsize, what we care only in
> dquot_transter() is dquot->dq_dqb. That means, even if the i_blocks
> is not correct in dquot_transfer() in ubifs, that's okey, because we
> will never use this value, right?

dquot_transfer() will use the value - when file F changes owner from user A
to user B, then you need to decrement amount of space used by F from A's
quota usage and add that amount to B's quota usage. And the amount of space
is obtained via inode_get_bytes() which uses i_blocks and i_bytes. See
__dquot_transfer() in fs/quota/dquot.c for details.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
