Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZFh8-00035o-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 18:24:22 +0000
Message-ID: <3C64199A.2E61AB33@comdev.cc>
Date: Fri, 08 Feb 2002 10:31:54 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: i node, u node, we all node for inodes
References: <Pine.LNX.4.44.0202081054280.25850-100000@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Is there some sort of "JFFS2 internals for dummies" guide around?

I'm seeing odd behavior that I can only attribute to linked lists
in RAM becoming corrupt, and I'd like to get a better understanding
of how each list is used, etc...

In the JFFS2 context...

Is the next_phys chain in the raw_node_ref null terminated?

Is the trick with the NULL member in the inode_cache guaranteed to
always work,
or just at boot time?

Can an inode have raw nodes in multiple erase blocks?  If so, how is
this
represented in the raw_node_ref?

Does an inode have a fixed or maximum size?

Can a raw node contain data used by mutiple inodes?  If not, what
prevents
this from happening?

Some basic definitions would be helpful.

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
