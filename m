Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScvjH-0002zU-R9
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 09:43:40 +0000
Message-ID: <4FD1CA7C.4040501@freescale.com>
Date: Fri, 8 Jun 2012 17:48:44 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: Is there a bug in the UBIFS?
References: <4FD1BD03.60800@freescale.com>
 <1339148214.6875.117.camel@sauron.fi.intel.com>
In-Reply-To: <1339148214.6875.117.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B406=E6=9C=8808=E6=97=A5 17:36, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Fri, 2012-06-08 at 16:51 +0800, Huang Shijie wrote:
>> [ 3526.960000] UBIFS error (pid 389): ubifs_scan: garbage
> UBIFS complains that it read garbage instead of proper UBIFS nodes.
>
>> I am not sure whether it's a UBIFS's bug, or the gpmi-nand's bug.
> Does not look like a UBIFS issue. You can always validate UBIFS using
> nandsim.
>
> modprobe nandsim
> modprobe ubi mtd=3D0
> ubimkvol /dev/ubi0 -N test -m
> mount -t ubifs /dev/ubi0_0 /mnt/ubifs
> integck /mnt/ubifs
>
>
ok, thanks a lot.

Huang Shijie
