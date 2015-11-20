Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzZOF-0006ty-7Q
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 00:17:24 +0000
Message-ID: <564E64CD.7010802@cn.fujitsu.com>
Date: Fri, 20 Nov 2015 08:09:49 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Konstantin Tokarev
 <annulen@yandex.ru>, Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: can't mount ubifs after resizing with ubirsvol
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br> <564DD1DF.9070009@nod.at>
 <203731447942192@web14h.yandex.ru> <564DE4A3.1070609@nod.at>
In-Reply-To: <564DE4A3.1070609@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/19/2015 11:02 PM, Richard Weinberger wrote:
> Am 19.11.2015 um 15:09 schrieb Konstantin Tokarev:
>> I can confirm that shrinking UBIFS volume corrupts it.
>
> There are no UBIFS volumes.
> If you shrink a UBI volume, you kill UBIFS for sure.
> It is like shrinking a HDD partition without resizing ext4 before.
>
> Maybe we can do a resizeubifs tool at some point.
> I'm currently checking the source what we need for a online-shrink...

Interesting idea. What about a ubifs tool with a subcommand named as
resize? Then we can add more subcommands for ubifs. Anyway, waiting for 
your
patch. :)

Thanx
Yang

>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
