Received: from web20722.mail.yahoo.com ([216.136.226.76])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvnnC-0006Re-20
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 01:24:54 +0000
Message-ID: <20040225012449.90118.qmail@web20722.mail.yahoo.com>
Date: Tue, 24 Feb 2004 17:24:49 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In cfi_cmdset_0002.c, there is a piece of comment stating that the
CFI_DEVICETYPE_X8 is needed even when cfi->device_type !=
CFI_DEVICETYPE_X8. Why is it the case?

In my case, two Am29PL320D chips are interleaved and each works in 32-bit
mode. So the buswidth is 64 bits. When CFI_DEVICETYPE_x8 is used in either
erase_oneblock() or write_oneword(), the command address generated is not
right. For example, to erase a block, the following commands are generated:
    Addr: 0xff002aaa  Data: 0x000000aa000000aa
    Addr: 0xff001554  Data: 0x0000005500000055
I found out that the cfi->addr_unlock1(2) are set to 0x1555 (0xaaa) because
of CFI_DEVICETYPE_X32 in cfi_cmdset_0002().

According to the datasheet of Am29PL320D
(http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/24075.pdf),
the correct addresses should be 0xff002aa8 (555 << 3) and 0xff001550 (2aa
<< 3).

So I replaced CFI_DEVICETYPE_X8 with cfi->device_type in both
do_erase_oneblock() and do_write_oneword(). I tested and found that erase
can succeed but write still fails.

Any ideas or explanations?

Thanks,
-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
