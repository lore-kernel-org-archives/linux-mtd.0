Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NbtF-0005Om-R7
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 18:17:33 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HFY00MQYW1HEJ@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 04 Jun 2003 19:17:42 +0200 (MEST)
Date: Wed, 04 Jun 2003 20:16:01 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3EDB2F4E.6050502@intracom.gr>
To: Pantelis Antoniou <panto@intracom.gr>, linux-mtd@lists.infradead.org
Message-id: <200306042016.01366.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <3EDB2F4E.6050502@intracom.gr>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: NAND write verify failed problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 02 June 2003 13:04, Pantelis Antoniou wrote:
>
>  > root$ fcp -v /tmp/root.jffs2.image /dev/mtd0
>  > Erasing blocks: 33/33 (100%)
>  > Writing data: 528k/528k (100%)
>  > Verifying data: 20k/528k (3%)File does not seem to match flash data.
Are you writing with ECC ? If not use nandwrite from mtd/utils

> Mount takes 30 seconds to finish, and during that time the board does not
> respond to any external stimulus. This is caused I believe from the scaning
> of the NAND, which I take it is normal.
Should be much faster with current MTD CVS code


> nand_write_page: Failed write verify, page 0x0000040b <5>Write of 68
> bytes at 0x00081774 failed. returned -5, retlen 0
> Mar 10 21:44:22 netvia-ppc kernel: Not marking the space at 0x00081774
> as dirty because the flash driver returned retlen zero
> Any ideas how to proceed?

Yes, update nand driver from MTD-CVS. It's fixed.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
