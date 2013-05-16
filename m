Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcnnT-0005X7-M3
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 02:20:00 +0000
Message-ID: <519442BF.80907@freescale.com>
Date: Thu, 16 May 2013 10:21:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v5 03/11] mtd: get the ECC info from the parameter page
 for ONFI nand
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-4-git-send-email-b32955@freescale.com>
 <5193C029.5060104@gmail.com>
In-Reply-To: <5193C029.5060104@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8816=E6=97=A5 01:04, Vikram Narayanan =E5=
=86=99=E9=81=93:
> I wonder what do we do, if the chip is not ONFI compliant?
> which means when the legacy calculation in GPMI goes wrong?
It may goes wrong _sometimes_.

For example, the TC58NVG5D2 requires 40bits per 1024bytes.
the legacy gpmi will fail in this nand. the gpmi assumes it can use all=20
the oob,
so it get a 56bits per 1024types. the 56bits is beyond its hardware's=20
capacity.
it will fail in this case. But with this patch set, the gpmi works fine.

thanks
Huang Shijie
