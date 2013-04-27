Received: from mail-qe0-f51.google.com ([209.85.128.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UW5ce-00065H-2m
 for linux-mtd@lists.infradead.org; Sat, 27 Apr 2013 13:57:04 +0000
Received: by mail-qe0-f51.google.com with SMTP id 1so3327056qec.10
 for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2013 06:57:02 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 27 Apr 2013 21:57:02 +0800
Message-ID: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
Subject: UBI torture_peb() bad block detection problem
From: Qiang Yu <yuq825@gmail.com>
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

Hi guys,

I'm writing MTD driver for Allwinner A10 nand controller. Now there is
a problem with the UBI torture_peb() function. From the code and UBI
doc, a PEB will be treated as bad when read with bit-flip after erase.
But with SAMSUNG K9GBG08U0A flash chip, sometimes the bit-flip does
happen even after being erased.

My question is why make this a rule to detect bad block in
torture_peb()? A PEB won't have bit-flip when just being erased?

Regards,
Qiang
