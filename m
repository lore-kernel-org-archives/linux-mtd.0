Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlqrF-0002yP-6C
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 03:02:05 +0000
Received: by mail-pd0-f177.google.com with SMTP id v10so14795173pde.22
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 19:01:44 -0800 (PST)
Date: Tue, 4 Nov 2014 19:01:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Wei.Yang@windriver.com
Subject: Re: [PATCH mtd-utils] libmtd: don't ignore "region index" parameter
 in mtd_regioninfo()
Message-ID: <20141105030140.GL23619@ld-irv-0074>
References: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
 <20140915173152.GA14832@ld-irv-0074>
 <20140915174821.GB14832@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140915174821.GB14832@ld-irv-0074>
Cc: linux-mtd@lists.infradead.org, w90p710@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 15, 2014 at 10:48:21AM -0700, Brian Norris wrote:
> ioctl(MEMGETREGIONINFO) has one input parameter (regionindex) and three
> output parameters (info about the erase region). There are two problems
> in mtdinfo/libmtd here:
> 
>  1. mtdinfo.c doesn't initialize its region_info_user struct, instead
>     passing uninitialized data to mtd_regioninfo()
> 
>  2. mtd_regioninfo() fails to utilize the 'regidx' parameter to fill out
>     the regionindex parameter properly, so the garbage from mtdinfo.c is
>     propagated to the ioctl()
> 
> This means that mtdinfo will continuously probe the same (possibly
> out-of-range) erase region, instead of looping over the valid regions.
> 
> Let's fix this in the mtd_regioninfo() helper, and at the same time,
> let's zero out the mtdinfo.c buffer, as an additional precaution to keep
> from using uninitialized data.
> 
> Initial error report from Yang, when running "mtdinfo /dev/mtd0" on a
> Cavium 6100 board:
> 
> 	root@CN61XX:~# mtdinfo /dev/mtd0
> 	mtd0
> 	Name:                           phys_mapped_flash
> 	Type:                           nor
> 	Eraseblock size:                65536 bytes, 64.0 KiB
> 	Amount of eraseblocks:          128 (8388608 bytes, 8.0 MiB)
> 	Minimum input/output unit size: 1 byte
> 	Sub-page size:                  1 byte
> 	Additional erase regions:       0
> 	Character device major/minor:   90:0
> 	Bad blocks are allowed:         false
> 	Device is writable:             true
> 	libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 0
> 	        error 22 (Invalid argument)
> 	Eraseblock region 0:  info is unavailable
> 	libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 1
> 	        error 22 (Invalid argument)
> 	Eraseblock region 1:  info is unavailable
> 
> Reported-by: Yang Wei <Wei.Yang@windriver.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to mtd-utils.git.

Brian
