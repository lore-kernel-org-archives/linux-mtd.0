Received: from smtpimr.rockwellcollins.com ([205.175.226.29]
 helo=ch3vs02.rockwellcollins.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgJaV-0005yw-5M
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 23:43:32 +0000
Received: by mail-yw0-f197.google.com with SMTP id a14so81087127ywe.5
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 16:43:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
 <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
 <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Fri, 11 Aug 2017 18:42:44 -0500
Message-ID: <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 11, 2017 at 4:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 11, 2017 at 11:03 PM, Sanjay Tandel
> <sanjay.tandel@rockwellcollins.com> wrote:
>> On Fri, Aug 11, 2017 at 2:41 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Fri, Aug 11, 2017 at 6:50 PM, Sanjay Tandel
>>> On almost all ARM platforms, it would use 32-bit accesses these days. On what
>>> kernel version, ARM platform and endianess do you see memcpy_toio() use 8-bit
>>> access?
>>>
>>
>> We use version 4.1.8 with Freescale LS1021A( cortex-a7 core, little-endian).
>> With the newer versions of kernel also, I can see same 8-bit
>> implementation for 32-bit ARM arch.
>
> I see. Commit 7ddfe625cbc1 ("ARM: optimize
> memset_io()/memcpy_fromio()/memcpy_toio()")
> was merged in linux-4.2 and changed this to use mostly 32-bit accesses and a
> bug in it fixed in commit 1bd46782d08b ("ARM: avoid unwanted GCC
> memset()/memcpy() optimisations for IO variants").
>
>
>> BTW, for other arch also memcpy_toio()  uses combination of  32-bit(or
>> 64-bit) and 8-bit accesses,
>> which may not work here.Because we need all accesses to be of same
>> size(bank-width).
>
> Could you try with a newer kernel or with the 7ddfe625cbc1/1bd46782d08b
> commits backported to see if that works for you though? At the very least that
> should impact the description of the patch we end up applying, since your
> current text no longer matches what the kernel does.
>

I tested back-porting commits 7ddfe625cbc1/1bd46782d08b,
but that didn't work for me.

Before, it used to corrupt every 2nd byte(2nd,4rth,6th ... upto N) in memory,
with memcpy_toio() using 8-bit accesses for our 16-bit chip.

Now, with backporting 7ddfe625cbc1/1bd46782d08b, it corrupts (N + 1)th byte
in memory, when I tried to write N number of bytes (where N is not aligned to
4-byte boundary).That means, it still tries 8-bit access for last odd byte and
ends up corrupting next byte.

>       Arnd

Thanks,
Sanjay
