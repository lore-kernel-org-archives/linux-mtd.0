Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN6cE-0007Rx-Mc
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 21:52:51 +0000
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C2840B.5000709@nod.at>
Date: Wed, 5 Aug 2015 23:45:47 +0200
MIME-Version: 1.0
In-Reply-To: <1438810690.6328.26.camel@embedded.rocks>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörg,

Am 05.08.2015 um 23:38 schrieb Jörg Krause:
> On Mi, 2015-08-05 at 23:30 +0200, Richard Weinberger wrote:
>> Jörg,
>>
>> Am 05.08.2015 um 23:22 schrieb Jörg Krause:
>>> Hi,
>>>
>>> after updating a custom build Linux Kernel from 4.0.8 to 4.1.4 my
>>> system fails to attach an MTD partition. Note, that everything 
>>> worked
>>> fine with Linux Kernels before 4.1.
>>
>> UBI Fastmap saw a lot of changes in 4.1.
>>
>>> The error message is:
>>> 	ubi_wl_get_peb: Unable to get a free PEB from user WL pool
>>> 	autoresize: cannot auto-resize volume 0
>>
>> Can you please share the full kernel log?
>> Especially I'm interested in the fastmap pool sizes.
> 
> I attached the kernel boot log.

Thanks.
That's a really small UBI setup.
[    3.202421] ubi1: default fastmap pool size: 10
[    3.207174] ubi1: default fastmap WL pool size: 5

>>
>>> The MTD partition has a size of 36 MB. The UBIFS image is created 
>>> with:
>>> 	mkfs.ubifs -v -F -m 2048 -e 124KiB -c 264 -d user -o user.ubifs
>>>
>>> The UBI image is created with:
>>> 	ubinize -v -o data.ubi -m 2048 -p 128KiB ubinize.ini
>>>
>>> ubinize.ini:
>>>     [user]
>>>     mode=ubi
>>>     image=user.ubifs
>>>     vol_id=0
>>>     vol_type=dynamic
>>>     vol_name=user
>>>     vol_flags=autoresize
>>>
>>>
>>> It works, if I replace the vol_flags with vol_size=32480KiB. But 
>>> that's
>>> not a final solution for me.
>>>
>>> Any idea what is wrong here?
>>
>> Not sure. Maybe fastmap claims too much PEBs.
>> BTW: Are you actually using fastmap or is it just enabled in your 
>> kernel config?
> 
> It is enabled in the kernel config. Not sure how to use it.

Then just disable it. :)
Meanwhile I'll find out what exactly is going on.

Thanks,
//richard
