Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrwCl-0005kA-Ml
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 05:39:52 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: matrix_lau@yahoo.com
In-Reply-To: <20050121100407.61148.qmail@web61208.mail.yahoo.com>
References: <20050121100407.61148.qmail@web61208.mail.yahoo.com>
Content-Type: text/plain
Date: Fri, 21 Jan 2005 11:39:49 +0100
Message-Id: <1106303989.5483.33.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2k Page support for the mtd driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-21 at 02:04 -0800, matrix lau wrote:
> Hi,
> 
> I have enable the debug msg as follow:
> 
> First mount after program : it's ok

What means first mount is ok ?

> root@work:/project/rootdisk# mount -t jffs2
> /dev/mtdblock/2 ./disk
> jffs2_check_nand_cleanmarker(): Cleanmarker node not
> detected in block at 00000000
> OOB at 00000000 was 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00

That's plain nonsense. 

Which version of nand_base.c are you using ?
Look for the $Id string in the top comment of the file.

Can you please show me your board driver ?

tglx
