Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAUsN-0000pM-Oy
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2013 00:28:05 +0000
Date: Wed, 27 Feb 2013 00:27:55 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: JFFS2 deadlock
Message-ID: <20130227002755.GL4503@ZenIV.linux.org.uk>
References: <512CA290.6050509@mimc.co.uk>
 <20130227101704.90466ae6df78ab9b3aa4ba22@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130227101704.90466ae6df78ab9b3aa4ba22@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org,
 Mark Jackson <mpfj-list@mimc.co.uk>, David Woodhouse <dwmw2@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 27, 2013 at 10:17:04AM +1100, Stephen Rothwell wrote:
> Hi Mark,
> 
> On Tue, 26 Feb 2013 11:54:56 +0000 Mark Jackson <mpfj-list@mimc.co.uk> wrote:
> >
> > Just tested the current next-20130226 on a custom AM335X board, and I received the JFFS2 deadlock shown below.
> 
> Is this new today?  is it reproducible? Does if ail for Linus' tree?
> 
> Al, could this be something to do with the new stuff in the vfs tree?

Very unlikely.  jffs2_readdir() does, indeed, grab ->sem on the inode in
question and then calls the callback (which might fault, grabbing ->mmap_sem).
Had been doing that all along.  And if the userland area we are doing
getdents(2) into had been mmapped from jffs2 file, jffs2_readpage() would
be called, which would grab ->sem on the inode of file mmaped in there.
Again, that had been going on all along.  Unlike the situation with ->i_mutex,
this one is probably a false positive - ->sem on directories nests outside of
->mmap_sem, ->sem on non-directories - inside.  But that false positive
shouldn't be something new; hell, both paths are present in 2.6.12 with
the lock orders as in the current tree (except that ->sem used to be
a semaphore instead of a mutex).
