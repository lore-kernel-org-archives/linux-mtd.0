Received: from h2.hallyn.com ([78.46.35.8])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5wFE-0001y9-Nw
 for linux-mtd@lists.infradead.org; Sat, 21 Oct 2017 16:03:30 +0000
Date: Sat, 21 Oct 2017 11:03:02 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Nicolas Belouin <nicolas@belouin.fr>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>,
 James Morris <james.l.morris@oracle.com>,
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-unionfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 linux-api@vger.kernel.org, kernel-hardening@lists.openwall.com
Subject: Re: [RFC PATCH 1/2] security, capabilities: create CAP_TRUSTED
Message-ID: <20171021160302.GA2842@mail.hallyn.com>
References: <20171021134558.21195-1-nicolas@belouin.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171021134558.21195-1-nicolas@belouin.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Nicolas Belouin (nicolas@belouin.fr):
> with CAP_SYS_ADMIN being bloated, the usefulness of using it to
> flag a process to be entrusted for e.g reading and writing trusted
> xattr is near zero.
> CAP_TRUSTED aims to provide userland with a way to mark a process as
> entrusted to do specific (not specially admin-centered) actions. It
> would for example allow a process to red/write the trusted xattrs.

You say "for example".  Are you intending to add more uses?  If so, what
are they?  If not, how about renaming it CAP_TRUSTED_XATTR?

What all does allowing writes to trusted xattrs give you?  There are
the overlayfs whiteouts, what else?
