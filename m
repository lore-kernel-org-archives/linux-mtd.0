Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUJj1-0007DH-Di
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 05:36:53 -0400
Message-ID: <46024E33.10406@ru.mvista.com>
Date: Thu, 22 Mar 2007 12:36:51 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: bug in drivers/mtd/onenand/onenand_base.c?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the piece of code below, though looking harmless, might cause side effects:

/**
 * onenand_oob_64 - oob info for large (2KB) page
 */
static struct nand_ecclayout onenand_oob_64 = {
        .eccbytes       = 20,
        .eccpos         = {
                8, 9, 10, 11, 12,
                24, 25, 26, 27, 28,
                40, 41, 42, 43, 44,
                56, 57, 58, 59, 60,
                },
        .oobfree        = {
                {2, 3}, {14, 2}, {18, 3}, {30, 2},
                {34, 3}, {46, 2}, {50, 3}, {62, 2}
        }
};

The problem is, the entry of oobfree past the last valid 
one should have length 0.

Here it's not the case: all the entries are occupied by 
OOB chunks. Therefore, once we get into a loop like

        for (free = this->ecclayout->oobfree; free->length; ++free) {

we might end up scanning past the real oobfree array.

Probably the best way out, as the same thing might happen for common NAND 
as well, is to check index against MTD_MAX_OOBFREE_ENTRIES.

Comments?

Vitaly
