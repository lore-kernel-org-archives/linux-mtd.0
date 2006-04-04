Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQg4A-0001NT-Ul
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 03:35:10 -0400
Message-ID: <44322186.3060800@yandex.ru>
Date: Tue, 04 Apr 2006 11:34:30 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ladislav Michl <ladis@linux-mips.org>
References: <20060322115409.GA2242@orphique> <20060322194939.GA10058@orphique>
	<20060403154933.GA18475@orphique>
In-Reply-To: <20060403154933.GA18475@orphique>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 BUG() on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Ladislav Michl wrote:
> jffs2_scan_inode_node adds also inodes with zero nlink to
> unchecked_space, but jffs2_garbage_collect_pass skips them. That
> probably leads to above problem. After applying following patch
> BUG() is no longer triggered.
> 

<snip>

> I'm not sure what is correct solution. With this change there are lots of
> JFFS2 warning: (138) jffs2_get_inode_nodes: Eep. No valid nodes for ino #465.
> JFFS2 warning: (138) jffs2_do_read_inode_internal: no data nodes found for ino #465
> Returned error for crccheck of ino #465. Expect badness...
> warnings. Jffs2 summary feature is disabled. I'd be very gratefull for ideas.

Actually, there is a jffs2_build_filesystem() function which walks all 
inodes with nlink == 0 and pretends to dispense with them. I believe 
that function is the right place to fix. I ganced at it, and it appeared 
to be thet it calls jffs2_mark_node_obsolete() for all nodes of this 
inode. jffs2_mark_node_obsolete() is a huge and fearsom monster-function 
which may do something wrong.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
