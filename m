Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2Ei-0002mO-Ot
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:08:05 +0000
Subject: Re: MLC controller embedded in the NXP LPC32xx ARM CPU
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gabriele Mondada <gabriele@precidata.com>
In-Reply-To: <DB52D0BE-D5A4-4A3D-8C6B-C84530CF7C9C@precidata.com>
References: <DB52D0BE-D5A4-4A3D-8C6B-C84530CF7C9C@precidata.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 11:07:51 +0200
Message-Id: <1259572071.7518.69.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
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

On Wed, 2009-11-25 at 17:46 +0100, Gabriele Mondada wrote:
> I'm starting to write the mtd driver for the MLC controller embedded
> in the NXP LPC32x0 ARM CPU. To prevent redoing existing code and to
> test my understanding, here are my "specs":
> 
> This controller has an hardware ECC. The ECC is performed on 512 bytes
> (user) + 6 bytes (oob) and produces 10 bytes code. The OOB data is
> covered by the ECC and cannot be handled separately from the user
> data. When using 2048 + 64 bytes pages (it's my case), the ECC must be
> performed 4 times. ECC codes will be inserted each 518 bytes, and not
> at the end of the page as usual.
> 
> The controller is described at page 158 of
> http://www.nxp.com/documents/user_manual/UM10326.pdf
> 
> The driver should not support OOB because it cannot do that in the
> standard mtd way. I can define the 6 bytes of OOB as part of the user
> data. This results in pages of 518 or 2072 bytes. Is there any problem
> with UBIFS or whatever else ?

First of all, can you really make it 518/2072? Will all data be covered
by ECC? Everything must be covered by ECC, especially for MLC.

Yes, UBI/UBIFS would not work, because current code assumes page size is
power of 2, for optimization purposes. So you would have 2 choices, if
you had to use UBI/UBIFS:

1. modify UBI/UBIFS so that it does not assume power of 2 min. I/O unit
sizes as it does now. This should not be extremely difficult to do.

2. Waste 6/24 bytes and report 512/2048 to the userspace.

Also, UBIFS was never tested with non power-of-two page sizes, so if you
go for 1., you could reveal some problems as well.

> For 2048 + 16 bytes pages, I plan to set ecc.steps=4, ecc.bytes=512,
> ecc.bytes=10 and mtd->oobsize=0 (maybe 40 ?)
>  but I'm not sure that this combinaiton works (especially because
> mtd->oobsize=0). The ecc.calculate() method will read/write the
> discarded OOB bytes (6) and the ECC bytes (10). It also asks to the
> ECC hardware controller if data is correct and retrieves the corrected
> data if needed. The function ecc.correct() does nothing.

I guess in your case mtd->oobsize=0 is the most sensible choice.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
