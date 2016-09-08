Received: from mail-it0-x22f.google.com ([2607:f8b0:4001:c0b::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bi2Gt-0002Ao-HO
 for linux-mtd@lists.infradead.org; Thu, 08 Sep 2016 16:33:52 +0000
Received: by mail-it0-x22f.google.com with SMTP id i184so267127017itf.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2016 09:33:30 -0700 (PDT)
MIME-Version: 1.0
From: Philippe Reynes <tremyfr@gmail.com>
Date: Thu, 8 Sep 2016 18:33:29 +0200
Message-ID: <CAC=8w93R_8Tymub9fz+mDa3W-=qPGAzLUFfbOuh_NVG+Ac=vwg@mail.gmail.com>
Subject: question about spi nor locking
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

Hi all,

We plan to work on spi nor locking, but, not only use the lock by
block with BP{0,1,2}.

We also plan to use advanced features. For example allow the user to
choose the "mode"
of lock by block : volatile (the lock disapear after a reboot),
non-volatile (the lock stay
after a reboot), otp (the lock can't be changed or removed). Another
example is to lock
the spi nor sector by sector.

Do you (the mtd community/subsystem) interrested by integrate those
kind of feature in the kernel please ?
If yes, may be someone is already working on it, are you aware of such
development please ?

Regards,
Philippe
