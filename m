From: kschoo70c@netscape.net (kokseng choo)
Date: Mon, 17 Feb 2003 16:02:35 +0000
Subject: copy filesystem to nand flash without ecc
References: <4EF56021.2C81712E.0265FBE9@netscape.net> <200302131752.54716.tglx@linutronix.de> <3E50D76A.40300@netscape.net> <200302171637.42445.tglx@linutronix.de>
Message-ID: <3E51079B.8090002@netscape.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

tglx at linutronix.de wrote:

>On Monday 17 February 2003 13:36, kokseng choo wrote:
>  
>
>Yep, but you still do not write fs-specific information in the OOB-area, 
>except the ecc.
>This still solves not the problem to write a fs-image to the chip. Therefor we
>need a function, which includes writing of OOB data and filesystem dependent 
>oob-layout selection.
>
Am I right to say that, I only have to put the fix pattern value -- 
which is cleanMarker in the case of JFFS2
in the OOB?  If this assumption is true, then I was thinking about let 
the erase do the job. Because,
 we can modify erase function such that we can have "erase --jffs2-oob" 
or "erase --yaffs-oob".
On the other hand, we probably can not change cp function to have "cp 
--jffs".

regards
choo
