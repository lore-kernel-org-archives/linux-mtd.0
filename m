MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1962615c-d606-2e93-d256-47f15e1b1035@st.com>
References: <1500105641-14161-1-git-send-email-geert@linux-m68k.org>
 <1962615c-d606-2e93-d256-47f15e1b1035@st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 12:22:30 +0200
Message-ID: <CAMuHMdUv69s21werL07ScowwPyjJ_V_D=QHkrnmkJM2aq-Pj4Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: stm32-quadspi: Fix uninitialized error
 return code
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Ludovic,

On Mon, Jul 17, 2017 at 11:56 AM, Ludovic BARRE <ludovic.barre@st.com> wrot=
e:
> Today only write_reg could be call with len=3D0 (spi-nor.c:
> write_enable/disable, set_4byte, erase_chip)
>
> But your remark make sense to prevent: gcc warning and framework evolutio=
n
> ...
>
>
> -In stm32-quadspi.c transfer data is enabled if tx_data is true (some
> actions under this bool)
>
> stm32_qspi_write_reg has already this protection with "!!(buf && len > 0)=
;"
>
> but we could extend this protection
>
> -    cmd.tx_data =3D true;
> +    cmd.tx_data =3D !!(len > 0);
>
> In : stm32_qspi_read, stm32_qspi_write, stm32_qspi_read_reg

Ah, I missed the check for !cmd->tx_data at the top of stm32_qspi_tx()

> -And to avoid gcc warning: I prefer initialize "ret" in the beginning of
> function
>
> -    int ret;
> +    int ret =3D 0;
>
> I tested this changes, and it's ok for me.
>
> Geert could you resend a new version, or do you prefer that I take care o=
f
> it

If you initialized ret at the beginning, you lose the ability to catch newl=
y
introduced similar bugs in the future.

> On 07/15/2017 10:00 AM, Geert Uytterhoeven wrote:
>>
>> With gcc 4.1.2:
>>
>>      drivers/mtd/spi-nor/stm32-quadspi.c: In function
>> =E2=80=98stm32_qspi_tx_poll=E2=80=99:
>>      drivers/mtd/spi-nor/stm32-quadspi.c:230: warning: =E2=80=98ret=E2=
=80=99 may be used
>> uninitialized in this function
>>
>> Indeed, if stm32_qspi_cmd.len is zero, ret will be uninitialized.
>> This length is passed from outside the driver using the
>> spi_nor.{read,write}{,_reg}() callbacks.
>>
>> Several functions in drivers/mtd/spi-nor/spi-nor.c (e.g. write_enable(),
>> write_disable(), and erase_chip()) call spi_nor.write_reg() with a zero
>> length.
>>
>> Fix this by returning an explicit zero on success.
>>
>> Fixes: 0d43d7ab277a048c ("mtd: spi-nor: add driver for STM32 quad spi
>> flash controller")
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>   drivers/mtd/spi-nor/stm32-quadspi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c
>> b/drivers/mtd/spi-nor/stm32-quadspi.c
>> index 86c0931543c538c3..ad6a3e1844cbe5ec 100644
>> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
>> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
>> @@ -240,12 +240,12 @@ static int stm32_qspi_tx_poll(struct stm32_qspi
>> *qspi,
>>
>> STM32_QSPI_FIFO_TIMEOUT_US);
>>                 if (ret) {
>>                         dev_err(qspi->dev, "fifo timeout (stat:%#x)\n",
>> sr);
>> -                       break;
>> +                       return ret;
>>                 }
>>                 tx_fifo(buf++, qspi->io_base + QUADSPI_DR);
>>         }
>>   -     return ret;
>> +       return 0;
>>   }
>>     static int stm32_qspi_tx_mm(struct stm32_qspi *qspi,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
