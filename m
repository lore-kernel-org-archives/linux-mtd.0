Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1s0z-0002tO-TT
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 15:40:35 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Brian T <btuch@usa.net>
In-Reply-To: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1093894808.25339.57.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 30 Aug 2004 14:40:13 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 file corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-08-30 at 14:30, Brian T wrote:
> Trying to (still) update from 2.4.20 to 2.4.27 on an x86 embedded unit.
> Made the kernel with CVS from 20040826 ( and added in the __ffs macro from
> the previous thread ).
> 
> Running on a 486 with 16mb Intel flash, 128k size erase sectors.  To create
> the file system I run :
> 
> mkfs.jffs2 -o romfs.img -U -n -p -e0x2000 -d romfs/

128KiB is 0x20000 (131072), not 0x2000 (8192).  Not sure if that was a
typo or not. 

> What other info would be needed to figure out what's wrong with this
> picture?

Maybe try setting CONFIG_JFFS2_FS_DEBUG=1.

josh
