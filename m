Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5kYz-0003LC-Os
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2004 11:59:21 +0000
Received: from sonne.eurodsn.de (sonne.eurodsn.de [192.168.0.11])
	by mserver.eurodsn.de (Postfix) with ESMTP id 1365B4F57D
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Mar 2004 12:59:03 +0100 (CET)
From: Juergen Beisert <jbeisert@eurodsn.de>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 23 Mar 2004 12:55:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200403231255.52627.jbeisert@eurodsn.de>
Subject: Problems using JFFS2 on my Samsung NAND chip
Reply-To: jbeisert@eurodsn.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello group.

I have trouble using a JFFS2 filesystem on my NAND chip.

I have tried:

emb> eraseall --jffs2 /dev/mtd/0

Last ouput of this command is:
Erasing 16 Kibyte @ ffc000 -- 99 % complete. Cleanmarker written at ffc000.

emb> mount -t jffs2 /dev/mtdblock/0 /mnt
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 1024
mount: Mounting /dev/mtdblock/0 on /mnt failed: Invalid argument

My NAND is a Samsung K9F2808U0B chip. I found a small discussion in february 
2004 in this list about this chip ("JFFS2 NAND support - Mount failure on 
"good" filesystem" by Joshua Wise).
So I have updated my mtd sources but I get the same results as before.

Any hints?

JB
