Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yi9ul-00006G-V6
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2015 23:06:44 +0000
Received: by qku63 with SMTP id 63so44964248qku.3
 for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2015 16:06:20 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 Apr 2015 16:06:07 -0700
Message-ID: <CAAK6Zt2r=pjG4XtX6V7p37QOLATAgYR+ov2Kn=k10RW1bDS5bg@mail.gmail.com>
Subject: fio MTD/NAND support patches out for review
From: Daniel Ehrenberg <dehrenberg@google.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

I am interested in using fio as a basis for NAND flash
characterization and qualification, so I wrote a patchset which adds
an mtd fio ioengine and generates workloads which could work on NAND
flash. I didn't want to spam this list with the whole patchset, since
it doesn't modify code that's in the kernel or mtdutils, but I'd
appreciate your comments or suggestions. I did take (fio is GPL2, like
mtd-utils) a few files from mtd-utils for this, since it didn't look
like that tends to be available as a shared library. You can find the
thread at

http://thread.gmane.org/gmane.comp.storage.fio/1569

Thanks,
Dan
