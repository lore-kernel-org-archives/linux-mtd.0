Received: from secvs01.rockwellcollins.com ([205.175.225.240])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAyMV-0000Jn-4v
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 13:52:06 +0000
Received: by mail-ot0-f197.google.com with SMTP id s6-v6so12830562oth.20
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2018 06:51:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424115618.70438e41@xps13>
References: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
 <20180422190743.36e65119@xps13>
 <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
 <20180424115618.70438e41@xps13>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Tue, 24 Apr 2018 08:51:48 -0500
Message-ID: <CADFuHZ6tJOVzhZOede_DvCbzBC_iJNJ4zpZtU4RtAp0sRJpOUw@mail.gmail.com>
Subject: Re: [PATCH] Added set feature command in FSL IFC nand controller
 driver for ONFI nand
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2018 at 4:56 AM, Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Hi Ronak,
>
>> >> +/**
>> >> + * fsl_ifc_onfi_set_features- set features for ONFI nand
>> >> + * @mtd: MTD device structure
>> >> + * @chip: nand chip info structure
>> >> + * @addr: feature address.
>> >> + * @subfeature_param: the subfeature parameters, a four bytes array.
>> >> + */
>> >> +static int fsl_ifc_onfi_set_features(struct mtd_info *mtd, struct na=
nd_chip *chip,
>> >> +                     int addr, uint8_t *subfeature_param)
>> >> +{
>> >> +     int status;
>> >> +     int i;
>> >> +
>> >> +#ifdef CONFIG_SYS_NAND_ONFI_DETECTION
>> >> +     if (!chip->onfi_version ||
>> >> +         !(le16_to_cpu(chip->onfi_params.opt_cmd)
>> >> +           & ONFI_OPT_CMD_SET_GET_FEATURES))
>> >> +             return -EINVAL;
>> >> +#endif
>> >
>> > No need to do that, the core will take care of it, see [1].
>>
>> Agree, I will remove this.
>> >
>> >> +
>> >> +     /* Want data from start of the buffer */
>> >> +     set_addr(mtd, 0, 0, 0);
>> >
>> > This is the only thing that differs from the core's implementation. I
>> > see most of the time it is called from ->cmdfunc(), could you move it
>> > there? If yes you could get rid of this entire hook and rely on the
>> > core's function.
>> >
>> NAND_CMD_SET_FEATURES command sends the sub-feature param from flash
>> buffer on the provided address and I added this here because I wanted
>> to make sure
>> that the data is set from start of the buffer. I looked at the core's
>> implementation
>> and I see that the NAND_CMD_SET_FEATURES  command is called first and th=
en
>> the data is filled into the buffer which will not work in case of my
>> implementation.
>> So, I will have to keep this here and the function, please suggest. I
>> will wait for your
>> feedback before submitting V2.  Moreover, I would suggest to check
>> sequence in core's
>> implementation as the command should run after setting the data and not =
before.
>
> Not sure what you mean exactly by "NAND_CMD_SET_FEATURES is called first
> and the data is filled into the buffer", could you please point out the
> faulty section in the core so I can have a look?
>
I was pointing to the code in else part in "nand_set_features_op". FSL
nand controller
driver does not use "exec_op" so if I use nand_default_set_features
from core as you suggested
then code in the else part will be executed and as depicted below, the
controller specific NAND_CMD_SET_FEATURES
is called before writing the sub-feature parameters. Whereas in my
implementation and I believe in general
also you would want to call the controller specific "cmdfunc" only
after writing the sub-feature parameters
in buffer. Please correct me if I am missing anything here.

2193     } else {
2194         chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, feature, -1);
2195         for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
2196             chip->write_byte(mtd, params[i]);

> Thanks,
> Miqu=C3=A8l
>
>> >> +
>> >> +     for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
>> >> +             chip->write_byte(mtd, subfeature_param[i]);
>> >> +
>> >> +     chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);
>> >> +
>> >> +     status =3D chip->waitfunc(mtd, chip);
>> >> +     if (status & NAND_STATUS_FAIL)
>> >> +             return -EIO;
>> >> +     return 0;
>> >> +}
>
>
> --
> Miquel Raynal, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Ronak.Desai@rockwellcollins.com
https://www.rockwellcollins.com/
