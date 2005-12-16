Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnBwZ-0001z5-Cz
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 04:32:44 -0500
Message-ID: <43A2898F.5030205@ru.mvista.com>
Date: Fri, 16 Dec 2005 12:31:59 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <20051215122842.7ec739ca.vwool@ru.mvista.com>
In-Reply-To: <20051215122842.7ec739ca.vwool@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] HW ECC optimization
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So, if noone disagrees, I'm gonna commit that...

Vitaly

Vitaly Wool wrote:

>Hi,
>
>currently the whole page is being written for nand_write_oob in HW ECC case.
>This is done in order to support some HW ECC generators which need a whole page to be written to generate proper ECC. However, for most of those generators it's not necessary and it results in perfrormance penalty during OOB writes.
>Well, the patch inlined below presents a proof-of-concept approach for speeding this up. The main problem is how to distinguish between different types of HW ECC generators? I'm using SYNDROME flag for this purpose, although it may make sense to create a separate one.
>
>Anyway, here's some measurements with and w/o this patch applied on my 2k-page NAND.
>
>layout {data, oob, ecc, data, oob, ecc, data, oob, ecc, data, oob, ecc}, w/ the patch:
>root@192.168.3.101:~# time flash_eraseall -j /dev/mtd/3
>Erasing 128 Kibyte @ 12e0000 -- 99 % complete. Cleanmarker written at 12e0000.
>
>real    0m0.709s
>user    0m0.010s
>sys     0m0.350s
>
>layout {data, oob, ecc, data, oob, ecc, data, oob, ecc, data, oob, ecc}, w/o the patch:
>root@192.168.3.101:~# time flash_eraseall -j /dev/mtd/3
>Erasing 128 Kibyte @ 12e0000 -- 99 % complete. Cleanmarker written at 12e0000.
>
>real    0m0.811s
>user    0m0.000s
>sys     0m0.370s
>
>layout {data, oob, ecc, oob, ecc, oob, ecc, oob, ecc}, w/o the patch:
>root@192.168.3.101:~# ./xx.sh
>root@192.168.3.101:~# time flash_eraseall -j /dev/mtd/3
>Erasing 128 Kibyte @ 12e0000 -- 99 % complete. Cleanmarker written at 12e0000.
>
>real    0m0.849s
>user    0m0.000s
>sys     0m0.330s
>
>layout {data, oob, ecc, oob, ecc, oob, ecc, oob, ecc}, w/ the patch:
>root@192.168.3.101:~# time flash_eraseall -j /dev/mtd/3
>Erasing 128 Kibyte @ 12e0000 -- 99 % complete. Cleanmarker written at 12e0000.
>
>real    0m0.709s
>user    0m0.000s
>sys     0m0.340s
>
>Any comments are welcome.
>
>Vitaly 
>
>--- drivers/mtd/nand/nand_base.c	2005-12-14 15:29:42.000000000 +0300
>+++ drivers/mtd/nand/nand_base.c	2005-12-14 21:37:47.324960872 +0300
>@@ -1948,7 +1948,7 @@
> 		}
> 	} else {
> 		int i = 0, j = 0;
>-		int fflen = 0, ooblen = 0;
>+		int fflen = 0, old_fflen = 0, ooblen = 0;
> 
> 		/* Write out desired data */
> 		this->cmdfunc (mtd, NAND_CMD_SEQIN, 0, page & this->pagemask);
>@@ -1957,9 +1957,27 @@
> 		for (j = 0; this->layout[j].length; j++) {
> 			switch (this->layout[j].type) {
> 			case ITEM_TYPE_DATA:
>-				this->enable_hwecc(mtd, NAND_ECC_WRITE);
>-				this->write_buf(mtd, ffchars, this->layout[j].length);
>-				fflen += this->layout[j].length;
>+				if (this->options & NAND_HWECC_SYNDROME) {
>+					this->enable_hwecc(mtd, NAND_ECC_WRITE);
>+					this->write_buf(mtd, ffchars, this->layout[j].length);
>+					fflen += this->layout[j].length;
>+				} else {
>+					if (old_fflen < fflen) {
>+						this->cmdfunc (mtd, NAND_CMD_PAGEPROG, -1, -1);
>+						status = this->waitfunc (mtd, this, FL_WRITING);
>+						if (status & NAND_STATUS_FAIL) {
>+							DEBUG (MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n", __FUNCTION__, page);
>+							ret = -EIO;
>+							goto out;
>+						}
>+					}
>+					fflen += this->layout[j].length;
>+					if (this->options & NAND_BUSWIDTH_16 && (fflen + ooblen) & 1)
>+						this->cmdfunc (mtd, NAND_CMD_SEQIN, fflen + ooblen - 1, page & this->pagemask);
>+					else
>+						this->cmdfunc (mtd, NAND_CMD_SEQIN, fflen + ooblen, page & this->pagemask);
>+					old_fflen = fflen;
>+				}
> 				break;
> 
> 			case ITEM_TYPE_ECC:
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
