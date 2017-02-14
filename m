Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdfAU-00044f-CX
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:37:32 +0000
From: <mark.marshall@omicronenergy.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <cyrille.pitchen@atmel.com>, <marek.vasut@gmail.com>
CC: <markmarshall14@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, Mark Marshall
 <mark.marshall@omicronenergy.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: flash_info table, use a u64 for the ID
Date: Tue, 14 Feb 2017 16:35:50 +0100
Message-ID: <cover.1487085166.git.mark.marshall@omicronenergy.com>
In-Reply-To: <6839f623-807d-3704-11d6-773263afca9a@atmel.com>
References: <6839f623-807d-3704-11d6-773263afca9a@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mark Marshall <mark.marshall@omicronenergy.com>

This is a minor re-write of my previous patch to change the flash_info
table to contain a u64 for the RDID bytes.  It's now split into three
patches, the first changes the flash_info structure and massages the
currently named macros to generate the new table.  The second replaces
the macros in the table with slightly more explicit ones, and the third
patch makes the actual change to the table that I wanted.

I now use macro called JEDEC_ID(_jedec_id, _ext_id, _ext_len) to generate
the IDs.  This could be different, of course.

Mark Marshall (3):
  mtd: spi-nor: flash_info table, use a u64 for the ID
  mtd: spi-nor: Use more explicit macros to generate the flash_info
    table
  mtd: spi-nor: s25fl512s: Set a page size of 512

 drivers/mtd/spi-nor/spi-nor.c | 467 ++++++++++++++++++++++--------------------
 1 file changed, 240 insertions(+), 227 deletions(-)

-- 
2.7.4
