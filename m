Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7c9a-0000Dk-FK
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 02:10:11 +0000
Received: by mail-ie0-f177.google.com with SMTP id a11so3256083iee.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2013 19:09:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F1993@DBDE04.ent.ti.com>
References: <20130729064234.GS9858@sirena.org.uk>
 <1375095194-7093-1-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9EE267@DBDE04.ent.ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F1993@DBDE04.ent.ti.com>
Date: Fri, 9 Aug 2013 10:09:47 +0800
Message-ID: <CAHSAbzMoqA2uk7VygVwx6wC4j=LWfAn8C+kD4bG4o7XSG3rNww@mail.gmail.com>
Subject: Re: [PATCH] SPI: DUAL and QUAD support
From: yuhang wang <wangyuhang2014@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "tpiepho@gmail.com" <tpiepho@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Pekon

2013/8/7 Gupta, Pekon <pekon@ti.com>:
>>
>> Hello,
>> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
>> > index 38c2b92..222e49e 100644
>> > --- a/include/linux/spi/spi.h
>> > +++ b/include/linux/spi/spi.h
>> > @@ -437,6 +441,8 @@ extern struct spi_master
>> > *spi_busnum_to_master(u16 busnum);
>> >   * @rx_buf: data to be read (dma-safe memory), or NULL
>> >   * @tx_dma: DMA address of tx_buf, if @spi_message.is_dma_mapped
>> >   * @rx_dma: DMA address of rx_buf, if @spi_message.is_dma_mapped
>> > + * @tx_nbits: number of bits used for writting
>> > + * @rx_nbits: number of bits used for reading
>> >   * @len: size of rx and tx buffers (in bytes)
>> >   * @speed_hz: Select a speed other than the device default for this
>> >   *      transfer. If 0 the default (from @spi_device) is used.
>> > @@ -491,6 +497,11 @@ extern struct spi_master
>> > *spi_busnum_to_master(u16 busnum);
>> >   * by the results of previous messages and where the whole transaction
>> >   * ends when the chipselect goes intactive.
>> >   *
>> > + * When SPI can transfer in 1x,2x or 4x. It can get this tranfer information
>> > + * from device through @tx_nbits and @rx_nbits. In Bi-direction, these
>> > + * two should both be set. User can set transfer mode with
>> > SPI_NBITS_SINGLE(1x)
>> > + * SPI_NBITS_DUAL(2x) and SPI_NBITS_QUAD(4x) to support these three
>> > transfer.
>> > + *
>> >   * The code that submits an spi_message (and its spi_transfers)
>> >   * to the lower layers is responsible for managing its memory.
>> >   * Zero-initialize every field you don't set up explicitly, to
>> > @@ -511,6 +522,11 @@ struct spi_transfer {
>> >     dma_addr_t      rx_dma;
>> >
>> >     unsigned        cs_change:1;
>> > +   u8              tx_nbits;
>> > +   u8              rx_nbits;
>> > +#define    SPI_NBITS_SINGLE        0x0; /* 1bit transfer */
>> > +#define    SPI_NBITS_DUAL          0x01; /* 2bits transfer */
>> > +#define    SPI_NBITS_QUAD          0x02; /* 4bits transfer */
>>
>> [Pekon]: I don't think it's a good place for #defines.  Plz keep it out of struct
>> body.
> One more feedback, Its better you define SPI_NBITS_xx matching
> the actual number of wires used. This would leave places for some
> micro-wire and 3-wire SPI, and would be more readable.
> +#define        SPI_NBITS_SINGLE_HALF_DUPLEX    0x0; /* 1bit transfer  microwire*/
> +#define        SPI_NBITS_SINGLE_FULL_DUPLEX    0x01; /* 1bit transfer  normal SPI*/
> +#define        SPI_NBITS_DUAL  2; /* 2bits transfer */
> +#define        SPI_NBITS_QUAD  4; /* 4bits transfer */
>
Totally three points.
1. There are still other positions which have macro defined in struct
in spi.h. That means the macro is belonged to the member above. So to
make it consistent, define it in @spi_transfer seems OK.
2. I don't think that  SPI_NBITS_SINGLE_HALF_DUPLEX is necessary.
tx_nbits and rx_nbits in @spi_transfer should be passed to spi master
driver and the master driver will set the certain mode depend on the
info in @spi_transfer. So there is no need to let the master driver
know SPI_NBITS_SINGLE_HALF_DUPLEX, also master can get the 3-wire SPI
info from spi_device->mode.
3. I agree to match the actual number of wires used. To make it 0x01,
0x02 and 0x04. Thanks.

Best regards.
