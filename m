Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7TeN-0000cW-Bi
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 03:29:16 -0500
From: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 10 Feb 2006 09:28:59 +0100
References: <200602091126.10462.manningc2@actrix.gen.nz>
In-Reply-To: <200602091126.10462.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602100928.59907.wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Charles,

thank you for sharing your experience...

You wrote:
> If you have not already done so, read the Toshiba NAND flash application
> guide:

Yes, I have.

> I have done a few accelerated lifetime tests that have gone very well. In
> one test (run once on 512byte page devices and once on 2k page devices) I
> wrote, read back and verified over 120Gbytes of data to the fs without a
> single bit betting lost.

You mean, without a single error correction? Or do you mean that ECC has done 
its job?

Regarding the 120 GBytes: How many times was each block written/erased? Have 
you reached the specified lifetime of the flash?

> * YAFFS is very conservative on dealing with ECC failures. YAFFS retires a
> block if one ECC failure is seen. JFFS2, IIRC allows five of so failure
> before retiring a block. The Toshiba folk have told me that if a block is
> going bad, it is most likely to start displaying recoverable 1-bit errors
> before displaying non-recoverable multi-bit errors.

This is a valuable information not found in other resources.

> Still, I think those reliability differences, at the flash level, are more
> than likely theoretical noise and are unlikely to be material in the real
> world.

Hmmmm... can you come and tell this to my boss ;-)

> One important factor, IMHO, is how you handle the write protect pin on the
> NAND. Some people tie the WP to the power supply failure flag. IMHO this is
> a bad thing to do since it can cause incomplete writes to happen if the wp
> is asserted during a write or erase cycle.

I will check this.

best regards

-- 
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
