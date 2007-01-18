Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7YgG-0000Ex-Ce
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 09:56:00 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1H7YfO-00035A-JR
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 15:55:05 +0100
Received: from 212.98.167.157 ([212.98.167.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2007 15:55:02 +0100
Received: from daermon by 212.98.167.157 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2007 15:55:02 +0100
To: linux-mtd@lists.infradead.org
From: Dmitry <daermon@mail.ru>
Subject: m28w640fst flash: quarduple words write method
Date: Thu, 18 Jan 2007 16:40:22 +0200
Message-ID: <eoo0sn$p05$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, All
Kernel: linux-sh4-2.6.11.12_stm20-33
flash:  m28w640fst
This flash is CFI compatible, but it doesn't support buffer write method 
(CFI command - 0xe8). Flash support single (CFI command - 0x10 or 0x40), 
double (CFI command - 0x30) and quadruple (CFI command - 0x56) words 
write method.
MTD supports only single word write method for this flash.
I have implemented double words write method. It works fine.
But I have problem with quadruple word write method implementation.

Part of function:
static int __xipram do_write_quadrupleword(
	struct map_info *map,
	struct flchip *chip,
	unsigned long adr,
	const u_char *buf,
	int len)
{
<...skip...>
         XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
         ENABLE_VPP(map);
         xip_disable(map, chip, adr);
         map_write(map, CMD(0x56), adr);

         datum = map_word_ff(map);

         datum = map_word_load(map, buf);
         map_write(map, datum, adr);

         datum = map_word_load(map, buf+2);
         map_write(map, datum, adr+2);

         datum = map_word_load(map, buf+4);
         map_write(map, datum, adr+4);

         datum = map_word_load(map, buf+6);
         map_write(map, datum, adr+6);

         map_write(map,CMD(0x70),adr);
         status = map_read(map, adr);
         printk("--> %s: status %X\n", __FUNCTION__, status);
<...skip...>

Several fist status is 0x80 ('OK'), then function gets status 0x92 
('Program Error' and 'Program/Erase on protected Block, Abort').

Does anybody implement this write method or know what wrong?
Thank you.
