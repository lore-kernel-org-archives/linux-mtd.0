Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L1uIA-0005k8-08
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2008 02:56:46 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2243664wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Nov 2008 18:56:44 -0800 (PST)
Message-ID: <9c9fda240811161856u2c784946wabba1dfc5009ef46@mail.gmail.com>
Date: Mon, 17 Nov 2008 11:56:44 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH][OneNAND] Write-while-program support
In-Reply-To: <491D53B8.1010401@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

HI,

On Fri, Nov 14, 2008 at 7:32 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Kyungmin Park wrote:
>>
>> This is from Adrian hunter and modified for write_ops operation.
>
> Thanks for looking at write-while-program.  I have a few questions though.
> I have copied the whole function below because the diff is too confusing:
>
>> /**
>>  * onenand_write_ops_nolock - [OneNAND Interface] write main and/or
>> out-of-band
>>  * @param mtd           MTD device structure
>>  * @param to            offset to write to
>>  * @param ops           oob operation description structure
>>  *
>>  * Write main and/or oob with ECC
>>  */
>> static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
>>                                struct mtd_oob_ops *ops)
>> {
>>        struct onenand_chip *this = mtd->priv;
>>        int written = 0, column, thislen = 0, subpage = 0;
>>        int prev = 0, prevlen = 0, prev_subpage = 0, first = 1;
>>        int oobwritten = 0, oobcolumn, thisooblen, oobsize;
>>        size_t len = ops->len;
>>        size_t ooblen = ops->ooblen;
>>        const u_char *buf = ops->datbuf;
>>        const u_char *oob = ops->oobbuf;
>>        u_char *oobbuf;
>>        int ret = 0;
>>
>>        DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ops_nolock: to = 0x%08x, len
>> = %i\n", (unsigned int) to, (int) len);
>>
>>        /* Initialize retlen, in case of early exit */
>>        ops->retlen = 0;
>>        ops->oobretlen = 0;
>>
>>        /* Do not allow writes past end of device */
>>        if (unlikely((to + len) > mtd->size)) {
>>                printk(KERN_ERR "onenand_write_ops_nolock: Attempt write to
>> past end of device\n");
>>                return -EINVAL;
>>        }
>>
>>        /* Reject writes, which are not page aligned */
>>        if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
>>                printk(KERN_ERR "onenand_write_ops_nolock: Attempt to write
>> not page aligned data\n");
>>                return -EINVAL;
>>        }
>>
>
> The loop cannot handle the case when len is zero so I had:
>
>        if (!len)
>                return 0;

Yes there's length check. I wonder is it possible to write with zero?
Is it handle at driver level or upper level such as filesystem?
But no problem to just add length check here at this time.

>
>>        if (ops->mode == MTD_OOB_AUTO)
>>                oobsize = this->ecclayout->oobavail;
>>        else
>>                oobsize = mtd->oobsize;
>>
>>        oobcolumn = to & (mtd->oobsize - 1);
>>
>>        column = to & (mtd->writesize - 1);
>>
>>        /* Loop until all data write */
>>        while (1) {
>>                if (written < len) {
>>                        u_char *wbuf = (u_char *) buf;
>>
>>                        thislen = min_t(int, mtd->writesize - column, len -
>> written);
>>                        thisooblen = min_t(int, oobsize - oobcolumn, ooblen
>> - oobwritten);
>>
>>                        cond_resched();
>>
>>                        this->command(mtd, ONENAND_CMD_BUFFERRAM, to,
>> thislen);
>>
>>                        /* Partial page write */
>>                        subpage = thislen < mtd->writesize;
>>                        if (subpage) {
>>                                memset(this->page_buf, 0xff,
>> mtd->writesize);
>>                                memcpy(this->page_buf + column, buf,
>> thislen);
>>                                wbuf = this->page_buf;
>>                        }
>>
>>                        this->write_bufferram(mtd, ONENAND_DATARAM, wbuf,
>> 0, mtd->writesize);
>>
>>                        if (oob) {
>>                                oobbuf = this->oob_buf;
>>
>>                                /* We send data to spare ram with oobsize
>>                                 * to prevent byte access */
>>                                memset(oobbuf, 0xff, mtd->oobsize);
>>                                if (ops->mode == MTD_OOB_AUTO)
>>                                        onenand_fill_auto_oob(mtd, oobbuf,
>> oob, oobcolumn, thisooblen);
>>                                else
>>                                        memcpy(oobbuf + oobcolumn, oob,
>> thisooblen);
>>
>>                                oobwritten += thisooblen;
>>                                oob += thisooblen;
>>                                oobcolumn = 0;
>>                        } else
>>                                oobbuf = (u_char *) ffchars;
>>
>>                        this->write_bufferram(mtd, ONENAND_SPARERAM,
>> oobbuf, 0, mtd->oobsize);
>>                } else
>>                        ONENAND_SET_NEXT_BUFFERRAM(this);
>>
>>                if (!first) {
>>                        ONENAND_SET_PREV_BUFFERRAM(this);
>>
>>                        ret = this->wait(mtd, FL_WRITING);
>>
>>                        /* In partial page write we don't update bufferram
>> */
>>                        onenand_update_bufferram(mtd, prev, !ret &&
>> !prev_subpage);
>>                        if (ONENAND_IS_2PLANE(this)) {
>
> I do not understand how 2PLANE is compatible with write-while-program
> because
> 2PLANE uses both buffers so we cannot start transferring to the second
> buffer
> while the program is ongoing.  Does it work?
>
> Won't MLC and FlexOneNAND have that problem too?

Agree, I'm not yet tested the 2PLANE features and it doesn't support
write-while-program.
If the 2plane and flex-onenand, it used the previous one.

>
>>                                ONENAND_SET_BUFFERRAM1(this);
>>                                onenand_update_bufferram(mtd, prev +
>> this->writesize, !ret && !prev_subpage);
>>                        }
>>
>>                        if (ret) {
>
> My original patch had "written -= prevlen" here.

Agreed.

>
>>                                printk(KERN_ERR "onenand_write_ops_nolock:
>> write filaed %d\n", ret);
>>                                break;
>>                        }
>>
>>                        if (written == len) {
>>                                /* Only check verify write turn on */
>>                                ret = onenand_verify(mtd, buf - len, to -
>> len, len);
>>                                if (ret) {
>>                                        printk(KERN_ERR
>> "onenand_write_ops_nolock: verify failed %d\n", ret);
>>                                        break;
>>                                }
>
> Why not just break here?

E.g., In original version, write bufferram 0 and it changes bufferam 1
automatically.
Same as if break here, it points out the previous bufferram.

>
>>                        }
>>                        ONENAND_SET_NEXT_BUFFERRAM(this);
>>
>>                        if (written == len)
>>                                break;
>>                }
>>
>>                this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
>>
>>                written += thislen;
>>
>>                column = 0;
>>                prev_subpage = subpage;
>>                prev = to;
>>                prevlen = thislen;
>>                to += thislen;
>>                buf += thislen;
>>                first = 0;
>>        }
>>
>>        ops->retlen = written;
>
> Is ops->oobretlen needed here also?

Okay I will added. I'm not sure YAFFS handle this one correctly. Maybe
it used the retlen in ops operation (data + spare).

>
>>
>>        return ret;
>> }

Thank you,
Kyungmin Park
