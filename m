Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12tqyR-0001LU-00
	for mtd-list@infradead.org; Mon, 22 May 2000 13:06:19 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12tqyR-0001LO-00
	for mtd@infradead.org; Mon, 22 May 2000 13:06:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-kernel@vger.rutgers.edu
Cc: mtd@infradead.org
Subject: HDIO_GETGEO vs. BLKGETSIZE
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 May 2000 13:06:17 +0100
Message-ID: <29342.958997177@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Is it permitted for a driver to returns CHS values for HDIO_GETGEO which, 
when multiplied together, don't match the value returned by BLKGETSIZE?

i.e. Is the code in the second 'if' statement below actually necessary?


        thisNFTL->cylinders = 1024;
        thisNFTL->heads = 16;

        temp = thisNFTL->cylinders * thisNFTL->heads;
        thisNFTL->sectors = thisNFTL->nr_sects / temp;

        if (thisNFTL->nr_sects % temp) {
                thisNFTL->sectors++;
                temp = thisNFTL->cylinders * thisNFTL->sectors;
                thisNFTL->heads = thisNFTL->nr_sects / temp;

                if (thisNFTL->nr_sects & temp) {
                        thisNFTL->heads++;
                        temp = thisNFTL->heads * thisNFTL->sectors;
                        thisNFTL->cylinders = thisNFTL->nr_sects / temp;
                }
        }
	/* Do we really need to do this.... ? */
        if (thisNFTL->nr_sects != thisNFTL->heads * thisNFTL->cylinders *
            thisNFTL->sectors) {
                printk("NFTL capacity reduced for geometry reasons from %lx to %x sectors\n", thisNFTL->nr_sects, 
                       thisNFTL->heads * thisNFTL->cylinders * thisNFTL->sectors);

                thisNFTL->nr_sects = thisNFTL->heads * thisNFTL->cylinders * thisNFTL->sectors;
        }


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
