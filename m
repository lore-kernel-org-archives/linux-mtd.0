Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ODIc-0005nx-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2002 08:41:58 +0000
Date: Tue, 17 Dec 2002 10:12:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alex Pavloff <apavloff@eason.com>
Cc: "'Tobias Otto-Adamczak'" <toa@indakom.de>, linux-mtd@lists.infradead.org
Subject: Re: writing new BBRAM driver
Message-ID: <20021217091227.GA11194@wohnheim.fh-wedel.de>
References: <D3AF5F134D627243993F2F2FC32EE4D229C4B0@mailman.eason.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3AF5F134D627243993F2F2FC32EE4D229C4B0@mailman.eason.com>
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

On Mon, 16 December 2002 14:33:41 -0800, Alex Pavloff wrote:
> 
> Alright, one more question:  What should the erasesize be for BBRAM?
> Obviously I'm not worried about wear, so should it be zero or one or
> something else?

Depends. :-)
For jffs2, you need 5 free blocks for operation. But every used block
eats up ~150Byte roughly, depending on data and compression. Bigger
blocks eat memory, more blocks eat memory, minimum is somewhere in the
middle, you do the math.
For minix, fat, ext2/3 etc., this doesn't really matter. I'd pick 4k,
as that is pagesize on most machines, but even 1byte might work - with
lots of overhead.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
