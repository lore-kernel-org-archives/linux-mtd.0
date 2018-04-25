Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBKv9-0006wk-9s
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2018 13:57:43 +0000
Received: by mail-oi0-f69.google.com with SMTP id 84-v6so12435624oii.20
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2018 06:56:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424193758.57ae5547@bbrezillon>
References: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
 <20180422190743.36e65119@xps13>
 <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
 <20180424115618.70438e41@xps13>
 <CADFuHZ6tJOVzhZOede_DvCbzBC_iJNJ4zpZtU4RtAp0sRJpOUw@mail.gmail.com>
 <20180424160028.1de6cfb6@xps13>
 <CADFuHZ5f4+jjVazc-0Q2qXmHWXnxXPSjdnmRtYue1-BvT02s4g@mail.gmail.com>
 <20180424193758.57ae5547@bbrezillon>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Wed, 25 Apr 2018 08:56:57 -0500
Message-ID: <CADFuHZ6FVEMj9=JSHATOUy=qD7L2WJbsiSsVMMLmHa0J7x-zPQ@mail.gmail.com>
Subject: Re: [PATCH] Added set feature command in FSL IFC nand controller
 driver for ONFI nand
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Borris, Miquel,

On Tue, Apr 24, 2018 at 12:37 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Hi Ronak,
>
> I'm jumping on this discussion to clarify a few things.
>
> On Tue, 24 Apr 2018 12:10:07 -0500
> Ronak Desai <ronak.desai@rockwellcollins.com> wrote:
>
>> >> >> >> +
>> >> >> >> +     for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
>> >> >> >> +             chip->write_byte(mtd, subfeature_param[i]);
>> >> >> >> +
>> >> >> >> +     chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);
>> >
>> > And this implementation does the opposite :)
>> No, this is not opposite, I am just copying the data in the nand
>> controller data buffer and not sending on the bus and when the
>> NAND_CMD_SET_FEATURES is called, in that I tell nand controller to
>> transfer 4 bytes from data buffer after sending the set feature
>> command. So, on the bus the sequence will be same as depicted in the
>> ONFI specification. I have tested this on two different target
>> hardwares with processors having this nand controller.
>
> The ->cmdfunc() semantic has been abused for too long by too many
> drivers, let's stop this insanity. ->cmdfunc() has been designed to
> send CMD and ADDR cycles on the NAND bus, not to trigger the actual
> data transfer. You might think this is a bad design (and I partially
> agree that things were not perfect), but that's how it is. This being
> said, we now have a clean way for drivers to get all information at
> once (CMD, ADDR and DATA cycles) and it's called ->exec_op().
>
> If you don't want to patch the driver to support ->exec_op(), I can
> consider accepting a temporary solution where the whole SET_FEATURES
> handling is done in fsl_ifc_onfi_set_features() (that is, moving the
> code you have in the 'case NAND_CMD_SET_FEATURES' in the
> fsl_ifc_onfi_set_features() function so that you don't call ->cmdfunc()
> at all), but I'd really prefer to have the driver converted to
> ->exec_op(), and I think we (Miquel and I) can help with that.
>
> BTW, you implement ->set_features() but ->get_features() is not
> supported??!! This sounds like a bad idea to me...
>
I understand your concern and thank you for the feedback, I am
planning to update the patch to accommodate temporary solution as
Borris suggested as converting the driver would take time but I am
also looking forward to it.
> Regards,
>
> Boris



-- 
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Ronak.Desai@rockwellcollins.com
https://www.rockwellcollins.com/
