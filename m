Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vclJ-00088W-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 12:29:09 +0100
Date: Thu, 11 Apr 2002 13:29:04 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Derek Ross <dross@iders.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: What is smallest JFFS2 size (#blocks)
Message-ID: <20020411132904.B11640@wohnheim.fh-wedel.de>
References: <008f01c1e097$2dce41a0$87657bc8@athlon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <008f01c1e097$2dce41a0$87657bc8@athlon>; from dross@iders.ca on Wed, Apr 10, 2002 at 08:54:05AM -0500
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

On Wed, 10 April 2002 08:54:05 -0500, Derek Ross wrote:
> We plan to use JFFS2 to store several
> text configuration files, but we don't 
> expect the total size of the files to 
> be more than 10k or so.
> 
> What is the smallest possible size
> for a JFFS2 file system, in number
> of blocks? I'm sure it's at least 2...

joern@dublin:/usr/src/linux/fs/jffs2> grep "#define" *.h
...
nodelist.h:#define ALLOC_GC     2       /* Space requested for GC. Give it or die */
nodelist.h:#define JFFS2_RESERVED_BLOCKS_BASE 3

Looks like 6 is the correct answer. But you can reduce
JFFS2_RESERVED_BLOCKS_BASE down to 0 - at your own risk of course.

Jörn

-- 
Smart data structures and dumb code works a lot better than the other
way around.
-- Eric Raymond in "The cathedral and the bazaar"
