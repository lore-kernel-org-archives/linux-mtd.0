Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBLoT-0000ds-1b
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 08:59:34 +0000
Message-ID: <51306DF5.60400@freescale.com>
Date: Fri, 1 Mar 2013 16:59:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com> <20130228104819.GH22886@pengutronix.de>
 <513021C3.2000503@freescale.com> <20130301085048.GJ22886@pengutronix.de>
In-Reply-To: <20130301085048.GJ22886@pengutronix.de>
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

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8801=E6=97=A5 16:50, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> puts $byte to I/O[7:0] and 0 to I/O[15:8]. This is what I want it to
> do---not sure if I/O[15:8] should better be tri-stated?
I am not sure too. :)
I do not ever use a 16-bit nand controller.

thanks
Huang Shijie
