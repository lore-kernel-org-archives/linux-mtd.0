Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4uSc-0000vZ-7i
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 17:47:58 +0000
Received: by igcto18 with SMTP id to18so41291834igc.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 09:47:37 -0800 (PST)
Date: Fri, 4 Dec 2015 11:46:05 -0600
From: Seth Forshee <seth.forshee@canonical.com>
To: "Serge E. Hallyn" <serge.hallyn@ubuntu.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov
Subject: Re: [PATCH 09/19] fs: Refuse uid/gid changes which don't map into
 s_user_ns
Message-ID: <20151204174605.GC147214@ubuntu-hedt>
References: <1449070821-73820-1-git-send-email-seth.forshee@canonical.com>
 <1449070821-73820-10-git-send-email-seth.forshee@canonical.com>
 <20151204172738.GA2280@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151204172738.GA2280@mail.hallyn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 11:27:38AM -0600, Serge E. Hallyn wrote:
> On Wed, Dec 02, 2015 at 09:40:09AM -0600, Seth Forshee wrote:
> > Add checks to inode_change_ok to verify that uid and gid changes
> > will map into the superblock's user namespace. If they do not
> > fail with -EOVERFLOW. This cannot be overriden with ATTR_FORCE.
> > 
> > Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> 
> Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
> 
> ...  although i could see root on the host being upset that it can't
> assign a uid not valid in the mounter's ns.  But it does seem safer.

That change wouldn't be representable in the backing store though, and
that could lead to unexpected behaviour. It's better to tell root that
we can't make the requested change, in my opinion.
