Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sdu2U-0002Gk-VV
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 02:07:32 +0000
Message-ID: <4FD55418.1000209@freescale.com>
Date: Mon, 11 Jun 2012 10:12:40 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Is there a bug in the UBIFS?
References: <4FD1BD03.60800@freescale.com>
 <1339148214.6875.117.camel@sauron.fi.intel.com>
 <4FD1CA7C.4040501@freescale.com> <201206110128.45829.marek.vasut@gmail.com>
In-Reply-To: <201206110128.45829.marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B406=E6=9C=8811=E6=97=A5 07:28, Marek Vasut =E5=86=99=
=E9=81=93:
> Dear Huang Shijie,
>
>> =E4=BA=8E 2012=E5=B9=B406=E6=9C=8808=E6=97=A5 17:36, Artem Bityutskiy =
=E5=86=99=E9=81=93:
>>> On Fri, 2012-06-08 at 16:51 +0800, Huang Shijie wrote:
>>>> [ 3526.960000] UBIFS error (pid 389): ubifs_scan: garbage
>>> UBIFS complains that it read garbage instead of proper UBIFS nodes.
>>>
>>>> I am not sure whether it's a UBIFS's bug, or the gpmi-nand's bug.
>>> Does not look like a UBIFS issue. You can always validate UBIFS using
>>> nandsim.
>>>
>>> modprobe nandsim
>>> modprobe ubi mtd=3D0
>>> ubimkvol /dev/ubi0 -N test -m
>>> mount -t ubifs /dev/ubi0_0 /mnt/ubifs
>>> integck /mnt/ubifs
>> ok, thanks a lot.
> Did you possibly finally shoot yourself in the leg with this issue that=
 is
> constantly ignored?
>
thanks a lot. :)

I will check it.

Best Regards
Huang Shijie
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039127.html
>
>> Huang Shijie
> Best regards,
> Marek Vasut
>
