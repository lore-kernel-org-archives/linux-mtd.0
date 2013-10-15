Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW984-0000X7-Vk
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 18:14:01 +0000
Received: by mail-ie0-f170.google.com with SMTP id at1so1400938iec.29
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 11:13:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131015180142.GS23337@ld-irv-0074.broadcom.com>
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com>
 <20131015180142.GS23337@ld-irv-0074.broadcom.com>
Date: Tue, 15 Oct 2013 11:13:38 -0700
Message-ID: <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
From: Trent Piepho <tpiepho@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Peter Korsgaard <peter@korsgaard.com>, balbi@ti.com,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Sourav Poddar <sourav.poddar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 11:01 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
>> So, the flow can be something like this:
>>
>> drivers/mtd/devices/m25p80.c
>> get_flash_buf()
>> {
>>     lock();
>>
>>      t[0] = GET_BUFFER;
>>      t[1] = buf;
>>      ......
>>
>>      spi_sync();
>>
>>     unlock();
>> }
>>
>> mtd_read
>> {
>>     get_flash_buf();
>>
>>     if (flash->buf) {
>>         memcpy();
>>        return 0;
>>   }
>> }
>>
>> Not sure, if free buf is needed as devm_* variant is used to allocate that
>> memory.
>
> I believe you are misplacing the discussion of devm_* variants. devm_*
> is only useful for resources allocated/mapped released/unmapped at probe
> and release time. They do not magically remove the burden of resource
> management for I/O and other dynamic operations.

Are there any numbers to show if memory mapped read support is a
benefit in Linux?  There is some question as to whether it's useful at
all or not.

If it is, I think low latency for small reads is probably one of the
only advantages.  To do that, you aren't going to want to deal with
device PM for every single read.  It would make more sense to turn the
hardware on when the MTD device is opened and leave it on until
closed.
