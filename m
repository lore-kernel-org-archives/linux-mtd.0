From: graham.greene@adelphia.net (Graham Greene)
Date: Fri, 7 Feb 2003 12:15:17 -0500
Subject: CFI/MTD weird problem
In-Reply-To: <1044637404.22176.37.camel@localhost.localdomain>
Message-ID: <MFEDIGJMCALJHDLJBAGEIEPKCAAA.graham.greene@adelphia.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Is code executing out of the flash part being queried? Only thing I can
think of off hand.

gg

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin at lists.infradead.org]On Behalf Of Nicola
Sent: Friday, February 07, 2003 12:03 PM
To: linux-mtd at lists.infradead.org
Subject: CFI/MTD weird problem


Booting a linux-2.4.19-rmk4-ds3 I get this weird problem:

1.Without MTD support module I get a good output to console until the
kernel prints out that there is no filesystem support. So my system's
printk works fine.

2.With MTD support module
The CFI probing is working correctly and detects QRY.
When I start tracing the code execution putting some printk into the
MTD/CFI code, I get a weird behavior where the console output is
corrupted BEFORE the calling of the MTD/CFI code, (see minicom log
below).
And I get out some '%' chars instead of the regular numerical values.

After some days debugging this problem I need a suggestion because I
have exhausted ideas about where to search.
TIA




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
