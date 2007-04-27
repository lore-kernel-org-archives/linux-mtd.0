Subject: Re: corruption of JFFS2 filesystem, csize is set to 0 after moving
	a block
From: David Woodhouse <dwmw2@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1177665229.18969.143.camel@localhost.localdomain>
References: <1177599259.18969.111.camel@localhost.localdomain>
	<1177602237.2755.414.camel@pmac.infradead.org>
	<1177665229.18969.143.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 27 Apr 2007 10:46:15 +0100
Message-Id: <1177667175.2755.476.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-04-27 at 11:13 +0200, Hans-Christian Egtvedt wrote:
> 
> Some filesystem dump from before:
>          Dirent     node at 0x0013c7e0, totlen 0x0000003b, #pino     7, version   148, #ino       150, nsize       19, name ld-uClibc-0.9.28.so
>          Inode      node at 0x0013c81c, totlen 0x00000a14, #ino    150, version     1, isize    13108, csize     2512, dsize     4092, offset        0
>          Inode      node at 0x0013d230, totlen 0x00000c57, #ino    150, version     2, isize    13108, csize     3091, dsize     4092, offset     4092
>          Inode      node at 0x0013de88, totlen 0x00000b21, #ino    150, version     3, isize    13108, csize     2781, dsize     4092, offset     8184
>          Inode      node at 0x0013e9ac, totlen 0x000001e0, #ino    150, version     4, isize    13108, csize      412, dsize      832, offset    12276

Those are suspect. Why 4092 bytes not 4096? The node with version 2
claims to be 4092 bytes starting from 4092, which is invalid because it
crosses a page boundary.

> After:
>          Dirent     node at 0x006c7bf0, totlen 0x0000003b, #pino     7, version   171, #ino       150, nsize       19, name ld-uClibc-0.9.28.so
>          Inode      node at 0x006c7c2c, totlen 0x00000a14, #ino    150, version     5, isize    13108, csize     2512, dsize     4092, offset        0
>          Inode      node at 0x006c8640, totlen 0x00000044, #ino    150, version     6, isize    13108, csize        0, dsize     4092, offset     4092
>          Inode      node at 0x006c8684, totlen 0x00000044, #ino    150, version     7, isize    13108, csize        0, dsize     4092, offset     8184
>          Inode      node at 0x006c86c8, totlen 0x00000044, #ino    150, version     8, isize    13108, csize        0, dsize      832, offset    12276 

Ok, in that case I agree that a csize of zero also looks suspicious.
Matches the node 'totlen' though. What's the compression type.

Did you use 'mkfs.jffs2 -s 4092'?

-- 
dwmw2
