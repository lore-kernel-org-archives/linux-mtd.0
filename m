Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BcO7-0001US-OQ
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 16:23:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: dge@sixnetio.com
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
References: <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
Message-Id: <1051889041.23448.30.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 02 May 2003 16:24:01 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: RE: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-02 at 16:18, Dave Ellis wrote:
> I think it is OK. Even during mount the inode crc is checked in 
> jffs2_scan_inode_node() before adding a _new_ inode to the cache (it 
> checks only if the inode isn't already in the cache). So every inode 
> number in the cache must have at least one valid inode node, which 
> keeps the bad inodes like #0xffffffef and #0xffffffff out of the cache.
> 
> The inode numbers that change c->highest_ino all come from the inode
> cache, so it should never see the bad values.

You're right -- evidently I did think of this at the time :)

-- 
dwmw2
