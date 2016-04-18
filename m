Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as7Vx-0005gK-2y
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 11:38:49 +0000
Received: by mail-io0-x22f.google.com with SMTP id g185so191653244ioa.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2016 04:38:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160418112457.GU3217@sirena.org.uk>
References: <1460977843-9426-1-git-send-email-zajec5@gmail.com>
 <20160418112457.GU3217@sirena.org.uk>
Date: Mon, 18 Apr 2016 13:38:28 +0200
Message-ID: <CACna6rzQfX7SxDoL-CTQp3_Ms5_K54pEa8uaUAiTPjR-un=VOg@mail.gmail.com>
Subject: Re: [PATCH for-next] spi: bcm53xx: add spi_flash_read callback for
 MMIO-based reads
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>
Cc: "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
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

On 18 April 2016 at 13:24, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Apr 18, 2016 at 01:10:43PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>
>> +static int bcm53xxspi_flash_read(struct spi_device *spi,
>> +                              struct spi_flash_read_message *msg)
>> +{
>> +     struct bcm53xxspi *b53spi =3D spi_master_get_devdata(spi->master);
>> +     int ret =3D 0;
>> +
>> +     bcm53xxspi_enable_bspi(b53spi);
>> +     memcpy_fromio(msg->buf, b53spi->mmio_base + msg->from, msg->len);
>> +     msg->retlen =3D msg->len;
>
> There's no bounds check here but...

That's true, I was looking at ti_qspi_spi_flash_read and somehow
incorrectly (!) assumed there is a check above. Of course there isn't
one and there can't be, I'll simply fix this code. I guess we should
fix ti_qspi_spi_flash_read in ti-qspi driver as well.

I also realized there wasn't any fallback introduced in:
mtd: devices: m25p80: add support for mmap read request
http://git.infradead.org/l2-mtd.git/commitdiff/08922f644878c9163ada8df3ef9d=
ef89be1d5e90

What shall we do if spi_flash_read fails? Should we always fallback to
the standard SPI flash read? Or should we standarize error codes
returned by spi_flash_read and fallback on some particular error code
only?


>> +     if (core->addr_s[0])
>> +             b53spi->mmio_base =3D devm_ioremap(dev, core->addr_s[0], S=
Z_32M);
>
> ...we only mapped 32M here.  What if something tries to do a larger
> read?  It's also a bit surprising that we're mapping a specific size
> here rather than the entire resource.

This is based on what I found in Broadcom's SDK (they don't release
any real specifications):
#define SI_NS_FLASH_WINDOW 0x02000000 /* Flash XIP Window */

--=20
Rafa=C5=82
