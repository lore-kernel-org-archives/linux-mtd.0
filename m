Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afJVN-0003ba-IX
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 03:49:18 +0000
Date: Mon, 14 Mar 2016 11:47:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: kbuild-all@01.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, karlzhang@micron.com,
 beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: Re: [PATCH 03/11] mtd: nand_bbt: add new API definitions
Message-ID: <201603141158.lXLz6cm4%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <1457923684-13505-4-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

[auto build test WARNING on next-20160311]
[cannot apply to mtd/master v4.5-rc7 v4.5-rc6 v4.5-rc5 v4.5-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Peter-Pan/mtd-nand_bbt-introduce-independent-nand-BBT/20160314-105725
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/nand_base.c:321: warning: Excess function parameter 'getchip' description in 'nand_block_bad'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'ops'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'info'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'options'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'bbt_td'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'bbt_md'
   drivers/mtd/nand/nand_base.c:321: warning: Excess function parameter 'getchip' description in 'nand_block_bad'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'ops'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'info'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'options'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'bbt_td'
>> drivers/mtd/nand/nand_bbt.c:1409: warning: No description found for parameter 'bbt_md'

vim +/ops +1409 drivers/mtd/nand/nand_bbt.c

  1393	static void nand_bbt_release(struct nand_bbt *bbt)
  1394	{
  1395		kfree(bbt->bbt);
  1396	}
  1397	
  1398	/**
  1399	 * nand_bbt_create - [NAND BBT Interface] create BBT structures for certain
  1400	 * MTD device
  1401	 * @mtd: MTD structure
  1402	 */
  1403	struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
  1404				const struct nand_bbt_ops *ops,
  1405				struct nand_chip_layout_info *info,
  1406				unsigned int options,
  1407				struct nand_bbt_descr *bbt_td,
  1408				struct nand_bbt_descr *bbt_md)
> 1409	{
  1410		struct nand_bbt *bbt = kzalloc(sizeof(struct nand_bbt),
  1411						GFP_KERNEL);
  1412		int ret;
  1413	
  1414		if (!bbt)
  1415			return ERR_PTR(-ENOMEM);
  1416	
  1417		bbt->mtd = mtd;

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--BOKacYhQ+x31HxR3
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--BOKacYhQ+x31HxR3--
