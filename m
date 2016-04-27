Received: from tundra.namei.org ([65.99.196.166] helo=namei.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avJnu-0003MY-Qu
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 07:22:36 +0000
Date: Wed, 27 Apr 2016 17:22:02 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Seth Forshee <seth.forshee@canonical.com>
cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <mszeredi@redhat.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-kernel@vger.kernel.org, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v4 17/21] capabilities: Allow privileged user in s_user_ns
 to set security.* xattrs
In-Reply-To: <1461699396-33000-18-git-send-email-seth.forshee@canonical.com>
Message-ID: <alpine.LRH.2.20.1604271721471.796@namei.org>
References: <1461699396-33000-1-git-send-email-seth.forshee@canonical.com>
 <1461699396-33000-18-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Apr 2016, Seth Forshee wrote:

> A privileged user in s_user_ns will generally have the ability to
> manipulate the backing store and insert security.* xattrs into
> the filesystem directly. Therefore the kernel must be prepared to
> handle these xattrs from unprivileged mounts, and it makes little
> sense for commoncap to prevent writing these xattrs to the
> filesystem. The capability and LSM code have already been updated
> to appropriately handle xattrs from unprivileged mounts, so it
> is safe to loosen this restriction on setting xattrs.
> 
> The exception to this logic is that writing xattrs to a mounted
> filesystem may also cause the LSM inode_post_setxattr or
> inode_setsecurity callbacks to be invoked. SELinux will deny the
> xattr update by virtue of applying mountpoint labeling to
> unprivileged userns mounts, and Smack will deny the writes for
> any user without global CAP_MAC_ADMIN, so loosening the
> capability check in commoncap is safe in this respect as well.
> 
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> Acked-by: Serge Hallyn <serge.hallyn@canonical.com>


Acked-by: James Morris <james.l.morris@oracle.com>


-- 
James Morris
<jmorris@namei.org>
