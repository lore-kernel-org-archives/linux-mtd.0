Received: from mail-ob0-f180.google.com ([209.85.214.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcN0y-0005QB-Qr
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 00:25:29 +0000
Received: by obbda8 with SMTP id da8so1748719obb.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2015 17:25:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1442433764-80826-3-git-send-email-seth.forshee@canonical.com>
References: <1442433764-80826-1-git-send-email-seth.forshee@canonical.com>
 <1442433764-80826-3-git-send-email-seth.forshee@canonical.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 16 Sep 2015 17:24:47 -0700
Message-ID: <CALCETrXoAi91JN4VLD2ybPgkD_J26=2_N-fyCCjOPL5Swo7kGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] userns: Simpilify MNT_NODEV handling.
To: Seth Forshee <seth.forshee@canonical.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@poochiereds.net>, "J. Bruce Fields" <bfields@fieldses.org>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 SELinux-NSA <selinux@tycho.nsa.gov>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 16, 2015 at 1:02 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> From: "Eric W. Biederman" <ebiederm@xmission.com>
>
> - Consolidate the testing if a device node may be opened in a new
>   function may_open_dev.
>
> - Move the check for allowing access to device nodes on filesystems
>   not mounted in the initial user namespace from mount time to open
>   time and include it in may_open_dev.
>
> This set of changes removes the implicit adding of MNT_NODEV which
> simplifies the logic in fs/namespace.c and removes a potentially
> problematic user visible difference in how normal and unprivileged
> mount namespaces work.
>
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

> -               /* Only in special cases allow devices from mounts
> -                * created outside the initial user namespace.
> -                */
> -               if (!(type->fs_flags & FS_USERNS_DEV_MOUNT)) {
> -                       flags |= MS_NODEV;
> -                       mnt_flags |= MNT_NODEV | MNT_LOCK_NODEV;
> -               }

This is an ABI change.  It's probably okay, but I think the commit
message should make it clear what's happening.


--Andy
