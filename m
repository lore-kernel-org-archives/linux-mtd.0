Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ex8Pb-0004O7-P2
 for linux-mtd@lists.infradead.org; Sat, 17 Mar 2018 09:46:05 +0000
Received: by mail-io0-x242.google.com with SMTP id e7so15399619ioj.1
 for <linux-mtd@lists.infradead.org>; Sat, 17 Mar 2018 02:45:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: use put_device() if device_register fail
To: Boris Brezillon <boris.brezillon@bootlin.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
 <20180314153600.458c0fe4@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: arvindY <arvind.yadav.cs@gmail.com>
Message-ID: <5AACE3C9.9090602@gmail.com>
Date: Sat, 17 Mar 2018 15:15:45 +0530
MIME-Version: 1.0
In-Reply-To: <20180314153600.458c0fe4@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wednesday 14 March 2018 08:06 PM, Boris Brezillon wrote:
> On Fri,  9 Mar 2018 16:20:48 +0530
> Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>
>> if device_register() returned an error! Always use put_device()
>> to give up the reference initialized.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> ---
>>   drivers/mtd/mtdcore.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 28553c8..4d77ca2 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -586,6 +586,7 @@ int add_mtd_device(struct mtd_info *mtd)
>>   	return 0;
>>   
>>   fail_added:
>> +	put_device(&mtd->dev);
> Not sure this is a good idea: the put_device() call will trigger
> an mtd_devtype->release(), which will in turn call device_destroy() on
> something that does not exist yet. Not sure if this is a real problem,
> but it does not look like the right thing to do.
>
yes, you are correct. No need to call put_device().
which can cause other problem.

>>   	of_node_put(mtd_get_of_node(mtd));
> You're referencing an object that is supposed to have been
> freed/released by the put_device() call. Again, it's not really a
> problem because in our case ->release() does not free the mtd object
> (as is usually done in other parts of the kernel), but it still looks
> wrong. It's probably better to move the of_node_put() and the below
> idr_remove() call in the ->release() hook if you want to use
> put_device().
>
>>   	idr_remove(&mtd_idr, i);
Sure, we can move put_device() below this. But need to check
how we can add hook in release.
>
>>   fail_locked:
>
>
~arvind
