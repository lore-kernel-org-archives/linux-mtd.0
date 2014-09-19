Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV1lX-0003F6-0Q
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 17:14:39 +0000
Message-ID: <1411146833.23429.11.camel@sauron.fi.intel.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 19 Sep 2014 20:13:53 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
 <1411140449.28850.152.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-09-19 at 12:58 -0400, Atlant Schmidt wrote:
> Artem:
> 
>   Thanks, but the key was in this line of my question:
> 
> > For the purposes of scrubbing-out *SINGLE BIT* errors,
> 
> 
>   Single bit errors are below the threshold set by either
>   current UBI software or newer NAND Flash chips that
>   contain on-board ECC and set a "Rewrite recommended"
>   Status Register bit.

This is MTD hiding these bit-flips from UBI. The idea is that depending
on the flash/controller, you may want to scrub or ignore bit-flips lower
than certain level.

Indeed, for some NANDs 1-bit flips happen on nearly every read,
scrubbing them all is not feasible.

Sow what you say sounds like you want to lower the bit-flip handling
threshold.

To do this, you either need to amend your driver to have the default
threshold that you need, or change the
/sys/class/mtd/mtdX/bitflip_threshold value (do not remember for sure,
but I believe it is writable).

Please, refer to the documentation here:

Documentation/ABI/testing/sysfs-class-mtd


>   That's why I proposed doing the UBI-level LEB rewrites
>   myself, any time even a single bit-flip was reported as
>   being corrected.

Well, if you feel comfortable with this, go ahead, but without knowing
the particulars of your systems, this sounds like asking for troubles.

Indeed, changing something underneath the live volume manager (UBI) and
file-system (UBIFS) is error-prone at the very least.

Asking UBI to do this sounds a lot better.

But again, I do not know the specific of the system you are designing.

>   For software ECC done in the UBI code, I guess one
>   strategy (as we discussed a few months back) is to
>   modify the UBI code so it schedules a block for
>   scrubbing even if a single-bit correctable error
>   occurs.

All you need to do is to lower 'bitflip_threshold' instead.

But note, this will be "passive" scrubbing, meaning that UBI will scrub
only when there is a read operation. But the read operation may be
extremely rare for certain LEBs, and the data may bit-rot due to various
"radiation" effects (doing I/O on the neighbor PEBs).

So I suggested you to just read all volumes periodically from the
user-space, may be from a background cron task.

But as I pointed, this will not force re-read of the volume table LEBs.
To address this, you'd need to do some additional, not very difficult
work.

-- 
Best Regards,
Artem Bityutskiy
