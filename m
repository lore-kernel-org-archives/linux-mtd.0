From: asoneofus@nm.ru (A.L. Klyutchenya)
Date: Wed, 26 Feb 2003 11:09:24 +0300
Subject: Is Samsung K9F5608U0B-YCB0 NAND Flash Supported
In-Reply-To: <20030226054016.23676.qmail@web80411.mail.yahoo.com>
References: <20030226054016.23676.qmail@web80411.mail.yahoo.com>
Message-ID: <200302261109.25118.asoneofus@nm.ru>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

26 ??????? 2003 08:40, Kevin Kaichuan He ???????:
> This is a 16Mbtes, 8bits NAND Flash from Samsung.
> I'm wondering if it's supported already. IOr is
> there a similiar hardware specific NAND driver
> I can copy and modify ?

In sources of mtd (drivers). All ok :-)
http://linux-mtd.infradead.org/tech/nand.html
description of creating driver. All notes in this document

Sample drivers: autcpu12.c, edb7312.c (eausy, as first)

-- 
????????!      
      ____   __
     /   |  / / ?. ?. ????????
    / /| | / /  (asoneofus)
   / /_| |/ /   mail:   asoneofus at kde.ru
  / ____  _ \   www:    http://www.qt.kde.ru
 / /   | | \ \  icq:    113679387
/_/    |_|  \_\ 
