Received: from sncsmrelay2.nai.com ([67.97.80.206])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STur0-00023O-MU
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:58:23 +0000
Message-ID: <4FB1015E.5000008@snapgear.com>
Date: Mon, 14 May 2012 22:58:06 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1336997124.2528.22.camel@sauron.fi.intel.com>
In-Reply-To: <1336997124.2528.22.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 05/14/2012 10:05 PM, Artem Bityutskiy wrote:
> I have few requests
>
> On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
>> @@ -80,7 +80,6 @@ static int __init uclinux_mtd_init(void)
>>   	mtd = do_map_probe("map_ram", mapp);
>>   	if (!mtd) {
>>   		printk("uclinux[mtd]: failed to find a mapping?\n");
>
> KERN_ERR prefixe is missing. Please, fix other printks in this file
> while on it.
>
>> -		iounmap(mapp->virt);
>>   		return(-ENXIO);
>>   	}
>>
>> @@ -103,10 +102,8 @@ static void __exit uclinux_mtd_cleanup(void)
>>   		map_destroy(uclinux_ram_mtdinfo);
>>   		uclinux_ram_mtdinfo = NULL;
>>   	}
>> -	if (uclinux_ram_map.virt) {
>> -		iounmap((void *) uclinux_ram_map.virt);
>> +	if (uclinux_ram_map.virt)
>>   		uclinux_ram_map.virt = 0;
>> -	}
>
> The "if" statements are redundant - could you please kill them?
>
> Would you please be kind to address these sparse warnings while you work
> on this rarely used file:
>
> drivers/mtd/maps/uclinux.c:27:17: warning: symbol 'uclinux_ram_map' was not declared. Should it be static? [sparse]
> drivers/mtd/maps/uclinux.c:49:15: warning: incorrect type in assignment (different address spaces) [sparse]
> drivers/mtd/maps/uclinux.c:49:15:    expected void *<noident>  [sparse]
> drivers/mtd/maps/uclinux.c:49:15:    got void [noderef]<asn:2>* [sparse]
> drivers/mtd/maps/uclinux.c:71:20: warning: incorrect type in assignment (different address spaces) [sparse]
> drivers/mtd/maps/uclinux.c:71:20:    expected void [noderef]<asn:2>*virt [sparse]
> drivers/mtd/maps/uclinux.c:71:20:    got void * [sparse]
> drivers/mtd/maps/uclinux.c:73:27: warning: Using plain integer as NULL pointer [sparse]
> drivers/mtd/maps/uclinux.c:106:40: warning: Using plain integer as NULL pointer [sparse]

Sure thing, I can clean all those up. Are you happy to take a single
cleanup patch on top of the ioremap_nocache fix patch?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
