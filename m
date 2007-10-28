Subject: Re: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071027231812.GA21216@lazybastard.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
	<20071027231812.GA21216@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Oct 2007 22:00:44 -0400
Message-Id: <1193536844.2915.36.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 2007-10-28 at 01:18 +0200, Jörn Engel wrote:
> On Fri, 26 October 2007 19:17:40 -0400, David Woodhouse wrote:
> > 
> > We probably need to implement a release() operation in the
> > jffs2_dir_operations (top of dir.c), which will remove the fake
> > 'deletion' dirents if !atomic_read(&inode->i_count). Or something like
> > that.
> 
> I hate to spoil the fun, but this can cause problems with nfs.
> 
> It is legal for nfs to call telldir, close the directory, wait for half
> a year, then open the directory, call seekdir and expect sane results.
> Not pretty at all for filesystem implementors.
> 
> So either these deletion dirents need to stay around or you have to
> convert the i_pos "cookie" to a hash of the filename or so or at least
> explicitly document that you have broken nfs under some circumstances.

Well, the f->dents list is _already_ ordered by the hash of the
filename. The only reason we _don't_ use the hash as the i_pos 'cookie'
is because of the potential for hash collisions.

If we could deal with that, we could use trees for it instead of a
linked list.

-- 
dwmw2
