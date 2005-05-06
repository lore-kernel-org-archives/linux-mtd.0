Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DU1wF-0000lG-AM
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 08:28:16 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: m.mikolaiczyk@rac.de
In-Reply-To: <427B3E53.3090803@rac.de>
References: <425E37FF.5040703@rac.de> <425E41D8.5070408@setabox.com>
	<425E4576.7030603@rac.de>  <427B3E53.3090803@rac.de>
Content-Type: text/plain
Date: Fri, 06 May 2005 12:10:03 +0000
Message-Id: <1115381403.19236.8.camel@tglx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash not found.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-05-06 at 11:52 +0200, Marcus Mikolaiczyk wrote:
>   value=0x90;
....
>   va[3]=NANDF_DATA;

The code in nand_scan does exactly the same

> Results:
> Maker Code: ec     Device Type: da

{"NAND 256MiB 3,3V 8-bit", 	0xDA, 0, 256, 0, ..

Thats the entry from nand_ids.c

> static int BTU_NAND_BASE = 0xAE000000;

> BTU_NAND_VIRT_BASE=(unsigned long)ioremap(BTU_NAND_BASE,SZ_4K);
> this->IO_ADDR_R = BTU_NAND_BASE;
> this->IO_ADDR_W = BTU_NAND_BASE;
-------------------^^^^^^^^^^^^^^
Using the virtual address instead of the physical address might be
helpful.

tglx
