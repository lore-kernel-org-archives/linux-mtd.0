Received: from mail-vc0-f171.google.com ([209.85.220.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xboh4-0002HN-Ce
 for linux-mtd@lists.infradead.org; Wed, 08 Oct 2014 10:42:06 +0000
Received: by mail-vc0-f171.google.com with SMTP id hy10so6473858vcb.30
 for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2014 03:41:44 -0700 (PDT)
Date: Wed, 8 Oct 2014 11:41:39 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/8] mtd: nand: Support for new DT NAND driver
Message-ID: <20141008104139.GF20647@lee--X1>
References: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
 <20140819013729.GP18411@ld-irv-0074>
 <20140820065744.GE4266@lee--X1>
 <20141002061841.GE3248@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20141002061841.GE3248@norris-Latitude-E6410>
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

On Wed, 01 Oct 2014, Brian Norris wrote:

> I guess I never answered this one:
> 
> On Wed, Aug 20, 2014 at 07:57:44AM +0100, Lee Jones wrote:
> > On Mon, 18 Aug 2014, Brian Norris wrote:
> > > Bisectability test results for configuration
> > > "arm-multi_v7_defconfig,arm,arm-unknown-linux-gnueabi-" 
> > > 
> > > Failed to build patch #7: 5936df30f5e1 mtd: nand: stm_nand_bch: add
> > > support for ST's BCH NAND controller 
> > > Configuration: "arm-multi_v7_defconfig, architecture arm".
> > 
> > How do _you_ test for bisectability?  Do you have a script?
> > 
> > What outputs "Failed to build patch #7: ..."?
> 
> 	#!/bin/sh
> 	for c in `git rev-list origin/master..HEAD`
> 	do
> 		git checkout $c
> 		make || break
> 	done

Yes, I have done similar things with `git log --format=%H` and/or `git
rebase --exec=build-script`

> I use aiaiai [1]. But you could easily test bisectability without it.
> [1] http://lwn.net/Articles/488992/
>     http://git.infradead.org/aiaiai.git

This is what I was really after, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
