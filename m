Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sdhv9-0005gX-GK
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 13:11:08 +0000
Received: by laap9 with SMTP id p9so2474694laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 06:11:04 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 10 Jun 2012 16:11:04 +0300
Message-ID: <CAJ2oMhJ93QORgUxfCerErreJuKg2z8weu5nKiYGDRrJabDdm9g@mail.gmail.com>
Subject: Q: ubifs writings into flash
From: Ran Shalit <ranshalit@gmail.com>
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

I have some beginner question if I'm allowed...
I would like to know if ubifs is writing stuff to Nand flash after the
application starts.
for example, the /var and /tmp are written into flash ?
I actaully do not want any wrting to Nand flash to be done after the
program starts (or at least to know about all of them and control when
they are done).


Thank You,

Ran
