Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fnC4-0000kN-CJ
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 22:00:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Wuertele <dave-gnus@bfnet.com>
In-Reply-To: <m3smov3b07.fsf@bfnet.com>
References: <m3smov3b07.fsf@bfnet.com>
Message-Id: <1059080351.27746.3.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Thu, 24 Jul 2003 16:59:13 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: ARGH. About to write node to 0x00022fac on flash, but there's
 data already there
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-24 at 16:50, David Wuertele wrote:
> Whenever I write big files to my JFFS2 partition, I'm getting this
> error (see Subject: line).  Small files don't result in the error.  I
> googled for hints but found nothing helpful.  My stats:
> 
> mkfs.jffs2:   revision 1.32
> architecture: mipsel
> Kernel:       2.4.18 (CONFIG_JFFS2_FS=y, CONFIG_JFFS2_FS_DEBUG=2)

Upgrade to something vaguely recent -- or at least upgrade the JFFS2
code. If it still happens, set CONFIG_JFFS2_FS_DEBUG=1, log it via
serial console and show me the whole thing from (and including) mount
onwards. Have flash images from before and after available should I want
them.

-- 
dwmw2
