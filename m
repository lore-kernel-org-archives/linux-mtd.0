From: robert@schwebel.de (Robert Schwebel)
Date: Sun, 9 Feb 2003 19:08:11 +0100
Subject: patchin script
Message-ID: <20030209180810.GN31292@pengutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thomas, 

Debian's grep does not understand the "-m N" switch you used in the 
patchin.sh script. Could you change it to reflect this behaviour? The
script does currently fail horribly when being invoked on a debian
machine. 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Braunschweiger Str. 79,  31134 Hildesheim, Germany
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
