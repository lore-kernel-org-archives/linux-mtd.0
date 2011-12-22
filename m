Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rds4R-0001iI-An
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 23:29:08 +0000
Message-ID: <4EF3BD15.1030709@newsguy.com>
Date: Thu, 22 Dec 2011 15:28:21 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
 <1324557264.10300.86.camel@sauron.fi.intel.com>
In-Reply-To: <1324557264.10300.86.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2011 04:34 AM, Artem Bityutskiy wrote:
> On Tue, 2011-12-20 at 10:42 -0800, Mike Dunn wrote:
>> Ensure driver methods always go through the wrapper functions in the
>> partitioning code by creating a single "partition" on otherwise unpartitioned
>> devices.
>>
>> Tested with nandsim, onenand_sim, and the diskonchip g4 nand driver (currently
>> out-of-tree).
>>
>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> Looks good to me in general. Does it change anything from the user-space
> POW (API/ABI)?


No, should be completely transparent (at least that's my intention).  The only
new behavior is that the partition code puts a string in the log with the
partition boundaries and partition name, which in the single partition case is
mtd->name, which should avoid any confusion.


> One thing to be aware of: some drivers do like this:
>
> drivers/mtd/maps/plat-ram.c:
>
>         /* check to see if there are any available partitions, or wether
>          * to add this device whole */
>
>         err = mtd_device_parse_register(info->mtd, pdata->probes, 0,
>                         pdata->partitions, pdata->nr_partitions);
>         if (!err)
>                 dev_info(&pdev->dev, "registered mtd device\n");
>
>         if (pdata->nr_partitions) {
>                 /* add the whole device. */
>                 err = mtd_device_register(info->mtd, NULL, 0);
>                 if (err) {
>                         dev_err(&pdev->dev,
>                                 "failed to register the entire device\n");
>                 }
>         }
>
> Could you please:
> 1. Try to find drivers like this and kill the redundant mtd_device_register()
>    call.
> 2. There is no guarantee you will find all. So you could add a check in
>    mtd_device_parse_register() which would print a warning if the device is
>    added for the second time and return. So the code would work and people
>    would be able to notice the warning and fix up the driver.


OK.  Sorry, missed that.


>> -		add_mtd_device(&slave->mtd);
>> +		ret = add_mtd_device(&slave->mtd);
>> +		if (ret == 1)
>> +			return -ENODEV;
> Is this an unrelated change? Would you separate it out?


No, it's related.  Currently, mtd_device_parse_register() does the above if no
partitions are created, whereas here in add_mtd_partitions() the return code of
add_mtd_device() is not checked, so I added this to be consistent with the
previous behavior.  mtd_device_parse_register() propagates this return code back
to the caller, so the result is the same.

Thanks,
Mike
