Received: from mail-qc0-x243.google.com ([2607:f8b0:400d:c01::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFxJa-00016y-3Q
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 02:55:14 +0000
Received: by mail-qc0-f195.google.com with SMTP id x13so10110576qcv.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 18:54:51 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 19 Feb 2014 10:54:50 +0800
Message-ID: <CAJy-8bv_Fwzuc1zfHp8osaSat5jDnoLOCZ0K+fJ8OvdE-y6wmg@mail.gmail.com>
Subject: why erase block size can not be less than 8KiB
From: Michael Zhu <boot2linux@gmail.com>
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

Dear all,

I want to make a jffs2 filesystem using 4KiB, but mkfs.jffs2 tell min
erase block size is 8KiB. Why have this limitation ?

I dug the source code, and find code snippet below:

/* If it's less than 8KiB, they're not allowed */
if (erase_block_size < 0x2000) {
  fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
 erase_block_size);
  erase_block_size = 0x2000;
}

If skipping  this check, is there any other side effect ?


B.R.

Michael
