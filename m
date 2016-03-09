Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1addqR-0005rZ-7f
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 13:08:07 +0000
Received: by mail-wm0-x230.google.com with SMTP id l68so70117788wml.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 05:07:46 -0800 (PST)
Date: Wed, 9 Mar 2016 14:08:55 +0100
From: Miklos Szeredi <miklos@szeredi.hu>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 linux-kernel@vger.kernel.org, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Subject: Re: [PATCH RESEND v2 18/18] fuse: Allow user namespace mounts
Message-ID: <20160309130855.GH8655@tucsk>
References: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
 <1451930639-94331-19-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451930639-94331-19-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 12:03:57PM -0600, Seth Forshee wrote:
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

> ---
>  fs/fuse/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index b7bdfdac3521..2fd338c199ce 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1201,7 +1201,7 @@ static void fuse_kill_sb_anon(struct super_block *sb)
>  static struct file_system_type fuse_fs_type = {
>  	.owner		= THIS_MODULE,
>  	.name		= "fuse",
> -	.fs_flags	= FS_HAS_SUBTYPE,
> +	.fs_flags	= FS_HAS_SUBTYPE | FS_USERNS_MOUNT,
>  	.mount		= fuse_mount,
>  	.kill_sb	= fuse_kill_sb_anon,
>  };
> @@ -1233,7 +1233,7 @@ static struct file_system_type fuseblk_fs_type = {
>  	.name		= "fuseblk",
>  	.mount		= fuse_mount_blk,
>  	.kill_sb	= fuse_kill_sb_blk,
> -	.fs_flags	= FS_REQUIRES_DEV | FS_HAS_SUBTYPE,
> +	.fs_flags	= FS_REQUIRES_DEV | FS_HAS_SUBTYPE | FS_USERNS_MOUNT,
>  };
>  MODULE_ALIAS_FS("fuseblk");
>  
> -- 
> 1.9.1
> 
