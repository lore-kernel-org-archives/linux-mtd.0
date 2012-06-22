MIME-Version: 1.0
In-Reply-To: <4FE29CB8.3000404@atmel.com>
References: <1339567570-4816-1-git-send-email-josh.wu@atmel.com>
 <4FE13CB2.3000605@atmel.com>
 <CAN8TOE8iDtzw4eTKa6tJ5oBxbaDUxg9nDLaKBhW4D86vGWxGJg@mail.gmail.com>
 <4FE29CB8.3000404@atmel.com>
Date: Fri, 22 Jun 2012 12:32:53 -0700
Message-ID: <CAN8TOE9ebFAfJHaG2-po0LeLi=wTq9YZ9pNFXhQE0PLt5TQxeg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] MTD: nand: add return value for
 write_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: bryan.wu@analog.com, jack.lan@freescale.com, nick.spence@freescale.com,
 dedekind1@gmail.com, tie-fei.zang@freescale.com, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, Dipen.Dudhat@freescale.com, tglx@linutronix.de,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

On Wed, Jun 20, 2012 at 9:02 PM, Josh Wu <josh.wu@atmel.com> wrote:
> On 6/21/2012 2:43 AM, Brian Norris wrote:
>> On Tue, Jun 19, 2012 at 8:00 PM, Josh Wu<josh.wu@atmel.com> =A0wrote:
>>> On 6/13/2012 2:06 PM, Josh Wu wrote:
>>>>
>>>> There is an implemention of hardware ECC write page function which may
>>>> return an error indication. But now the definition of 'write_page'
>>>> function
>>>> in struct nand_ecc_ctrl is 'void'.
>>
>> I think it would help reviewers (and changelog readers) to note which
>> implementations are the real issue, if there are a small number of
>> implementations targeted.
>
> Currently, I am introducing the atmel pragrammable multibit ECC(PMECC)
> hardware code to nand flash. I meet following situation that I need chang=
e
> the write_page()'s return value to 'int':
>
> when writing one page into a nand flash with PMECC enabled, the hardware
> engine will compute the BCH ecc code for this page. so we need read a the
> status register to theck whether the ecc code is generated.
> But we cannot assume the status register always can be ready, (for instan=
ce,
> incorrect hardware configuration or hardware issue), in such case I need
> write_page() to return a error code.
>
> So this is the reason that I push this patch to change the return value t=
o
> int.

OK, thanks for the clarification here. I think that this is valuable
information that should be included in the change log when you send
v3. Also, this is the kind of fix that should probably be sent in a
series with the patch for your Atmel PMECC driver. That way, they can
be reviewed/accepted together. As you mention, it is pointless to
merge this patch without your driver patch.

>>>> --- a/drivers/mtd/nand/nand_base.c
>>>> +++ b/drivers/mtd/nand/nand_base.c
>>
>> ...
>>>>
>>>> @@ -2096,9 +2104,14 @@ static int nand_write_page(struct mtd_info *mtd=
,
>>>> struct nand_chip *chip,
>>>> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>>>>
>>>> =A0 =A0 =A0 =A0if (unlikely(raw))
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf,=
 oob_required);
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D chip->ecc.write_page_raw(mtd,=
 chip, buf, oob_required);
>>>> =A0 =A0 =A0 =A0else
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page(mtd, chip, buf, oob=
_required);
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D chip->ecc.write_page(mtd, chi=
p, buf, oob_required);
>>>> +
>>>> + =A0 =A0 =A0 if (status< =A0 =A00) {
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("Error happened when calling nan=
d_write_page()\n");
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
>>>> + =A0 =A0 =A0 }
>>
>> I'm not sure this is the most informative error message. (Similar
>> comment applies in cafe_nand.c, which imitates a lot of nand_base.c
>> code)
>
> Maybe in this case I need print the error code as well.

After a little closer look, I don't think you need to print anything
(here, or in cafe_nand.c). This is a kind of intermediate-layer
function that doesn't print anything on other errors (e.g., when it
checks the status, it just fails with 'return -EIO;'). The error will
be caught by upper layers and an appropriate error code may or may not
be displayed. So just make sure that your new driver asserts an
appropriate error code, and no print should be necessary.

Regards,
Brian
