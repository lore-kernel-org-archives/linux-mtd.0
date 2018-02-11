Date: Sun, 11 Feb 2018 15:54:13 +0800
From: kbuild test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: kbuild-all@01.org, cyrille.pitchen@wedev4u.fr, mchehab@kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 shawn.lin@rock-chips.com, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: add rockchip serial flash
 controller driver
Message-ID: <201802111502.mUO8hPlO%fengguang.wu@intel.com>
References: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shawn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v4.15 next-20180209]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Andy-Yan/Add-Rockchip-SFC-serial-flash-controller-support/20180211-135616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/spi-nor/rockchip-sfc.c:899:5: sparse: symbol 'rockchip_sfc_runtime_suspend' was not declared. Should it be
>> drivers/mtd/spi-nor/rockchip-sfc.c:907:5: sparse: symbol 'rockchip_sfc_runtime_resume' was not declared. Should it be

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
