Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RKEm-0005EW-00
	for mtd-list@infradead.org; Tue, 22 Aug 2000 21:01:32 +0100
Received: from mb04.swip.net ([193.12.122.208])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13RKEk-0005EQ-00
	for mtd@infradead.org; Tue, 22 Aug 2000 21:01:31 +0100
Received: from win95 (dialup212-1-33.interloop.se [130.244.212.33])
          by mb04.swip.net (8.8.8/8.8.8) with SMTP
          id WAA17097 for <mtd@infradead.org>;
          Tue, 22 Aug 2000 22:00:09 +0200 (MET DST)
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: pmc551.c doesn't compile w/ egcs-2.91.66
Date: Tue, 22 Aug 2000 22:01:19 +0200
Message-ID: <000f01c00c73$bcdac480$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <14787.966367168@cygnus.co.uk>
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


 FYI: I can't get my egcs-2.91.66 to compile pmc551.c w/o adding either -=
O1
(or -O0) or -g. I have no idea why, it just stops right before the last
'defined but unreferenced static'-warning.


//Bj=F6rnen.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
