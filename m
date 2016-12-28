Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMBr6-00043A-CE
 for linux-mtd@lists.infradead.org; Wed, 28 Dec 2016 10:53:13 +0000
Subject: Re: [PATCH v2] romfs: use different way to generate fsid for BLOCK or
 MTD
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1482915207-109005-1-git-send-email-colyli@suse.de>
 <CAFLxGvz5et4pxYSMdS0EKJjJTCT53Ns+ok1p1dPPO=uPUV25ZA@mail.gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, nongli1031@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Coly Li <colyli@suse.de>
Message-ID: <00ceb848-a378-9624-8a24-010a73b095f5@suse.de>
Date: Wed, 28 Dec 2016 18:52:37 +0800
MIME-Version: 1.0
In-Reply-To: <CAFLxGvz5et4pxYSMdS0EKJjJTCT53Ns+ok1p1dPPO=uPUV25ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2016/12/28 下午5:44, Richard Weinberger wrote:
> CC'ing MTD
> 
> On Wed, Dec 28, 2016 at 9:53 AM, Coly Li <colyli@suse.de> wrote:
>>  static struct kmem_cache *romfs_inode_cachep;
>> @@ -416,8 +417,14 @@ static void romfs_destroy_inode(struct inode *inode)
>>  static int romfs_statfs(struct dentry *dentry, struct kstatfs *buf)
>>  {
>>         struct super_block *sb = dentry->d_sb;
>> -       u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
>> +       u64 id = 0;
>>
>> +#ifdef CONFIG_ROMFS_ON_BLOCK
>> +       id = huge_encode_dev(sb->s_bdev->bd_dev);
>> +#endif
>> +#ifdef  CONFIG_ROMFS_ON_MTD
>> +       id = huge_encode_dev(sb->s_dev);
>> +#endif
> 
> How is this supposed to work with CONFIG_ROMFS_BACKED_BY_BOTH=y?

Aha! Thanks for telling me this config option.
The purpose of f_fsid is to unify a file system volume, if
CONFIG_ROMFS_BACKED_BY_BOTH=y, it can firstly try sb->s_bdev->bd_dev. If
sb->s_bdev is NULL, then try sb->s_dev. If both failed, then f_fsid will
be 0.

> 
>>         buf->f_type = ROMFS_MAGIC;
>>         buf->f_namelen = ROMFS_MAXFN;
>>         buf->f_bsize = ROMBSIZE;
>> @@ -489,6 +496,13 @@ static int romfs_fill_super(struct super_block *sb, void *data, int silent)
>>         sb->s_flags |= MS_RDONLY | MS_NOATIME;
>>         sb->s_op = &romfs_super_ops;
>>
>> +#ifdef CONFIG_ROMFS_ON_MTD
>> +       /* Use same dev ID from the underlying mtdblock device */
>> +       if (sb->s_mtd)
>> +               sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, sb->s_mtd->index);
>> +       else
>> +               sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, 0);
> 
> Hmm, when there is no MTD, s_dev is still equal to mtd0, since mtd0 is
> ->index of
> value 0. This seems fishy to me.

You are right, if both CONFIG_ROMFS_ON_BLOCK and CONFIG_ROMFS_ON_MTD are
defined, here is buggy.

Thanks for your review, I will send out another version.

Coly
