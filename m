Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBamr-00045n-7j
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 15:45:49 +0100
Date: Thu, 8 Apr 2004 16:45:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040408144542.GB1921@wohnheim.fh-wedel.de>
References: <407547DF.1020404@imc-berlin.de> <40754B83.3020000@imc-berlin.de>
	<200404081458.56018.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200404081458.56018.tglx@linutronix.de>
cc: MTD <linux-mtd@lists.infradead.org>
cc: Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: Changing the number of JFFS2 erasblocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 April 2004 14:58:56 +0200, Thomas Gleixner wrote:
> 
> You can do this, but it will break and it will break your root jffs2 too, as 
> there is no way to have this per partition. This all is related to garbage 
> collection and the neccecarity to have spare blocks for writing / deleting 
> /modifying files. In a read only fs this would not hurt.
> 
> 320K is not really useful for a filesystem IMHO. 
> What do you want to do with it ?

Here we go again...

2 Eraseblocks (in words: two) are enough to put a jffs2 filesystem on
it.  One eraseblock plus a few bytes have to be reserved for garbage
collection, but not two, much less five.

Jffs2 should:
- Switch from free blocks to free bytes.
- Make this per-mountpoint.
- Make the numbers depend on number and size of erase blocks.

Maybe I will even do this one day, but not before Redhat lawyers and
myself sort out some things.  Don't tell me "Show me the code.", since
it wouldn't get included anyway.

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
