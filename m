Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYIB2-0000XG-OT
 for linux-mtd@lists.infradead.org; Fri, 12 Aug 2016 19:31:33 +0000
Date: Sat, 13 Aug 2016 03:30:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Kyle Roeschley <kyle.roeschley@ni.com>
Cc: kbuild-all@01.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nathan.sullivan@ni.com,
 xander.huff@ni.com, peterpansjtu@gmail.com
Subject: Re: [PATCH v6 2/2] mtd: nand_bbt: scan for next free bbt block if
 writing bbt fails
Message-ID: <201608130359.gLedtnLc%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <1471024490-32348-2-git-send-email-kyle.roeschley@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kyle,

[auto build test WARNING on mtd/master]
[also build test WARNING on v4.8-rc1 next-20160812]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Kyle-Roeschley/mtd-nand_bbt-Move-BBT-block-selection-logic-out-of-write_bbt/20160813-015713
base:   git://git.infradead.org/linux-mtd.git master
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/nand_bbt.c:685: warning: No description found for parameter 'block'
>> drivers/mtd/nand/nand_bbt.c:685: warning: Excess function parameter 'md' description in 'mark_bbt_block_bad'
   drivers/mtd/nand/nand_bbt.c:1: warning: no structured comments found
>> drivers/mtd/nand/nand_bbt.c:685: warning: No description found for parameter 'block'
>> drivers/mtd/nand/nand_bbt.c:685: warning: Excess function parameter 'md' description in 'mark_bbt_block_bad'

vim +/block +685 drivers/mtd/nand/nand_bbt.c

   669	
   670	/**
   671	 * mark_bbt_block_bad - Mark one of the block reserved for BBT bad
   672	 * @this: the NAND device
   673	 * @td: the BBT description
   674	 * @md: the mirror BBT descriptor
   675	 * @chip: the CHIP selector
   676	 *
   677	 * Blocks reserved for BBT can become bad. This functions is an helper to mark
   678	 * such blocks as bad. It takes care of updating the in-memory BBT, marking the
   679	 * block as bad using a bad block marker and invalidating the associated
   680	 * td->pages[] entry.
   681	 */
   682	static void mark_bbt_block_bad(struct nand_chip *this,
   683				       struct nand_bbt_descr *td,
   684				       int chip, int block)
 > 685	{
   686		struct mtd_info *mtd = nand_to_mtd(this);
   687		loff_t to;
   688		int res;
   689	
   690		bbt_mark_entry(this, block, BBT_BLOCK_WORN);
   691	
   692		to = (loff_t)block << this->bbt_erase_shift;
   693		res = this->block_markbad(mtd, to);

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--LQksG6bCIzRHxTLp
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--LQksG6bCIzRHxTLp--
