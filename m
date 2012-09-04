Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8oJa-0008Hu-JN
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:16:55 +0000
Received: by pbbrq8 with SMTP id rq8so9522600pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 01:16:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346685918.3061.66.camel@sauron.fi.intel.com>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 <1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 <1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
 <1346685918.3061.66.camel@sauron.fi.intel.com>
Date: Tue, 4 Sep 2012 17:16:52 +0900
Message-ID: <CAC5umyhakuTz=d5Gr6DiUZQSvuefo6S86KR55qQbQ_x+LUiDbA@mail.gmail.com>
Subject: Re: [PATCH] Test for multi-bit error correction
From: Akinobu Mita <akinobu.mita@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/4 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2012-08-31 at 08:59 +1000, Iwo Mergler wrote:
>> This tests ECC biterror recovery on a single NAND page. Mostly intended
>> to test ECC hardware and low-level NAND driver.
>>
>> There are two test modes:
>>
>>     0 - artificially inserting bit errors until the ECC fails
>>         This is the default method and fairly quick. It should
>>         be independent of the quality of the FLASH.
>>
>>     1 - re-writing the same pattern repeatedly until the ECC fails.
>>         This method relies on the physics of NAND FLASH to eventually
>>         generate '0' bits if '1' has been written sufficient times. Depending
>>         on the NAND, the first bit errors will appear after 1000 or
>>         more writes and then will usually snowball, reaching the limits
>>         of the ECC quickly.
>>
>> The test stops after 10000 cycles, should your FLASH be exceptionally
>> good and not generate bit errors before that. Try a different page
>> offset in that case.
>>
>> Please note that neither of these tests will significantly 'use up' any FLASH
>> endurance. Only a maximum of two erase operations will be performed.
>>
>> Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
>> ---
>>  drivers/mtd/tests/Makefile          |    1 +
>>  drivers/mtd/tests/mtd_nandbiterrs.c |  460 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 461 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/mtd/tests/mtd_nandbiterrs.c
>>
>> diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
>> index b44dcab..bd0065c 100644
>> --- a/drivers/mtd/tests/Makefile
>> +++ b/drivers/mtd/tests/Makefile
>> @@ -6,3 +6,4 @@ obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
>>  obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
>>  obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
>>  obj-$(CONFIG_MTD_TESTS) += mtd_nandecctest.o
>> +obj-$(CONFIG_MTD_TESTS) += mtd_nandbiterrs.o
>> diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_nandbiterrs.c
>> new file mode 100644
>> index 0000000..94e908e
>> --- /dev/null
>> +++ b/drivers/mtd/tests/mtd_nandbiterrs.c
>> @@ -0,0 +1,460 @@
>> +/*
>> + * (C)2012 NetCommWireless
>> + * Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>
>> + *
>> + * Test for multi-bit error recovery on a NAND page This mostly tests the
>> + * ECC controller / driver.
>> + *
>> + * There are two test modes:
>> + *
>> + *   0 - artificially inserting bit errors until the ECC fails
>> + *       This is the default method and fairly quick. It should
>> + *       be independent of the quality of the FLASH.
>> + *
>> + *   1 - re-writing the same pattern repeatedly until the ECC fails.
>> + *       This method relies on the physics of NAND FLASH to eventually
>> + *       generate '0' bits if '1' has been written sufficient times.
>> + *       Depending on the NAND, the first bit errors will appear after
>> + *       1000 or more writes and then will usually snowball, reaching the
>> + *       limits of the ECC quickly.
>> + *
>> + *       The test stops after 10000 cycles, should your FLASH be
>> + *       exceptionally good and not generate bit errors before that. Try
>> + *       a different page in that case.
>
> So basically you test that ECC works, and you are trying to be
> independent on the NAND HW and the ECC type. Right?
>
> How about mtd_nandecc test? How is it different? Do we need 2 tests?
> Why?
>
> Akinobu - you recently sent a large patch-set for mtd_nandecctest, could
> you please also comment on the above questions?

I think the test mtd_nandbiterrs is trying to do is useful and it is
different from mtd_nandecctest.  So they can coexist.

The mtd_nandecctest tests ECC function itself in nand_ecc.ko without
actual mtd devices.  Tests for nand_bch.ko may be added to
mtd_nandecctest in the future. But it should be done without actual
device as it has been.  It doesn't need to warry about losing important
data by human error.  BTW, my patch set for mtd_nandecctest attempts to
cover all type of corruption patterns.

On the other hand, mtd_nandbiterrs tests ECC functionality by poking
real mtd devices which may not be using ECC functions provided by
nand_ecc.ko.  It is more realistic and its test coverage spreads wider
range of mtd code than mtd_nandecctest can.

> Basically, I would like to understand why we need 2 tests, and if we
> really need 2, have the differences be documented, at least in the
> commentaries.

I'll add commentaries described above in nandecctest.c.
