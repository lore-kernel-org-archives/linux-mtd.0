Received: from ms-smtp-03.nyroc.rr.com ([24.92.226.153])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BcIV-0001PJ-Ev
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 16:18:03 +0100
From: "Dave Ellis" <dge@sixnetio.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Fri, 2 May 2003 11:18:04 -0400
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
MIME-Version: 1.0
In-Reply-To: <1051860665.21608.36.camel@imladris.demon.co.uk>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: RE: Oops in mounting jffs2 (jffs2_get_ino_cache())
Reply-To: dge@sixnetio.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, May 02, 2003 at 3:31 AM, David Woodhouse wrote:
> On Wed, 2003-04-30 at 21:41, David Woodhouse wrote:
> > On Wed, 2003-04-30 at 21:22, Vipin Malik wrote:
> > > I'm using CVS code (HEAD) from Feb 16th on x86 w/ NOR flash chips
(AMD).
> > > 
> > > I've been doing pwr fail testing on my application code and during
a power 
> > > up I got the following Oops.
> > 
> >
http://lists.infradead.org/pipermail/linux-mtd/2003-February/007115.html

> >
> > cvs up
> 
> Urgh. That fix isn't enough. The idea is that we file nodes against
the
> inode number they claim to belong to, and only later when we check the
> crc do we throw away the bogus ones such as the one you found, which
> claim to belong to inode #0xffffffef.
> 
> Unfortunately, this still means that we set c->highest_ino to
> 0xffffffef, and the inode numbers are going to wrap around fairly
> quickly thereafter, leading to massive corruption since we don't
> actually check for ino# wrap -- we don't really expect to ever get
past
> 4 milliard inodes, and we just start again at zero.
>
> I think I need to fix the ino wrap case, and also check the node_crc
> during mount _if_ the node in question is causing us to allocate a new
> jffs2_inode_cache -- i.e. if it's for an inode we haven't seen before.
 
I think it is OK. Even during mount the inode crc is checked in 
jffs2_scan_inode_node() before adding a _new_ inode to the cache (it 
checks only if the inode isn't already in the cache). So every inode 
number in the cache must have at least one valid inode node, which 
keeps the bad inodes like #0xffffffef and #0xffffffff out of the cache.

The inode numbers that change c->highest_ino all come from the inode
cache, so it should never see the bad values.

FWIW I had an image which had the problem, and once the oops was fixed
it
worked fine, with no signs of corruption.

Dave
