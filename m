Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Wop-0006nQ-5l
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 15:12:49 +0000
Received: by mail-wg0-f53.google.com with SMTP id y10so3826538wgg.20
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2014 07:12:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52D3ABB6.9030204@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <52D1494E.9090303@overkiz.com> <1389449230.19197.2.camel@localhost>
 <52D1541F.4040400@overkiz.com> <1389456075.20989.11.camel@localhost>
 <1389474709.22660.4.camel@localhost> <52D3ABB6.9030204@overkiz.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 29 Jan 2014 16:11:41 +0100
Message-ID: <CAOMqctSrXow1Wjppzp0Y4+p26KFFggtEphxX2xcs0ZoLvDUx1g@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND Flash
 Controller support
To: linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dev@linux-sunxi.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Henrik_Nordstr=C3=B6m?= <henrik@henriknordstrom.net>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 January 2014 10:02, boris brezillon <b.brezillon@overkiz.com> wrote:
> Hi Henrik,
>
>
> On 11/01/2014 22:11, Henrik Nordstr=C3=B6m wrote:
>>
>> <bbrezillon> thanks for pointing out your documents
>> <bbrezillon> I'm trying to get the NAND driver with HW ECC (and HW RND)
>> without using DMA at all
>>
>> I tried many things but did not quite get the ECC reading command to
>> return meaningful resuts. But should work somehow.
>>
>> <bbrezillon> do you have any other information I could use to do this ?
>>
>> Not really. There is no known code to look at using the nand controller
>> without DMA. All allwinner code uses DMA even the boot ROM (BROM).
>>
>> <bbrezillon> For example, I wonder why there are 2 RAM sectors (the
>> driver I found only make use of RAM0)
>>
>> I think it's used during DMA to fetch next sector while the previous one
>> is transferred by DMA. But not sure.
>
>
> Some feedback on my tests:
>
> - I managed to get HW ECC working without any DMA transfer (using CMD =3D=
 01):
>   * I only tested the sequential ECC =3D> ECC are stored between 2 data b=
locks
> (1024 byte)
>   * Non sequential ECC should work if I store ECC bytes in the OOB area t=
oo
> (I'll just have
>      to send RANDOM_OUT commands to move to the OOB area before sending t=
he
> ECC
>      cmd and another RANDOM_OUT to go back to the DATA area)
>
> - The HW RND (randomizer) works too, I'll just have to figure out how thi=
s
> could be
>   mainlined:
>    * using a simple dt property to tell the controller it should enable t=
he
> randomizer
>    * provide an interface (like the nand_ecc_ctrl struct ) for other to a=
dd
> their own
>       randomizer implementation (this was requested:
> https://lkml.org/lkml/2013/12/13/154)
>
>
> The most complicated part is the boot0 partition.
>
> Tell me if I'm wrong, but here's what I understood from your work (and yu=
q's
> work too):
>
> boot 0 part properties:
> - uses sequential ECC
> - uses 1024 bytes ECC blocks
> - boot0 code is stored only on the first ECC block of each page (1024 byt=
es
> + ecc bytes)
> - boot0 code is stored on the first 64 pages of the first block
> - boot0 uses HW randomizer with a specific rnd seed (0x4a80)
>
> It's not that complicated to read/write from/to boot0, but it's a bit mor=
e
> to mainline this
> implementation:
>  - the nand chip must use the same ECC algorithm and ECC layout on the wh=
ole
> flash
>    (no partition specific config available)
> - you cannot mark some part of pages as unused =3D> the nand driver will =
write
> the
>   whole page, not just the first ECC block (1024 bytes)
>
> I thought about manually creating an mtd device that fullfils these needs
> (in case we
> encounter the "allwinner,nandn-boot" property on a nand@X node), but I'm =
not
> sure
> this is the right approach.
>
> Any ideas ?

Maybe if varying parameters on one MTD device is not acceptable you
could export parts of the flash as different MTD devices each with its
own parameters. Since the boot0 part is fixed size this should not
really be an issue. Existing MTD drivers that share hardware with
other devices exist - eg. the MTD driver which exports part of RAM as
MDT device.

I wonder if it would be good idea to make it possible to use the NAND
only for storage without a boot0 area. If this is selected by a DT
parameter as suggested changing the parameter will probably make the
NAND unreadable.

Thanks

Michal

>
>
> Best Regards,
>
> Boris
>
>>
>> Regards
>> Henrik
>>
>
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/groups/opt_out.
