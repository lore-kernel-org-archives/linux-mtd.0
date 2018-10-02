Received: from forward100p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat
 Linux)) id 1g7FKd-0007PX-2P
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 07:43:07 +0000
Received: from mxback13g.mail.yandex.net (mxback13g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:92])
 by forward100p.mail.yandex.net (Yandex) with ESMTP id 195C35100DD5
 for <linux-mtd@lists.infradead.org>; Tue,  2 Oct 2018 10:42:37 +0300 (MSK)
Received: from [192.92.92.32] by ircoc.vrn.ru (MDaemon PRO v12.5.6)
 with ESMTP id md50001681508.msg
 for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2018 10:42:33 +0300
Message-ID: <5BB32167.1040902@ircoc.vrn.ru>
Date: Tue, 02 Oct 2018 10:42:31 +0300
From: =?UTF-8?B?ItCc0Y/RgdC+0LXQtNC+0LIg0JAu0K4uIg==?=
 <myasoedovau@ircoc.vrn.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to organize UBI volumes and power crash
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use UBIFS at my device. I'd like 2 UBIFS volumes, first volume for 
work purposes, and second volume for logs omly. RootFS is in RAM.

Both volumes are R/W, but the first volume is not intended for permanent 
writing. The second volume is intended for permanent writing (logs and 
some data tables).

The second volume may be failured in casual power crash. But the first 
volume would work.

Will it be safe to have only 1 mfd device, and 2 UBI volume on the mtd 
device? Or I must to have 2 separate mtd devices with one UBI volume on 
each? The second approach is not suitable because of device tree 
modifications when I want to change volume sizes/

-- 
Andrey
