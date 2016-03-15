Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afp6C-0006HA-KT
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 13:33:25 +0000
Received: by mail-oi0-x229.google.com with SMTP id d205so12873983oia.0
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2016 06:32:43 -0700 (PDT)
Date: Tue, 15 Mar 2016 08:32:41 -0500
From: Seth Forshee <seth.forshee@canonical.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, devel@openvz.org,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@poochiereds.net>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Andy Lutomirski <luto@amacapital.net>,
 linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org, selinux@tycho.nsa.gov,
 linux-fsdevel@vger.kernel.org,
 Konstantin Khorenko <khorenko@virtuozzo.com>,
 Pavel Emelyanov <xemul@virtuozzo.com>
Subject: Re: [PATCH] fs: fix a posible leak of allocated superblock
Message-ID: <20160315133241.GA27754@ubuntu-xps13>
References: <1443039368-55445-2-git-send-email-seth.forshee@canonical.com>
 <1458043730-14296-1-git-send-email-ptikhomirov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458043730-14296-1-git-send-email-ptikhomirov@virtuozzo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 15, 2016 at 03:08:50PM +0300, Pavel Tikhomirov wrote:
> We probably need to fix superblock leak in patch (v4 "fs: Add user
> namesapace member to struct super_block"):
> 
> Imagine posible code path in sget_userns: we iterate through
> type->fs_supers and do not find suitable sb, we drop sb_lock to
> allocate s and go to retry. After we dropped sb_lock some other
> task from different userns takes sb_lock, it is already in retry
> stage and has s allocated, so it puts its s in type->fs_supers
> list. So in retry we will find these sb in list and check it has
> a different userns, and finally we will return without freeing s.
> 
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Good catch.

Acked-by: Seth Forshee <seth.forshee@canonical.com>
