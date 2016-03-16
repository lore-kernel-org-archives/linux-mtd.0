Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ag8AR-0001Jd-4w
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2016 09:55:03 +0000
Received: by mail-lf0-x234.google.com with SMTP id e138so14441296lfe.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2016 02:54:42 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Mar 2016 09:54:41 +0000
Message-ID: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
Subject: UBIFS question
From: Martin Townsend <mtownsend1973@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have an board with a 512MB Raw NAND flash memory device and 4GB
Managed eMMC flash memory device.  I would like to take advantage of
this and maintain a root filesystem on each and keep them in sync so
upgrades will upgrade each filesystem.  I can then use one of them as
a redundant image that can be used to correct the primary one or fail
over on device failure.  I have UBIFS on the raw NAND flash and ext3
on the eMMC flash.  My first thought was can I create a mirror using
raid but after researching it looks like the linux SW raid, although
very flexible, only supports block devices which rules out UBIFS.  I
could see some mails about a block device layer for UBI but I seem to
remember that this was read only or had certain restrictions.

Next I thought about maybe using Docker so I could switch between the
2 filesystems but saw a mail that UBIFS doesn't support WHITEOUT
feature that docker would require from the underlying filesystem as it
uses union/overlay filesystems.

Just wanted to check that these assumptions are correct and I haven't
missed something and also if anyone knows of another method I would be
very interested in hearing it.

Thanks in Advance,
Martin.
