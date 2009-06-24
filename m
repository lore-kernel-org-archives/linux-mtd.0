Received: from web56502.mail.re3.yahoo.com ([66.196.97.31])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJLSM-0004Vo-KW
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 05:55:45 +0000
Message-ID: <390041.28156.qm@web56502.mail.re3.yahoo.com>
Date: Tue, 23 Jun 2009 22:55:37 -0700 (PDT)
From: mital pawar <pmits_11@yahoo.com>
Subject: JFFS2 summary size
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mital Pawar <mitalpawar@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
   I am  using jffs2 with summary support. But size of file is increases by around 10 MB  after applying summary to jffs2 file.
   We are using nand of 64MB having 16KB erase block size. 

    mkfs.jffs2 --pad --eraseblock=0x4000 -l -n -d  ROOTFS_PATH  -o outputfile.jffs2
    sumtool -n -l  -e 0x4000  -p -i  outputfile.jffs2  -o outputfile-sum.jffs2
    
    size of   outputfile.jffs2 is 31 MB
       but size of    outputfile-sum.jffs is 42 MB

Please  tell me why there is  huge  increase in size with summary


Regards
Mital Pawar



      
