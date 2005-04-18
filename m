Received: from ppsw-2.csi.cam.ac.uk ([131.111.8.132])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DNWSH-0006NC-L9
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2005 14:38:26 +0100
From: Anton Altaparmakov <aia21@cam.ac.uk>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <1113829708.5286.30.camel@localhost.localdomain>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
	<20050418105301.GA21878@infradead.org>
	<1113824781.2125.12.camel@sauron.oktetlabs.ru>
	<20050418115220.GA22750@infradead.org>
	<1113827466.2125.47.camel@sauron.oktetlabs.ru>
	<20050418124656.GA23387@infradead.org>
	<1113829708.5286.30.camel@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1113831474.13640.2.camel@imp.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: aia21@hermes.cam.ac.uk
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: ntfs ->iput use - was: Re: [PATC] small VFS change for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 18 Apr 2005 13:38:24 -0000

Hi Christoph,

If you remember you complained about ntfs' "fishy use of iput"?

I think that David's explanation below is exactly the reason why I had
to do it IIRC...  So if the vfs is fixed so the below can _never_ happen
anymore then I believe it would be safe to do as you and Al suggest and
stop using iput in a "fishy" way in ntfs...

Best regards,

	Anton

On Mon, 2005-04-18 at 23:08 +1000, David Woodhouse wrote:
> On Mon, 2005-04-18 at 13:46 +0100, Christoph Hellwig wrote:
> > Any, this sounds like you'd want to use ilookup because you don't want
> > to read the inode in the cache anyway, right?
> 
> We use ilookup() in some circumstances -- if the inode has zero nlink
> and hence we definitely don't want to pull it back again if it's gone.
> 
> But sometimes we really do mean to use iget() to bring it into core. And
> it's in that case that I believe Artem has found the problem, because if
> I understand correctly he's still seeing two consecutive calls to
> read_inode() for the same inode, without a clear_inode() in between.
> 
> prune_icache() is removing the inode from i_hash at line 457 of inode.c,
> then being preempted when it drops the inode_lock at line 464, which is
> _before_ it calls dispose_list() to actually get rid of the inode(s) in
> question. So when iget() is called, the VFS ends up calling read_inode()
> again instead of waiting for the original inode to finish going away.

-- 
Anton Altaparmakov <aia21 at cam.ac.uk> (replace at with @)
Unix Support, Computing Service, University of Cambridge, CB2 3QH, UK
Linux NTFS maintainer / IRC: #ntfs on irc.freenode.net
WWW: http://linux-ntfs.sf.net/ & http://www-stu.christs.cam.ac.uk/~aia21/
