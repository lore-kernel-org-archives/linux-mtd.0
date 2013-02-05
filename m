Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2dmb-0003Rr-Bh
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 08:21:37 +0000
Message-ID: <5110C10B.5090502@freescale.com>
Date: Tue, 5 Feb 2013 16:21:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 2/2] mtd: torturetest: add the support for random data
 pattern
References: <1360030820-21491-1-git-send-email-b32955@freescale.com>
 <1360030820-21491-2-git-send-email-b32955@freescale.com>
 <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8805=E6=97=A5 16:05, Ricard Wanderlof =E5=
=86=99=E9=81=93:
>
> On Tue, 5 Feb 2013, Huang Shijie wrote:
>
>> Add a new module parameter 'pattern'. If it is set to zero, we will=20
>> use the 55/AA pattern to torture the nand blocks; if it is set to a=20
>> non-zero value, we will use the random data pattern.
>
> Not a big issue in any way, but if you're using a numeric parameter=20
> value anyway, could not one use a range of the permissable values to=20
> set a seed for the random generation, so that the test can be repeated=20
> with the same set of random numbers?
It's ok to provide a seed to the mtd_torturetest.


>
> Something like
>
> 0 =3D> 55/AA
> -1 =3D> random
> 1 and up =3D> random, specifying seed for random number generator.
>
I will add it in next version.

thanks for your review.

Huang Shijie
