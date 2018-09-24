Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Lvf-0004Nq-Fm
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 08:09:17 +0000
Date: Mon, 24 Sep 2018 10:09:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
Message-ID: <20180924100902.7b177324@bbrezillon>
In-Reply-To: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

On Mon, 24 Sep 2018 08:45:44 +0200
Daniel Mack <daniel@zonque.org> wrote:

> Hi Miquel,
> 
> I'm having issues using the new marvell_nand driver on a PXA3xx based 
> platform. My test does a ubiformat on the chip, then creates a volume, 
> mounts it and runs bonnie++ on the file system. After some time (usually 
> less than half a minute), the driver spits out a warning like the one 
> below, and eventually the UBI layer bails out, which leads to a r/o 
> remount and (possibly) file system corruptions.
> 
> FWIW, this is the test script I'm using:
> 
>  > #!/bin/sh
>  >
>  > UBIDEV=0
>  > UBIMTD=3
>  >
>  > umount /mnt
>  > ubidetach /dev/ubi_ctrl -d $UBIDEV
>  > ubiformat -y /dev/mtd$UBIMTD
>  > ubiattach /dev/ubi_ctrl -d $UBIDEV -m $UBIMTD
>  > ubimkvol /dev/ubi$UBIDEV -N test -m
>  > mount -t ubifs ubi0:test /mnt
>  > bonnie\+\+ -d /mnt -u 0:0  
> 
> 
> The legacy pxa3xx_nand driver didn't have this issue, but my system was 
> also running a much older kernel with that. I'm currently still 
> struggling to resurrect the old code, but I'm running into "Wait time 
> out!!!" conditions immediately right now. Not sure what's going on.

Hm, so that means the old driver has pretty much the same issue.

> 
> Interestingly, I can't seem to reproduce the bug with any of the mtd 
> kernel tests, I've tried all of them, several times, and all succeed. So 
> a file system test that includes the UBI/UBIFS layers seems to trigger 
> different things in the driver than the the tests that operate on the 
> mtd device directly.

Looking at the backtrace, it seems to fail on a high PEB num. Are you
interfacing with a dual-die chip? Can you share the part number of your
chip?

> 
> I'v also tried this with and without the keep-config DT property, but 
> that didn't change anything.
> 
> Could you try my script on some other device that runs the new driver 
> and see if you can reproduce? If bonnie++ is unavailable, extracting a 
> bigger tarball a couple of times will also trigger the bug at some point.
> 
> Meanwhile, I can start poking around in the driver. I'd be grateful for 
> a hint on where to start.

You can try to run the mtd tests on eraseblock 905, just to check if
they pass or not. Also, when you run the ubi/ubifs/bonnie++ tests, does
it always fail on the same PEB?

Regards,

Boris
