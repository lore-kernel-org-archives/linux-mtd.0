Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPnDl-0006GN-S8
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 11:00:19 +0000
Date: Mon, 4 Jun 2018 13:59:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ext-mika.2.korhonen@nokia.com
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [bug report] mtd: OneNAND: multiblock erase support
Message-ID: <20180604105951.l42e6migfillhvg3@kili.mountain>
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

Hello Mika Korhonen,

The patch 72073027ee95: "mtd: OneNAND: multiblock erase support" from
Oct 23, 2009, leads to the following static checker warning:

	drivers/mtd/nand/onenand/onenand_base.c:2214 onenand_multiblock_erase()
	warn: 'len' can be negative (type promoted to high)

drivers/mtd/nand/onenand/onenand_base.c
  2191          len = instr->len;
  2192          addr = instr->addr;
  2193  
  2194          /* loop over 64 eb batches */
  2195          while (len) {
  2196                  struct erase_info verify_instr = *instr;
  2197                  int max_eb_count = MB_ERASE_MAX_BLK_COUNT;
  2198  
  2199                  verify_instr.addr = addr;
  2200                  verify_instr.len = 0;
  2201  
  2202                  /* do not cross chip boundary */
  2203                  if (bdry_block) {
  2204                          int this_block = (addr >> this->erase_shift);
  2205  
  2206                          if (this_block < bdry_block) {
  2207                                  max_eb_count = min(max_eb_count,
  2208                                                     (bdry_block - this_block));
  2209                          }
  2210                  }
  2211  
  2212                  eb_count = 0;
  2213  
  2214                  while (len > block_size && eb_count < (max_eb_count - 1)) {
  2215                          this->command(mtd, ONENAND_CMD_MULTIBLOCK_ERASE,
  2216                                        addr, block_size);
  2217                          onenand_invalidate_bufferram(mtd, addr, block_size);
  2218  
  2219                          ret = this->wait(mtd, FL_PREPARING_ERASE);
  2220                          if (ret) {
  2221                                  printk(KERN_ERR "%s: Failed multiblock erase, "
  2222                                         "block %d\n", __func__,
  2223                                         onenand_block(this, addr));
  2224                                  instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
  2225                                  return -EIO;
  2226                          }
  2227  
  2228                          len -= block_size;
  2229                          addr += block_size;
  2230                          eb_count++;
  2231                  }
  2232  
  2233                  /* last block of 64-eb series */
  2234                  cond_resched();
  2235                  this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
  2236                  onenand_invalidate_bufferram(mtd, addr, block_size);
  2237  
  2238                  ret = this->wait(mtd, FL_ERASING);
  2239                  /* Check if it is write protected */
  2240                  if (ret) {
  2241                          printk(KERN_ERR "%s: Failed erase, block %d\n",
  2242                                 __func__, onenand_block(this, addr));
  2243                          instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
  2244                          return -EIO;
  2245                  }
  2246  
  2247                  len -= block_size;
                        ^^^^^^^^^^^^^^^^^^
The other places check that (len >= block_size) before doing the
subtract.  We should probably return -EINVAL or -EFAULT or something.

  2248                  addr += block_size;
  2249                  eb_count++;
  2250  
  2251                  /* verify */
  2252                  verify_instr.len = eb_count * block_size;
  2253                  if (onenand_multiblock_erase_verify(mtd, &verify_instr)) {
  2254                          instr->fail_addr = verify_instr.fail_addr;
  2255                          return -EIO;
  2256                  }
  2257  
  2258          }
  2259          return 0;
  2260  }

regards,
dan carpenter
