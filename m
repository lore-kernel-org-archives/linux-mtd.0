Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qdexm-0004B3-V7
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 08:57:07 +0000
Received: by wyf23 with SMTP id 23so4154478wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Jul 2011 01:57:03 -0700 (PDT)
Message-ID: <4E11805C.2000307@gmail.com>
Date: Mon, 04 Jul 2011 10:57:00 +0200
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [Help]Dedicated thread for each block partition?
References: <BLU119-W99FA11014ECEA1A6FB2B1C05C0@phx.gbl>
In-Reply-To: <BLU119-W99FA11014ECEA1A6FB2B1C05C0@phx.gbl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Getting the same issue in the past with 2.6.35, I suggest to get a look 
at the commit 008c751ec78587dd9b48bb62d4b10d616554fea2 from upstream, 
which I cherry-pick to fix my issue.

There is multiple thread in this mailing list describing the problem in 
the past.

regards,
arnaud

On 07/04/2011 04:20 AM, 柏均 葉 wrote:
> Hi all,
>
> Sorry for my poor English first.
>
> I'm migrating my NAND controller driver from kernel 2.6.28 to 2.6.35.
> I
> encounter the weird situation in 2.6.35 that the NAND controller driver
> can't be removed via rmmod because the column of "used by" in lsmod
> isn't equal to 0.
> I find the number of "used by" of NAND controller driver is relative to the registered partition number.
>
> For example,
>   
> /usr # lsmod
> Module                  Size  Used by    Not tainted
> nand                   32483  0
> nand_ids               3097  1 nand
> nand_ecc              3510  1 nand
> mtdblock               3055  0
> mtd_blkdevs          5653  1 mtdblock
> mtd                    17461  3 nand,mtd_blkdevs
>
> When I insert my module into kernel, the lsmod shows as the following: (Note: I register 4 partitions in nandctl driver.)
> /usr # insmod nandctl.ko
> /usr # lsmod
> Module                  Size  Used by    Not tainted
> nandctl                 12677  4
> nand                    32483  1 nandctl
> nand_ids                3097  1 nand
> nand_ecc               3510  1 nand
> mtdblock                3055  4
> mtd_blkdevs           5653  1 mtdblock
> mtd                      17461  8 ftnandc024v1_nand,nand,mtd_blkdevs
> /usr # rmmod nandctl.ko
> rmmod: can't unload 'nandctl': Resource temporarily unavailable
>
> Remove the nandctl module isn't allowed due to the nonzero value of 'used by'.
> ========================================================
>
> Tracing
> the MTD layer and find this statement
> ,"__get_mtd_device(new->mtd);", in add_mtd_blktrans_dev function in
> <kernel source>/driver/mtd/mtd_blkdevs.c
> This function will increase the reference counter of nandctl for each partition.
>
> Does anybody know how should I do to remove the module via rmmod in kernel 2.6.35??
> Any suggestion is welcome.
>   		 	   		
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
