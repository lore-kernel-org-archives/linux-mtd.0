Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6w9c-0000rL-RP
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 10:09:50 +0000
Received: by mail-oi0-x244.google.com with SMTP id c77so35833597oig.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 03:09:28 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20171024092127.GB29656@lahna.fi.intel.com>
References: <1508828379-3479-1-git-send-email-bmeng.cn@gmail.com>
 <20171024092127.GB29656@lahna.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 24 Oct 2017 12:09:27 +0200
Message-ID: <CAK8P3a2hJk_sLTtGik3qC+ZSADWqega3DK9HdSgYveuNfSk+zA@mail.gmail.com>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 24, 2017 at 11:21 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Oct 23, 2017 at 11:59:39PM -0700, Bin Meng wrote:
>> index f26aaa6..abf453a 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -107,8 +107,9 @@ config SPI_INTEL_SPI_PCI
>>
>>  config SPI_INTEL_SPI_PLATFORM
>>       tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
>> -     depends on X86
>> +     depends on X86 && PCI
>
> It is kind of weird to depend on PCI if we want to enable *platform*
> driver but whatever. I would still prefer to have dependency for LPC_ICH
> instead.
>
> No strong feelings though - as long as it builds and works fine :-)

Agreed, I think we are better off using a dependency here, but
then we should probably do that for all users of LPC_ICH and
change them over as well. I think there are two or three other drivers
that currently select LPC_ICH. Using 'select' like this is generally
a bad idea, but being inconsistent (using both depends and select)
is usually worse.

        Arnd
