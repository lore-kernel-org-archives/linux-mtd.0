Received: from ppp82.spiderweb.com.au ([202.76.149.82] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZG5P-00037T-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 18:49:29 +0000
Date: Sat, 9 Feb 2002 04:30:30 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Adam Wozniak <adam.wozniak@comdev.cc>
cc: linux-mtd@lists.infradead.org
Subject: Re: i node, u node, we all node for inodes
In-Reply-To: <3C64199A.2E61AB33@comdev.cc>
Message-ID: <Pine.LNX.4.44.0202090427040.13267-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 8 Feb 2002, Adam Wozniak wrote:

> Is there some sort of "JFFS2 internals for dummies" guide around?

Well, there was one here at linux.conf.au a few hours ago :)

> I'm seeing odd behavior that I can only attribute to linked lists
> in RAM becoming corrupt, and I'd like to get a better understanding
> of how each list is used, etc...
> 
> In the JFFS2 context...
> 
> Is the next_phys chain in the raw_node_ref null terminated?

Yes.
> 
> Is the trick with the NULL member in the inode_cache guaranteed to
> always work, or just at boot time?

Always _except_ during boot time, when the NULL member is in fact used.

> Can an inode have raw nodes in multiple erase blocks?  If so, how is
> this represented in the raw_node_ref?

Yes. The raw_node_ref has a next_phys pointer pointing to the next 
physical node on the medium, and a next_in_ino pointer pointing to the 
next physical node belonging to the same inode. They're unrelated.

> Does an inode have a fixed or maximum size?

Do you mean a node? Not explicitly, although each type of node has its own 
limits so you could deduce the maximum node size you'll ever see.

> Can a raw node contain data used by mutiple inodes?  If not, what
> prevents this from happening?

Each node belongs to only one inode. It's generated for that inode, added 
to the list for that inode, the physical node on the flash contains the 
inode number. Why would it get shared?

-- 
dwmw2
