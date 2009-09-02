Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MiiyI-0007Oh-Aj
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 06:05:35 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KPB0083RXSBCY@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 14:55:24 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KPB00B57XS90A@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 14:55:23 +0900 (KST)
Date: Wed, 02 Sep 2009 11:25:56 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: Kyungmin Park <kmpark@infradead.org>
Message-id: <9F26F5B628B1411DAC7AE8B2BD9D7330@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> @@ -2717,16 +2927,21 @@ static int onenand_otp_walk(struct mtd_info
> *mtd, loff_t from, size_t len,
>       if (density < ONENAND_DEVICE_DENSITY_512Mb)
>               otp_pages = 20;
>       else
> -               otp_pages = 10;
> +               otp_pages = 50;
>
> Is it always 50 pages? Is it right? why I think it's 10. please check
> the previous OneNAND spec.
> At least the latest OneNAND spec say it's 50. flex or not.
>

I've checked different OneNAND specs and 50 pages have been allocated for the User Area in all of 
those.

>> +       if (FLEXONENAND(this)) {
>> +
>> +#ifdef CONFIG_ONENAND_OTP_AREA
>> +               buf[FLEXONENAND_OTP_LOCK_OFFSET] = 0xFC;
>> +#elif defined(CONFIG_ONENAND_OTP_BLOCK0)
>> +               buf[FLEXONENAND_OTP_LOCK_OFFSET] = 0xF3;
>> +#elif defined(CONFIG_ONENAND_OTP_AREA_BLOCK0)
>> +               buf[FLEXONENAND_OTP_LOCK_OFFSET] = 0xF0;
>> +#endif /* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA_BLOCK0 */
>> +       } else {
>> +
>> +#ifdef CONFIG_ONENAND_OTP_AREA
>> +               buf[ONENAND_OTP_LOCK_OFFSET] = 0xFC;
>> +#elif defined(CONFIG_ONENAND_OTP_BLOCK0)
>> +               buf[ONENAND_OTP_LOCK_OFFSET] = 0xF3;
>> +#elif defined(CONFIG_ONENAND_OTP_AREA_BLOCK0)
>> +               buf[ONENAND_OTP_LOCK_OFFSET] = 0xF0;
>> +#endif /* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA_BLOCK0 */
>> +       }
>> +
>
> it's too much #ifdef, #endif. Introuduce the opt_lock_offset and set
> the proper offset based on flex or not.
>
> And the set the buf[otp_lock_offset] = proper value.
>
Accepted and corrected.

Please find the patch in the following mail.

Regards,
Amul
