Received: from ns.tz.ru ([194.149.234.1])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTAgz-0004NC-0Y
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 01:46:02 -0400
Date: Mon, 19 Mar 2007 08:45:52 +0300
From: Igor Marnat <marny@rambler.ru>
Message-ID: <41978953.20070319084552@rambler.ru>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
In-Reply-To: <1173705053.5493.28.camel@sauron>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Igor Marnat <marny@rambler.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem and List!

After some investigations I found some details of the problem, hope it
helps.

Having mounted the /dev/mtdblock0 device the jffs2 kernel thread begins garbage
collection. In a function jffs2_get_inode_nodes it tries to assemble
the chain of nodes of inode (if I got it correctly).

I printed the common length of chain of nodes, it is generally 2 or
3, in rare cases it is bigger than 3. My file system on this NAND is corrupted in 2
places (at least). At the first time loop  "while (valid_ref)" in jffs2_get_inode_nodes is passed about
28000 times and (I guess) system considers this chain as consisted of
28000 items. This chain passes successfully crc check
of node header in jffs2_get_inode_nodes. Anyway it doesn't pass CRC check later. It writes the
message "JFFS2 notice: (450) check_node_data: wrong data CRC in data
node at" and process continues. 

But it cannot pass the second corrupted place. It doesn't meet the
NULL node, so the valid_ref is  always not NULL. It passes crc check of node header,
so the loop continues till the system exhausted all the
memory available (there are calls to kmalloc in the loop). When the
chain length grows up to 110000 entries, oom killer begins to stop
kernel threads and a bit later all the system reboots.

The problem is big for me, it is not a problem when some file
gets corrupted but it shouldn't prevent the whole system from running,
especially when the fs in problem is not the root fs.

So the questions are:
1. May be the function jffs2_get_inode_nodes can be improved? It's
possible to pre-calculate chain length before trying to read it into
the memory and allocate memory for it. It can be considered as broken if it's length
exceeds some pre-defined maximum.

2. What can I do with the broken filesystem? Can I repair it?

3. Any other ideas or considerations?

I tried it on a several kernel versions, including 2.6.20.3.

Thank you for your help,
Best regards,
Igor Marnat
mailto:marny@rambler.ru
