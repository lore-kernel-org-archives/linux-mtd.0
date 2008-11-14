Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0xUJ-0001Ys-Rh
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 12:09:24 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout5.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KAB00GPSOFI5K@mailout5.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 21:09:18 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KAB00H1OOFEQK@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 21:09:16 +0900 (KST)
Date: Fri, 14 Nov 2008 17:42:35 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH][OneNAND] Write-while-program support
To: Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Kyungmin Park <kmpark@infradead.org>
Message-id: <71C53CED5F5345FBB054232641D9A907@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <20081114002830.GA25979@july> <491D53B8.1010401@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian

FlexOneNand read dual data ram buffer and so we can not use
----- Original Message ----- 
From: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
To: "Kyungmin Park" <kmpark@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Sent: Friday, November 14, 2008 4:02 PM
Subject: Re: [PATCH][OneNAND] Write-while-program support


> Kyungmin Park wrote:
>> This is from Adrian hunter and modified for write_ops 
>> operation.
>
> Thanks for looking at write-while-program.  I have a few 
> questions though.
> I have copied the whole function below because the diff is 
> too confusing:
>
>> /**
>>  * onenand_write_ops_nolock - [OneNAND Interface] write 
>> main and/or out-of-band
>>  * @param mtd MTD device structure
>>  * @param to offset to write to
>>  * @param ops oob operation description structure
>>  *
>>  * Write main and/or oob with ECC
>>  */
>> static int onenand_write_ops_nolock(struct mtd_info *mtd, 
>> loff_t to,
>> struct mtd_oob_ops *ops)
>> {
>> struct onenand_chip *this = mtd->priv;
>> int written = 0, column, thislen = 0, subpage = 0;
>> int prev = 0, prevlen = 0, prev_subpage = 0, first = 1;
>> int oobwritten = 0, oobcolumn, thisooblen, oobsize;
>> size_t len = ops->len;
>> size_t ooblen = ops->ooblen;
>> const u_char *buf = ops->datbuf;
>> const u_char *oob = ops->oobbuf;
>> u_char *oobbuf;
>> int ret = 0;
>>
>> DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ops_nolock: to = 
>> 0x%08x, len = %i\n", (unsigned int) to, (int) len);
>>
>> /* Initialize retlen, in case of early exit */
>> ops->retlen = 0;
>> ops->oobretlen = 0;
>>
>> /* Do not allow writes past end of device */
>> if (unlikely((to + len) > mtd->size)) {
>> printk(KERN_ERR "onenand_write_ops_nolock: Attempt write 
>> to past end of device\n");
>> return -EINVAL;
>> }
>>
>> /* Reject writes, which are not page aligned */
>>         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) 
>> {
>>                 printk(KERN_ERR 
>> "onenand_write_ops_nolock: Attempt to write not page 
>> aligned data\n");
>>                 return -EINVAL;
>>         }
>>
>
> The loop cannot handle the case when len is zero so I had:
>
> if (!len)
> return 0;
>
>> if (ops->mode == MTD_OOB_AUTO)
>> oobsize = this->ecclayout->oobavail;
>> else
>> oobsize = mtd->oobsize;
>>
>> oobcolumn = to & (mtd->oobsize - 1);
>>
>> column = to & (mtd->writesize - 1);
>>
>> /* Loop until all data write */
>> while (1) {
>> if (written < len) {
>> u_char *wbuf = (u_char *) buf;
>>
>> thislen = min_t(int, mtd->writesize - column, len - 
>> written);
>> thisooblen = min_t(int, oobsize - oobcolumn, ooblen - 
>> oobwritten);
>>
>> cond_resched();
>>
>> this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
>>
>> /* Partial page write */
>> subpage = thislen < mtd->writesize;
>> if (subpage) {
>> memset(this->page_buf, 0xff, mtd->writesize);
>> memcpy(this->page_buf + column, buf, thislen);
>> wbuf = this->page_buf;
>> }
>>
>> this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0, 
>> mtd->writesize);
>>
>> if (oob) {
>> oobbuf = this->oob_buf;
>>
>> /* We send data to spare ram with oobsize
>> * to prevent byte access */
>> memset(oobbuf, 0xff, mtd->oobsize);
>> if (ops->mode == MTD_OOB_AUTO)
>> onenand_fill_auto_oob(mtd, oobbuf, oob, oobcolumn, 
>> thisooblen);
>> else
>> memcpy(oobbuf + oobcolumn, oob, thisooblen);
>>
>> oobwritten += thisooblen;
>> oob += thisooblen;
>> oobcolumn = 0;
>> } else
>> oobbuf = (u_char *) ffchars;
>>
>> this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, 
>> mtd->oobsize);
>> } else
>> ONENAND_SET_NEXT_BUFFERRAM(this);
>>
>> if (!first) {
>> ONENAND_SET_PREV_BUFFERRAM(this);
>>
>> ret = this->wait(mtd, FL_WRITING);
>>
>> /* In partial page write we don't update bufferram */
>> onenand_update_bufferram(mtd, prev, !ret && 
>> !prev_subpage);
>> if (ONENAND_IS_2PLANE(this)) {
>
> I do not understand how 2PLANE is compatible with 
> write-while-program because
> 2PLANE uses both buffers so we cannot start transferring 
> to the second buffer
> while the program is ongoing.  Does it work?
>
> Won't MLC and FlexOneNAND have that problem too?
Amit : FlexOneNand use dual data ram buffer and so we can 
not use it and other point is for OneNand we have a plan to 
use dual  buufer
because OneNand page size will increase to 4k.
>
>> ONENAND_SET_BUFFERRAM1(this);
>> onenand_update_bufferram(mtd, prev + this->writesize, 
>> !ret && !prev_subpage);
>> }
>>
>> if (ret) {
>
> My original patch had "written -= prevlen" here.
>
>> printk(KERN_ERR "onenand_write_ops_nolock: write filaed 
>> %d\n", ret);
>> break;
>> }
>>
>> if (written == len) {
>> /* Only check verify write turn on */
>> ret = onenand_verify(mtd, buf - len, to - len, len);
>> if (ret) {
>> printk(KERN_ERR "onenand_write_ops_nolock: verify failed 
>> %d\n", ret);
>> break;
>> }
>
> Why not just break here?
>
Amit : same as kyungmin comment.
>> }
>> ONENAND_SET_NEXT_BUFFERRAM(this);
>>
>> if (written == len)
>> break;
>> }
>>
>> this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
>>
>> written += thislen;
>>
>> column = 0;
>> prev_subpage = subpage;
>> prev = to;
>> prevlen = thislen;
>> to += thislen;
>> buf += thislen;
>> first = 0;
>> }
>>
>> ops->retlen = written;
>
> Is ops->oobretlen needed here also?
>
>>
>> return ret;
>> }
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
