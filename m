Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQS8M-0001nB-5P
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 04:00:06 +0000
Date: Tue, 2 Feb 2016 11:58:57 +0800
From: kbuild test robot <lkp@intel.com>
To: Bean Huo <jackyard88@gmail.com>
Cc: kbuild-all@01.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 zszubbocsev@micron.com, peterpandong@micron.com
Subject: Re: [PATCH v2 17/17] drivers:mtd:ubi: Kconfig Makefile
Message-ID: <201602021143.Jp8dJlOD%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454380252-16170-18-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

[auto build test WARNING on v4.5-rc2]
[also build test WARNING on next-20160201]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Bean-Huo/Add-a-bakvol-module-in-UBI-layer-for-MLC-paired-page-power-loss-issue/20160202-104450


coccinelle warnings: (new ones prefixed by >>)

>> drivers/mtd/ubi/bakvol.c:862:17-28: ERROR: ubi -> bkblk_tbl is NULL but dereferenced.
--
>> drivers/mtd/ubi/bakvol.c:1211:1-15: ERROR: reference preceded by free on line 1210
   drivers/mtd/ubi/bakvol.c:862:1-15: ERROR: reference preceded by free on line 855

vim +862 drivers/mtd/ubi/bakvol.c

3b3521fb Bean Huo 2016-02-02  846  out0:
3b3521fb Bean Huo 2016-02-02  847  	kfree(oob_ops_src->oobbuf);
3b3521fb Bean Huo 2016-02-02  848  out_oob_ops:
3b3521fb Bean Huo 2016-02-02  849  	kfree(oob_ops_src);
3b3521fb Bean Huo 2016-02-02  850  out_obs_src:
3b3521fb Bean Huo 2016-02-02  851  	kfree(oob_ops_bak->oobbuf);
3b3521fb Bean Huo 2016-02-02  852  out_back_oob_ops:
3b3521fb Bean Huo 2016-02-02  853  	kfree(oob_ops_bak);
3b3521fb Bean Huo 2016-02-02  854  out_backup_info:
3b3521fb Bean Huo 2016-02-02  855  	kfree(ubi->bkblk_tbl);
3b3521fb Bean Huo 2016-02-02  856  out_vidh:
3b3521fb Bean Huo 2016-02-02  857  	ubi_free_vid_hdr(ubi, vidh);
3b3521fb Bean Huo 2016-02-02  858  out_ech:
3b3521fb Bean Huo 2016-02-02  859  	kfree(ech);
3b3521fb Bean Huo 2016-02-02  860  out_init:
3b3521fb Bean Huo 2016-02-02  861  	ubi_err(ubi, "bakvol module init error,init step [%d].\n", step);
3b3521fb Bean Huo 2016-02-02 @862  	ubi->bkblk_tbl->bakvol_flag = UBI_BAKVOL_REJECT;
3b3521fb Bean Huo 2016-02-02  863  	return -1;
3b3521fb Bean Huo 2016-02-02  864  }
3b3521fb Bean Huo 2016-02-02  865  
3b3521fb Bean Huo 2016-02-02  866  /**
3b3521fb Bean Huo 2016-02-02  867   * ubi_bakvol_peb_scan - check VID header,see if this PEB
3b3521fb Bean Huo 2016-02-02  868   *				belongs to bakvol
3b3521fb Bean Huo 2016-02-02  869   *
3b3521fb Bean Huo 2016-02-02  870   * This function returns 1 if this PEB not belongs to bakvol

:::::: The code at line 862 was first introduced by commit
:::::: 3b3521fb6dda26424b36620d13e0195a5b4930b0 driver:mtd:ubi:add new bakvol module in ubi layer

:::::: TO: Bean Huo <beanhuo@micron.com>
:::::: CC: 0day robot <fengguang.wu@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
