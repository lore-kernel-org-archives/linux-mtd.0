Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzQk7-00030F-VZ
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 15:03:30 +0000
Subject: Re: can't mount ubifs after resizing with ubirsvol
To: Konstantin Tokarev <annulen@yandex.ru>,
 Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
 <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
 <564DCFED.2070902@writesys.com.br> <564DD1DF.9070009@nod.at>
 <203731447942192@web14h.yandex.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <564DE4A3.1070609@nod.at>
Date: Thu, 19 Nov 2015 16:02:59 +0100
MIME-Version: 1.0
In-Reply-To: <203731447942192@web14h.yandex.ru>
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

Am 19.11.2015 um 15:09 schrieb Konstantin Tokarev:
> I can confirm that shrinking UBIFS volume corrupts it.

There are no UBIFS volumes.
If you shrink a UBI volume, you kill UBIFS for sure.
It is like shrinking a HDD partition without resizing ext4 before.

Maybe we can do a resizeubifs tool at some point.
I'm currently checking the source what we need for a online-shrink...

Thanks,
//richard
