Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13gQay-0004JU-00
	for mtd-list@infradead.org; Tue, 03 Oct 2000 12:50:52 +0100
Received: from fep04.swip.net ([130.244.199.132] helo=fep04-svc.swip.net)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13gQax-0004JN-00
	for mtd@infradead.org; Tue, 03 Oct 2000 12:50:51 +0100
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: "Steven J. Hill" <sjhill@cotw.com>,
	"MTD List" <mtd@infradead.org>
Subject: Re: First release of NAND flash device driver... / Comments
Date: Tue, 3 Oct 2000 13:50:29 +0200
Message-ID: <001001c02d30$20a2e380$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <39D44220.FB9C32E4@cotw.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


 I've had quick peek at your code this morning. I hope to spend some more
time on this issue this week. I started out trying to understand why you
want a 'static u_char *ecc_read_buf;' (uppercase initial-letter or some such
would be nice IMHO) but instead stumbled upon spia_init() (which is 'void'
BTW, perhaps it should be 'int' and return -ENOMEM etc.).

 Small change suggestion: [I know this will forever mark me as a wanker who
can't read others code...]

The code in question: (spia_init())
	/* Allocate memory for MTD device structure and private data */
	spia_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_info),
				GFP_KERNEL);
	if (!spia_mtd) {
		printk("Unable to allocate SPIA NAND MTD device structure.\n");
		return;
	}

	/* Get pointer to private data */
	this = (struct nand_info *) (&spia_mtd[1]);

	/* Initialize structures */
	memset((char *) spia_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_info));

	/* Link the private data with the MTD structure */
	spia_mtd->priv = this;

I think this makes the intent clearer:

	/* Allocate memory for MTD device structure and private data */
	struct combined_kmalloc_struct {		/* Struct for combined kmalloc()
		struct mtd_info mtd_info_struct;	 * of mtd_info_struct and ...
		struct nand_info nand_info_struct;	 * nand_info_struct. */
	} *p = kmalloc(sizeof(struct combined_kmalloc_struct), GFP_KERNEL);

	if (!p) {
		printk("Unable to allocate SPIA NAND MTD device structure.\n");
		return -ENOMEM;
	}

	/* Initialize structures */
	memset((char *)p, 0, sizeof(*p));

	/* Get pointers to private data */
	spia_mtd = &p->mtd_info_struct;
	spia_mtd->priv = this = &p->nand_info_struct;

 I assume (never a good idea) that the intent is to reduce the kmalloc()
overhead.


--
//Björnen [I'll go into hiding now...]




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
