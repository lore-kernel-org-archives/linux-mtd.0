Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0cQg-0001Vl-NO
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2015 21:44:16 +0000
Subject: Re: can't mount ubifs after resizing with ubirsvol
To: Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>,
 Konstantin Tokarev <annulen@yandex.ru>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br> <564DD1DF.9070009@nod.at>
 <203731447942192@web14h.yandex.ru> <564DE4A3.1070609@nod.at>
 <564DEEEF.7010102@writesys.com.br>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5652370F.60501@nod.at>
Date: Sun, 22 Nov 2015 22:43:43 +0100
MIME-Version: 1.0
In-Reply-To: <564DEEEF.7010102@writesys.com.br>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ibrahim,

Am 19.11.2015 um 16:46 schrieb Ibrahim Mattus Neto:
> Hi!
> 
> On 19/11/2015 13:02, Richard Weinberger wrote:
>> Am 19.11.2015 um 15:09 schrieb Konstantin Tokarev:
>>> I can confirm that shrinking UBIFS volume corrupts it.
>> There are no UBIFS volumes.
> 
> You mean that there are no UBIFS volumes because of the config file? e.g.

UBIFS has no volumes, it is a filesystem.
UBI has volumes. :-)

>  [data]
>  mode=ubi
>  vol_id=1
>  vol_type=dynamic
>  vol_name=data
>  vol_alignment=1
>  vol_flags=autoresize
>  vol_size=10MiB
> 
> 
> 
>> If you shrink a UBI volume, you kill UBIFS for sure.
>> It is like shrinking a HDD partition without resizing ext4 before.
> 
> In this case, should I use ubiupdatevol (with a new ubifs file) after resizing the ubi volume?

You can. (As long the UBIFS fits into the UBI volume)

Thanks,
//richard
