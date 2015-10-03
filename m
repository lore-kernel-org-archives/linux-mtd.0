Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiS0m-0003JY-TK
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:58:25 +0000
Subject: Re: [PATCH v3 00/39] Add quota supporting in ubifs
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56102537.2080101@nod.at>
Date: Sat, 3 Oct 2015 20:57:59 +0200
MIME-Version: 1.0
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 15.09.2015 um 11:01 schrieb Dongsheng Yang:
> Hi all,
> 	This is the V3 to add quota in ubifs.
> 
> Hi Al,
> 	There are some patches about vfs, and
> some of them are already Reviewed-by Jan, please
> take a look at them. Thanx.
> 
> Hi Jan,
> 	There are some new patches for dquot,
> please take a look.
> 
> Hi Artem and Richard,
> 	please help to review the ubifs part.

Yang, from the discussion with Jan it seems as you'll send an v4 of your
patches.
Shall I wait with reviewing UBIFS specific parts or won't they change in v4?

> Dongsheng Yang (39):
>   fs: introduce a ->s_cdev field into struct super_block
>   fs: cleanup: remove the blank line before EXPORT_SYMBOL

This patch is unrelated to this series. Not sure if it makes sense to
carry it here.

>   fs: super: cleanup: make the comment of each function aligned
>   fs: super: consolidate the get_super class functions
>   fs: super: introduce a get_super_cdev to get super by a cdev reference
>   fs: super: introduce a get_super_cdev_thawed to get sb by cdev
>     reference
>   fs: char_dev: introduce cd_acquire function to acquire cdev
>   fs: introduce a __lookup_dev for internal using
>   fs: char_dev: introduce lookup_cdev to get cdev by pathname
>   fs: dquot: skip invalidate_bdev if bdev is NULL
>   fs: quota: replace opened calling of ->sync_fs with sync_filesystem
>   fs: quota: make quota support fs which is running on char dev
>   fs: introduce a get_qsize() to inode_operations
>   fs: quota: restore i_flags of quota files in dquot_disable
>   fs: quota: introduce a callback of restore_iflags to quotactl_ops

Jan, Al, will you take the VFS/quota specific changes or shall I
take them? Of course iff you ACK them.

Thanks,
//richard
