Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BV0S-0000GR-4E
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 08:30:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
In-Reply-To: <1051735274.2850.305.camel@imladris.demon.co.uk>
References: <5.1.0.14.0.20030430145340.02502ea8@ns.webzsite.com>
	 <1051735274.2850.305.camel@imladris.demon.co.uk>
Message-Id: <1051860665.21608.36.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 02 May 2003 08:31:05 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Dave Ellis <DGE@sixnetio.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-30 at 21:41, David Woodhouse wrote:
> On Wed, 2003-04-30 at 21:22, Vipin Malik wrote:
> > I'm using CVS code (HEAD) from Feb 16th on x86 w/ NOR flash chips (AMD).
> > 
> > I've been doing pwr fail testing on my application code and during a power 
> > up I got the following Oops.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2003-February/007115.html
> 
> cvs up

Urgh. That fix isn't enough. The idea is that we file nodes against the
inode number they claim to belong to, and only later when we check the
crc do we throw away the bogus ones such as the one you found, which
claim to belong to inode #0xffffffef.

Unfortunately, this still means that we set c->highest_ino to
0xffffffef, and the inode numbers are going to wrap around fairly
quickly thereafter, leading to massive corruption since we don't
actually check for ino# wrap -- we don't really expect to ever get past
4 milliard inodes, and we just start again at zero.

I think I need to fix the ino wrap case, and also check the node_crc
during mount _if_ the node in question is causing us to allocate a new
jffs2_inode_cache -- i.e. if it's for an inode we haven't seen before.

-- 
dwmw2
