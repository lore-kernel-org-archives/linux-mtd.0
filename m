Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlGdz-00048p-Ib
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 07:31:36 +0000
Message-ID: <4C6A3AD1.3070203@parrot.com>
Date: Tue, 17 Aug 2010 09:31:29 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "peter.barada@gmail.com" <peter.barada@gmail.com>
Subject: Re: NAND ECC on a per-partition basis
References: <1281969511.13433.207.camel@thunk>
In-Reply-To: <1281969511.13433.207.camel@thunk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Barada a écrit :
> I'm working with a Micron POP part for an omap3530, and I need to write
> pages in the boot block using the builtin Hamming ECC(as the bootrom
> expects it), but the rest of the blocks I want to use the NAND's builtin
> 4-bit ECC engine.
> 
> Is there any way to specify the ECC method on a per-partition basis?
>
No, but you can write in raw mode and compute the ecc in userspace.

  Matthieu
