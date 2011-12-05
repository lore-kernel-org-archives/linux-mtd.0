Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXftx-0001Ni-0z
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 21:16:43 +0000
Received: by laah2 with SMTP id h2so216867laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 13:16:37 -0800 (PST)
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 05 Dec 2011 23:16:34 +0200
In-Reply-To: <4EDD09E1.8070207@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <1323066236.2316.16.camel@koala> <4EDD09E1.8070207@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323119796.2173.3.camel@koala>
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-05 at 10:13 -0800, Mike Dunn wrote:
> OK.  But you may still be underestimating the quantity of code that warrants
> review.  Since we're going back to multiple patches anyway, how about four patches:
> 
> 1. api change to mtd.h (a few lines just to put the rest in context)
> 2. nand, onenand
> 3. mtd infrastructructure: mtdblock, mtdchar, mtdpart, mtdconcat, ...
> 4. rote changes

But you need to maintain bisectability. The kernel has to be compilable
and working between all these steps. The only way to do this is to add 2
new interfaces without removing the old ones, the do all the changes in
N stpes, then remove old interfaces. When I start thinking about that,
it looks too much, so I am not sure.

Artem.
