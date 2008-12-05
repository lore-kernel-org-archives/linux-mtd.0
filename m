Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Vwx-0007tG-O5
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 08:22:11 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2161235wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Dec 2008 00:22:10 -0800 (PST)
Message-ID: <7ccead5b0812050022hed8dbb7p4957aace524b924a@mail.gmail.com>
Date: Fri, 5 Dec 2008 16:22:09 +0800
From: "Du Zhongdong" <axdududu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [NAND] Do we support COPY_BACK operation in nand flash?
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

Hi, all.

I'm trying to writing a mtd-based driver for HY27UK08BGFM nand flash,
and in the data sheet, there's a COPY-BACK program which is
'configured to quickly and efficiently rewrite data stored in one page
without utilizing an external memory.'

Then I dig through the source: nand.h & nand_base.c, it seems there's
no command for such COPY-BACK operation.

I'm wondering, is there any alternative if I want to take advantage of
this COPY-BACK operation?

Best regards,
Du Zhongdong
