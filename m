Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1tSP-000798-Rp
 for linux-mtd@lists.infradead.org; Wed, 02 Nov 2016 11:11:51 +0000
Received: from mail-lf0-f41.google.com ([209.85.215.41]:35208)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1c1tRt-002Lqf-Pt
 for linux-mtd@lists.infradead.org; Wed, 02 Nov 2016 07:11:27 -0400
Received: by mail-lf0-f41.google.com with SMTP id b14so9450414lfg.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Nov 2016 04:11:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e4458eb3-4676-5b05-ef6c-555468efe260@atmel.com>
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <87ace1a307f4d9899a84108de999a2eeb151da1a.1477325128.git.cyrille.pitchen@atmel.com>
 <CAD6G_RQvtJXMJecbDz=s=UOCiUC9q9f68zZsfu9m_i8AK5xcEw@mail.gmail.com>
 <e4458eb3-4676-5b05-ef6c-555468efe260@atmel.com>
From: Jagan Teki <jagan@openedev.com>
Date: Wed, 2 Nov 2016 16:41:15 +0530
Message-ID: <CAD6G_RRGphpvR1EcdGWdVhAUen=S-mydE17i-7DPapeMb7ZLkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] mtd: spi-nor: add an alternative method to support
 memory >16MiB
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, Marek Vasut <marex@denx.de>, richard@nod.at,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 2, 2016 at 4:19 PM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> Hi,
>
> Le 31/10/2016 =C3=A0 19:51, Jagan Teki a =C3=A9crit :
>> Hi Cyrille,
>>
>> On Mon, Oct 24, 2016 at 10:04 PM, Cyrille Pitchen
>> <cyrille.pitchen@atmel.com> wrote:
>>> This patch provides an alternative mean to support memory above 16MiB
>>> (128Mib) by replacing 3byte address op codes by their associated 4byte
>>> address versions.
>>>
>>> Using the dedicated 4byte address op codes doesn't change the internal
>>> state of the SPI NOR memory as opposed to using other means such as
>>> updating a Base Address Register (BAR) and sending command to enter/lea=
ve
>>> the 4byte mode.
>>>
>>> Hence when a CPU reset occurs, early bootloaders don't need to be aware
>>> of BAR value or 4byte mode being enabled: they can still access the fir=
st
>>> 16MiB of the SPI NOR memory using the regular 3byte address op codes.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>> Tested-by: Vignesh R <vigneshr@ti.com>
>>> ---
>>>  drivers/mtd/devices/serial_flash_cmds.h |   7 ---
>>>  drivers/mtd/devices/st_spi_fsm.c        |  28 ++++-----
>>>  drivers/mtd/spi-nor/spi-nor.c           | 104 ++++++++++++++++++++++++=
+-------
>>>  include/linux/mtd/spi-nor.h             |  22 +++++--
>>>  4 files changed, 113 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/serial_flash_cmds.h b/drivers/mtd/devi=
ces/serial_flash_cmds.h
>>> index f59a125295d0..8b81e15105dd 100644
>>> --- a/drivers/mtd/devices/serial_flash_cmds.h
>>> +++ b/drivers/mtd/devices/serial_flash_cmds.h
>>> @@ -18,19 +18,12 @@
>>>  #define SPINOR_OP_RDVCR                0x85
>>>
>>>  /* JEDEC Standard - Serial Flash Discoverable Parmeters (SFDP) Command=
s */
>>> -#define SPINOR_OP_READ_1_2_2   0xbb    /* DUAL I/O READ */
>>> -#define SPINOR_OP_READ_1_4_4   0xeb    /* QUAD I/O READ */
>>> -
>>>  #define SPINOR_OP_WRITE                0x02    /* PAGE PROGRAM */
>>>  #define SPINOR_OP_WRITE_1_1_2  0xa2    /* DUAL INPUT PROGRAM */
>>>  #define SPINOR_OP_WRITE_1_2_2  0xd2    /* DUAL INPUT EXT PROGRAM */
>>>  #define SPINOR_OP_WRITE_1_1_4  0x32    /* QUAD INPUT PROGRAM */
>>>  #define SPINOR_OP_WRITE_1_4_4  0x12    /* QUAD INPUT EXT PROGRAM */
>>>
>>> -/* READ commands with 32-bit addressing */
>>> -#define SPINOR_OP_READ4_1_2_2  0xbc
>>> -#define SPINOR_OP_READ4_1_4_4  0xec
>>> -
>>>  /* Configuration flags */
>>>  #define FLASH_FLAG_SINGLE      0x000000ff
>>>  #define FLASH_FLAG_READ_WRITE  0x00000001
>>> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_=
spi_fsm.c
>>> index 5454b4113589..804313a33f2b 100644
>>> --- a/drivers/mtd/devices/st_spi_fsm.c
>>> +++ b/drivers/mtd/devices/st_spi_fsm.c
>>> @@ -507,13 +507,13 @@ static struct seq_rw_config n25q_read3_configs[] =
=3D {
>>>   *     - 'FAST' variants configured for 8 dummy cycles (see note above=
.)
>>>   */
>>>  static struct seq_rw_config n25q_read4_configs[] =3D {
>>> -       {FLASH_FLAG_READ_1_4_4, SPINOR_OP_READ4_1_4_4,  0, 4, 4, 0x00, =
0, 8},
>>> -       {FLASH_FLAG_READ_1_1_4, SPINOR_OP_READ4_1_1_4,  0, 1, 4, 0x00, =
0, 8},
>>> -       {FLASH_FLAG_READ_1_2_2, SPINOR_OP_READ4_1_2_2,  0, 2, 2, 0x00, =
0, 8},
>>> -       {FLASH_FLAG_READ_1_1_2, SPINOR_OP_READ4_1_1_2,  0, 1, 2, 0x00, =
0, 8},
>>> -       {FLASH_FLAG_READ_FAST,  SPINOR_OP_READ4_FAST,   0, 1, 1, 0x00, =
0, 8},
>>> -       {FLASH_FLAG_READ_WRITE, SPINOR_OP_READ4,        0, 1, 1, 0x00, =
0, 0},
>>> -       {0x00,                  0,                      0, 0, 0, 0x00, =
0, 0},
>>> +       {FLASH_FLAG_READ_1_4_4, SPINOR_OP_READ_1_4_4_4B, 0, 4, 4, 0x00,=
 0, 8},
>>> +       {FLASH_FLAG_READ_1_1_4, SPINOR_OP_READ_1_1_4_4B, 0, 1, 4, 0x00,=
 0, 8},
>>> +       {FLASH_FLAG_READ_1_2_2, SPINOR_OP_READ_1_2_2_4B, 0, 2, 2, 0x00,=
 0, 8},
>>> +       {FLASH_FLAG_READ_1_1_2, SPINOR_OP_READ_1_1_2_4B, 0, 1, 2, 0x00,=
 0, 8},
>>> +       {FLASH_FLAG_READ_FAST,  SPINOR_OP_READ_FAST_4B,  0, 1, 1, 0x00,=
 0, 8},
>>> +       {FLASH_FLAG_READ_WRITE, SPINOR_OP_READ_4B,       0, 1, 1, 0x00,=
 0, 0},
>>> +       {0x00,                  0,                       0, 0, 0, 0x00,=
 0, 0},
>>>  };
>>>
>>>  /*
>>> @@ -553,13 +553,13 @@ static int stfsm_mx25_en_32bit_addr_seq(struct st=
fsm_seq *seq)
>>>   * entering a state that is incompatible with the SPIBoot Controller.
>>>   */
>>>  static struct seq_rw_config stfsm_s25fl_read4_configs[] =3D {
>>> -       {FLASH_FLAG_READ_1_4_4,  SPINOR_OP_READ4_1_4_4,  0, 4, 4, 0x00,=
 2, 4},
>>> -       {FLASH_FLAG_READ_1_1_4,  SPINOR_OP_READ4_1_1_4,  0, 1, 4, 0x00,=
 0, 8},
>>> -       {FLASH_FLAG_READ_1_2_2,  SPINOR_OP_READ4_1_2_2,  0, 2, 2, 0x00,=
 4, 0},
>>> -       {FLASH_FLAG_READ_1_1_2,  SPINOR_OP_READ4_1_1_2,  0, 1, 2, 0x00,=
 0, 8},
>>> -       {FLASH_FLAG_READ_FAST,   SPINOR_OP_READ4_FAST,   0, 1, 1, 0x00,=
 0, 8},
>>> -       {FLASH_FLAG_READ_WRITE,  SPINOR_OP_READ4,        0, 1, 1, 0x00,=
 0, 0},
>>> -       {0x00,                   0,                      0, 0, 0, 0x00,=
 0, 0},
>>> +       {FLASH_FLAG_READ_1_4_4,  SPINOR_OP_READ_1_4_4_4B,  0, 4, 4, 0x0=
0, 2, 4},
>>> +       {FLASH_FLAG_READ_1_1_4,  SPINOR_OP_READ_1_1_4_4B,  0, 1, 4, 0x0=
0, 0, 8},
>>> +       {FLASH_FLAG_READ_1_2_2,  SPINOR_OP_READ_1_2_2_4B,  0, 2, 2, 0x0=
0, 4, 0},
>>> +       {FLASH_FLAG_READ_1_1_2,  SPINOR_OP_READ_1_1_2_4B,  0, 1, 2, 0x0=
0, 0, 8},
>>> +       {FLASH_FLAG_READ_FAST,   SPINOR_OP_READ_FAST_4B,   0, 1, 1, 0x0=
0, 0, 8},
>>> +       {FLASH_FLAG_READ_WRITE,  SPINOR_OP_READ_4B,        0, 1, 1, 0x0=
0, 0, 0},
>>> +       {0x00,                   0,                        0, 0, 0, 0x0=
0, 0, 0},
>>>  };
>>>
>>>  static struct seq_rw_config stfsm_s25fl_write4_configs[] =3D {
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-no=
r.c
>>> index 5c87b2d99507..423448c1c7a8 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -75,6 +75,10 @@ struct flash_info {
>>>                                          * bit. Must be used with
>>>                                          * SPI_NOR_HAS_LOCK.
>>>                                          */
>>> +#define SPI_NOR_4B_OPCODES     BIT(10) /*
>>> +                                        * Use dedicated 4byte address =
op codes
>>> +                                        * to support memory size above=
 128Mib.
>>> +                                        */
>>>  };
>>>
>>>  #define JEDEC_MFR(info)        ((info)->id[0])
>>> @@ -188,6 +192,81 @@ static inline struct spi_nor *mtd_to_spi_nor(struc=
t mtd_info *mtd)
>>>         return mtd->priv;
>>>  }
>>>
>>> +
>>> +struct spi_nor_address_entry {
>>> +       u8      src_opcode;
>>> +       u8      dst_opcode;
>>> +};
>>> +
>>> +static u8 spi_nor_convert_opcode(u8 opcode,
>>> +                                const struct spi_nor_address_entry *en=
tries,
>>> +                                size_t num_entries)
>>> +{
>>> +       int min, max;
>>> +
>>> +       min =3D 0;
>>> +       max =3D num_entries - 1;
>>> +       while (min <=3D max) {
>>> +               int mid =3D (min + max) >> 1;
>>> +               const struct spi_nor_address_entry *entry =3D &entries[=
mid];
>>> +
>>> +               if (opcode =3D=3D entry->src_opcode)
>>> +                       return entry->dst_opcode;
>>> +
>>> +               if (opcode < entry->src_opcode)
>>> +                       max =3D mid - 1;
>>> +               else
>>> +                       min =3D mid + 1;
>>> +       }
>>> +
>>> +       /* No conversion found */
>>> +       return opcode;
>>> +}
>>> +
>>> +static u8 spi_nor_3to4_opcode(u8 opcode)
>>> +{
>>> +       /* MUST be sorted by 3byte opcode */
>>> +#define ENTRY_3TO4(_opcode)    { _opcode, _opcode##_4B }
>>> +       static const struct spi_nor_address_entry spi_nor_3to4_table[] =
=3D {
>>> +               ENTRY_3TO4(SPINOR_OP_PP),               /* 0x02 */
>>> +               ENTRY_3TO4(SPINOR_OP_READ),             /* 0x03 */
>>> +               ENTRY_3TO4(SPINOR_OP_READ_FAST),        /* 0x0b */
>>> +               ENTRY_3TO4(SPINOR_OP_BE_4K),            /* 0x20 */
>>> +               ENTRY_3TO4(SPINOR_OP_PP_1_1_4),         /* 0x32 */
>>> +               ENTRY_3TO4(SPINOR_OP_PP_1_4_4),         /* 0x38 */
>>> +               ENTRY_3TO4(SPINOR_OP_READ_1_1_2),       /* 0x3b */
>>> +               ENTRY_3TO4(SPINOR_OP_BE_32K),           /* 0x52 */
>>> +               ENTRY_3TO4(SPINOR_OP_READ_1_1_4),       /* 0x6b */
>>> +               ENTRY_3TO4(SPINOR_OP_READ_1_2_2),       /* 0xbb */
>>> +               ENTRY_3TO4(SPINOR_OP_SE),               /* 0xd8 */
>>> +               ENTRY_3TO4(SPINOR_OP_READ_1_4_4),       /* 0xeb */
>>> +       };
>>> +#undef ENTRY_3TO4
>>> +
>>> +       return spi_nor_convert_opcode(opcode, spi_nor_3to4_table,
>>> +                                     ARRAY_SIZE(spi_nor_3to4_table));
>>> +}
>>> +
>>> +static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
>>> +                                     const struct flash_info *info)
>>> +{
>>> +       /* Do some manufacturer fixups first */
>>> +       switch (JEDEC_MFR(info)) {
>>> +       case SNOR_MFR_SPANSION:
>>> +               /* No small sector erase for 4-byte command set */
>>> +               nor->erase_opcode =3D SPINOR_OP_SE;
>>> +               nor->mtd.erasesize =3D info->sector_size;
>>> +               break;
>>> +
>>> +       default:
>>> +               break;
>>> +       }
>>> +
>>> +       nor->read_opcode        =3D spi_nor_3to4_opcode(nor->read_opcod=
e);
>>> +       nor->program_opcode     =3D spi_nor_3to4_opcode(nor->program_op=
code);
>>> +       nor->erase_opcode       =3D spi_nor_3to4_opcode(nor->erase_opco=
de);
>>> +}
>>> +
>>>  /* Enable/disable 4-byte addressing mode. */
>>>  static inline int set_4byte(struct spi_nor *nor, const struct flash_in=
fo *info,
>>>                             int enable)
>>> @@ -1476,27 +1555,10 @@ int spi_nor_scan(struct spi_nor *nor, const cha=
r *name, enum read_mode mode)
>>>         else if (mtd->size > 0x1000000) {
>>>                 /* enable 4-byte addressing if the device exceeds 16MiB=
 */
>>>                 nor->addr_width =3D 4;
>>> -               if (JEDEC_MFR(info) =3D=3D SNOR_MFR_SPANSION) {
>>> -                       /* Dedicated 4-byte command set */
>>> -                       switch (nor->flash_read) {
>>> -                       case SPI_NOR_QUAD:
>>> -                               nor->read_opcode =3D SPINOR_OP_READ4_1_=
1_4;
>>> -                               break;
>>> -                       case SPI_NOR_DUAL:
>>> -                               nor->read_opcode =3D SPINOR_OP_READ4_1_=
1_2;
>>> -                               break;
>>> -                       case SPI_NOR_FAST:
>>> -                               nor->read_opcode =3D SPINOR_OP_READ4_FA=
ST;
>>> -                               break;
>>> -                       case SPI_NOR_NORMAL:
>>> -                               nor->read_opcode =3D SPINOR_OP_READ4;
>>> -                               break;
>>> -                       }
>>> -                       nor->program_opcode =3D SPINOR_OP_PP_4B;
>>> -                       /* No small sector erase for 4-byte command set=
 */
>>> -                       nor->erase_opcode =3D SPINOR_OP_SE_4B;
>>> -                       mtd->erasesize =3D info->sector_size;
>>> -               } else
>>> +               if (JEDEC_MFR(info) =3D=3D SNOR_MFR_SPANSION ||
>>> +                   info->flags & SPI_NOR_4B_OPCODES)
>>> +                       spi_nor_set_4byte_opcodes(nor, info);
>>
>> I am giving my inputs based on the discussion on this thread[1].
>>
>> Seems like winbond[2], stmicron, spansion look better way or equally
>> same for accessing 4-byte addressing commands. and I find few of the
>> Macronix [3] have support of 4B addressing(see Table 5) but
>> lack/unable to find the 4B opcodes.
>>
>
> The Macronix mx25l25635e has no 4-byte address op codes. Instead you can
> use the EN4B (enter 4-byte mode) B7h op code to make the memory enter its
> 4-byte mode: hence you still write one of the 3-byte address op code but =
now
> this op code is followed by a 4-byte address.
> Currently the spi-nor framework uses this EN4B op code for all but Spansi=
on
> memories. However entering this 4-byte mode is statefull.
> For the Macronix 35e won't be able to use the 4-byte address instruction =
set
> and we will keep on entering the 4-byte mode.
>
> The idea behind the patch is to use the 4-byte address instruction set wh=
en
> we are absolutely sure this set is supported by a given memory but keep t=
he
> current behaviour for other memories.
>
>> And about BAR support, based on my experience in u-boot and research
>> on above chips only require when controller isn't supporting 4-byte
>> addressing even if connected flash chip has > 16MiB, that means there
>> is no exact or equivalent requirement for flash side either.
>>
>> So, adding the flags on flash table might be the good option instead
>> making code to convert 3B opcode to 4B because anyway the chips
>> require SPI_NOR_4B_OPCODES and also except winbond, stmicron, spansion
>> not too many flash needed > 16MiB support as of now.
>>
>
> Sorry but I don't understand what you mean or suggest here!

OK, What I am trying to say here is except the Macronix reaming chips
- Winbond, Stmicron, Spansion has a similar way of opcode handling. So
why can't we add the flags for supporting chips instead of 3B_to_4B
conversion I'm thinking this conversion of opcodes not much helpful
here as we dealing only few vendor chips and also not adequate for all
scenarios.

thanks!
--=20
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
