Received: from mycroft.westnet.com ([216.187.52.7])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQi4C-0005gy-QR
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2010 15:05:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <19712.61515.201226.938553@quad.stoffel.home>
Date: Thu, 9 Dec 2010 10:05:47 -0500
From: "John Stoffel" <john@stoffel.org>
To: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH] fs/vfs/security: pass last path component to LSM on inode
	creation
In-Reply-To: <20101208194527.13537.77202.stgit@paris.rdu.redhat.com>
References: <20101208194527.13537.77202.stgit@paris.rdu.redhat.com>
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

>>>>> "Eric" == Eric Paris <eparis@redhat.com> writes:

Eric> SELinux would like to implement a new labeling behavior of newly
Eric> created inodes.  We currently label new inodes based on the
Eric> parent and the creating process.  This new behavior would also
Eric> take into account the name of the new object when deciding the
Eric> new label.  This is not the (supposed) full path, just the last
Eric> component of the path.

Eric> This is very useful because creating /etc/shadow is different
Eric> than creating /etc/passwd but the kernel hooks are unable to
Eric> differentiate these operations.  We currently require that
Eric> userspace realize it is doing some difficult operation like that
Eric> and than userspace jumps through SELinux hoops to get things set
Eric> up correctly.  This patch does not implement new behavior, that
Eric> is obviously contained in a seperate SELinux patch, but it does
Eric> pass the needed name down to the correct LSM hook.  If no such
Eric> name exists it is fine to pass NULL.

I've looked this patch over, and maybe I'm missing something, but how
does knowing the name of the file really tell you anything, esp when
you only get the filename, not the path?  What threat are you
addressing with this change?  

So what happens when I create a file /home/john/shadow, does selinux
(or LSM in general) then run extra checks because the filename is
'shadow' in your model?  

I *think* the overhead shouldn't be there if SELINUX is disabled, but
have you confirmed this?  How you run performance tests before/after
this change when doing lots of creations of inodes to see what sort of
performance changes might be there?

Thanks,
John
