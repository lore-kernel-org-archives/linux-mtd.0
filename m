Received: from mail-ie0-f175.google.com ([209.85.223.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJzqV-0002Z6-GB
 for linux-mtd@lists.infradead.org; Wed, 20 Aug 2014 06:58:12 +0000
Received: by mail-ie0-f175.google.com with SMTP id x19so2289383ier.6
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 23:57:49 -0700 (PDT)
Date: Wed, 20 Aug 2014 07:57:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/8] mtd: nand: Support for new DT NAND driver
Message-ID: <20140820065744.GE4266@lee--X1>
References: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
 <20140819013729.GP18411@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140819013729.GP18411@ld-irv-0074>
Cc: pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Aug 2014, Brian Norris wrote:
> On Mon, Aug 18, 2014 at 11:31:51AM +0100, Lee Jones wrote:
> > I believe all of your queries have either been answered or addressed
> > and I am hoping this will be the last submission. :)
> 
> Sorry, no. I can't review code that doesn't compile, so I'm only now
> getting to some of the review.
> 
> > This is v2 of the squashed submission.  v1 had a small typo which
> > prevented the BBT code from being truly configurable.  This has now
> > been rectified and build tested with and without MTD_NAND_STM_BCH_BBT
> > support.
> 
> From smatch:
> 
>   drivers/mtd/nand/stm_nand_bch.c:1556 stm_nand_bch_probe() error:
>   we previously assumed 'bank' could be null (see line 1482)
>   [smatch] 

I have now built and installed smatch - it is now part of my built
scripts.

> From GCC (extra warnings):
> 
>   drivers/mtd/nand/stm_nand_dt.c:39:21: warning: no previous
>   prototype for 'stm_of_get_partitions_node' [-Wmissing-prototypes] 
>   drivers/mtd/nand/stm_nand_dt.c:68:5: warning: no previous
>   prototype for 'stm_of_get_nand_banks' [-Wmissing-prototypes] 

My build scripts now support extended warnings to level 1.  This was a
pain to get working, as my scripts also build DTBS, which has a side
effect of re-compiling everything, every time.  This was fixed by also
issuing W=1 on the `make $(make_options) $(extra_build_options) dtbs`
line.

> Looks like you forgot to include <linux/mtd/stm_nand_bbt.h>.

This had me confused for a little while.  I think you mean:

  #include "stm_nand_dt.h".

Basically, the DT code wasn't including its own header file.

Caught and fixed.

> And your code is not bisectable. I think patch 7 and 8 should be
> reordered (with some tweaks, perhaps):

Now fixed.

I have split out the BBT header file and applied it first.

> Bisectability test results for configuration
> "arm-multi_v7_defconfig,arm,arm-unknown-linux-gnueabi-" 
> 
> Failed to build patch #7: 5936df30f5e1 mtd: nand: stm_nand_bch: add
> support for ST's BCH NAND controller 
> Configuration: "arm-multi_v7_defconfig, architecture arm".

How do _you_ test for bisectability?  Do you have a script?

What outputs "Failed to build patch #7: ..."?

[...]

> drivers/mtd/nand/stm_nand_bch.c:26:36: fatal error:
> linux/mtd/stm_nand_bbt.h: No such file or directory 
> compilation terminated.
> make[4]: *** [drivers/mtd/nand/stm_nand_bch.o] Error 1

Fixed.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
