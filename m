Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Avwtq-0007kM-Ux
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 11:08:23 +0000
Message-ID: <403C8225.3040801@arcom.com>
Date: Wed, 25 Feb 2004 11:08:21 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <20040225012449.90118.qmail@web20722.mail.yahoo.com>
In-Reply-To: <20040225012449.90118.qmail@web20722.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shawn Jin wrote:
> 
> In cfi_cmdset_0002.c, there is a piece of comment stating that the
> CFI_DEVICETYPE_X8 is needed even when cfi->device_type !=
> CFI_DEVICETYPE_X8. Why is it the case?

It appears to be to handle the case of x16 chips in x8 mode.  In such a 
case the device width is 2, interleave is 1 and buswidth is 1. 
Therefore, cfi_build_cmd_addr() will not generate the correct unlock 
addresses. (i.e., there's no integral solution to 0xaaa = addr * 
device_width (2) * interleave (1) which is the required unlock address.)

Not sure how to handle all possible arrangements of chips.

Dev. width | interleave  | buswidth |   addr1 |   addr2
-------------------------------------------------------
2          | 1           | 2        |   0xaaa |   0x554
2          | 1           | 1        |   0xaaa |   0x555
4          | 2           | 8        |  0x2aa8 |  0x1550

(addr1 and addr2 are byte addresses -- the AMD datasheets typically 
gives word addresses)

> So I replaced CFI_DEVICETYPE_X8 with cfi->device_type in both
> do_erase_oneblock() and do_write_oneword(). I tested and found that erase
> can succeed but write still fails.

Maybe you're using do_write_buffer(..) instead? There's a comment near 
it that says it may well be broken for interleaved chips, though.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
