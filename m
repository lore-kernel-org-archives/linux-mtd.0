Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1En3sL-0002tV-I5
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 19:55:19 -0500
Date: Fri, 16 Dec 2005 01:55:05 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Kyungmin Park <kyungmin.park@samsung.com>
Message-ID: <20051216005505.GW23349@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	Linus Torvalds <torvalds@osdl.org>, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Subject: drivers/mtd/onenand/: unacceptable stack usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In 2.6.15-rc, the following driver was added:


include/linux/mtd/onenand.h:
#define MAX_ONENAND_PAGESIZE        (2048 + 64)


drivers/mtd/onenand/onenand_base.c:
static int onenand_writev_ecc(struct mtd_info *mtd, const struct kvec *vecs,
        unsigned long count, loff_t to, size_t *retlen,
        u_char *eccbuf, struct nand_oobinfo *oobsel)
{
        struct onenand_chip *this = mtd->priv;
        unsigned char buffer[MAX_ONENAND_PAGESIZE], *pbuf;


drivers/mtd/onenand/onenand_bbt.c:
static inline int onenand_memory_bbt (struct mtd_info *mtd, struct nand_bbt_descr *bd)
{
        unsigned char data_buf[MAX_ONENAND_PAGESIZE];


These are variables on the stack that are > 2kB which is not acceptable 
since the complete stack might be only 4kB.


Please either fix this before 2.6.15 or mark the MTD_ONENAND driver as 
BROKEN until it's fixed.


TIA
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
