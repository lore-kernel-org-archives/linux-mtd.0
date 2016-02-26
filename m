Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ74H-0003KV-Cr
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 01:19:55 +0000
Received: by mail-io0-x22d.google.com with SMTP id g203so107603469iof.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 17:19:20 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 25 Feb 2016 17:19:20 -0800
Message-ID: <CACwgvgU05i7-72bgWeY3uAx1DFotJ2j3zBz2wDz3-ujeGBm6aQ@mail.gmail.com>
Subject: 
From: Fredrick Prashanth John Berchmans <fredrickprashanth@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, Suresh Siddha <sbsiddha@gmail.com>
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

We are using UBIFS on our NOR flash.
We are observing that a lot of times the filesystem goes to read-only
unable to recover.
Most of the time its due to
a) ubifs_scan_a_node failing due to bad crc or unclean free space.
b) ubifs_leb_write failing to erase due to erase timeout

[ The above would have happened due to unclean power cuts. In our
environment this happens often ]

I checked the code in jffs2. Looking at jffs2 code it looks like jffs2
tolerates the above two
failures and moves on without mounting read-only.
Is my understanding right ?

Could we change the ubifs_scan_a_node to skip corrupted bytes and move
to next node,
instead of returning error ?


Thanks,
Fredrick
