Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn7ub-0002A8-1g
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 15:59:06 +0000
Received: by pablj1 with SMTP id lj1so45756283pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2015 08:58:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20150428151138.GB11721@bshelton-desktop>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
 <20150428151138.GB11721@bshelton-desktop>
Date: Tue, 28 Apr 2015 21:28:42 +0530
Message-ID: <CAGnW=BY=vAOYMuK7My-g6+YOBEnbkRaY4mwpGUE9TexA9_GsFg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Ben Shelton <ben.shelton@ni.com>
Content-Type: text/plain; charset=UTF-8
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Punnaiah Choudary <kpc528@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

  I will take care of the boundary conditions for both lower and upper
limits and update the patches accordingly.

Thanks,
Punnaiah

On Tue, Apr 28, 2015 at 8:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> Hi Punnaiah,
>
>> +/**
>> + * pl353_smc_set_cycles - Set memory timing parameters
>> + * @dev:     Pointer to the device struct
>> + * @t0:      t_rc            read cycle time
>> + * @t1:      t_wc            write cycle time
>> + * @t2:      t_rea/t_ceoe    output enable assertion delay
>> + * @t3:      t_wp            write enable deassertion delay
>> + * @t4:      t_clr/t_pc      page cycle time
>> + * @t5:      t_ar/t_ta       ID read time/turnaround time
>> + * @t6:      t_rr            busy to RE timing
>> + *
>> + * Sets NAND chip specific timing parameters.
>> + */
>> +void pl353_smc_set_cycles(struct device *dev, u32 t0, u32 t1, u32 t2, u32 t3,
>> +                       u32 t4, u32 t5, u32 t6)
>> +{
>> +     struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
>> +
>> +     t0 &= PL353_SMC_SET_CYCLES_T0_MASK;
>> +     t1 = (t1 & PL353_SMC_SET_CYCLES_T1_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T1_SHIFT;
>> +     t2 = (t2 & PL353_SMC_SET_CYCLES_T2_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T2_SHIFT;
>> +     t3 = (t3 & PL353_SMC_SET_CYCLES_T3_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T3_SHIFT;
>> +     t4 = (t4 & PL353_SMC_SET_CYCLES_T4_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T4_SHIFT;
>> +     t5 = (t5 & PL353_SMC_SET_CYCLES_T5_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T5_SHIFT;
>> +     t6 = (t6 & PL353_SMC_SET_CYCLES_T6_MASK) <<
>> +                     PL353_SMC_SET_CYCLES_T6_SHIFT;
>
> Right now, if the caller (i.e. the PL353 NAND driver) passes in a value for any
> of the timing parameters that is too large, it will be truncated with the
> corresponding mask and then saved, resulting in unexpected behavior.  I saw
> this when the PL353 NAND driver tried to set t_rc and t_wc to 17 cycles, which
> does not fit in the 4-bit fields for those values -- it got clipped to 4 bits
> and stored as 1 cycle, which made communication with the NAND chip fail and
> time out.
>
> It would be good to sanity-check each timing here, and rather than returning
> void, return a return code indicating success or failure (e.g. -EINVAL for
> invalid timings).
>
> Note also that truncation isn't the only thing to check for here.  The PL350
> r2p1 datasheet lists a "Minimum permitted value" for each of these timing
> values.
>
>> +
>> +     t0 |= t1 | t2 | t3 | t4 | t5 | t6;
>> +
>> +     writel(t0, pl353_smc->base + PL353_SMC_SET_CYCLES_OFFS);
>> +     writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc->base +
>> +            PL353_SMC_DIRECT_CMD_OFFS);
>> +}
>> +EXPORT_SYMBOL_GPL(pl353_smc_set_cycles);
>> +
>
> Thanks,
> Ben
