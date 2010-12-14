Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWmi-0007G8-Bf
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 15:27:25 +0000
Received: by eyd9 with SMTP id 9so465660eyd.22
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 07:27:19 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Liu <r64343@freescale.com>
In-Reply-To: <1290156045-11719-1-git-send-email-r64343@freescale.com>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 17:26:49 +0200
Message-ID: <1292340409.2538.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-19 at 16:40 +0800, Jason Liu wrote:
> When run mtd_oobtest case, there will be one error for step(4),
> which turned out it need add one check for out of page read in
> nand_do_read_oob just like mtd_do_write_oob did it already.
> This commit also fix one typo error for comments in mtd_do_write_oob
> 
> Signed-off-by: Jason Liu <r64343@freescale.com>

I cannot reproduce this with nandsim, can you?

I tried:

1. sudo modprobe nandsim
   sudo modprobe mtd_oobtest dev=0

2. sudo ./load_nandsim.sh 128 128 2048
   sudo modprobe mtd_oobtest dev=0

In both cases the test passes: "mtd_oobtest: finished with 0 errors"

And in 'nand_do_read_oob()' I see the following piece of code:

        /* Do not allow reads past end of device */
        if (unlikely(from >= mtd->size ||
                     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
                                        (from >> chip->page_shift)) * len)) {
                DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
                                        "of device\n", __func__);
                return -EINVAL;
        }

which should handle the case AFAICS.

So, although I did think hard about this, it looks like there is no
problem. What is the kernel version you are looking at? I checked it
with my l2-mtd-2.6.git, which is the latest mtd-2.6.git plus a revert
commit of your patch:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
