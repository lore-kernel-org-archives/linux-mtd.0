Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW2d2-0003nL-R0
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 09:08:29 +0000
Received: by lagu2 with SMTP id u2so795216lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 01:08:27 -0800 (PST)
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Dec 2011 11:08:24 +0200
In-Reply-To: <20111129144042.1979a587@skate>
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
 <20111129144042.1979a587@skate>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322730506.2332.30.camel@koala>
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
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

On Tue, 2011-11-29 at 14:40 +0100, Thomas Petazzoni wrote:
> Also, another option is to allow max_bitflips to be NULL, which would
> simplify things such as :

Yes, I vote for this solution.

> Another question: is the max_bitflips information sufficient (i.e on a
> large read with multiple pages, you will only get the value for the
> worst page) ? Don't you need the bitflip count on a per-page basis ?

I do not think we need accurate per-page information.

Artem.
