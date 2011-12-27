Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfeXF-0007vT-BO
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 21:26:14 +0000
Received: by iadk27 with SMTP id k27so23182564iad.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 13:26:11 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 27 Dec 2011 23:26:11 +0200
Message-ID: <CAK-xBP+nE0eiMw+TPEsWwgCDwxyv7ixg9S2Dv1pJaBLFaUXmRw@mail.gmail.com>
Subject: flashcp tool
From: yoav feldman <yoavfeld@gmail.com>
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

Hello,

i'm using flashcp for flashing a ubi image on a nor flash.
when flashcp is started it seems that it also erasing.

What does it erase? the whole mtd? or just the eraseblocks that the
image should be burned to?
Can i be sure that all the old data on the mtd is being deleted?

Thanks
Yoav.
