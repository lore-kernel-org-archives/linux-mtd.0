Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRRa1-0003by-CN
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:55:25 +0000
Received: by mail-ve0-f175.google.com with SMTP id jy13so934585veb.6
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:55:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131002185123.GT23337@ld-irv-0074.broadcom.com>
References: <1378270016-9280-1-git-send-email-Priyanka.Jain@freescale.com>
 <20131002185123.GT23337@ld-irv-0074.broadcom.com>
Date: Wed, 2 Oct 2013 11:55:04 -0700
Message-ID: <CAN8TOE8k4LCU-6ensOO5OoNuXE+rVOdVaS5S-Q39DGK4CwmNcA@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Add support for Micron N25Q512A memory
From: Brian Norris <computersforpeace@gmail.com>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 + Marek for real!

On Wed, Oct 2, 2013 at 11:51 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> + Marek
>
> On Wed, Sep 04, 2013 at 10:16:56AM +0530, Priyanka Jain wrote:
>> Micron N25Q512A is a spi flash memory with following features:
>> -64MB size, 1.8V, Mulitple I/O, 4KB Sector erase memory.
>> -Memory is organised as 1024(64KB) main sectors.
>> -Each sector is divided into 256 pages.
>> -Register set/Opcodes are similar to other N25Q family products.
>>
>> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
>> ---
>>  drivers/mtd/devices/m25p80.c |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 26b14f9..94e3b53 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -774,6 +774,7 @@ static const struct spi_device_id m25p_ids[] = {
>>       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
>>       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
>>       { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
>> +     { "n25q512a", INFO(0x20bb20, 0, 64 * 1024, 512, SECT_4K) },
>
> This device actually has the same ID as Micron's next line (MT25QL512A).
> They have the same geometry, so maybe that's not a problem.
>
> (FWIW, I haven't gotten either flash working here, but I'm suspecting
> board problems.)
>
>>
>>       /* PMC */
>>       { "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
>
> I'll give Marek a chance to look at this, then I'll take this into
> l2-mtd.git if there are no objections.
>
> Brian
