Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7I8C-0003nX-VP
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 14:06:37 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: extabe@bredband.net
In-Reply-To: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
References: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Mar 2005 20:06:28 +0100
Message-Id: <1109963188.4032.192.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trying to get 1Gb Samsung nand flash working
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-04 at 18:49 +0000, extabe@bredband.net wrote:
> The flash works well in U-boot enviroment with jffs2 but I can´t get it running i Linux.
> The chip i detected but then it reads badblocks on the entire chip.
> 
> "Scanning device for bad blocks
> nand_read_oob: from = 0x00000000, len = 2
> Bad eraseblock 0 at 0x00000000"
> ..and so on.
>  I´ve used the same driver running a 64Mb nandflash with good result.
>
> Anyone else who used this chip?

I don't think its a chip problem. 

What's the exact chip type ?
Which kernel version ? 
Are you using MTD CVS code ?

Please tell me the CVS $Id string from drivers/mtd/nand/nand_bbt.c

tglx
