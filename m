Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhV3t-0005fe-K1
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 05:06:14 +0000
Received: by mail-qk0-f200.google.com with SMTP id g124so10715732qkd.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Sep 2016 22:05:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ4bP6zWZYUGu_6sjNgo6Uj+pdUrCpCUhBo=DrWdYFb3Ww@mail.gmail.com>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <CADFuHZ4bP6zWZYUGu_6sjNgo6Uj+pdUrCpCUhBo=DrWdYFb3Ww@mail.gmail.com>
From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 7 Sep 2016 00:05:50 -0500
Message-ID: <CANQCQpZatHXpaU1Y3kCQ1N7HnGXX2SduaRssq9C8so7CE_YdHg@mail.gmail.com>
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 oss@buserror.net, prabhakar.kushwaha@nxp.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apologize for top post.

Dipen seems to have moved on.  Adding new CC(s).

Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: Steve Wood  <oss@buserror.net>

On Tue, Sep 6, 2016 at 3:37 PM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> On Tue, Sep 6, 2016 at 2:50 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>>
>> On Tue,  6 Sep 2016 14:13:17 -0500
>> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>>
>> > This patch adds random output enable command support in IFC nand
>> > controller driver. This command implements change read
>> > column (05h-E0h).
>> >
>> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> > Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
>> > ---
>> >  drivers/mtd/nand/fsl_ifc_nand.c | 30 +++++++++++++++++++++++++++---
>> >  1 file changed, 27 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
>> > index 4e9e5fd..230919f 100644
>> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
>> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
>> > @@ -387,10 +387,11 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>> >
>> >               /*
>> >                * although currently it's 8 bytes for READID, we always read
>> > -              * the maximum 256 bytes(for PARAM)
>> > +              * the maximum 8192 bytes(for PARAM) supported by IFC controller
>> > +              * as extended page may be available for some NAND devices.
>> >                */
>> > -             ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
>> > -             ifc_nand_ctrl->read_bytes = 256;
>> > +             ifc_out32(0, &ifc->ifc_nand.nand_fbcr); /* Read whole page */
>> > +             ifc_nand_ctrl->read_bytes = 8192; /* Maximum supported page by IFC */
>>
>> And this exactly why letting drivers implement their own ->cmdfunc()
>> method is a bad idea.
>> ->cmdfunc() does not provide enough information to guess how much data
>> should be read or written. Actually it's not supposed to be used this
>> way, but drivers usually abuse it.
>>
>> I know you're just adding support for a new feature here, and I don't
>> blame you, but this kind of things make the whole NAND framework
>> impossible to maintain.
>>
> In nand_flash_detect_ext_param_page() function, nand base code
> sends NAND_CMD_PARAM and after that sends NAND_CMD_RNDOUT
> to skip the ONFI param pages. Now, NAND_CMD_PARAM actually does
> not do any actual reading and just requests to change the column pointer
> we need to read the extended page somewhere and thus I ended up with
> the above change.
>>
>> >
>> >               set_addr(mtd, 0, 0, 0);
>> >               fsl_ifc_run_command(mtd);
>> > @@ -530,6 +531,29 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>> >               fsl_ifc_run_command(mtd);
>> >               return;
>> >
>> > +     case NAND_CMD_RNDOUT: {
>> > +             __le16 Tccs = 0;
>> > +             chip->onfi_version ? (Tccs = chip->onfi_params.t_ccs)
>> > +                                     : (Tccs = chip->jedec_params.t_ccs);
>> > +             ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
>> > +                             (IFC_FIR_OP_CA0 << IFC_NAND_FIR0_OP1_SHIFT) |
>> > +                             (IFC_FIR_OP_CMD1 << IFC_NAND_FIR0_OP2_SHIFT) |
>> > +                             (IFC_FIR_OP_NWAIT << IFC_NAND_FIR0_OP3_SHIFT),
>> > +                             &ifc->ifc_nand.nand_fir0);
>> > +
>> > +             ifc_out32((NAND_CMD_RNDOUT << IFC_NAND_FCR0_CMD0_SHIFT) |
>> > +                             (NAND_CMD_RNDOUTSTART << IFC_NAND_FCR0_CMD1_SHIFT),
>> > +                             &ifc->ifc_nand.nand_fcr0);
>> > +
>> > +             /* Wait for minimum change column set-up time. But it does not harm
>> > +              * to wait more time, so calculated based on 333.3 MHz input IFC clock
>> > +              */
>>
>> Can't you know the clk rate at runtime instead of basing your
>> calculation on the hypothetic clk rate?
>
>
> IFC input clock is divide by 2 platform clock and for T, P series
> and Layerscape series of processors where IFC is used, maximum
> platform clock is 600 MHz so IFC input clock becomes 300 MHz maximum.
> To avoid floating operation, I chose next possible frequency of
> 333.33 MHz which gives me period of 3 ns. There was no easy way to find
> the input IFC clock without knowing platform clock which requires RCW values
> . So, to avoid that I selected this route where we will end up waiting few more
> cycles then required but it does not harm. For example, my input IFC clock is
> 266.66 Mhz and my NAND part tells me to wait minimum 200 ns so I have to
> wait for  54 cycles while with this calculation I will be waiting for
> 66 cycles which
>  I think won't matter as the data-sheet specifies minimum change
> column set-up time.
>>
>>
>> > +             ifc_out32((0xFF & (le16_to_cpu(Tccs)/3)), &ifc->ifc_nand.ncfgr);
>>
>> Why is it done in ->cmdfunc()? I mean, this timing parameter should be
>> set for all operations, and applied as soon as ->select_chip() is
>> called.
>>
> I am using NCFGR[NUM_WAIT] (Number of IFC input clock cycles)
>  to wait for Tccs time and which gets filled by the base driver when
> probing for features. So, I am using tccs value read from NAND device
> to calculate wait cycles with maximum possible IFC input clock.
>
>> > +             set_addr(mtd, column, 0, 0);
>> > +             fsl_ifc_run_command(mtd);
>> > +             return;
>> > +     }
>> > +
>> >       default:
>> >               dev_err(priv->dev, "%s: error, unsupported command 0x%x.\n",
>> >                                       __func__, command);
>>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber@corp.rockwellcollins.com.
