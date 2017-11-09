Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCaNc-0002NS-MU
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 00:07:38 +0000
Received: by mail-io0-x22e.google.com with SMTP id d66so7915578ioe.5
 for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2017 16:07:16 -0800 (PST)
MIME-Version: 1.0
From: Frank Mori Hess <fmh6jj@gmail.com>
Date: Wed, 8 Nov 2017 19:07:14 -0500
Message-ID: <CAJz5OpfT79Fu0-bTKxcuMBXp140xUF1pp0kS0Q=F90DeUqN5RA@mail.gmail.com>
Subject: jffs2: stack dump on sync
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I'm using kernel 4.1.17 and I noticed jffs2 dumping stacktraces on
sync, as reported here:

https://patchwork.ozlabs.org/patch/298933/#689224

As far as I can tell, this has not been fixed in newer versions
although I haven't tested them.  It seems the problem occurs when
CONFIG_JFFS2_FS_WRITEBUFFER is enabled, which causes jffs2_sync_fs()
in jffs2/super.c to call

cancel_delayed_work_sync(&c->wbuf_dwork);

However, wbuf_dwork is generally not initialized, producing the stack dump.

-- 
Frank
