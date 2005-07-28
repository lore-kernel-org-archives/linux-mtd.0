Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyBIH-0001lx-AW
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 12:31:43 -0400
Message-ID: <42E90864.1080100@mvista.com>
Date: Thu, 28 Jul 2005 09:31:32 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Mirco Fuchs <mircofuchs@web.de>
References: <7686279@web.de>
In-Reply-To: <7686279@web.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with AT91RM9200 and intel cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mirco Fuchs wrote:

> #> umount /mnt/jffs2
> 
> The instruction aborts with the following error:
...
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
...
> Backtrace:
> [<c01b22c0>] (__down_write+0x0/0xd4) from [<c00d8140>] (jffs2_flush_wbuf_pad+0x1c/0x3c)

Looks like there were multiple fixes for similar problems, in addition 
to the patch I pointed you at on linux-arm-kernel.  Patch in the latest 
linux-mtd code from CVS and see if it's fixed?  Or if you don't need 
NAND flash support (you mention Intel CFI flash) then 
CONFIG_JFFS2_FS_NAND=n might get rid of it.

-- 
Todd
