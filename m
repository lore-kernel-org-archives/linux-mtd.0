Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7FG-0004Gs-Cu
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 20:31:59 +0000
Received: by mail-lb0-f181.google.com with SMTP id l4so1324925lbv.40
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 12:31:34 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 5 Nov 2014 14:31:34 -0600
Message-ID: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
Subject: mtd: nand: lock unlock function
From: Zhi Li <lznuaa@gmail.com>
To: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 boris.brezillon@free-electrons.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does any know the reason why there are nand_lock and nand_unlock
function in nand_base.c, but

        mtd->_lock = NULL;
        mtd->_unlock = NULL;

Not set to nand_lock and nand_unlock?


best regards
Frank Li
