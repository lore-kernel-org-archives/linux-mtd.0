Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXRy3-000788-IB
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:24:00 +0000
Received: by laai10 with SMTP id i10so1296945laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:23:57 -0800 (PST)
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 05 Dec 2011 08:23:50 +0200
In-Reply-To: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323066236.2316.16.camel@koala>
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

On Sat, 2011-12-03 at 12:20 -0800, Mike Dunn wrote:
> Hi,
> 
> This patch proposes a change to the mtd API for the purpose of returning to
> the caller information on the number of bit errors corrected by the ecc
> facilities of the device during read operations.  The affected functions are
> read() and read_oob().

Mike,

this is quite big patch, and I've realized that it is difficult to
review it because of the size. I know I suggested one big patch, but now
I think we should try to split it, if we can. This way it will also be
easier to pass through dwmw2 because at the end he is the MTD
maintainer.

I can see the following parts in your patch:

1. Mechanical part - no much brains needed, just change prototypes, add
few comments, add NULL arguments everywhere. This is the biggest part. 

2. Implementation part - should be much smaller - implements
max_bitflips support in MTD.

Part 2 is interesting to reveiw, and currently part 1 adds so much noise
that the review becomes difficult. Can you split your patches like that?

I apologize for not suggesting this from the very beginning.

Artem.


P.S. As a side note, I am thinking that with your patch the -EUCLEAN
return code may go away. It has always been a bit ugly interface anyway.
What do you think? My thinking is that we can do this separately later.
But you need to add assertions like:

	WARN_ON(err == -EUCLEAN && max_bitflips == 0);

in interesting places.

It would be easier to do if MTD interface had a single entry point,
though.
