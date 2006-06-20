Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsfxN-0002lK-Go
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 09:08:16 -0400
Message-ID: <4497F550.6090302@epico.si>
Date: Tue, 20 Jun 2006 15:17:04 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] AT91RM9200 NAND support
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>	
	<1150787336.6780.102.camel@localhost.localdomain>	
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>	
	<4497A723.2070006@epico.si>	
	<1150790417.6780.107.camel@localhost.localdomain>	
	<4497BAE2.3010602@epico.si>	
	<1150795093.6780.117.camel@localhost.localdomain>	
	<4497D2CE.7070000@epico.si>	
	<1150801960.6780.132.camel@localhost.localdomain>
	<4497DF09.70404@epico.si>	
	<1150804501.6780.141.camel@localhost.localdomain>	
	<4497E9D4.9040307@epico.si>	
	<1150807480.6780.157.camel@localhost.localdomain>
	<1150807931.6780.160.camel@localhost.localdomain>
In-Reply-To: <1150807931.6780.160.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Thomas Gleixner wrote:

>On Tue, 2006-06-20 at 14:44 +0200, Thomas Gleixner wrote:
>  
>
> Oops, looked at the wrong place. The culprit is elsewhere.
>
>Please replace the debug patch by the one below.
>  
>
[...]

Here is what I get.
    savin

Chip not ready in nand_command():
Last caller: c012bd44 (nand_base.c:1638)
Last command: 0x10
Current caller: c012c12c (nand_base.c:1728)
Current command: 0x60

Chip not ready in nand_command():
Last caller: c012bffc (nand_base.c:1393)
Last command: 0x10
Current caller: c012bfd0 (nand_base.c:1382)
Current command: 0x80

Chip not ready in nand_command():
Last caller: c012bd44 (nand_base.c:1638)
Last command: 0x10
Current caller: c012b688 (nand_base.c:996)
Current command: 0x00

961     static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
996     chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);

1375    static int nand_write_page(struct mtd_info *mtd, struct 
nand_chip *chip,
1382    chip->ecc.write_page(mtd, chip, buf);
1393    status = chip->waitfunc(mtd, chip, FL_WRITING);

1582    static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
1638    status = chip->waitfunc(mtd, chip, FL_WRITING);

1723    static void single_erase_cmd(struct mtd_info *mtd, int page)
1728    chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
