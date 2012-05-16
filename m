Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhap-0001Vc-Oz
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:00:56 +0000
Received: by pbbrq13 with SMTP id rq13so1519657pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 May 2012 10:00:52 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 May 2012 13:00:52 -0400
Message-ID: <CAETHaKqTBWzfYLyznK03qFepuZ9e-8grtYRASrqLvZmJzO4ebw@mail.gmail.com>
Subject: enabling xattr on existing jffs2 fs?
From: Dave Bender <codehero@gmail.com>
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

Hi,
  I have an existing jffs2 partition and my running kernel currently
doesn't have xattr enabled. If I enable xattr in my kernel, would my
existing jffs2 partition be able store xattrs?

Thanks,
Dave
