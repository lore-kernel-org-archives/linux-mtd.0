Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19h8u8-0006OV-2t
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2003 15:23:12 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HIQ00FN4NXP2Q@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 28 Jul 2003 16:22:40 +0200 (MEST)
Date: Mon, 28 Jul 2003 17:18:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <a05200f13bb4ad4689358@[130.161.115.44]>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
	linux-mtd@lists.infradead.org
Message-id: <200307281718.17326.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <a05200f13bb4ad4689358@[130.161.115.44]>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: nand_verify_buf broken ?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 28 July 2003 15:30, J.D. Bakker wrote:
> Hi,
>
> Context: drivers/mtd/nand/nand.c in the latest CVS.
>
> static int nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int
> len) {
> 	int i;
> 	struct nand_chip *this = mtd->priv;
>
> 	for (i=0; i<len; i++)
> 		if (buf[i] != readb(this->IO_ADDR_R))
> 			return i;
>
> 	return 0;
> }
>
> This will yield a false positive if the first byte of the buffer is
> corrupted. I didn't dig deep enough to find out who's using this and
> why (or if buf[0] is guaranteed to be correct) so no patch, sorry.

You're right. There must be return -EIO; 

It was there before the big changes for DOC support. Must have happened there.
Thanks. Will be fixed.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
