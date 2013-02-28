Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAtWq-00062k-Bs
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 02:47:29 +0000
Message-ID: <512EC54F.3090400@freescale.com>
Date: Thu, 28 Feb 2013 10:47:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8827=E6=97=A5 23:10, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> According to the Open NAND Flash Interface Specification (ONFI) Revisio=
n
> 3.1 "Parameters are always transferred on the lower 8-bits of the data
> bus." for the Get Features and Set Features commands.
>
yes. the set/get features should works in 8-bit.

I have never met a 16-bit onfi nand yet. :)

> So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> they use I/O[15:0]. The Get Features command is easily fixed using 4
> times the read_byte callback. For Set Features error out as there is no
yes. for get features, it's easy to fix it.
> write_byte callback.
Most of the time, the nand controller will overwrite the write_buf hook..=
.
I also think we need a write_byte callback.

thanks
Huang Shijie
