From: nicola76@inwind.it (Nicola)
Date: 07 Feb 2003 18:03:24 +0100
Subject: CFI/MTD weird problem
Message-ID: <1044637404.22176.37.camel@localhost.localdomain>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

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
