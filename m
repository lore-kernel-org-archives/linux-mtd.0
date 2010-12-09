Received: from adelie.canonical.com ([91.189.90.139])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PQj0i-0008E5-LM
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2010 16:06:28 +0000
Date: Thu, 9 Dec 2010 10:05:49 -0600
From: Serge Hallyn <serge.hallyn@canonical.com>
To: John Stoffel <john@stoffel.org>
Subject: Re: [PATCH] fs/vfs/security: pass last path component to LSM on
	inode creation
Message-ID: <20101209160549.GA2315@peq>
References: <20101208194527.13537.77202.stgit@paris.rdu.redhat.com>
	<19712.61515.201226.938553@quad.stoffel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19712.61515.201226.938553@quad.stoffel.home>
Cc: jfs-discussion@lists.sourceforge.net, jack@suse.cz,
	penguin-kernel@I-love.SAKURA.ne.jp, jeffm@suse.com,
	jmorris@namei.org, dhowells@redhat.com, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, serue@us.ibm.com,
	shaggy@linux.vnet.ibm.com, shemminger@vyatta.com, hch@lst.de,
	hughd@google.com, joel.becker@oracle.com,
	cluster-devel@redhat.com, tao.ma@oracle.com, aelder@sgi.com,
	kees.cook@canonical.com, linux-ext4@vger.kernel.org,
	sds@tycho.nsa.gov, paul.moore@hp.com, mfasheh@suse.com,
	reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com,
	xfs-masters@oss.sgi.com, viro@zeniv.linux.org.uk,
	dchinner@redhat.com, eparis@parisplace.org, swhiteho@redhat.com,
	chris.mason@oracle.com, tytso@mit.edu,
	linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
	linux-security-module@vger.kernel.org,
	linux-btrfs@vger.kernel.org, casey@schaufler-ca.com,
	adilger.kernel@dilger.ca, akpm@linux-foundation.org,
	dwmw2@infradead.org, ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting John Stoffel (john@stoffel.org):
> >>>>> "Eric" == Eric Paris <eparis@redhat.com> writes:
> 
> Eric> SELinux would like to implement a new labeling behavior of newly
> Eric> created inodes.  We currently label new inodes based on the
> Eric> parent and the creating process.  This new behavior would also
> Eric> take into account the name of the new object when deciding the
> Eric> new label.  This is not the (supposed) full path, just the last
> Eric> component of the path.
> 
> Eric> This is very useful because creating /etc/shadow is different
> Eric> than creating /etc/passwd but the kernel hooks are unable to
> Eric> differentiate these operations.  We currently require that
> Eric> userspace realize it is doing some difficult operation like that
> Eric> and than userspace jumps through SELinux hoops to get things set
> Eric> up correctly.  This patch does not implement new behavior, that
> Eric> is obviously contained in a seperate SELinux patch, but it does
> Eric> pass the needed name down to the correct LSM hook.  If no such
> Eric> name exists it is fine to pass NULL.
> 
> I've looked this patch over, and maybe I'm missing something, but how
> does knowing the name of the file really tell you anything, esp when
> you only get the filename, not the path?  What threat are you
> addressing with this change?  

Like you, I keep thinking back to this patch and going back and forth.
But to answer your question:  in some cases, the name of the file
(plus the context of the directory in which it is created) can tell
you what assumptions userspace will make about it.  And userspace most
definately is a part of the TCB, i.e. /bin/passwd and /bin/login.

-serge
