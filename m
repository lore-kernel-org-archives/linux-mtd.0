Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDjoK-00011N-To
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 13:48:12 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: David Daney <ddaney@avtrex.com>,
 linux-mtd@lists.infradead.org
Date: Wed, 14 Apr 2004 14:43:56 +0200
References: <407CC018.3030505@avtrex.com>
In-Reply-To: <407CC018.3030505@avtrex.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404141443.56257.tglx@linutronix.de>
Subject: Re: mtd, mtdblock and nand ecc.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 April 2004 06:37, David Daney wrote:
> Is there some reason that the mtd and mtdblock drivers do not use ECC
> when the backing device is nand with ECC enabled?

Yes. 
If the oobsel structure == NULL, then the nand driver uses the structure, 
which is associated to this mtd device. This can be done from userspace using 
MEMSETOOBSEL ioctl.
NAND aware filesystem drivers provide their own oobsel structure and use the 
xxx_ecc functions.

> I suppose you could run into problems if the backing device were a
> concatenation of ECC and non-ECC devices, but that could probably be
> detected either on open or at each page read/write.

Concatenation of NAND and NOR will not work anyway, as the fs must be aware of 
the FLASH type.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
