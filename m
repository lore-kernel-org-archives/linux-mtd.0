Received: from real.realitydiluted.com ([208.242.241.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H2zV-0000Pc-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 13:39:51 +0100
Message-ID: <3B406B63.4E28CA8A@cotw.com>
Date: Mon, 02 Jul 2001 07:38:59 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
Reply-To: sjhill@cotw.com
MIME-Version: 1.0
To: "Adam J. Richter" <adam@yggdrasil.com>
CC: dwmw2@redhat.com, linux-kernel@vger.kernel.org,
 	linux-mtd@lists.infradead.org
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols
References: <200107012207.PAA01921@adam.yggdrasil.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

"Adam J. Richter" wrote:
> 
>         linux-2.4.6-pre8/drivers/mtd/nand/spia.c references four
> undefined symbols, presumably intended to be #define constants,
> although I am not sure what their values are supposed to be:
> 
>         IO_BASE
>         FIO_BASE
>         PEDR
>         PEDDR
> 
The way that I architected the raw NAND flash device driver was to
break it into 2 parts. 'nand.c' contains the actual driver code and
is considered to be device independent. 'spia.c' is the device
dependent part. You should write your own version of 'spia.c' and
"simply" fill in the addresses for the IO address and control
register address depending on your specific hardware. The above
symbols are only defined for my specific hardware. They should be
changed to values used on your hardware platform. Let me know if
you need further assistance.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
