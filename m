Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143WSz-0003vi-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 04:46:05 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143WSx-0003vb-00
	for mtd@infradead.org; Wed, 06 Dec 2000 04:46:04 +0000
Date: Wed, 6 Dec 2000 14:45:59 +1000
Message-Id: <200012060445.OAA20682@singularity.tronunltd.com>
To: mtd@infradead.org
Subject: Millennium
From: "Ian" <Relativity@HumanHeuristic.com>
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Is there any firmware required on the DoC2001 to make it perform its 8 x bootblock 
memory magic?  .. or is it all done in glue logic?

If the answer to that is an overwhelmingly loud "Well DUH .. of course it requires firmware 
to do its bootblock magic", then Q2 is;

  Isn't that firmware going to be blown away whenever I go to write over the first 1024
bytes .? .. ie .. "doc_loadbios", and the "erase /dev/mtd0 0 128" are both wiping out 8k
of DoC from its origin ...


Thanks in advance ...

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
