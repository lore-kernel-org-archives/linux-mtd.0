Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rz4IG-0001tF-5a
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2012 10:47:00 +0000
Received: by lahg1 with SMTP id g1so6722204lah.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Feb 2012 02:46:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5473968.KjMqXsbqus@avalon>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
 <1328960705-18699-4-git-send-email-hechtb@gmail.com>
 <5473968.KjMqXsbqus@avalon>
Date: Sun, 19 Feb 2012 11:46:58 +0100
Message-ID: <CABYn4swSzkOgCe5Fe=jVP_j5ywA4xRZTzXFYS=BzaUMscri0cQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] mtd: sh_flctl: Expand the READID command to 8 bytes
From: Bastian Hecht <hechtb@googlemail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Laurent,

2012/2/18 Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> Hi Bastian,
>
> Thanks for the patch.
>
> On Saturday 11 February 2012 12:45:01 Bastian Hecht wrote:
>> The nand base code wants to read out 8 bytes in the READID command.
>> Reflect this in the driver code.
>>
>> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
>> ---
>> changelog: exactly same as patch v1.
>>
>> =A0drivers/mtd/nand/sh_flctl.c | =A0 13 ++++++++++---
>> =A01 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
>> index 8c97367..407acb5 100644
>> --- a/drivers/mtd/nand/sh_flctl.c
>> +++ b/drivers/mtd/nand/sh_flctl.c
>> @@ -320,6 +320,7 @@ static void set_cmd_regs(struct mtd_info *mtd, uint3=
2_t
>> cmd, uint32_t flcmcdr_va break;
>> =A0 =A0 =A0 case NAND_CMD_READID:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 flcmncr_val &=3D ~SNAND_E;
>> + =A0 =A0 =A0 =A0 =A0 =A0 flcmdcr_val |=3D CDSRC_E;
>
> this bit is marked as reserved in my SH7372 documentation, and should be =
set
> to 0. Won't this break compatibility with the SH7372 ?

It's flcm*D*cr not flcmncr. Took me some time to separate these
beautiful abbreviations too ;)
It's to tell the flctl to save the read in the fifo instead of a register.

>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr_len_bytes =3D ADRCNT_1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 case NAND_CMD_STATUS:
>> @@ -559,12 +560,18 @@ static void flctl_cmdfunc(struct mtd_info *mtd,
>> unsigned int command,
>>
>> =A0 =A0 =A0 case NAND_CMD_READID:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_cmd_regs(mtd, command, command);
>> - =A0 =A0 =A0 =A0 =A0 =A0 set_addr(mtd, 0, 0);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 flctl->read_bytes =3D 4;
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* READID is always performed using an 8-bit b=
us */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (flctl->chip.options & NAND_BUSWIDTH_16)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 column <<=3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_addr(mtd, column, 0);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 flctl->read_bytes =3D 8;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(flctl->read_bytes, FLDTCNTR(flctl)); =
/* set read size */
>> + =A0 =A0 =A0 =A0 =A0 =A0 empty_fifo(flctl);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 start_translation(flctl);
>> - =A0 =A0 =A0 =A0 =A0 =A0 read_datareg(flctl, 0); /* read and end */
>> + =A0 =A0 =A0 =A0 =A0 =A0 read_fiforeg(flctl, flctl->read_bytes, 0);
>
> Not saying it's a bad thing, but why do you switch from read_datareg() to
> read_fiforeg() ?

We can only read 4 bytes from a register read, while we need 8 bytes
for the ID. The extra 4 bytes are used to determine the correct NAND
chip size in nand_base.c.

>> + =A0 =A0 =A0 =A0 =A0 =A0 wait_completion(flctl);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>
>> =A0 =A0 =A0 case NAND_CMD_ERASE1:
> --
> Regards,
>
> Laurent Pinchart

thanks,

 Bastian
