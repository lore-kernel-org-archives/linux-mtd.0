Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Zp2n-0004oy-IS
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 10:45:53 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HHP009YX9S0RP@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 08 Jul 2003 11:45:37 +0200 (MEST)
Date: Tue, 08 Jul 2003 12:42:54 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200307081001.10555.jbeisert@eurodsn.de>
To: jbeisert@eurodsn.de, linux-mtd@lists.infradead.org
Message-id: <200307081242.54207.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <200307081001.10555.jbeisert@eurodsn.de>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: NAND-Flash ECC data not used
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 July 2003 10:01, Juergen Beisert wrote:
> Hello all,
>
> I have tried to use a 16MiB NAND flash in my application. It seems to work,
> but it also seem that the driver is not using the ECC data. I have derived
> my small driver from the spia.c source and have added the line
>
> this->eccmode=NAND_ECC_SOFT;
>
> before calling nand_scan(). nand_scan() inserts the ECC check routines
> correctly in the structure. But later, if the jffs2 calls the driver to
> read data from flash, it calls nand_read_ecc() with parameter oobsel = 0.
> So the line
>
> int	eccmode = oobsel ? this->eccmode : NAND_ECC_NONE;
>
> in nand_read_ecc() switches back to NONE ecc mode while reading.

Have you enabled CONFIG_JFFS2_NAND ?

This happens on boot up too, if you have not given the fs type in the 
commandline and the kernel tries to mount the partition with ext2 first.
It should not happen with jffs2.
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
