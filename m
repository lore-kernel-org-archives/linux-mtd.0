Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzqdw-0006IQ-93
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 18:42:46 +0000
Subject: Re: [PATCH] brcmnand: Clear EXT_ADDR error registers in PIO mode
To: Brian Norris <computersforpeace@gmail.com>
References: <564A5333.9000200@simon.arlott.org.uk>
 <20151117004005.GU8456@google.com> <564ADA21.8070700@simon.arlott.org.uk>
 <20151117175515.GC8456@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Cernekee <cernekee@gmail.com>, bcm-kernel-feedback-list@broadcom.com
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <564F6980.3050806@simon.arlott.org.uk>
Date: Fri, 20 Nov 2015 18:42:08 +0000
MIME-Version: 1.0
In-Reply-To: <20151117175515.GC8456@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17/11/15 17:55, Brian Norris wrote:
> On Tue, Nov 17, 2015 at 07:41:21AM +0000, Simon Arlott wrote:
>> On 17/11/15 00:40, Brian Norris wrote:
>> > + bcm-kernel-feedback-list
>> > 
>> > On Mon, Nov 16, 2015 at 10:05:39PM +0000, Simon Arlott wrote:
>> >> If an error occurs in flash above 4GB in PIO mode then the EXT_ADDR
>> >> registers will be set to the location of the error and never cleared.
>> >> 
>> >> Reset them to 0 before reading.
>> >> 
>> >> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> > 
>> > Patch looks OK. Did you see this problem in practice, or is this just
>> > theoretical? I thought the documentation seemed to suggest these
>> > registers were cleared together with their non-_EXT counterparts. But
>> > implementation definitely trumps documentation for HW.
>> 
>> It's theoretical (I don't have 4GB+ flash), but the Broadcom version of
>> the NAND driver does this.
> 
> That's a funny thing to say :) There never really was a single "Broadcom
> version" until we settled on upstreaming this one. It's a direct
> descendant of this [1], which also does not do these writes, and was
> tested on >4GB flash, though not extensively.
> 
> Which product line did you get your driver from, then?

I have a file called bcm963xx_4.12L.06B_consumer/kernel/linux/drivers/mtd/brcmnand/brcmnand_base.c:

        /* Clear ECC registers */
        chip->ctrl_write(BCHP_NAND_ECC_CORR_ADDR, 0);
        chip->ctrl_write(BCHP_NAND_ECC_UNC_ADDR, 0);
#if CONFIG_MTD_BRCMNAND_VERSION >= CONFIG_MTD_BRCMNAND_VERS_1_0
        chip->ctrl_write(BCHP_NAND_ECC_CORR_EXT_ADDR, 0);
        chip->ctrl_write(BCHP_NAND_ECC_UNC_EXT_ADDR, 0);
#endif

There's also a workaround (brcmnand_handle_false_read_ecc_unc_errors)
that I'm going to write a patch for as it affects my v4.0 device. It'd
be useful to know which version of the controller fixes the issue:

       /* Flash chip returns errors 
        || There is a bug in the controller, where if one reads from an erased block that has NOT been written to,
        || this error is raised.  
        || (Writing to OOB area does not have any effect on this bug)
        || The workaround is to also look into the OOB area, to see if they are all 0xFF
        */

> Anyway, unless someone still at Broadcom can confirm or deny, I suppose
> this patch is mostly harmless and I can take it.
> 
> Brian
> 
>> > Brian
>> > 
>> >> ---
>> >>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >> 
>> >> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> >> index 12c6190..2c8f67f 100644
>> >> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> >> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> >> @@ -1400,6 +1400,8 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>> >>  	/* Clear error addresses */
>> >>  	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
>> >>  	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
>> >> +	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
>> >> +	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
>> >>  
>> >>  	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
>> >>  			(host->cs << 16) | ((addr >> 32) & 0xffff));
>> >> -- 
>> >> 2.1.4
>> >> 
>> >> -- 
>> >> Simon Arlott
>> > 
>> 
>> 
>> -- 
>> Simon Arlott
> 
> [1] https://github.com/Broadcom/stblinux-3.8/blob/master/linux/drivers/mtd/nand/brcmstb_nand.c
>     Disclaimer: I used to work at Broadcom.
> 


-- 
Simon Arlott
