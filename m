Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rds4V-0001ic-GY
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 23:29:12 +0000
Message-ID: <4EF3BD20.9010408@newsguy.com>
Date: Thu, 22 Dec 2011 15:28:32 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>	
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
 <1324559149.10300.93.camel@sauron.fi.intel.com>
In-Reply-To: <1324559149.10300.93.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2011 05:05 AM, Artem Bityutskiy wrote:
> On Tue, 2011-12-20 at 10:42 -0800, Mike Dunn wrote:
>> +		/*
>> +		 * For unpartitioned devices, create a single "partition" that
>> +		 * spans the entire device, so that driver methods go through
>> +		 * partition wrappers in all cases.
>> +		 */
>> +		struct mtd_partition single_part = {
>> +			.name = (char *)mtd->name,
>> +			.offset = 0,
>> +			.size = mtd->size,
>> +			.mask_flags = 0,
>> +			.ecclayout = mtd->ecclayout,
>> +		};
>> +		err = add_mtd_partitions(mtd, &single_part, 1);
>>  	}
> There is a problem with this approach :-(
>
> Look at the 'mtd_blkpg_ioctl()' function which is used to re-partition
> MTD device from user-space. It is a bit strange, but we use block device
> for re-partition in order to not invent new ioctls.


Sorry, missed that too.  So many perils...

Thanks,
Mike
