Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4Y5h-0001CL-7Z
	for linux-mtd@lists.infradead.org; Mon, 24 Nov 2008 09:50:49 +0000
Message-ID: <492A7981.7040202@nokia.com>
Date: Mon, 24 Nov 2008 11:53:05 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Patrick Turley <patrick.turley@freescale.com>
Subject: Re: A question about nand_read()
References: <op.ukucbhx54yuz67@iconoclast.sgtl.sigmatel.com>
	<op.uky93rcy4yuz67@pturley-home.am.freescale.net>
In-Reply-To: <op.uky93rcy4yuz67@pturley-home.am.freescale.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patrick Turley wrote:
> No love? Is my question too n00bish?

People are busy.

You should test this yourself, and if you can make it go wrong
submit a patch.

I glanced at the code and it looks OK because struct nand_chip
is always initialised to zero and chip->ops.mode is never assigned.

> On Tue, 18 Nov 2008 18:43:55 -0600, Patrick Turley  
> <patrick.turley@freescale.com> wrote:
> 
>> My tree is up-to-date as I'm writing this message.
>>
>> I'm looking at nand_read() in nand_base.c, starting at line 1175, quoted
>> here for your convenience:
>>
>>
>> static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
>>                       size_t *retlen, uint8_t *buf)
>> {
>>          struct nand_chip *chip = mtd->priv;
>>          int ret;
>>
>>          /* Do not allow reads past end of device */
>>          if ((from + len) > mtd->size)
>>                  return -EINVAL;
>>          if (!len)
>>                  return 0;
>>
>>          nand_get_device(chip, mtd, FL_READING);
>>
>>          chip->ops.len = len;
>>          chip->ops.datbuf = buf;
>>          chip->ops.oobbuf = NULL;
>>
>>          ret = nand_do_read_ops(mtd, from, &chip->ops);
>>
>>          *retlen = chip->ops.retlen;
>>
>>          nand_release_device(mtd);
>>
>>          return ret;
>> }
>>
>>
>> In particular, I'm looking at the preparation to call nand_do_read_ops(),
>> where the chip->ops structure is filled in.
>>
>> Here's a small excerpt from nand_do_read_ops() that concerns me:
>>
>>
>>      /* Now read the page into the buffer */
>>      if (unlikely(ops->mode == MTD_OOB_RAW))
>>              ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
>>      else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
>>              ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
>>      else
>>              ret = chip->ecc.read_page(mtd, chip, bufpoi);
>>      if (ret < 0)
>>              break;
>>
>>
>> Note that nand_do_read_ops() will look at the mode field of the ops
>> structure, but this field hasn't been set by nand_read().
>>
>> On the face of it, this looks like a bug. Is there something I don't know
>> that makes this not a bug? For example, is the value in the mode field
>> intended to persist across operations?
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
