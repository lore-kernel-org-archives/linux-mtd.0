Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkZMb-00057c-F4
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2018 18:27:18 +0000
Date: Tue, 31 Jul 2018 21:26:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: allocate dynamically ONFI parameters
 during detection
Message-ID: <20180731182654.ybi46jqvm5ygfhk7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Miquel Raynal,

This is a semi-automatic email about new static checker warnings.

The patch 0ff393463e9c: "mtd: rawnand: allocate dynamically ONFI 
parameters during detection" from Jul 25, 2018, leads to the 
following Smatch complaint:

    drivers/mtd/nand/raw/nand_micron.c:93 micron_nand_onfi_init()
     warn: variable dereferenced before check 'p->onfi' (see line 91)

drivers/mtd/nand/raw/nand_micron.c
    90		struct nand_parameters *p = &chip->parameters;
    91		struct nand_onfi_vendor_micron *micron = (void *)p->onfi->vendor;
                                                                 ^^^^^^^^^^^^^^^
The code dereferences "p->onfi"

    92	
    93		if (p->onfi) {
                    ^^^^^^^
but the patch adds a new check for NULL.

    94			chip->read_retries = micron->read_retry_options;
    95			chip->setup_read_retry = micron_nand_setup_read_retry;

regards,
dan carpenter
