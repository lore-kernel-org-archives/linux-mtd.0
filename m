Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RsdJ-00008W-FR
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 12:58:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Massimo =?ISO-8859-1?Q?Cal=F2?= <m.calo@ctsgroup.it>
In-Reply-To: <001001c333fb$3c2b3ba0$e10106c0@Massimo>
References: <001001c333fb$3c2b3ba0$e10106c0@Massimo>
Message-Id: <1055764754.2289.37.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 16 Jun 2003 12:59:15 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Data CRC failed on node...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-16 at 12:34, Massimo Calò wrote:
> Hi All,
> 
>     I have a 5272 Motorola Coldfire based board, running "uClinux dist. :
> uClinux-20030305.tar.gz" +
> 
> "Tool Chain : m68k-elf-tools-20030314.sh.".
> 
> I have a 2Mb flash (AMD AM29LV160DB) using MTD + JFFS2.
> 
> It has worked fine for a long time, then I received the following message
> during the bootstarp :

>         jffs2_scan_inode_node(): Data CRC failed on node at 0x0005ca64: Read
> 0xb399e587c

That's normal and harmless. It's just a warning, not an error. You
powered down while a node was being written -- perhaps by the garbage
collection thread. In that case, the previous node containing the same
data will still be valid and will continue to be used. No data are lost.

> To fix the problem I do the command "eraseall /dev/mtd2" and the error was
> cleared.

Or you could have waited until the block containing the offending node
was garbage-collected, and it would have gone away on its own.

> Do I have to mount/unmount the flash every time I have to read/write from it
> ?

No, but if you want to avoid the cosmetic warnings, you should mount the
file system readonly or unmount it before each _reboot_.

-- 
dwmw2
