Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VF1bL-00022i-HY
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 12:45:28 +0000
Received: by mail-pd0-f171.google.com with SMTP id g10so406530pdj.30
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2013 05:45:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130829122500.GC10783@sirena.org.uk>
References: <1377738110-4219-1-git-send-email-wangyuhang2014@gmail.com>
 <20130829122500.GC10783@sirena.org.uk>
Date: Thu, 29 Aug 2013 20:45:04 +0800
Message-ID: <CAHSAbzOh=AM+EVeiEgY0=4zwrgOo-q3PfR2X1a1Fs5hW8Bc5bg@mail.gmail.com>
Subject: Re: [PATCH V2] spi: dual and quad support(add single macro)
From: yuhang wang <wangyuhang2014@gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi. Mark

2013/8/29 Mark Brown <broonie@kernel.org>:
> On Thu, Aug 29, 2013 at 09:01:50AM +0800, wangyuhang wrote:
>
>> fix two things in patch:
>> commit id:f477b7fb13df2b843997559ff34e87d054ba6538
>
>> 1.Add SPI_TX_SINGLE and SPI_RX_SINGLE to specify SINGLE mode.
>>  Instead of using default value in mode.
>> 2.Delete a "return" when commit the patch to a new kernel version
>>  by mistake. So recover it.
>
> These two changes aren't related to each other so should be sent as two
> separate patches.
>
Got it. Thanks.

>> @@ -89,8 +89,12 @@ struct spi_device {
>>  #define      SPI_READY       0x80                    /* slave pulls low to pause */
>>  #define      SPI_TX_DUAL     0x100                   /* transmit with 2 wires */
>>  #define      SPI_TX_QUAD     0x200                   /* transmit with 4 wires */
>> +/* transmit with 1 wire(not using dual-tx and quad-tx) */
>> +#define      SPI_TX_SINGLE   ~(SPI_TX_DUAL | SPI_TX_QUAD)
>>  #define      SPI_RX_DUAL     0x400                   /* receive with 2 wires */
>>  #define      SPI_RX_QUAD     0x800                   /* receive with 4 wires */
>> +/* receive with 1 wire(not using dual-rx and quad-rx) */
>> +#define      SPI_RX_SINGLE   ~(SPI_RX_DUAL | SPI_RX_QUAD)
>
> These don't look right, they're going to set all bits which is going to
> interfere with all the other flags.  Why do we need this define at all?

Well, it is not necessary. Pekon thought to set SINGLE just using the
default value in mode seems not reliable. But the flag is not
consistent with others really seems a little dangerous. So drop it.

Best regards.
