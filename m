Received: from mail-ia0-x232.google.com ([2607:f8b0:4001:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVfj1-0007Tp-KF
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 10:17:56 +0000
Received: by mail-ia0-f178.google.com with SMTP id j38so3481348iad.37
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2013 03:17:54 -0700 (PDT)
MIME-Version: 1.0
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 26 Apr 2013 12:17:34 +0200
Message-ID: <CACQ1gAhY5TbH3JUYMtRk9ETOLn-ZFNbwKQ_5=j_hnPpZ-1fj_w@mail.gmail.com>
Subject: PMECC capability
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've got a (dumb?) question about the error correct capability of atmel PMECC:
Do we have to use the exact error capability required by the nand
chipset or we can use a bigger one ?

use case:
I'm working on at91sam9g35-cm board which require 1 bit per 512bytes
correction and also on a at91sam9g35-cm+phy which require 4bits per
512bytes correction.

If I use for both a 4b/512B correction, this won't hurt ?
There won't be any strange side effect ?

Moreover, as I don't use the OOB data, I could set a 8b/512B correction.
Will it be completely useless ?


Regards,

Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
