Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeTHs-0006Jl-4S
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 11:27:36 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1202899wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Sep 2008 04:27:35 -0700 (PDT)
Message-ID: <48CBA3A4.7020308@gmail.com>
Date: Sat, 13 Sep 2008 04:27:32 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 1/3] [MTD] physmap.c: Check return of
	platform_device_register()
References: <48CB5E9A.4010000@gmail.com>
	<20080913104542.GD21603@xi.wantstofly.org>
In-Reply-To: <20080913104542.GD21603@xi.wantstofly.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lennert Buytenhek wrote:
> On Fri, Sep 12, 2008 at 11:32:58PM -0700, Zev Weiss wrote:
> 
>> The PHYSMAP_COMPAT code had been ignoring the return value of
>> platform_device_register() in the physmap_init() function.
>>
>> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
>> ---
>>   drivers/mtd/maps/physmap.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
>> index 42d844f..6fba0d4 100644
>> --- a/drivers/mtd/maps/physmap.c
>> +++ b/drivers/mtd/maps/physmap.c
>> @@ -312,7 +312,7 @@ static int __init physmap_init(void)
>>   	err = platform_driver_register(&physmap_flash_driver);
>>   #ifdef PHYSMAP_COMPAT
>>   	if (err == 0)
>> -		platform_device_register(&physmap_flash);
>> +		err = platform_device_register(&physmap_flash);
>>   #endif
> 
> I don't think you want the registration of the physmap driver to fail
> if the compat platform device fails to register.
> 
> One reason that the compat platform device can fail to register can be
> that there is already a non-compat platform device for the compat flash
> chip, and in that case I don't think you want to fail the driver init
> (while leaving the physmap_flash_driver registered, too!).
> 

Chalk another one up to ignorance on my part...sounds like a nak all 'round.
