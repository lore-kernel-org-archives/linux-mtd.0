From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 24 Mar 2003 19:59:32 +0100
Subject: Flash trace...
In-Reply-To: <Pine.SOL.4.10.10303241208180.1668-100000@dogbert>
References: <Pine.SOL.4.10.10303241208180.1668-100000@dogbert>
Message-ID: <20030324185931.GA12963@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 24 March 2003 12:23:16 -0600, Siddharth Choudhuri wrote:
> 
> I am trying to get a trace/log of all reads, writes and erase made to
> flash. I added some printk in mtdchar.c [mtd_write() function] and
> mtdblock.c [handle_mtdblock_request() function], but I do not see any
> messages on console. I have klogd and syslog running too. 
> 
> I am running jffs2 on / and did a couple of file I/Os to look for console
> logs. Am I putting the printk in wrong  places ? I thought the mtdchar.c
> and mtdblock.c should be the closest thing to flash as all flash I/O
> requests would eventually go through these.

try putting the printk()s in chips/cfi_cmdset_00xx.c

J?rn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
