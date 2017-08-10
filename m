Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfpbZ-0005Ec-1g
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 15:42:38 +0000
Received: by mail-qt0-x22e.google.com with SMTP id 16so6534788qtz.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2017 08:42:15 -0700 (PDT)
MIME-Version: 1.0
From: Matthew Stanger <matthew_stanger@trimble.com>
Date: Thu, 10 Aug 2017 09:42:14 -0600
Message-ID: <CANr77M27AkvoKo8_WGstSOC9Lw89FuDi0bzwf0ddrkr8=G7NnA@mail.gmail.com>
Subject: Correct way to flash an MTD partition using mtd-utils
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

Hi all,

I'm hoping someone would be able to tell me the correct way to backup
a mtd partition. Right now I'm cleaning up some code that would run
nanddump and pipe it to ubiformat, to dump a RFS from one primary
partition to an identically sized backup partition. The overlaying
filesystem being UBIFS. The issue is if the backup partition has an
extra badblock, than the source, then there isn't enough room. I'm not
an expert in this space so I'm hoping someone can clarify what the
correct way is to do this; I'm pretty sure this method isn't right? Is
using 'mkfs.ubifs' to copy the RFS at the UBIFS layer they way to go
and then restore it with 'ubinize'? Is there a better, faster way?
Thanks for any tips.

Cheers,
Matt
