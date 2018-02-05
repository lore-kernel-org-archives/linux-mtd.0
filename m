Received: from mail-db5eur01on071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::71b]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eiaRo-0005Rv-GH
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 06:40:15 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <CAFLxGvwhwy8_1piyn6WnS1XsD-eifc55C8nCsv8Eh5mmLz1GMg@mail.gmail.com>
From: Timo Ketola <timo@exertus.fi>
Message-ID: <eb4fbb3b-897d-458e-6e0b-5cdc8599be48@exertus.fi>
Date: Mon, 5 Feb 2018 08:39:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwhwy8_1piyn6WnS1XsD-eifc55C8nCsv8Eh5mmLz1GMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.02.2018 15:44, Richard Weinberger wrote:
> Can you share me this UBI image such that I can have a quick look why
> the invalidation did not work?

Thank you for looking at this!

I sent the image privately to not bother the list with 3M file.

It really is an empty image.


Build commands:

mkfs.ubifs -e 0x1f000 -c 2048 -m 0x800 -o userfs.ubifs

ubinize -o userfs.ubi -m 0x800 -p 0x20000 ubinize.cfg


ubinize.cfg:

[ubifs]
mode=ubi
vol_id=0
vol_type=dynamic
vol_name=user
vol_alignment=1
image=userfs.ubifs
vol_size=1800MiB


--

Timo
