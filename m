Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeTFN-0005pd-MV
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 11:25:02 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1202192wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Sep 2008 04:25:00 -0700 (PDT)
Message-ID: <48CBA308.1070309@gmail.com>
Date: Sat, 13 Sep 2008 04:24:56 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 3/3] [MTD] physmap.c: Add a dummy release function
References: <48CB5EA4.10907@gmail.com>
	<20080913104701.GF21603@xi.wantstofly.org>
In-Reply-To: <20080913104701.GF21603@xi.wantstofly.org>
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
> On Fri, Sep 12, 2008 at 11:33:08PM -0700, Zev Weiss wrote:
> 
>> Adding a dummy release function to the physmap device so as to silence a log
>> warning on initialization.
>>
>> Signed-off-by: Zev Weiss <zevweiss@gmail.com>
>> ---
>>   drivers/mtd/maps/physmap.c |    5 +++++
>>   1 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
>> index 49e2039..73a8d3c 100644
>> --- a/drivers/mtd/maps/physmap.c
>> +++ b/drivers/mtd/maps/physmap.c
>> @@ -277,11 +277,16 @@ static struct resource physmap_flash_resource = {
>>   	.flags		= IORESOURCE_MEM,
>>   };
>>
>> +static void physmap_dummy_release(struct device *dev)
>> +{
>> +}
>> +
>>   static struct platform_device physmap_flash = {
>>   	.name		= "physmap-flash",
>>   	.id		= 0,
>>   	.dev		= {
>>   		.platform_data	= &physmap_flash_data,
>> +		.release	= &physmap_dummy_release,
>>   	},
>>   	.num_resources	= 1,
>>   	.resource	= &physmap_flash_resource,
> 
> Isn't that just papering over the issue?
> 

Quite possibly -- is there something it *should* be doing?  (I don't mean to suggest 
I particularly think there's not, honest question.)  I had figured it was a minor 
oversight and the warning was sort of a "spurious" one, though I'm admittedly well 
out of my depth here, so perhaps I shouldn't be doing such things (though I suppose 
it's one way to learn).
