Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmvex-0005W2-2a
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 01:49:35 +0000
Received: by mail-ig0-f171.google.com with SMTP id c1so5651513igq.4
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 18:49:11 -0700 (PDT)
Date: Tue, 20 May 2014 18:49:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>
Subject: Re: [l2-mtd:master 28/29] drivers/mtd/lpddr/lpddr2_nvm.c:149:2:
 error: implicit declaration of function 'writel_relaxed'
Message-ID: <20140521014908.GE22233@ld-irv-0074>
References: <537bfc24.N6Jd/c3WxnkfHn37%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537bfc24.N6Jd/c3WxnkfHn37%fengguang.wu@intel.com>
Cc: linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 21, 2014 at 09:06:44AM +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/users/dedekind/l2-mtd.git master
> head:   4007e2d175cc83ea728b757e49155826b32fbff8
> commit: 96ba9dd65788a0bd2a7d1e57ec78b7642f0ccc25 [28/29] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
> config: make ARCH=x86_64 allyesconfig
> 
> All error/warnings:
> 
>    drivers/mtd/lpddr/lpddr2_nvm.c: In function 'ow_enable':
> >> drivers/mtd/lpddr/lpddr2_nvm.c:149:2: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
>      writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
>      ^
>    cc1: some warnings being treated as errors
> 
> vim +/writel_relaxed +149 drivers/mtd/lpddr/lpddr2_nvm.c
> 
>    143	 * Register, Device ID, etc
>    144	 */
>    145	static inline void ow_enable(struct map_info *map)
>    146	{
>    147		struct pcm_int_data *pcm_data = map->fldrv_priv;
>    148	
>  > 149		writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
>    150			pcm_data->ctl_regs + LPDDR2_MODE_REG_CFG);
>    151		writel_relaxed(0x01, pcm_data->ctl_regs + LPDDR2_MODE_REG_DATA);
>    152	}

This is because writel_relaxed is not implemented consistently across
all architectures. It looks like Will Deacon is trying to fix this.

  https://lkml.org/lkml/2014/4/17/267

Vincenzo,

What do you think? Should we:

 1. Limit your driver to ARM (or other ARCH that supports
    writel_relaxed()?
 2. Use writel() instead?
 3. Wait for other ARCH'es to support writel_relaxed()?

Brian
