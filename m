Received: from submit1.sa.ew.hu ([212.108.200.71])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz3wH-0004c9-Df
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 13:05:41 +0000
Message-ID: <53A82609.9090408@denx.de>
Date: Mon, 23 Jun 2014 15:05:13 +0200
From: Heiko Schocher <hs@denx.de>
Reply-To: hs@denx.de
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI: fix rb_tree node comparison in add_map commit buggy?
References: <53A7EF04.7040805@denx.de> <53A809A3.30703@denx.de>
 <53A82077.6090109@nod.at>
In-Reply-To: <53A82077.6090109@nod.at>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

Am 23.06.2014 14:41, schrieb Richard Weinberger:
> Am 23.06.2014 13:04, schrieb Heiko Schocher:
>> I tried this patch also in the U-Boot code, without getting a ubifs
>> rootfs (burned with u-boot into the ubi volume) bootable in linux ...
>> which worked before... maybe v3.14 and v3.16-rc1 are not compatible?
>> Do anybody know from such problems?
>>
>> If I revert commit 604b592e6fd3c98f21435e1181ba7723ffc24715 in
>> Linux v3.16-rc1 only (so I have the same code in U-Boot at this
>> place), I can boot Linux with the ubifs based rootfs, and after
>> a reboot the U-Boot ubi attach time is short ... all works fine,
>> as I can see it ...
>>
>> If I make in U-Boot and Linux in following patch [1]:
>> $ git diff
>> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
>> index b04e7d0..72f39da 100644
>> --- a/drivers/mtd/ubi/fastmap.c
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -125,7 +125,7 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
>>                  parent = *p;
>>                  av = rb_entry(parent, struct ubi_ainf_volume, rb);
>>
>> -               if (vol_id<  av->vol_id)
>> +               if (vol_id>  av->vol_id)
>>                          p =&(*p)->rb_left;
>>                  else
>>                          p =&(*p)->rb_right;
>> $
>
> "Found" your patch. ;)
> Looks like I need new glasses.

;-)

> Yes, it looks correct as the logic is now balanced with the logic in ubi_find_av().

Ah, yes, right! So should I post a correct patch for this?

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
