Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5Xpq-0001S5-2W
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 22:23:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Eric Hammerle <ehammerle@spectracomcorp.com>
In-Reply-To: <00e501c41059$7533cf80$c4c80a0a@CoOp4>
References: <00e501c41059$7533cf80$c4c80a0a@CoOp4>
Content-Type: text/plain
Message-Id: <1079994228.16786.23.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 22 Mar 2004 22:23:49 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 IO
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-22 at 17:03 -0500, Eric Hammerle wrote:
> uClinux kernel 2.4.20-uc0 on an ARM7TDMI.  

> jffs2_scan_inode_node(): Data CRC failed on node at 0x0060000c: Read
> 0x17a11a74, calculated 0xedda2a7c

You need working alignment fixups. Failing that you'll probably get away
with putting get_unaligned() in the flash chip driver where it reads
from the buffer to write to the chip. Or in fact with the current code
just memcpy the name to an aligned location in
jffs2_garbage_collect_dirent(); I've just fixed the case of an unaligned
pointer coming in from commit_write() and I think that was the only
other time it happened.

-- 
dwmw2
