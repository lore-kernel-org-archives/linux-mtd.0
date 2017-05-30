Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFdoI-0007O3-9T
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 09:51:31 +0000
Received: by mail-qk0-x22a.google.com with SMTP id u75so64122357qka.3
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 02:51:08 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Tue, 30 May 2017 11:51:07 +0200
Message-ID: <CAJbz7-0+WijkdxuwL_xvjwTWfzWcqL5PHAqSwGbwV=txQVnnAA@mail.gmail.com>
Subject: [PATCH v2 0/3] mtd:nor:ppb_unlock fixes
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,
as you advised I come back with v2 patch, now it is the series
of three fixes I found them during the testing of the original fix.

>From the fixes it is evident that PPB unlocking is not so much
widely used. What is understandable as usually the flashing
is done in bootloader. At least in projects I was involved before.

Anyway, I can say I tested the code only on one-flashchip
configuration, so I'm not 100% sure if all will be ok with multichip
setting. All my old embedded boards have unfortunatelly only
one nor chip.

As I noted already, the original issue was very slow unlocking
on Spansion S29GL01GS, what led in really horrible timing,
sometimes in minutes! With the fix (when only one chip unlock
cmd is used) the operation returns to the "standard" behaviour
whats make the whole system happy again.

BR.
/Honza
