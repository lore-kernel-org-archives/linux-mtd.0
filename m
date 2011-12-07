Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYMjj-0001hN-So
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 19:01:00 +0000
Received: by iaby26 with SMTP id y26so1509042iab.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 11:00:57 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 7 Dec 2011 21:00:57 +0200
Message-ID: <CAK-xBPKEwVN743EV1HC3BaKQ3PUsF6rCwiF4Pq4WP8_3c9m_Sw@mail.gmail.com>
Subject: A question about ubiformat and and some flash utils.
From: yoav feldman <yoavfeld@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

i just picked up in google a messaging about flashing ubi images.
i have also problem with the erase speed,  and i wonder if u can
answer about some qustion that i have.
i found there this peregraph:

"OK. But did you consider to pre-create the image with ubinize and
mkfs.ubifs tools and just flash the raw image in production? This is the
fastest possible way."

This is the method that i'm trying to use, but things going too slow:
1. ubiformat is taking too much time (about 5-10 min).
2. for burning linux kernel image, i'm using flash_eraseall and
flashcp. the flash_eraseall also takes long time.

Do you know what can i to decrease the erase time?
its important for me to erase the whole flash when i'm updating the software.
Thanks alot!

Yoav Feldman.
