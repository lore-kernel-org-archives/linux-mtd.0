Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNn80-0006TK-1m
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 19:48:44 +0000
Received: by mail-ig0-x236.google.com with SMTP id z14so43376178igp.1
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 11:48:21 -0800 (PST)
Date: Mon, 25 Jan 2016 13:47:22 -0600
From: Seth Forshee <seth.forshee@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 00/19] Support fuse mounts in user namespaces
Message-ID: <20160125194722.GA10638@ubuntu-hedt>
References: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 12:03:39PM -0600, Seth Forshee wrote:
> These patches implement support for mounting filesystems in user
> namespaces using fuse. They are based on the patches in the for-testing
> branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git,
> but I've rebased them onto 4.4-rc3. I've pushed all of this to:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fuse-userns
> 
> The patches are organized into three high-level groups.
> 
> Patches 1-6 are related to security, adding restrictions for
> unprivileged mounts and updating the LSMs as needed. Patches 1-2
> (checking inode permissions for block device mounts) may not be strictly
> necessary for fuseblk mounts since fuse doesn't do any IO on the block
> device in the kernel, but it still seems like a good idea to fail the
> mount if the user doesn't have the required permissions for the inode
> (though this is a bit misleading with fuse since the mounts are done via
> a suid-root helper).
> 
> Patches 7-14 update most of the vfs to translate ids correctly and deal
> with inodes which may have invalid user/group ids. I've omitted patches
> for anything not used by fuse - quota, fs freezing, some helper
> functions, etc. - but if these are wanted for the sake of completeness I
> can include them.
> 
> Patches 15-18 update fuse to deal with mounts from non-init pid and user
> namespaces and enable mounting from user namespaces.
> 
> Changes since v1:
>  - Drop patch for FIBMAP.
>  - Use current_in_userns in fuse_allow_current_process.
>  - Remove checks for uid/gid validity in fuse. Intead, ids from the
>    backing store which do not map into s_user_ns will result in invalid
>    ids in the vfs inode. Checks in the vfs will prevent unmappable ids
>    from being passed in from above.
>  - Update a couple of commit messages to provide more detail about
>    changes.

Now that the merge window is over, I'm wondering whether it might be
possible to get some feedback on these patches this cycle?

Thanks,
Seth
