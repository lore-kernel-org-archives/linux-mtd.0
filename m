Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2nR-0006np-Es
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:36:11 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Fastmap update v2 (pile 2)
Date: Sun, 30 Nov 2014 12:35:34 +0100
Message-Id: <1417347340-6872-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

this is pile 2 of 7.

[PATCH 1/6] UBI: Fastmap: Fix memory leaks while closing the WL
[PATCH 2/6] UBI: Fastmap: Don't allocate new ubi_wl_entry objects
[PATCH 3/6] UBI: Fastmap: Notify user in case of an
[PATCH 4/6] UBI: Fastmap: Wrap fastmap specific function in a ifdef
[PATCH 5/6] UBI: Fastmap: Fix fastmap usage in ubi_volume_notify()
[PATCH 6/6] UBI: Fastmap: Fix memory leak while attaching

Thanks,
//richard
