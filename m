Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTp0Q-0005M6-RE
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2016 11:01:52 +0000
Date: Thu, 11 Feb 2016 19:00:23 +0800
From: kbuild test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: kbuild-all@01.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: spi-nor: Add support for s25fl116k
Message-ID: <201602111813.vwC6CdYU%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <1455187224-1650-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sascha,

[auto build test ERROR on v4.5-rc3]
[also build test ERROR on next-20160211]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/mtd-spi-nor-Add-support-for-s25fl116k/20160211-184301
config: x86_64-randconfig-x002-201606 (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spi-nor.c:800:67: error: expected expression before '|' token
     { "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K) | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)  },
                                                                      ^
>> drivers/mtd/spi-nor/spi-nor.c:800:67: warning: excess elements in struct initializer
   drivers/mtd/spi-nor/spi-nor.c:800:67: note: (near initialization for 'spi_nor_ids[77]')
>> drivers/mtd/spi-nor/spi-nor.c:800:106: error: expected '}' before ')' token
     { "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K) | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)  },
                                                                                                             ^
>> drivers/mtd/spi-nor/spi-nor.c:800:106: error: expected ',' or ';' before ')' token
>> drivers/mtd/spi-nor/spi-nor.c:800:110: error: expected identifier or '(' before ',' token
     { "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K) | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)  },
                                                                                                                 ^
   drivers/mtd/spi-nor/spi-nor.c:801:68: error: expected identifier or '(' before ',' token
     { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
                                                                       ^
   drivers/mtd/spi-nor/spi-nor.c:802:68: error: expected identifier or '(' before ',' token
     { "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
                                                                       ^
   drivers/mtd/spi-nor/spi-nor.c:803:88: error: expected identifier or '(' before ',' token
     { "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
                                                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:806:74: error: expected identifier or '(' before ',' token
     { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:807:74: error: expected identifier or '(' before ',' token
     { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:808:74: error: expected identifier or '(' before ',' token
     { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:809:74: error: expected identifier or '(' before ',' token
     { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:810:63: error: expected identifier or '(' before ',' token
     { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
                                                                  ^
   drivers/mtd/spi-nor/spi-nor.c:811:74: error: expected identifier or '(' before ',' token
     { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:812:74: error: expected identifier or '(' before ',' token
     { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:813:74: error: expected identifier or '(' before ',' token
     { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:814:62: error: expected identifier or '(' before ',' token
     { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
                                                                 ^
   drivers/mtd/spi-nor/spi-nor.c:815:62: error: expected identifier or '(' before ',' token
     { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
                                                                 ^
   drivers/mtd/spi-nor/spi-nor.c:816:74: error: expected identifier or '(' before ',' token
     { "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:817:74: error: expected identifier or '(' before ',' token
     { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
                                                                             ^
   drivers/mtd/spi-nor/spi-nor.c:820:55: error: expected identifier or '(' before ',' token
     { "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:821:55: error: expected identifier or '(' before ',' token
     { "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:822:55: error: expected identifier or '(' before ',' token
     { "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:823:55: error: expected identifier or '(' before ',' token
     { "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:824:55: error: expected identifier or '(' before ',' token
     { "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:825:55: error: expected identifier or '(' before ',' token
     { "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:826:55: error: expected identifier or '(' before ',' token
     { "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:827:55: error: expected identifier or '(' before ',' token
     { "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:828:55: error: expected identifier or '(' before ',' token
     { "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
                                                          ^
   drivers/mtd/spi-nor/spi-nor.c:830:56: error: expected identifier or '(' before ',' token
     { "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:831:56: error: expected identifier or '(' before ',' token
     { "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:832:56: error: expected identifier or '(' before ',' token
     { "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:833:56: error: expected identifier or '(' before ',' token
     { "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:834:56: error: expected identifier or '(' before ',' token
     { "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:835:56: error: expected identifier or '(' before ',' token
     { "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:836:56: error: expected identifier or '(' before ',' token
     { "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:837:56: error: expected identifier or '(' before ',' token
     { "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128, 0) },
                                                           ^
   drivers/mtd/spi-nor/spi-nor.c:838:56: error: expected identifier or '(' before ',' token
     { "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },

vim +800 drivers/mtd/spi-nor/spi-nor.c

   794		{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
   795		{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
   796		{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
   797		{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
   798		{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
   799		{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 > 800		{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K) | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)  },
   801		{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
   802		{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
   803		{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--VbJkn9YxBvnuCH5J
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--VbJkn9YxBvnuCH5J--
