Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2FhI-0003sV-JS
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 13:05:51 +0000
Received: by mail-pg1-x542.google.com with SMTP id 2-v6so1020375pgo.4
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2018 06:05:33 -0700 (PDT)
From: Andrew Worsley <amworsley@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org (open list:UNSORTED BLOCK IMAGES (UBI)),
 linux-kernel@vger.kernel.org (open list)
Subject: Round up the average EC for recovered EB to defer their reuse
Date: Tue, 18 Sep 2018 23:05:20 +1000
Message-Id: <20180918130521.22880-1-amworsley@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We suggest rounding up the EC(Erase Count) for recovered EB(Erase Blocks) so
they are less likely than averaged to be re-used. The EBs which have lost their
EC header page and need to be reset are likely to be more worn than average
so it is better to use a larger than average number rather than less than
average number.

        Andrew Worsley
