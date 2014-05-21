Received: from mail-qc0-x22a.google.com ([2607:f8b0:400d:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn0AQ-0001Qa-OW
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:38:23 +0000
Received: by mail-qc0-f170.google.com with SMTP id i8so2514250qcq.15
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:38:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140521014908.GE22233@ld-irv-0074>
References: <537bfc24.N6Jd/c3WxnkfHn37%fengguang.wu@intel.com>
 <20140521014908.GE22233@ld-irv-0074>
Date: Wed, 21 May 2014 08:38:00 +0200
Message-ID: <CADBu1QtQpXQTqEDBV3bzQkLmEq3s6k3rtQ2en4L7StcLszO9rQ@mail.gmail.com>
Subject: Re: [l2-mtd:master 28/29] drivers/mtd/lpddr/lpddr2_nvm.c:149:2:
 error: implicit declaration of function 'writel_relaxed'
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: kbuild test robot <fengguang.wu@intel.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,
   considering that this memory interface is implemented only on ARM
we can litimit the driver to ARM
in my opinion. Is it ok for you?

Regards,
   Vincenzo

On Wed, May 21, 2014 at 3:49 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, May 21, 2014 at 09:06:44AM +0800, kbuild test robot wrote:
>> tree:   git://git.infradead.org/users/dedekind/l2-mtd.git master
>> head:   4007e2d175cc83ea728b757e49155826b32fbff8
>> commit: 96ba9dd65788a0bd2a7d1e57ec78b7642f0ccc25 [28/29] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
>> config: make ARCH=x86_64 allyesconfig
>>
>> All error/warnings:
>>
>>    drivers/mtd/lpddr/lpddr2_nvm.c: In function 'ow_enable':
>> >> drivers/mtd/lpddr/lpddr2_nvm.c:149:2: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
>>      writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
>>      ^
>>    cc1: some warnings being treated as errors
>>
>> vim +/writel_relaxed +149 drivers/mtd/lpddr/lpddr2_nvm.c
>>
>>    143         * Register, Device ID, etc
>>    144         */
>>    145        static inline void ow_enable(struct map_info *map)
>>    146        {
>>    147                struct pcm_int_data *pcm_data = map->fldrv_priv;
>>    148
>>  > 149                writel_relaxed(build_mr_cfgmask(pcm_data->bus_width) | 0x18,
>>    150                        pcm_data->ctl_regs + LPDDR2_MODE_REG_CFG);
>>    151                writel_relaxed(0x01, pcm_data->ctl_regs + LPDDR2_MODE_REG_DATA);
>>    152        }
>
> This is because writel_relaxed is not implemented consistently across
> all architectures. It looks like Will Deacon is trying to fix this.
>
>   https://lkml.org/lkml/2014/4/17/267
>
> Vincenzo,
>
> What do you think? Should we:
>
>  1. Limit your driver to ARM (or other ARCH that supports
>     writel_relaxed()?
>  2. Use writel() instead?
>  3. Wait for other ARCH'es to support writel_relaxed()?
>
> Brian
