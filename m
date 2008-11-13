Received: from e35.co.us.ibm.com ([32.97.110.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0Pvd-0005H4-2S
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 00:19:33 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mAD0IgZA001970
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2008 17:18:42 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mAD0JJDG162322
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2008 17:19:19 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mAD0Ios1010975
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2008 17:18:50 -0700
Subject: Re: [PATCH] filesystems: use has_capability_noaudit interface for
	reserved blocks checks
From: Mingming Cao <cmm@us.ibm.com>
To: Eric Paris <eparis@redhat.com>
In-Reply-To: <1226430769.3353.5.camel@localhost.localdomain>
References: <1226430769.3353.5.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2008 16:19:18 -0800
Message-Id: <1226535558.12488.30.camel@mingming-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: adilger@sun.com, tytso@mit.edu, ext-adrian.hunter@nokia.com, sct@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-mtd@lists.infradead.org, dushistov@mail.ru,
	akpm@linux-foundation.org, linux-ext4@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


在 2008-11-11二的 14:12 -0500，Eric Paris写道：
> ext[2,3,4], ufs, and ubifs all check for  CAP_SYS_RESOURCE to determine
> if they should allow reserved blocks to be used.  A process not having
> this capability is not failing some security decision and should not be
> audited.  Thus move to using has_capability_noaudit.
> 
Looks fine to me.

Eric Sandeen has  mentioned earlier about the security audit issue with
ext4. We fixed it in ext4, with this it is even better.


Reviewed-by: Mingming Cao <cmm@us.ibm.com>
> Signed-off-by: Eric Paris <eparis@redhat.com>
> ---
> 
> I would like to push this patch through the security tree (since that's
> the only place the new cap_noaudit interface exists), but I'd like to
> get an ACK from each subsystem maintainer.
> 
>  fs/ext2/balloc.c     |    2 +-
>  fs/ext3/balloc.c     |    2 +-
>  fs/ext4/balloc.c     |    2 +-
>  fs/ubifs/budget.c    |    3 ++-
>  fs/ufs/balloc.c      |    2 +-
>  security/commoncap.c |    1 +
>  security/security.c  |    1 +
>  7 files changed, 8 insertions(+), 5 deletions(-)
> 
> 
> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
> index 6dac7ba..e06d96d 100644
> --- a/fs/ext2/balloc.c
> +++ b/fs/ext2/balloc.c
> @@ -1192,7 +1192,7 @@ static int ext2_has_free_blocks(struct ext2_sb_info *sbi)
> 
>  	free_blocks = percpu_counter_read_positive(&sbi->s_freeblocks_counter);
>  	root_blocks = le32_to_cpu(sbi->s_es->s_r_blocks_count);
> -	if (free_blocks < root_blocks + 1 && !capable(CAP_SYS_RESOURCE) &&
> +	if (free_blocks < root_blocks + 1 && !has_capability_noaudit(current, CAP_SYS_RESOURCE) &&
>  		sbi->s_resuid != current->fsuid &&
>  		(sbi->s_resgid == 0 || !in_group_p (sbi->s_resgid))) {
>  		return 0;
> diff --git a/fs/ext3/balloc.c b/fs/ext3/balloc.c
> index f5b57a2..f224ee4 100644
> --- a/fs/ext3/balloc.c
> +++ b/fs/ext3/balloc.c
> @@ -1421,7 +1421,7 @@ static int ext3_has_free_blocks(struct ext3_sb_info *sbi)
> 
>  	free_blocks = percpu_counter_read_positive(&sbi->s_freeblocks_counter);
>  	root_blocks = le32_to_cpu(sbi->s_es->s_r_blocks_count);
> -	if (free_blocks < root_blocks + 1 && !capable(CAP_SYS_RESOURCE) &&
> +	if (free_blocks < root_blocks + 1 && !has_capability_noaudit(current, CAP_SYS_RESOURCE) &&
>  		sbi->s_resuid != current->fsuid &&
>  		(sbi->s_resgid == 0 || !in_group_p (sbi->s_resgid))) {
>  		return 0;
> diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
> index d2003cd..a7c7c52 100644
> --- a/fs/ext4/balloc.c
> +++ b/fs/ext4/balloc.c
> @@ -626,7 +626,7 @@ int ext4_has_free_blocks(struct ext4_sb_info *sbi, s64 nblocks)
>  	/* Hm, nope.  Are (enough) root reserved blocks available? */
>  	if (sbi->s_resuid == current->fsuid ||
>  	    ((sbi->s_resgid != 0) && in_group_p(sbi->s_resgid)) ||
> -	    capable(CAP_SYS_RESOURCE)) {
> +	    has_capability_noaudit(current, CAP_SYS_RESOURCE)) {
>  		if (free_blocks >= (nblocks + dirty_blocks))
>  			return 1;
>  	}
> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index 1a4973e..d17b8b4 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -32,6 +32,7 @@
> 
>  #include "ubifs.h"
>  #include <linux/writeback.h>
> +#include <linux/capability.h>
>  #include <asm/div64.h>
> 
>  /*
> @@ -363,7 +364,7 @@ long long ubifs_calc_available(const struct ubifs_info *c, int min_idx_lebs)
>   */
>  static int can_use_rp(struct ubifs_info *c)
>  {
> -	if (current->fsuid == c->rp_uid || capable(CAP_SYS_RESOURCE) ||
> +	if (current->fsuid == c->rp_uid || has_capability_noaudit(current, CAP_SYS_RESOURCE) ||
>  	    (c->rp_gid != 0 && in_group_p(c->rp_gid)))
>  		return 1;
>  	return 0;
> diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
> index 0d9ada1..ad4398b 100644
> --- a/fs/ufs/balloc.c
> +++ b/fs/ufs/balloc.c
> @@ -411,7 +411,7 @@ u64 ufs_new_fragments(struct inode *inode, void *p, u64 fragment,
>  	/*
>  	 * There is not enough space for user on the device
>  	 */
> -	if (!capable(CAP_SYS_RESOURCE) && ufs_freespace(uspi, UFS_MINFREE) <= 0) {
> +	if (!has_capability_noaudit(current, CAP_SYS_RESOURCE) && ufs_freespace(uspi, UFS_MINFREE) <= 0) {
>  		unlock_super (sb);
>  		UFSD("EXIT (FAILED)\n");
>  		return 0;
> diff --git a/security/commoncap.c b/security/commoncap.c
> index 73999f6..5401e77 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -55,6 +55,7 @@ int cap_capable(struct task_struct *tsk, int cap, int audit)
>  		return 0;
>  	return -EPERM;
>  }
> +EXPORT_SYMBOL(cap_capable);
> 
>  int cap_settime(struct timespec *ts, struct timezone *tz)
>  {
> diff --git a/security/security.c b/security/security.c
> index 346f21e..d061eb1 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -170,6 +170,7 @@ int security_capable_noaudit(struct task_struct *tsk, int cap)
>  {
>  	return security_ops->capable(tsk, cap, SECURITY_CAP_NOAUDIT);
>  }
> +EXPORT_SYMBOL(security_capable_noaudit);
> 
>  int security_acct(struct file *file)
>  {
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ext4" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
