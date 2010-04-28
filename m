Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O77g7-0005UQ-Nq
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 13:51:52 +0000
Subject: Re: UBI - disable subpage verify and use
	CONFIG_MTD_NAND_VERIFY_WRITE possible?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDDFB4E6@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDDFB4E6@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 16:47:17 +0300
Message-ID: <1272462437.7750.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2010-04-19 at 17:52 -0700, Darwin Rambo wrote:
> Hello Artem,
> 
> Can you please clarify something for me?
> 
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail 
> 
> I read this note and still, CONFIG_MTD_NAND_VERIFY_WRITE is very
> useful for me.

Ok.

>  The question is, if I don't mind wasting a bit of flash, and
> configure UBI to not do subpage writes and put the EC and VID headers
> on separate pages (for example ubi.mtd=6,4096), does UBI then always
> do page writes and would CONFIG_MTD_NAND_VERIFY_WRITE then work
> reliably for me?

Yes, in this case UBI will never use sub-pages, all writes will be 4KiB
aligned, and the feature should work.

>  Or are there other places in the code that might do subpage writes?

No.

>  So far it seems to work well for me with the verify on and no
> subpages for the headers. 

Right.

> By the way, the standard nand_verify_buf() function in nand_base.c
> uses readb(chip->IO_ADDR_R) and doesn't use something like
> chip->ecc.read_page() to correct the data so this sounds like a bug to
> me.

Yup. I think this feature was not used by anyone for long time.

>  But I override this to do corrected reads anyways, which works better
> for SLC/MLC flash which can show one or more bit errors in a page
> read.

Just send a patch then :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
