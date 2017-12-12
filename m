Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOnQy-0002fd-DA
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 16:29:34 +0000
Received: by mail-pg0-x242.google.com with SMTP id e14so13749398pgr.9
 for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2017 08:29:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171212142033.5b19efec@bbrezillon>
References: <20171212083826.5000-1-greg@morpheus.ws>
 <20171212142033.5b19efec@bbrezillon>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Dec 2017 13:29:11 -0300
Message-ID: <CAAEAJfDweETzJ-nrwV2gqsF6tr5GjPDYGeK0jxBG4zs=8k3U8Q@mail.gmail.com>
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Greg Cook <greg@morpheus.ws>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
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

On 12 December 2017 at 10:20, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Greg,
>
> Could you at least Cc the NAND maintainer when you submit something
> related to NAND!
>
> On Tue, 12 Dec 2017 16:38:26 +0800
> Greg Cook <greg@morpheus.ws> wrote:
>
> Please add a commit message explaining what your fixing.
>
>> Signed-off-by: Greg Cook <greg@morpheus.ws>
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 021374f..cfa8c71 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *inf=
o, uint32_t int_mask)
>>
>>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int l=
en)
>>  {
>> -     if (info->ecc_bch) {
>> +     if (info->use_ecc && info->ecc_bch) {
>>               u32 val;
>>               int ret;
>>
>> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand=
_info *info, int command,
>>
>>               if (info->cur_chunk < info->nfullchunks) {
>>                       info->step_chunk_size =3D info->chunk_size;
>> -                     info->step_spare_size =3D info->spare_size;
>> +                     if (info->use_ecc) {
>> +                             info->step_spare_size =3D info->spare_size=
;
>> +                     } else {
>> +                             info->step_spare_size =3D info->spare_size
>> +                                                     + info->ecc_size;
>> +                     }
>
> Curly braces are unneeded, and I'd prefer to have the + operator at the
> end of the line. Or it could be written like that:
>
>                         info->step_spare_size =3D info->spare_size;
>                         if (!info->use_ecc)
>                                 info->step_spare_size +=3D info->ecc_size=
;
>
> Anyway, I'm still not convince this is the appropriate fix. As
> mentioned in my previous, I wonder why we're not activating ECC when
> reading OOB bytes. There's a good reason for having 2 different hooks
> to read/write OOBs: one is doing it in raw mode (with the ECC engine
> disabled), the other one is doing it with the ECC engine enabled.
> This driver not only omit raw accessors (which is already a bad news
> for everyone that needs to debug the driver) but it also do things
> differently for OOB and page access: OOB bytes are read in raw mode
> while pages are always accessed with the ECC engine enabled.
>
> OOB accesses are broken and should be fixed, I think we all agree on
> that, but we should fix it correctly, don't you think?
> And by correctly, I mean we should try to make things consistent at
> least (read OOB bytes with the ECC engine enabled).
>
>>               } else {
>>                       info->step_chunk_size =3D info->last_chunk_size;
>>                       info->step_spare_size =3D info->last_spare_size;
>
> Can you try with the below patch and see if it fixes the timeout issue?
>

Well, the patch may very well fix the timeout, but it's not really
reading any OOB.

Like I said in my previous mail, accessing the OOB doesn't
work when ECC is enabled. This is specified in the specs,
copying from the Armada 370 spec:

"""
14.4.1
Error Checking and Correction (ECC)
[..] When ECC is enabled, the number of spare area bytes required for use b=
y
ECC are shown in the middle column of Table 30. These bytes are not
available for use by the
system software and cannot be written to or read from.
"""

I seriously doubt you are reading valid data with this change.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
