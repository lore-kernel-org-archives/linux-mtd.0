Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeTHA-0006Ge-D1
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 11:26:53 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1606078rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Sep 2008 04:26:51 -0700 (PDT)
Message-ID: <48CBA377.9020802@gmail.com>
Date: Sat, 13 Sep 2008 04:26:47 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 2/3] [MTD] physmap.c: Add #endif comments
References: <48CB5E9F.9060109@gmail.com>
	<20080913104641.GE21603@xi.wantstofly.org>
In-Reply-To: <20080913104641.GE21603@xi.wantstofly.org>
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
> On Fri, Sep 12, 2008 at 11:33:03PM -0700, Zev Weiss wrote:
> 
>> Adding comments to a few of the less painfully-obvious #endifs.
>>
>> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
>> ---
>>   drivers/mtd/maps/physmap.c |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
>> index 6fba0d4..49e2039 100644
>> --- a/drivers/mtd/maps/physmap.c
>> +++ b/drivers/mtd/maps/physmap.c
>> @@ -244,7 +244,7 @@ static void physmap_flash_shutdown(struct platform_device *dev)
>>   #define physmap_flash_suspend NULL
>>   #define physmap_flash_resume NULL
>>   #define physmap_flash_shutdown NULL
>> -#endif
>> +#endif /* CONFIG_PM */
>>
>>   static struct platform_driver physmap_flash_driver = {
>>   	.probe		= physmap_flash_probe,
>> @@ -302,8 +302,8 @@ void physmap_set_partitions(struct mtd_partition *parts, int
>> num_parts)
>>   	physmap_flash_data.nr_parts = num_parts;
>>   	physmap_flash_data.parts = parts;
>>   }
>> -#endif
>> -#endif
>> +#endif /* CONFIG_MTD_PARTITIONS */
>> +#endif /* PHYSMAP_COMPAT */
> 
> I thought that this was frowned upon.  (I don't like it myself, and
> my editor is perfectly well capable of pointing out to me which ifdef
> matches up with which endif.)
> 

Ah, OK -- I found it slightly hard to follow the ones that get longer than a 
screenful or so, and I don't have my editor set to match them up nicely (though I 
might look into that).  It's something I'm accustomed to doing and seeing, and I saw 
no mention of it one way or another in Documentation/CodingStyle, so I didn't really 
give it a second thought.
