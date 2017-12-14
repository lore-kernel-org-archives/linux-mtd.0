Received: from [45.249.212.35] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePQwG-0002EO-VA
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 10:40:31 +0000
Subject: Re: [PATCH] fs/*/Kconfig: drop links to 404-compliant
 http://acl.bestbits.at
To: Adam Borowski <kilobyte@angband.pl>, Alexander Viro
 <viro@zeniv.linux.org.uk>, <linux-fsdevel@vger.kernel.org>, Jan Kara
 <jack@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 <linux-ext4@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Eric Van Hensbergen <ericvh@gmail.com>, "Ron
 Minnich" <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>,
 <v9fs-developer@lists.sourceforge.net>, David Sterba <dsterba@suse.com>,
 <linux-btrfs@vger.kernel.org>, "Yan, Zheng" <zyan@redhat.com>, Sage Weil
 <sage@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 <ceph-devel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 <linux-cifs@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, David Woodhouse
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, Dave Kleikamp
 <shaggy@kernel.org>, <jfs-discussion@lists.sourceforge.net>,
 <reiserfs-devel@vger.kernel.org>, "Darrick J. Wong"
 <darrick.wong@oracle.com>, <linux-xfs@vger.kernel.org>
References: <20171213053825.10903-1-kilobyte@angband.pl>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8b0816ac-186e-77ec-68d9-d28e90d0d5d1@huawei.com>
Date: Thu, 14 Dec 2017 18:39:40 +0800
MIME-Version: 1.0
In-Reply-To: <20171213053825.10903-1-kilobyte@angband.pl>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017/12/13 13:38, Adam Borowski wrote:
> This link is replicated in most filesystems' config stanzas.  Referring
> to an archived version of that site is pointless as it mostly deals with
> patches; user documentation is available elsewhere.
> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

[skip]

> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 378c221d68a9..9a20ef42fadd 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -35,8 +35,7 @@ config F2FS_FS_XATTR
>  	default y
>  	help
>  	  Extended attributes are name:value pairs associated with inodes by
> -	  the kernel or by users (see the attr(5) manual page, or visit
> -	  <http://acl.bestbits.at/> for details).
> +	  the kernel or by users (see the attr(5) manual page for details).
>  
>  	  If unsure, say N.
>  
> @@ -49,9 +48,6 @@ config F2FS_FS_POSIX_ACL
>  	  Posix Access Control Lists (ACLs) support permissions for users and
>  	  groups beyond the owner/group/world scheme.
>  
> -	  To learn more about Access Control Lists, visit the POSIX ACLs for
> -	  Linux website <http://acl.bestbits.at/>.
> -
>  	  If you don't know what Access Control Lists are, say N
>  
>  config F2FS_FS_SECURITY

Looks good to me.

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,
