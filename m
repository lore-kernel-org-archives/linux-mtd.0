From: samoutin@hotbox.ru (Alex Samoutin)
Date: Fri, 14 Feb 2003 09:43:58 -0800
Subject: A couple of bugs in nand_write_ecc()
Message-ID: <001301c2d450$aa1a07a0$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I've  found a couple of bugs in nand.c driver, or may be I just don't
understand how it should works. Please, take a look.
Function nand_write_ecc() mast write buffer to NAND with any length  and
starting with any byte. But when the last byte
not finished at sector border   nand_write_ecc() write extra bytes out of
buffer :
 /*
                * Check, if we have a full page write, then we can
                * use the given buffer, else we have to copy
                */

               if (!col && ((len - written) >= mtd->oobblock))  {
                       this->data_poi = (u_char*) &buf[written];
                       cnt = mtd->oobblock;
               } else {
                       cnt = 0;
>>>>>>>>>>>                    for (i = col; i < len && i < mtd->oobblock;
i++) {
                               this->data_buf[i] = buf[written + i];
                               cnt++;
                       }
                       this->data_poi = this->data_buf;
               }


Market line should be
for (i = col; i < (len-written) && i < mtd->oobblock; i++) {

Then we invoke    nand_write_page() function

               if (eccbuf) {
                       ret = nand_write_page (mtd, this, page, col, cnt
,&eccbuf[oob], oobsel);
                       oob += mtd->oobsize;
               } else
                       ret = nand_write_page (mtd, this, page, col, cnt,
NULL, oobsel);

Where the "col" is offset form page start and "cnt" is leght of data. But
nand_write_page ()
defined as:

static int nand_write_page (struct mtd_info *mtd, struct nand_chip *this,
                           int page, int col, int last, u_char *oob_buf, int
oobsel)

where "col" mean the same, but "last" is offset of last byte of data!

So, we have to use:

   ret = nand_write_page (mtd, this, page, col, col+cnt, NULL, oobsel)

Am I right?

Alex.
