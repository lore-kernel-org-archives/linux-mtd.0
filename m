Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=DB3EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qszl0-0004qd-3I
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 16:11:18 +0000
Message-ID: <4E494520.7050509@freescale.com>
Date: Mon, 15 Aug 2011 11:11:12 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1310446122-18050-1-git-send-email-b35362@freescale.com>
	<1313423954.8691.17.camel@sauron>
In-Reply-To: <1313423954.8691.17.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Li Yang <leoli@freescale.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/15/2011 10:59 AM, Artem Bityutskiy wrote:
> On Tue, 2011-07-12 at 12:48 +0800, b35362@freescale.com wrote:
>> +	/*
>> +	 * Hack for supporting the flash chip whose writesize is
>> +	 * larger than 2K bytes.
>> +	 */
>> +	if (mtd->writesize > 2048) {
>> +		elbc_fcm_ctrl->subpage_shift = ffs(mtd->writesize >> 11) - 1;
>> +		elbc_fcm_ctrl->subpage_mask =
>> +			(1 << elbc_fcm_ctrl->subpage_shift) - 1;
>> +		/*
>> +		 * Rewrite mtd->writesize, mtd->oobsize, chip->page_shift
>> +		 * and chip->pagemask.
>> +		 */
>> +		mtd->writesize = 2048;
>> +		mtd->oobsize = 64;
>> +		chip->page_shift = ffs(mtd->writesize) - 1;
>> +		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
>> +	}
> 
> So basically if the flash has 4KiB NAND pages, you are considering it as
> a flash with 2KiB NAND pages. But surely this will work only if the
> underlying flash has NOP 2 at least. Or even, if you consider that JFFS2
> and YAFFS want to write to OOB, you need NOP 4 (2 ECC writes and 2
> writes from YAFFS/JFFS2) ? So this won't work for NOP1 flashes?

Right.  The set of chips that work with this controller is still larger
with this than without this.

It looks like NOP1 tends to be MLC -- you probably wouldn't want to use
MLC with this controller anyway as it only does 1-bit ECC.

> Isn't it an ugly hack?

Less ugly than some other approaches that were considered. :-)

But yes, it's a hack (even says so in the comment).  The other option is
"it doesn't work".

-Scott
