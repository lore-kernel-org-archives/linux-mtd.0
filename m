Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvLvj-00074S-C3
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 08:34:16 +0000
Received: by wicmx19 with SMTP id mx19so6224650wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 01:33:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520234525.GY11598@ld-irv-0074>
References: <cover.1430430153.git.hramrach@gmail.com>
 <02f7510acb9b6dbb3a5a6cd5bb287762eb4d22c1.1430430153.git.hramrach@gmail.com>
 <20150520234525.GY11598@ld-irv-0074>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 21 May 2015 10:33:09 +0200
Message-ID: <CAOMqctQ3Asj+-onsAs7R-LBBth6Pf-D55yBPKwk5Z2bVVeQHVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, "grmoore@altera.com" <grmoore@altera.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 21 May 2015 at 01:45, Brian Norris <computersforpeace@gmail.com> wrote:
> On Thu, Apr 30, 2015 at 03:33:47PM +0200, Michal Suchanek wrote:
>> The 'retlen' points to a variable representing the number of data bytes
>> written/read (see include/linux/mtd/mtd.h) by the current invocation of
>> the function. This variable must be set, not incremented.
>>
>> v2: clearer commit message
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> Acked-by: Marek Vasut <marex@denx.de>
>> ---
>>  drivers/mtd/devices/m25p80.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 7c8b169..0b2bc21 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -102,7 +102,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>>
>>       spi_sync(spi, &m);
>>
>> -     *retlen += m.actual_length - cmd_sz;
>> +     *retlen = m.actual_length - cmd_sz;
>
> This is very wrong. It gets a little better once you add your next
> patches (which are also not good) since those patches reinterpret the
> usage of retlen, but this one definitely does *not* stand a lone.
>
> I'll admit the API is a little odd here, but the callers of this
> function (see spi_nor_write()) actually depend on calling this multiple
> times, with the value incrementing each time so we get a summary total.
> You're now clobbering this value.
>
> I'm willing to accept patches to improve this API, if you think that
> would help. Or to add comments that document this.

Yes, the only user of the retlen value ignores it but passes it on so
without the following patch this one makes the passed on value
different from before.

For m25p80 this would be fixed by truncating the write in the driver
and setting actual_length appropriately rather than returning an error
when the message is too long. It might possibly break other drivers,
though.

Thanks

Michal
