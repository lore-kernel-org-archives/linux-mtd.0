Received: from mail.gsl.com.hk ([203.198.205.214] helo=hkgdominogw.gsl.com.hk)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LMIqc-0001AS-V9
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 09:12:39 +0000
Message-ID: <496B05EF.7060401@gsl.com.hk>
Date: Mon, 12 Jan 2009 16:57:19 +0800
From: Jacky Lam <jackylam@gsl.com.hk>
To: linux-mtd@lists.infradead.org
Subject: Some problem in real application
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=Big5
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I am new to UBI and want to apply it in a real production application.
However, I have a technical problem and hope anyone can give me some advice.

I use NFTL before. While in production, we use some self-made IO
programmer to program the NAND flash. We first write the data and ecc
(in spare area), and then read then back. After verify it with ECC, we
can tell whether the data is written correctly or not.

However, in UBI, it doesn't use spare area and embedded the ECC
information in main area. Will it be difficult to extract the ECC
information from the read back data in order to do verification? I am
worry about our self-made IO programmer is too slow for handling UBI.
(Or any other clever way to do that?)

If my question is not clear or even wrong, please point me out. Thanks
very much for help.

BR,
Jacky


Disclaimer: This email and attachments are confidential. If you are not the intended recipient, you must not pursue, use, disseminate, distribute or copy this message, whether in whole or in part. If you have received this message in error, please notify us immediately by email or telephone us at (852) 2832 8228 and delete this message from your system. We do not represent that this email may not be interfered with, may not contain computer viruses or other defects and may not be successfully replicated on other system. 
