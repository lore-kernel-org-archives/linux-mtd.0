Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhD6K-0005Dn-Q2
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 08:51:01 +0000
Date: Wed, 30 Sep 2015 16:50:01 +0800
From: kbuild test robot <lkp@intel.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: kbuild-all@01.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] mtd: mtdram: fix build error
Message-ID: <201509301615.HeD274JU%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <1443602158-631-1-git-send-email-sudipm.mukherjee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sudip,

[auto build test results on next-20150930 -- if it's inappropriate base, please ignore]

config: cris-etrax-100lx_v2_defconfig (attached as .config)
reproduce:
  wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
  chmod +x ~/bin/make.cross
  git checkout f2fe6774b45537be1dca5fee8e89943524bc777b
  # save the attached .config to linux build tree
  make.cross ARCH=cris 

All warnings (new ones prefixed by >>):

   drivers/mtd/devices/mtdram.c: In function 'check_offs_len':
>> drivers/mtd/devices/mtdram.c:42:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
>> drivers/mtd/devices/mtdram.c:42:2: warning: right shift count >= width of type [enabled by default]
>> drivers/mtd/devices/mtdram.c:42:2: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
   include/asm-generic/div64.h:35:17: note: expected 'uint64_t *' but argument is of type 'long unsigned int *'
   drivers/mtd/devices/mtdram.c:50:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
   drivers/mtd/devices/mtdram.c:50:2: warning: right shift count >= width of type [enabled by default]
   drivers/mtd/devices/mtdram.c:50:2: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
   include/asm-generic/div64.h:35:17: note: expected 'uint64_t *' but argument is of type 'long unsigned int *'

vim +42 drivers/mtd/devices/mtdram.c

    26	module_param(total_size, ulong, 0);
    27	MODULE_PARM_DESC(total_size, "Total device size in KiB");
    28	module_param(erase_size, ulong, 0);
    29	MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
    30	#endif
    31	
    32	// We could store these in the mtd structure, but we only support 1 device..
    33	static struct mtd_info *mtd_info;
    34	
    35	static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
    36	{
    37		int ret = 0;
    38		unsigned long temp_len, rem;
    39	
    40		/* Start address must align on block boundary */
    41		temp_len = ofs;
  > 42		rem = do_div(temp_len, mtd->erasesize);
    43		if (rem) {
    44			pr_debug("%s: unaligned address\n", __func__);
    45			ret = -EINVAL;
    46		}
    47	
    48		/* Length must align on block boundary */
    49		temp_len = len;
    50		rem = do_div(temp_len, mtd->erasesize);

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--Qxx1br4bt0+wmkIi
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
JXNQQEB2AAA=

--Qxx1br4bt0+wmkIi--
