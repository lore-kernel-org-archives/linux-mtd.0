Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19512C-0004SS-Pk
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 11:17:57 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDB0094QWL3ST@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 14 Apr 2003 12:17:28 +0200 (MEST)
Date: Mon, 14 Apr 2003 13:17:28 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E9A876E.8090503@ems-wuensche.com>
To: Gerhard Uttenthaler <uttenthaler@ems-wuensche.com>,
 linux-mtd@lists.infradead.org
Message-id: <200304141317.28634.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
 <3E9AF275.4000905@idis.co.kr> <3E9A876E.8090503@ems-wuensche.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 April 2003 12:03, Gerhard Uttenthaler wrote:

> Which eccmode is used seems to be set from the calling function of
> nand_read_ecc. I found:
TRUE
> in nandwrite.c:
> struct nand_oobinfo jffs2_oobinfo = {
> 	useecc: 1,
> 	eccpos:	{ 0, 1, 2, 3, 6, 7}
> };
> Here useecc is set to 1, which is found in nand.h:
> #define NAND_ECC_SOFT	1
CRAP. 
ECC_TYPE (SOFT OR HARD) is set in the board specific driver and nowhere else.

Read: http://www.linux-mtd.infradead.org/tech/nand.html

useecc is given by the calling program (filesystem or userspace utility) to 
tell the nand driver to USE ECC. eccpos is given to tell te nand driver
WHERE to put / get ECC in oobarea 
This was made to have support for different filesystems on one NAND chip. eg. 
JFFS2 and YAFFS.

>
> I found this while studying nftlmount.c. In function find_boot_record
> there might be a bug.
NTFL does _NOT_ use nand.c functions at all !!!!!!
DO NOT MIXUP STUFF HERE !

> Hope this all makes some sense and helps.
NO, see above

--- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
