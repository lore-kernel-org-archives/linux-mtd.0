Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcdV9-000348-EN
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 20:10:49 +0000
Received: by mail-oi0-x242.google.com with SMTP id b130so3557224oii.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 13:10:24 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <fa857ef2-0ae6-5383-c178-3a86fa557332@wedev4u.fr>
References: <20170721222204.3402340-1-arnd@arndb.de>
 <fa857ef2-0ae6-5383-c178-3a86fa557332@wedev4u.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Aug 2017 22:10:23 +0200
Message-ID: <CAK8P3a27xzszjbfP4KdAMFOa2iqfH7vvUOBcT39Ychn0kw39KA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd: atmel-quadspi: fix build issues
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ludovic Barre <ludovic.barre@st.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Aug 1, 2017 at 9:41 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> Le 22/07/2017 =C3=A0 00:21, Arnd Bergmann a =C3=A9crit :

>> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
>> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
>> @@ -208,9 +208,9 @@ static int atmel_qspi_run_transfer(struct atmel_qspi=
 *aq,
>>       if (cmd->enable.bits.address)
>>               ahb_mem +=3D cmd->address;
>>       if (cmd->tx_buf)
>> -             _memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
>> +             memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
>>       else
>> -             _memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
>> +             memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
>>
>
> At least on AT91 platforms and likely on most ARM boards,
> memcpy_fromio =3D=3D memcpy_toio =3D=3D memcpy.

Just to give more background, it's a bit more complicated than this:

On big-endian kernels, memcpy_fromio/memcpy_toio are
always defined as _memcpy_fromio/_memcpy_toio so we
do byte load/store operations in the correct order, while
little-endian kernels have the optimized mmiocpy() that redirects
to memcpy(). This is true for all ARM platforms other than EBSA110
IIRC.

Also, mmiocpy is an exported symbol that aliases to the external
memcpy definition, but we can't call memcpy directly, because gcc
knows how to inline calls to memcpy() and replace them by direct
load/store instructions that might be unaligned and trap on uncached
mmio areas.

> I got some sama5d2 hardware last week, so I'll try to test your patch
> within few days because as you said maybe memcpy() was broken when I
> developed this driver at first but now memcpy() is likely to have been
> fixed so it might be interesting to get rid of _memcpy_fromio() and
> _memcpy_toio() because this is not the first time those 2 functions have
> created issues when building the Atmel Quad SPI driver on other platforms=
.
>
> So thanks for you're patch, I'll give it a try :)

Ok, thanks.

       Arnd
