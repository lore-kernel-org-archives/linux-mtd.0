Received: from forward2h.mail.yandex.net ([2a02:6b8:0:f05::2])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzPum-0007Ly-GY
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 14:10:24 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Richard Weinberger <richard@nod.at>,
 Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <564DD1DF.9070009@nod.at>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br> <564DD1DF.9070009@nod.at>
Subject: Re: can't mount ubifs after resizing with ubirsvol
MIME-Version: 1.0
Message-Id: <203731447942192@web14h.yandex.ru>
Date: Thu, 19 Nov 2015 17:09:52 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



19.11.2015, 16:44, "Richard Weinberger" <richard@nod.at>:
> Hi!
>
> Am 19.11.2015 um 14:34 schrieb Ibrahim Mattus Neto:
>> šHi Richard!
>>
>> šThanks for the response.
>>
>> šWhat I did was:
>>
>> š1) I created an .ubi file using the following configuration.
>> š[rootfs]
>> šmode=ubi
>> švol_id=0
>> švol_type=dynamic
>> švol_name=rootfs
>> švol_alignment=1
>> šimage=rootfs.ubifs
>> švol_size=80MiB
>>
>> š[data]
>> šmode=ubi
>> švol_id=1
>> švol_type=dynamic
>> švol_name=data
>> švol_alignment=1
>> švol_flags=autoresize
>> švol_size=10MiB
>>
>> š[recover]
>> šmode=ubi
>> švol_id=2
>> švol_type=dynamic
>> švol_name=recover
>> švol_alignment=1
>> švol_size=5MiB
>>
>> š2) After booting I tried to shrink "data" and increase the size of recover using ubirsvol:
>>
>> šubirsvol /dev/ubi0 -n 1 -s 4MiB (data)
>>
>> šubirsvol /dev/ubi0 -n 2 -s 15MiB (recover)
>>
>> š3) After the resizing I tried to mount "data"
>>
>> šmount /home/data/
>> š[ 88.510000] UBIFS error (ubi0:1 pid 668): validate_sb: bad LEB count: 1159 in superblock, 34 on UBI volume, 20 minimum required
>> š[ 88.520000] UBIFS error (ubi0:1 pid 668): validate_sb: bad superblock, error 1
>
> This cannot work. You resized the UBI *volume*, not the UBIFS filesystem.
> And unless I'm very mistaken UBIFS does not support shrinking anyway.

I can confirm that shrinking UBIFS volume corrupts it.

-- 
Regards,
Konstantin
