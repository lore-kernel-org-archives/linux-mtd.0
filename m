Received: from blu0-omc1-s5.blu0.hotmail.com ([65.55.116.16])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTqKs-0001iJ-K5
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 03:50:47 +0000
Message-ID: <BLU142-W266768C71B78201E0D0A4A9F6D0@phx.gbl>
From: =?gb2312?B?wfWyqg==?= <bo-liu@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: about oobsize and ooboffs
Date: Fri, 15 Aug 2008 11:50:44 +0800
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi , all

I have a question about the "mtd->oobsize" and "ops->ooboffs" .
I think "mtd->oobsize" is the whole spare area size for nand flash.
and "ops->ooboffs" is the oob's offset in the spare area only when defined marco MTD_OOB_PLACE.

But in file nand_base.c 
funtion nand_do_read_oob() first calls chip->ecc.read_oob, then calls nand_tranfser_oob().
if defined marco MTD_OOB_PLACE. 
nand_tranfser_oob() will call funtion memcpy(oob,chip->oob_opi + ops->offs, len), where "len = mtd->oobsize".

My question is if "ops->offs" is not 0, then memcpy will failed ? becausse chip->ecc.read_oob() just read "mtd->oobsize" to chip->oob_opi's buffer.

Thank you!
Bob



_________________________________________________________________
快来看看这些猫咪有多逗，爆笑！
http://cnweb.search.live.com/video/results.aspx?q=%E5%8F%AF%E7%88%B1%E7%8C%AB%E5%92%AA&Form=MEVHAA
