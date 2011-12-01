Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW2Kb-0001YY-Og
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:49:26 +0000
Received: by lagu2 with SMTP id u2so786973lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:49:24 -0800 (PST)
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 01 Dec 2011 10:49:20 +0200
In-Reply-To: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322729362.2332.15.camel@koala>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jamie Iles <jamie@jamieiles.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Andres Salomon <dilinger@queued.net>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, Olof Johansson <olof@lixom.net>,
 Vimal Singh <vimal.newwork@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks you, a nit-pick below.

On Mon, 2011-11-28 at 17:01 -0800, Mike Dunn wrote:
>   * @datbuf:	data buffer - if NULL only oob data are read/written
>   * @oobbuf:	oob data buffer
> + * @max_bitflips: for read operations, greatest number of bit errors corrected
> + *                on any one minimum i/o unit (e.g., nand page)
> + *                (value returned to caller by the driver)
>   *

Could you please make this change in the comment: s/greatest/maximum/ -
I find it easier to understand that way and it is more consistent with
the variable name.

Artem.
