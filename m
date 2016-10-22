Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxpsJ-0005JX-OW
 for linux-mtd@lists.infradead.org; Sat, 22 Oct 2016 06:33:48 +0000
Received: by mail-it0-x243.google.com with SMTP id e203so2127149itc.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 23:33:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161021232954.4900709e@bbrezillon>
References: <aad52b708dcf6754edab87d2e0afe4f0ee6831f9.1476891131.git.cyrille.pitchen@atmel.com>
 <20161021232954.4900709e@bbrezillon>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 22 Oct 2016 08:33:24 +0200
Message-ID: <CAFLxGvypdHy+O8-i8Dshzj1+WAemxkpmu8EtrJKnXmf0HWjQwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 Marek Vasut <marex@denx.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 11:29 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 19 Oct 2016 17:34:49 +0200
> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>
>> I would like to volunteer as a maintainer for the SPI NOR part of the MTD
>> subsystem.
>>
>> Over the last months, a significant number of SPI NOR related patches have
>> been submitted, some of them have been reviewed, but very few have finally
>> been merged. Hence, the number of pending SPI NOR related patches continues
>> to increase over the time.
>>
>> Through my work on SPI NOR memories from many manufacturers over the last
>> two years, I've gained a solid understanding of this technology.
>> I've already helped by reviewing patches from other contributors on the
>> mailing list, and would like to help getting those patches integrated by
>> volunteering as a maintainer for this specific area.
>>
>> Boris Brezillon has already stepped up as a maintainer for the NAND
>> sub-subsystem in MTD, and the SPI NOR sub-subsystem could be handled in
>> the same way: I would be reviewing patches touching this area, collecting
>> them and sending pull requests to Brian Norris.
>>
>> Also both Marek Vasut and Richard Weinberger have volunteered as well as
>> maintainers for the SPI NOR subsystem.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
>> ChangeLog:
>>
>> v1 -> v2:
>> - add Marek and Richard as maintainers.
>> - add Acked-by from Boris Brezillon.
>>
>>
>>  MAINTAINERS | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 757f9c4b388d..7e63b2015072 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11390,6 +11390,18 @@ W:   http://www.st.com/spear
>>  S:   Maintained
>>  F:   drivers/clk/spear/
>>
>> +SPI NOR SUBSYSTEM
>> +M:   Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> +M:   Marek Vasut <marek.vasut@gmail.com>
>> +M:   Richard Weinberger <richard@nod.at>
>
> My bad, I think I misunderstood Richard's answer: Richard does not want
> to be a spi-nor maintainer, he was just acking Marek's proposal to be a
> co-maintainer.

Correct. :-)

-- 
Thanks,
//richard
