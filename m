Received: from gv-out-0910.google.com ([216.239.58.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ko0ZY-0002ED-CR
	for linux-mtd@lists.infradead.org; Thu, 09 Oct 2008 18:49:16 +0000
Received: by gv-out-0910.google.com with SMTP id n40so105903gve.5
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Oct 2008 11:49:14 -0700 (PDT)
Message-ID: <fbb0532c0810091149h65db537ag7ffc42b7d39475c9@mail.gmail.com>
Date: Fri, 10 Oct 2008 02:49:14 +0800
From: "=?GB2312?B?wfjV8dbQ?=" <liuzz1983@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: nftl module problem
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

hello
    this is my first time to post email to this  list ,if I do not
follow the rules,I am sorry
    recently,I tried the nftl module in MTD,I found it could not work
well, so I debug it , and found one place that I thought it was the
wrong place.

     in the nftlcore.c file ,line 178 to 198 ,the function nftl_write
,as follows:

-- static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
		   --   size_t *retlen, uint8_t *buf, uint8_t *oob)
--{
	--struct mtd_oob_ops ops;
	--int res;

	--ops.mode = MTD_OOB_PLACE;

	--ops.ooboffs = offs;------------------------------------this place
,I thought i should be 0 ,or offs&(mtd->writesize-1), if the value is
offs, it will be over, and cannot work


	--ops.ooblen = mtd->oobsize;
	--ops.oobbuf = oob;
	--ops.datbuf = buf;
	--ops.len = len;

	--res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
	--*retlen = ops.retlen;
	--return res;
--}

  I debug it on nandsim (I made a little change on nftl to let it work
on nandsim,just change the nftl_add_mtd function, let it can
recongnize nandsim)
  I change ops.ooboffs=offs into ops.oobffs=0, it can work ;

 anyone could give me an answer whether my change is right?
