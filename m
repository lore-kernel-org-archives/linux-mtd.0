From: David Woodhouse <dwmw2@infradead.org>
To: gyf606-mtd@yahoo.com.cn
In-Reply-To: <20040916031038.30732.qmail@web15710.mail.cnb.yahoo.com>
References: <20040916031038.30732.qmail@web15710.mail.cnb.yahoo.com>
Content-Type: text/plain
Message-Id: <1095326635.9144.2198.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 16 Sep 2004 10:23:55 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 filesystem on flash problem CRC errpr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-09-16 at 11:10 +0800, gyf606-mtd@yahoo.com.cn wrote:
> /usr> erase /dev/mtd4
> Erase Total 1 Units
> Performing Flash Erase of length 131072 at offset 0x0 done

You erased only the first block (128KiB) of the partition.

> /usr> cp fs2.img /dev/mtd4

You wrote the image using the character device, which does not erase
first -- hence performing a bitwise 'OR' with the previous contents of
the flash.

> /usr> mount -t jffs2 /dev/mtdblock4 /mnt

You mounted it.

> jffs2_scan_dirent_node(): Name CRC failed on node at 0x00000000: Read 0xca6598d0, calculated
> 0x00000000

It was corrupt.

Use 'eraseall' instead of 'erase'.

-- 
dwmw2
