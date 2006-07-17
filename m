Subject: RE: nandwrite problem
From: David Woodhouse <dwmw2@infradead.org>
To: Raj Kumar Yadav <ryadav@neomagic.com>
In-Reply-To: <004e01c6a9c2$b330d7b0$491fa8c0@pcryadav>
References: <004e01c6a9c2$b330d7b0$491fa8c0@pcryadav>
Content-Type: text/plain
Date: Mon, 17 Jul 2006 14:10:18 -0400
Message-Id: <1153159818.21539.6.camel@shinybook.infradead.org>
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

On Mon, 2006-07-17 at 22:31 +0530, Raj Kumar Yadav wrote:
> Also for mtdblock/5 the character node will be mtd10  "mknod /dev/mtd10 c 90
> 10".
> 
> With mtd character interface every partition is accessed through pair of two
> char device node.
> First with  read-write permission. Second with read-only permission.
> 
> It is like
> /dev/mtdblock/0   b 31 0
> /dev/mtd0               c 90 0 (Read-write)
> /dev/mtd1               c 90 1 (read only)
> 
> /dev/mtdblock/1   b 31 1
> /dev/mtd2               c 90 2 (Read-write)
> /dev/mtd3               c 90 3 (read only)
> 
> ...
> 
> /dev/mtdblock/5   b 31 5
> /dev/mtd10              c 90 10 (Read-write)
> /dev/mtd11              c 90 11 (read only) 

This is incorrect. Your description of the minor numbers and the meaning
of the device is right, but you're using entirely bogus names. They
should be mtd0, mtd0ro, mtd1, mtd1r0, etc. The device node with major
90, minor 10 is supposed to be called '/dev/mtd5'. If you use MAKEDEV or
udev, or if you just bother to follow the documentation, this should be
correct.

Do not top-post.

-- 
dwmw2
