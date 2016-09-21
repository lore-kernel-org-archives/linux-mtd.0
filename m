Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmib9-0005ke-0U
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 14:34:08 +0000
Subject: Re: [PATCH v2 03/46] mtd: Don't unconditionally unregister reboot
 notifier
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <f83b7dd1edbee967b352aa3c2dab676bafd63a56.1474450295.git.dwalter@sigma-star.at>
 <20160921163120.7d7e7fca@bbrezillon>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 computersforpeace@gmail.com, linux-kernel@vger.kernel.org
From: Daniel Walter <dwalter@sigma-star.at>
Message-ID: <136a55bf-a31c-3329-33e7-f3084b5608dc@sigma-star.at>
Date: Wed, 21 Sep 2016 16:33:42 +0200
MIME-Version: 1.0
In-Reply-To: <20160921163120.7d7e7fca@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/21/2016 04:31 PM, Boris Brezillon wrote:
> On Wed, 21 Sep 2016 11:45:12 +0200
> Daniel Walter <dwalter@sigma-star.at> wrote:
> 
>> From: Richard Weinberger <richard@nod.at>
>>
>> del_mtd_device() is allowed to fail.
>> i.e. when the MTD is busy.
>> Unregister the reboot notifier only when we're really
>> about to delete the MTD.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/mtdcore.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index e3936b8..36e5fb0 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -654,17 +654,22 @@ int mtd_device_unregister(struct mtd_info *master)
>>  {
>>  	int err;
>>  
>> -	if (master->_reboot)
>> -		unregister_reboot_notifier(&master->reboot_notifier);
>> -
>>  	err = del_mtd_partitions(master);
>>  	if (err)
>>  		return err;
>>  
>>  	if (!device_is_registered(&master->dev))
>> -		return 0;
>> +		goto unregister;
>>  
>> -	return del_mtd_device(master);
>> +	err = del_mtd_device(master);
>> +	if (err)
>> +		return err;
>> +
>> +unregister:
>> +	if (master->_reboot)
>> +		unregister_reboot_notifier(&master->reboot_notifier);
>> +
>> +	return 0;
> 
> How about:
> 
> 	if (device_is_registered(&master->dev)) {
> 		err = del_mtd_device(master);
> 		if (err)
> 			return err;
> 	}
> 
> 	if (master->_reboot)
> 		unregister_reboot_notifier(&master->reboot_notifier);
> 
> 	return 0;
> 
> This way you get rid of the unregister label, which IMHO improves
> readability.

Agree, will fix this in v3 of the series.



-- 
sigma star gmbh | Eduard-Bodem-Gasse 6, 6020 Innsbruck, Austria
UID/VAT Nr: ATU 66964118 | FN: 374287y
