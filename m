Received: from fk-out-0910.google.com ([209.85.128.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsAT4-0000uY-I8
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 06:11:47 +0000
Received: by fk-out-0910.google.com with SMTP id 18so2871241fks.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 23:11:45 -0700 (PDT)
Message-ID: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
Date: Tue, 21 Oct 2008 14:11:45 +0800
From: "Du Zhongdong" <axdududu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [NAND flash driver] What would mtd do if read returns -EBADMSG (ecc
	failed)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm doing a NAND flash driver, and I suppose if ecc cannot be
corrected while read something from NAND flash, that block should be
marked bad, is that right?

Reading through nand_base.c I notice that mtd->read = nand_read;
nand_read() [MTD Interface] calls nand_do_read_ops() [Internal] to do
the work,  and in nand_do_read_ops():
        if (mtd->ecc_stats.failed - stats.failed)
		return -EBADMSG;
-EBADMSG then is returned to the MTD layer. I tried to trace this
information in the MTD code, but there seems to be so many and I
cannot be sure how MTD handles this "-EBADMSG".  Any help or
information is appreciated.


Best regards,
Du Zhongdong
