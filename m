Received: from smtp3.stanford.edu ([171.67.219.83] helo=smtp.stanford.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLdCt-000736-Lg
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 19:44:20 +0000
From: David Ramos <daramos@stanford.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Uninitialized memcpy length bug in cfi_staa_writev
 (drivers/mtd/chips/cfi_cmdset_0020.c)
Date: Wed, 11 Feb 2015 11:43:44 -0800
Message-Id: <649777A8-5485-42DC-B2A0-4A271600BED7@stanford.edu>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Our UC-KLEE tool found an uninitialized memcpy length bug in =
cfi_staa_writev (drivers/mtd/chips/cfi_cmdset_0020.c). The bug appears =
in kernel 3.16.3, but it dates back to before the git migration in 2005.

The bug occurs when the initialization of the =E2=80=98thislen=E2=80=99 =
local variable is bypassed (i.e., neither of the if-conditions on lines =
686 and 702 are satisfied). This uninitialized variable is then passed =
to memcpy on line 713, possibly causing memory corruption or a kernel =
segfault.

It appears that the bug can be triggered if the first element passed to =
writev() is fewer than mtd->writesize bytes, in which case both =
if-statements are skipped.

Please let me know if you have any questions.

Thanks,
-David
