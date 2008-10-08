Received: from web58908.mail.re1.yahoo.com ([66.196.100.237])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnbS4-0007tV-30
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 15:59:52 +0000
Date: Wed, 8 Oct 2008 08:59:50 -0700 (PDT)
From: Philip Rakity <prakity@yahoo.com>
Subject: 2GB Nand flash MTD  question
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <46875.40483.qm@web58908.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have also been looking at 2GB flash support in MTD and have something barely working.  Upon reflection it seems that the approach in MTD to deal with real flash size, erase size, page size in real units eg (2GB, 256K, 2048 bytes) causes lots of overflow issues for items that need to fit in a 4 byte field.   In my case the size of my chip is reported as 0x8000 0000 but there are 2 chips so the real size is 0 (overflow). 

I was wondering is anyone has looked at redoing MTD to use the "shifted down" values internally and only returning the real values to user space when needed.    This is an a solution that I am going to explore over the next few days. 

Any thoughts ?

Philip



      
