Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ip4t-0007aE-VY
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 13:21:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: m.neiger@synergie-inf.com
In-Reply-To: <515CABE7496FD111AA3300201829FCBE2FFE30@archie.gsi.synergie-inf.com>
References: 
	 <515CABE7496FD111AA3300201829FCBE2FFE30@archie.gsi.synergie-inf.com>
Message-Id: <1053606128.21582.146.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 22 May 2003 13:22:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 scanning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-05-22 at 13:12, Marc Neiger wrote:
> Hi,
> 
> is it possible to tell (from command line ?) jffs2 not to scan some MTD
> devices ?

JFFS2 will only scan those MTD devices which you explicitly ask it to
mount. You can tell it not to by simply refraining from trying to mount
the device :)

> I have some mtd partitions in NOR flash which are to be accessed as raw
> devices and a NAND flash which is JFFS2. With debugging enabled JFFS2
> reports pages and pages of messages regarding what it found in NOR,
> moreover, it could eventually understand something wrong !

That's odd. Are you mounting the NOR device as root and just specifying
it with 'root=/dev/mtdblock$n' on the kernel command line? If so, try
also adding 'rootfstype=cramfs' (or whatever fs it is). The kernel will
try all available file systems in the order they were linked into the
kernel image, so it's that or hack fs/Makefile to link them in the other
order. Or make JFFS2 a loadable module and load it once the rootfs is
mounted, I suppose.

-- 
dwmw2
