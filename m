Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192twz-0003Ik-Tb
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 15:19:50 +0100
Date: Tue, 8 Apr 2003 16:19:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20030408141952.GA30313@wohnheim.fh-wedel.de>
References: <3E92D5C7.8020603@imc-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E92D5C7.8020603@imc-berlin.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 uncompressed?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 April 2003 15:59:35 +0200, Steven Scholz wrote:
> 
> IIRC files are stored compressed on a JFFS2 partition.
> 
> Is there any chance that I could use JFFS2 without any compression?
> 
> I guess this might me faster for our embedded system!

Piece of cake.
Look at fs/jffs2/compr.c, first function. Add a couple of #if 0 and
you're done.

Do the same with the second function and the kernel image should
shrink a little.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
