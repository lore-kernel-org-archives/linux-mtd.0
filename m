Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144FU6-0006qY-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 04:50:14 +0000
Received: from rose.mizi.com ([203.239.30.86])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144FU3-0006qM-00
	for mtd@infradead.org; Fri, 08 Dec 2000 04:50:12 +0000
Received: (from root@localhost)
	by rose.mizi.com (8.11.1/8.11.1) id eB84neN15189
	for mtd@infradead.org; Fri, 8 Dec 2000 13:49:40 +0900
Date: Fri, 8 Dec 2000 13:49:40 +0900
From: SeonKon Choi <bushi@mizi.com>
To: mtd@infradead.org
Subject: DOC2K & mtd/util/nftl_format.c
Message-ID: <20001208134940.A14241@mizi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

hi,

mtd/util/nftl_format.c

    157 
    158     if (meminfo.erasesize != 0x2000) {
    159         printf("Erase size not 8Kb - I'm confused\n");
    160         close(fd);
    161         return 1;
    162     }
    163

It's 0x4000 (16kb) on my DOC2K 16 Mbytes (MD2202-D16, 1.23).

Is there anyone who solve this problem ?

M-System says,
              MD220( )
                    0 - Low profile (16,24,32,48 Mbytes)
                    1 - High profile (72,80,112,144 Mbytes)
                    2 - Low profile (64,96 Mbytes)
                    3 - High profile (160,192,288 MBytes)




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
