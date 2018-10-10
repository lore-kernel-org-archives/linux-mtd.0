Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAF5E-0004yS-AV
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 14:03:38 +0000
Received: by mail-qt1-x841.google.com with SMTP id v19-v6so5743818qtg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2018 07:03:15 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20181010134317.8466-4-geert+renesas@glider.be>
References: <20181010134036.8296-1-geert+renesas@glider.be>
 <20181010134317.8466-1-geert+renesas@glider.be>
 <20181010134317.8466-4-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Oct 2018 16:03:13 +0200
Message-ID: <CAK8P3a1=rWcDaO9eu56us09=yy8CfakgFSGtLW1xfRyVhUT69g@mail.gmail.com>
Subject: Re: [PATCH 3/3] eeprom: at25: Split writes in two SPI transfers to
 optimize DMA
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/10/18, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Currently EEPROM writes are implemented using a single SPI transfer,
> which contains all of command, address, and payload data bytes.
> As some SPI controllers impose limitations on transfers with respect to
> the use of DMA, they may have to fall back to PIO. E.g. DMA may require
> the transfer length to be a multiple of 4 bytes.
>
> Optimize writes for DMA by splitting writes in two SPI transfers:
>   - The first transfer contains command and address bytes,
>   - The second transfer contains the actual payload data, now stored at
>     the start of the (kmalloc() aligned) buffer, to improve payload
>     alignment.
>
> E.g. for a 25LC040 EEPROM with a page size 16 bytes, a 16-byte write
> aligned to the page size was transferred using an 18-byte write.
> After this change, the write is split in a 2-byte and an aligned 16-byte
> write.
>
> Note that EEPROM reads already use a similar scheme, due to the
> different data directions for command and address bytes versus payload
> data.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Arnd Bergmann <arnd@arndb.de>
