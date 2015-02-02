Received: from mxf3.bahnhof.se ([213.80.101.27])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIB7x-0008Jm-VI
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 07:08:59 +0000
Message-ID: <54CF2261.1040707@flawful.org>
Date: Mon, 02 Feb 2015 08:08:17 +0100
From: Niklas Cassel <nks@flawful.org>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: avoid registering reboot notifier twice
References: <1422752930-696-1-git-send-email-nks@flawful.org>
 <20150201230723.GA3523@norris-Latitude-E6410>
In-Reply-To: <20150201230723.GA3523@norris-Latitude-E6410>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 02/02/2015 12:07 AM, Brian Norris wrote:
> On Sun, Feb 01, 2015 at 02:08:50AM +0100, Niklas Cassel wrote:
>> Calling mtd_device_parse_register with the same mtd_info
>> (e.g. registering several partitions on a single device)
>> would add the same reboot notifier twice, causing an
>> infinte loop in notifier_chain_register during boot up.
> No driver should be calling mtd_device_parse_register() multiple times
> on the same mtd_info. Under what context do you see this? What driver?
arch/cris/arch-v32/drivers/axisflashmap.c

It calls mtd_device_register for different partitions on same device using the same mtd_info.

What do you suggest this driver should do instead?

>
>> Signed-off-by: Niklas Cassel <nks@flawful.org>
>> ---
>>  drivers/mtd/mtdcore.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index de79576..98efc1e 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -556,7 +556,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>>  			err = -ENODEV;
>>  	}
>>  
>> -	if (mtd->_reboot) {
>> +	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
>>  		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
>>  		register_reboot_notifier(&mtd->reboot_notifier);
>>  	}
> Brian
