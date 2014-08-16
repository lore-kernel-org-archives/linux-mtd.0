Received: from mail-qc0-x22b.google.com ([2607:f8b0:400d:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIlC2-0002GN-95
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 21:07:18 +0000
Received: by mail-qc0-f171.google.com with SMTP id r5so3513105qcx.30
 for <linux-mtd@lists.infradead.org>; Sat, 16 Aug 2014 14:06:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1408220271-21455-1-git-send-email-zajec5@gmail.com>
References: <1408220271-21455-1-git-send-email-zajec5@gmail.com>
From: Kevin Cernekee <cernekee@gmail.com>
Date: Sat, 16 Aug 2014 14:06:35 -0700
Message-ID: <CAJiQ=7Ab6XG6CyEapwEskGTTsCDbvscQ_WQCNKCiHD-pqb8XKw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: add Kconfig option to disable 4K sectors
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 16, 2014 at 1:17 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> +config MTD_SPI_NOR_USE_4K_SECTORS
> +       bool "Use small 4096 B erase sectors"
> +       default y
> +       help
> +         Many flash memories support erasing small (4096 B) sectors. Dep=
ending
> +         on the usage this feature may provide performance gain in compa=
rison
> +         to erasing whole blocks (32/64 KiB).

I would also note that on some SPI-NOR devices, erasing 16x 4K sectors
is significantly slower than erasing 1x 64K block.  There is also the
question of balancing filesystem overhead versus internal
fragmentation.

It probably does make sense to let the user weigh the tradeoffs and
make the right decision for his application instead of hardcoding the
policy into the driver.
