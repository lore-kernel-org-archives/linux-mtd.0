Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3dSM-0002AR-LI
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 02:45:07 +0000
Received: by mail-oa0-f51.google.com with SMTP id i4so11520026oah.24
 for <linux-mtd@lists.infradead.org>; Sun, 28 Jul 2013 19:44:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+7tXihU+JODQec-h2joUYiVY=otuSOu8BwADn+mtgELCFHPng@mail.gmail.com>
References: <1374917973-7083-1-git-send-email-wangyuhang2014@gmail.com>
 <CA+7tXihU+JODQec-h2joUYiVY=otuSOu8BwADn+mtgELCFHPng@mail.gmail.com>
Date: Mon, 29 Jul 2013 10:44:43 +0800
Message-ID: <CAHSAbzNTUpsftZ1-fpv7UefuSdUvUidg9-SLOUXCTmSBhM0ZJQ@mail.gmail.com>
Subject: Re: [PATCH V2] SPI: DUAL and QUAD support
From: yuhang wang <wangyuhang2014@gmail.com>
To: Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Sourav Poddar <sourav.poddar@ti.com>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi


2013/7/29 Trent Piepho <tpiepho@gmail.com>:
> On Sat, Jul 27, 2013 at 2:39 AM, wangyuhang <wangyuhang2014@gmail.com> wrote:
>> 2:To spidev, in order to backward compatible, still use
>>  SPI_IOC_RD_MODE to deal with user who use <u8 mode>. Add
>>  SPI_IOC_EXTRD_MODE to fix the <u16 mode>. And SPI_IOC_RD_LSB_FIRST
>>  seems a little redundant, so del it.
>
> Your changes to spidev are not backward compatible at all.  You can
> not change the data types in the ioctl and maintain backward
> compatibility.  You can also not delete ioctls!
>
well, please give me some details or specific situations. Why ioctl
can not be changed. The operation that SPI_IOC_RD_LSB_FIRST do can be
done in SPI_IOC_RD_MODE, so I dont think there is any necessary using
SPI_IOC_RD_LSB_FIRST. What you worry about is the user already used
SPI_IOC_RD_LSB_FIRST?

>> @@ -1316,6 +1324,12 @@ int spi_setup(struct spi_device *spi)
>>         /* help drivers fail *cleanly* when they need options
>>          * that aren't supported with their current master
>>          */
>> +       if (((spi->mode >> 8) & 0x03) == 0x03 ||
>> +               ((spi->mode >> 10) & 0x03) == 0x03) {
>> +               dev_err(&spi->dev,
>> +               "setup: can not select dual and quad at the same time\n");
>> +               return -EINVAL;
>> +       }
>
> This code won't work if the constants you added for mode flags change
> value.  More importantly, anyone searching the code for SPI_TX_DUAL,
> etc. won't find this code.
agree, thanks.
