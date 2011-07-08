Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QfDke-0004ca-Ni
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 16:18:02 +0000
Date: Fri, 8 Jul 2011 17:17:22 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH] fs/vfs/security: pass last path component to LSM on
	inode creation
Message-ID: <20110708161722.GG11013@ZenIV.linux.org.uk>
References: <20101208194527.13537.77202.stgit@paris.rdu.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101208194527.13537.77202.stgit@paris.rdu.redhat.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: jfs-discussion@lists.sourceforge.net, jack@suse.cz,
	penguin-kernel@I-love.SAKURA.ne.jp, jeffm@suse.com,
	joel.becker@oracle.com, dhowells@redhat.com, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, serue@us.ibm.com,
	shaggy@linux.vnet.ibm.com, shemminger@vyatta.com, hch@lst.de,
	hughd@google.com, jmorris@namei.org, cluster-devel@redhat.com,
	tao.ma@oracle.com, aelder@sgi.com, kees.cook@canonical.com,
	linux-ext4@vger.kernel.org, sds@tycho.nsa.gov, paul.moore@hp.com,
	mfasheh@suse.com, reiserfs-devel@vger.kernel.org,
	xfs@oss.sgi.com, xfs-masters@oss.sgi.com, dchinner@redhat.com,
	eparis@parisplace.org, swhiteho@redhat.com,
	chris.mason@oracle.com, tytso@mit.edu, linux-kernel@vger.kernel.org,
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

On Wed, Dec 08, 2010 at 02:45:27PM -0500, Eric Paris wrote:
> SELinux would like to implement a new labeling behavior of newly created
> inodes.  We currently label new inodes based on the parent and the creating
> process.  This new behavior would also take into account the name of the
> new object when deciding the new label.  This is not the (supposed) full path,
> just the last component of the path.
> 
> This is very useful because creating /etc/shadow is different than creating
> /etc/passwd but the kernel hooks are unable to differentiate these
> operations.  We currently require that userspace realize it is doing some
> difficult operation like that and than userspace jumps through SELinux hoops
> to get things set up correctly.  This patch does not implement new
> behavior, that is obviously contained in a seperate SELinux patch, but it
> does pass the needed name down to the correct LSM hook.  If no such name
> exists it is fine to pass NULL.

-ETOOFUCKINGUGLY...
