Received: from hm8854-n-82.locaweb.com.br ([189.126.112.82])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0rRP-0000H2-KH
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 13:46:01 +0000
Received: from mcbain0011.correio.biz (189.126.112.14) by
 hm8854-n-11.locaweb.com.br id hacc9e1un34j for
 <linux-mtd@lists.infradead.org>;
 Mon, 23 Nov 2015 11:45:24 -0200 (envelope-from <ibrahim.neto@writesys.com.br>)
Subject: Re: can't mount ubifs after resizing with ubirsvol
To: Richard Weinberger <richard@nod.at>, Konstantin Tokarev <annulen@yandex.ru>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br> <564DD1DF.9070009@nod.at>
 <203731447942192@web14h.yandex.ru> <564DE4A3.1070609@nod.at>
 <564DEEEF.7010102@writesys.com.br> <5652370F.60501@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
Message-ID: <565317EB.4010407@writesys.com.br>
Date: Mon, 23 Nov 2015 11:43:07 -0200
MIME-Version: 1.0
In-Reply-To: <5652370F.60501@nod.at>
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 22/11/2015 19:43, Richard Weinberger wrote:
> Ibrahim,
>
> Am 19.11.2015 um 16:46 schrieb Ibrahim Mattus Neto:
>> Hi!
>>
>> On 19/11/2015 13:02, Richard Weinberger wrote:
>>> Am 19.11.2015 um 15:09 schrieb Konstantin Tokarev:
>>>> I can confirm that shrinking UBIFS volume corrupts it.
>>> There are no UBIFS volumes.
>> You mean that there are no UBIFS volumes because of the config file? e.g.
> UBIFS has no volumes, it is a filesystem.
> UBI has volumes. :-)

My bad... got  a little confused :(

>
>>   [data]
>>   mode=ubi
>>   vol_id=1
>>   vol_type=dynamic
>>   vol_name=data
>>   vol_alignment=1
>>   vol_flags=autoresize
>>   vol_size=10MiB
>>
>>
>>
>>> If you shrink a UBI volume, you kill UBIFS for sure.
>>> It is like shrinking a HDD partition without resizing ext4 before.
>> In this case, should I use ubiupdatevol (with a new ubifs file) after resizing the ubi volume?
> You can. (As long the UBIFS fits into the UBI volume)
>
> Thanks,
> //richard

Thank you for your time!
Best,
--Ibrahim
