Received: from dns.kernelconcepts.de ([212.60.202.194]
	helo=gateway.kernelconcepts.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGNhM-0000LZ-Vg
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 20:47:57 +0100
Received: from pd955b35a.dip.t-dialin.net ([217.85.179.90] helo=lem)
	by gateway.kernelconcepts.de with asmtp (Exim 3.35 #1 (Debian))
	id 1BGNdJ-00021r-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Apr 2004 21:43:45 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1082576874.7915.9.camel@lem>
Mime-Version: 1.0
Date: Wed, 21 Apr 2004 21:47:55 +0200
Content-Transfer-Encoding: 7bit
Subject: Wrong device id
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

Looks like there is a wrong device ID in this file:

The id of the AM29DL800BB flash ic is 0x22CB instead of 0x22C8.
At least my device is using it and shows this id. Some other clue about
this may be found in tuxscreen code:
http://cvs.sourceforge.net/viewcvs.py/tuxscreen/jflash/flash.h?rev=1.2

Greetings

Florian
-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: 0271-771091-14 
and the reality of tomorrow.            Fax: 0271-771091-19 
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de 

6C 44 30 4C 43 20 6B 61  16 07 0F AA E6 97 70 A8
