Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxD3L-0001Gi-1c
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 11:29:49 +0000
Message-ID: <55645910.9010706@nod.at>
Date: Tue, 26 May 2015 13:29:20 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Chao Yu <chao2.yu@samsung.com>, dedekind1@gmail.com,
 adrian.hunter@intel.com
Subject: Re: [PATCH] ubifs: fix to check error code of register_shrinker
References: <003001d09146$c124b150$436e13f0$@samsung.com>
 <000301d097a6$6f3f9e70$4dbedb50$@samsung.com>
In-Reply-To: <000301d097a6$6f3f9e70$4dbedb50$@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2015 um 13:23 schrieb Chao Yu:
> Ping.
> 
> Add Cc Richard Weinberger.

Patch looks good to me.
Artem, if you don't mind I'd pick it up for the 4.2 queue.

Thanks,
//richard

>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Chao Yu
>> Sent: Monday, May 18, 2015 4:43 PM
>> To: dedekind1@gmail.com; adrian.hunter@intel.com
>> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [PATCH] ubifs: fix to check error code of register_shrinker
>>
>> register_shrinker() in ubifs_init() can fail due to fail to call kzalloc.
>> This patch fixes to check the return value of register_shrinker, otherwise
>> our shrinker may be unregistered after ubifs initialized successfully.
>>
>> Signed-off-by: Chao Yu <chao2.yu@samsung.com>
>> ---
>>  fs/ubifs/super.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 75e6f04..fa83d1b 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -2245,7 +2245,9 @@ static int __init ubifs_init(void)
>>  	if (!ubifs_inode_slab)
>>  		return -ENOMEM;
>>
>> -	register_shrinker(&ubifs_shrinker_info);
>> +	err = register_shrinker(&ubifs_shrinker_info);
>> +	if (err)
>> +		goto out_slab;
>>
>>  	err = ubifs_compressors_init();
>>  	if (err)
>> @@ -2269,6 +2271,7 @@ out_compr:
>>  	ubifs_compressors_exit();
>>  out_shrinker:
>>  	unregister_shrinker(&ubifs_shrinker_info);
>> +out_slab:
>>  	kmem_cache_destroy(ubifs_inode_slab);
>>  	return err;
>>  }
>> --
>> 2.3.3
>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
