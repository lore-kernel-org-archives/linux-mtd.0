Received: from mail-sg2apc01on0049.outbound.protection.outlook.com
 ([104.47.125.49] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azcWS-0005gv-8r
 for linux-mtd@lists.infradead.org; Mon, 09 May 2016 04:10:21 +0000
Subject: Re: [PATCH] mtd: nandbiterrs: Support for NAND biterrors test on
 platforms without raw write
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <572BDE8C.3020703@netcommwireless.com>
 <20160508184451.3d90176a@bbrezillon>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
From: Iwo Mergler <iwo.mergler@netcommwireless.com>
Message-ID: <57300D8A.8040607@netcommwireless.com>
Date: Mon, 9 May 2016 14:09:46 +1000
MIME-Version: 1.0
In-Reply-To: <20160508184451.3d90176a@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


I have to admit that your NACK surprised me.

My patch removes an unnecessary use of raw write
from the test. It was only there because of my
original implementation, which I now consider
mistaken.

I fully agree with you that raw write should
be implemented, despite the impediments.
Although I have seen at least one NAND controller
that always computed and wrote ECC, with no way
for software to circumvent it.

Could you please elaborate a little why you
don't want a test module to work with incomplete
MTD drivers? Is that supposed to be motivating
driver writers for better implementations? ;-)

Would you accept the patch if I remove the comment
about data reshuffling drivers? It's not required
for the patch and, as you correctly pointed out,
now inaccurate.


Best regards,

Iwo


On 05/09/2016 02:44 AM, Boris Brezillon wrote:
> Hi Iwo,
>
> On Fri, 6 May 2016 10:00:12 +1000
> Iwo Mergler <iwo.mergler@netcommwireless.com> wrote:
>
>> Hi all,
>>
>>
>> I'm vaguely aware that there is an ongoing effort to move this
>> stuff to mtd-utils, but I was unable to find a source tree
>> with the work so far.
>>
>> Below is a single-line patch for the kernel tests, feel free
>> to apply to the userspace source as well.
>>
>>
>> Best regards,
>>
>> Iwo
>>
>>
>> Support for NAND biterrors test on platforms without raw write
>>
>> While the default test mode relies on raw write (mtd_write_oob) to introduce
>> bit errors into a page, the rewrite test mode doesn't need it.
>>
>> Some drivers use eldritch data/ECC arrangements in a NAND page and reshuffle
>> things on-the-fly, to present a normal page view to the kernel. Typically,
>> raw write / read is unsupported on such platforms. Examples are Freescale
>> MXS and Qualcomm MDM9 and probably many others.
> Sorry, but I think such platforms should unshuffle the data/ECC
> sections to expose a standard in-band/out-of-band view to the upper
> layer.
>
> This is completely doable since ->read_page_raw()/->write_page_raw()
> can be overloaded (see the GPMI implementation or the default
> ECC_HW_SYNDROME raw implementation if you need examples).
>
> So, it's a NACK on my side.
>
> Best Regards,
>
> Boris
>
>
>> Changed the overwrite test to use normal writes.
>>
>> Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
>> ---
>>    drivers/mtd/tests/nandbiterrs.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/tests/nandbiterrs.c
>> b/drivers/mtd/tests/nandbiterrs.c
>> index 09a4cca..f26dec8 100644
>> --- a/drivers/mtd/tests/nandbiterrs.c
>> +++ b/drivers/mtd/tests/nandbiterrs.c
>> @@ -290,7 +290,7 @@ static int overwrite_test(void)
>>
>>        while (opno < max_overwrite) {
>>
>> -        err = rewrite_page(0);
>> +        err = write_page(0);
>>            if (err)
>>                break;
>>
>
>
