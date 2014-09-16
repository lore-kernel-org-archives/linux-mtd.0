Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTtGp-0000Sw-Np
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 13:58:16 +0000
Received: by mail-pd0-f177.google.com with SMTP id y10so8698879pdj.22
 for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2014 06:57:52 -0700 (PDT)
MIME-Version: 1.0
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Sep 2014 15:57:32 +0200
Message-ID: <CAGm1_ktgNoGkxNn-FVuE5nW2pSpXwWX+1Q4D+juMJJBhgUkm-w@mail.gmail.com>
Subject: MTD autorepartitioning
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: roman.tereshonkov@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've found an old discussion, that references following commits (mtd:
add BLKPG API based repartition support) and also this patch
https://patchwork.ozlabs.org/patch/60224/.

What user space tool can I use to repartition my NAND flash? There is
no "master" /dev/mtdblock device, that I can pass to fdisk or do I see
it wrong?

Regards,
Yegor
