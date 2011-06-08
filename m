Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJQC-00059K-H5
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:07:49 +0000
Received: by vxd2 with SMTP id 2so472093vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:07:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110608.225021.214244518.anemo@mba.ocn.ne.jp>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-19-git-send-email-dbaryshkov@gmail.com>
	<20110608.225021.214244518.anemo@mba.ocn.ne.jp>
Date: Wed, 8 Jun 2011 18:07:40 +0400
Message-ID: <BANLkTikhoyRZGxLo=VfxLBNEfwuHtQxuhA@mail.gmail.com>
Subject: Re: [PATCH 18/44] mtd: rbtx4939-flash.c: use mtd_device_parse_register
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/8/11, Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> On Tue,  7 Jun 2011 17:36:17 +0400, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> @@ -106,18 +102,8 @@ static int rbtx4939_flash_probe(struct
>> platform_device *dev)
>>  	info->mtd->owner = THIS_MODULE;
>>  	if (err)
>>  		goto err_out;
>> -	err = parse_mtd_partitions(info->mtd, NULL, &info->parts, 0);
>> -	if (err > 0) {
>> -		mtd_device_register(info->mtd, info->parts, err);
>> -		info->nr_parts = err;
>> -		return 0;
>> -	}
>> -
>> -	if (pdata->nr_parts) {
>> -		pr_notice("Using rbtx4939 partition information\n");
>> -		mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
>> -		return 0;
>> -	}
>> +	err = mtd_device_parse_register(info->mtd, NULL, 0,
>> +			pdata->parts, pdata->nr_parts);
>>
>>  	mtd_device_register(info->mtd, NULL, 0);
>>  	return 0;
>
> The last mtd_device_register() call should be removed too?

Good catch, thanks!

-- 
With best wishes
Dmitry
