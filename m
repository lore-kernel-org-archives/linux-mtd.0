Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCw3O-0001F2-8O
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 16:48:58 +0000
Received: by yhjj52 with SMTP id j52so976768yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2012 09:48:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1332929665.2058.102.camel@shinybook.infradead.org>
References: <CAN8TOE_8sTtuvBq+SOSLv5Kbw_2G8ByX-euiDm=z2btO-kLkcw@mail.gmail.com>
 <alpine.LFD.2.02.1203281149010.2542@ionos>
 <1332929665.2058.102.camel@shinybook.infradead.org>
Date: Wed, 28 Mar 2012 09:42:32 -0700
Message-ID: <CAN8TOE90kUTDA8WDaELSL7E2D8qNUB9uYN5W4Tg3Jpw+u-Mffg@mail.gmail.com>
Subject: Re: nand_base - kill chip->oob_poi?
From: Brian Norris <computersforpeace@gmail.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Gleixner <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 28, 2012 at 3:14 AM, Woodhouse, David
<david.woodhouse@intel.com> wrote:
> On Wed, 2012-03-28 at 11:51 +0200, Thomas Gleixner wrote:
>> On Tue, 27 Mar 2012, Brian Norris wrote:
>> > I'm looking to support a new NAND hardware controller, and it doesn't
>> > support OOB read/write for its fastest modes of operation, since most
>> > normal activity (i.e., UBI(FS)) doesn't need OOB. So I'm trying to
>>
>> And how is ECC working for that "normal" activity ?
>>
>> Using NAND w/o ECC is doomed for fail.
>
> I was assuming that the controller *used* the OOB area for hardware ECC,
> but just didn't support letting the *host* access the OOB area "in its
> fastest modes of operation".

Right, HW ECC is working with a HW internal buffer that isn't exposed
to the host in its DMA modes. I can access it via PIO, but that's not
ideal.

>> > My plan looked something like the following:
>> > - avoid using chip->oob_poi explicitly if at all possible
>> > - pass both buf and oob pointers to the various {read,write}_page
>> > =A0 interfaces (in nand_chip and in nand_ecc_ctrl)
>> > - allow oob to be NULL, which would imply that the API call only
>> > =A0 needed the in-band data
>
> And presumably the swecc/hwecc cases would still use either oob_poi or
> their own buffer, since they have to put the syndrome *somewhere* after
> calculating it... but those are only for those controllers which *use*
> the swecc/hwecc support.

Yes, I guess they still need it. Maybe in places where they would have
used chip->oob_poi, I can replace it with a buffer passed as an
argument, then when that buffer is NULL we fall back to chip->oob_poi,
like the following:

static int nand_read_page_raw_syndrome(... uint8_t *buf, uint8_t *oobbuf ..=
.)
{
    ...
    uint8_t *oob =3D oobbuf ? oobbuf : chip->oob_poi;
    ...
    chip->read_buf(mtd, oob, ...);
    ...
}

> I don't think it matters that your plan "conflicts" with the ECC
> implementations that you wouldn't be able to to use on this hardware
> anyway.

Right. I'm just concerned with modifying the nand_chip / nand_ecc_ctrl
interfaces enough to work with this hardware while avoiding breaking
existing stuff and keeping the interfaces sane. I have to at least
break the assumption that the {read,write}_page interfaces *always*
will fill/use chip->oob_poi.

Brian
