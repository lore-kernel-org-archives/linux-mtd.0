Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqo4k-0005KA-Pj
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:09:03 +0000
Received: by igdg1 with SMTP id g1so67510854igd.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 13:08:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <562E7667.5050406@broadcom.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
Date: Mon, 26 Oct 2015 13:08:41 -0700
Message-ID: <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
From: Clay McClure <clay@daemons.net>
To: Ray Jui <rjui@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2015 at 11:52 AM, Ray Jui <rjui@broadcom.com> wrote:

> I guess I still need to get this straight in my brain and I have a few
> questions here:
>
> 1) I remember we had some other discussions related to this before,
> regarding the NAND data endianness. We confirmed that the raw NAND data
> programmed with a standard flasher is in LE format. And this is why we need
> to configure apb bus to LE before accessing these data/cache registers?

According to the ONFI specifications[1], the parameter page is little-endian:

"For parameters that span multiple bytes, the least significant byte
of the parameter corresponds to the first byte."

I'm not sure if that's what drove the decision to use LE APB
transfers, but it does simplify the code to use the same byte ordering
on the bus as in the CPU.

> 2) Are we saying here that, by standard, the ONFI parameters should be in BE
> format as opposed to the raw NAND data format, and therefore no apb bus
> config to LE should be done? Or, your current logic seems to do the
> following:
>
> 1) still configure the APB to LE before access data/cache registers
> 2) do a be32_to_cpu, which in effect causes a byte swap on ARM CPU running
> in LE (our current case). If data read from APB is already in LE, this makes
> it become BE
> 3) return directly from the byte location of the buffer memory, instead of
> doing a 32-bit based read and doing some arithmetic, to get the byte data

The bug in read_byte() is due to the fact that it currently assumes
the host CPU byte order is big-endian (i.e., it always extracts byte 0
from the high bits of the word). If we continue to use LE APB
transfers, then I think we can exclude the be32_to_cpu() call from
Brian's patch. Converting flash_cache to a byte array I believe is all
we need to solve the problem with nand_flash_detect_onfi(). That
function already includes the necessary byte-order conversions for
big-endian machines.

Brian, I'll test a variation of this patch on our iProc-based
platforms and report back.

Thanks,

Clay

[1]: http://www.onfi.org/specifications
