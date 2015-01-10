Received: from mail-yh0-x229.google.com ([2607:f8b0:4002:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9vb4-0005J1-8T
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 12:56:55 +0000
Received: by mail-yh0-f41.google.com with SMTP id a41so6335820yho.0
 for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2015 04:56:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150109232900.GB9759@ld-irv-0074>
References: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
 <20150109232900.GB9759@ld-irv-0074>
Date: Sat, 10 Jan 2015 14:56:32 +0200
Message-ID: <CAHp75VdBuqdFYTuQuSPY7QUpL0p7Ku1n7=t7aT+QP=d17ndwHw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nftl: reorganize operations in condition check
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Giel van Schijndel <me@mortis.eu>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 10, 2015 at 1:29 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jan 07, 2015 at 10:37:20PM +0200, Andy Shevchenko wrote:
>> We need to compare ret variable for negative value. The current code
>> assigns the boolean to the ret and prints it wrongly in the warning
>> message.
>>
>> Reported-by: Andrey Karpov <karpov@viva64.com>
>> Cc: Giel van Schijndel <me@mortis.eu>
>> Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
>> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> To be clear, this touches some commented out code (yuck). I think you
> noted this previously.

It had been proposed by Giel.

>
> For my reference, are you actually testing this driver?
>

Not a real testing. Only compilation on x86_32.

> Anyway, pushed to l2-mtd.git. Thanks.

Thanks!

>
> Brian



-- 
With Best Regards,
Andy Shevchenko
