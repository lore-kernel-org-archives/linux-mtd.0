Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EG3d-0007VS-00
	for mtd-list@infradead.org; Thu, 04 Jan 2001 19:28:17 +0000
Received: from post2.inre.asu.edu ([129.219.110.73])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EG3c-0007VM-00
	for mtd@infradead.org; Thu, 04 Jan 2001 19:28:16 +0000
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0G6N00401KQW2D@asu.edu> for mtd@infradead.org; Thu,
 04 Jan 2001 12:28:08 -0700 (MST)
Received: from webmail2.asu.edu (webmail2.asu.edu [129.219.10.28])
 by asu.edu (PMDF V6.0-24 #47347) with ESMTP id <0G6N003KBKQV3V@asu.edu> for
 mtd@infradead.org; Thu, 04 Jan 2001 12:28:08 -0700 (MST)
Received: (from nobody@localhost)	by webmail2.asu.edu (8.9.3/8.9.3)
 id MAA05868	for mtd@infradead.org; Thu, 04 Jan 2001 12:28:08 -0700
Date: Thu, 04 Jan 2001 12:28:08 -0700 (MST)
From: Russ.Dill@asu.edu
Subject: Supported flash memory
To: mtd@infradead.org
Message-id: <978636488.3a54cec86af09@webmail2.asu.edu>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

After attempting to find flash memory for the LART board (Intel DT28F160F3B),
I've decided I need a plan B. So while I'm calling different suppliers around
the world (any tips here would be appreciated), I'm designing my own StrongARM
board, but with different flash/more flash options. I plan to use what seems to
be the most popular non BGA footprint, TSOP-48. I'm printing out data sheets
from various manufactures now to find the best way to make the most universal
footprint/layout. 

Besides footprints, pinouts, etc, my other concern is software. The logical
combination would seem to be blob/mtd. What flash products are known or probable
to be compatible with this combination, what should I look for to attempt to
assertain compatibilty? Does blob/mtd work transparently with a 16bit or 32bit
ROM bus?

I of course know that blob will have to be modified to accept various flash
configurations, I'm asking about compatibilty without having to completely
rewrite large portions of mtd or blob.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
