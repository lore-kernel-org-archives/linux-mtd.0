Received: from [213.154.159.82] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16flSI-0005Hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 17:31:59 +0000
Received: from localhost (IDENT:rcorlan@localhost.localdomain [127.0.0.1])
	by pinot.profis.ro (8.9.3/8.8.7) with ESMTP id TAA00638
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 19:46:39 -0500
Date: Tue, 26 Feb 2002 19:46:39 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: linux-mtd@lists.infradead.org
Subject: nftl problem
In-Reply-To: <0202261445370B.10190@thomas>
Message-ID: <Pine.LNX.4.10.10202261939200.608-100000@pinot.profis.ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Before i gave up on nftl, i found the following problem: nftl accesses the
flash through the read_ecc and write_ecc function pointers in the slave
mtd_info structure. However, when the slave structure is initialised, only
the read and write function pointers are filled, not the read_ecc and
write_ecc; i got kernel panic out of this, which got away when i filled
the fields.

Anyway, i gave up on nftl; my mtd seems to run ok now, as i put a ext2
filesystem on the mtdblock0 device and it runs fine.

But i can;t get jffs2 to work - i used the code from the latest snapshot
on the infradead site - is it ok? Can i get a 'stable' version somewhere?
my kernel is 2.4.2.

Thanks,

Radu


-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1, 
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!   
                 Use Linux!                       
-------------
