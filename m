Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW8dT-0004fU-R2
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:47:28 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Sebastian Siewior <sebastian@breakpoint.cc>
Subject: Re: [RFC] mtd: add OF2PDEV convertor for the NDFC driver
Date: Thu, 21 Aug 2008 13:46:14 +0200
References: <20080820205958.GA13371@www.tglx.de>
	<200808210040.58809.arnd@arndb.de>
	<20080821082805.GA8013@www.tglx.de>
In-Reply-To: <20080821082805.GA8013@www.tglx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808211346.15450.arnd@arndb.de>
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008, Sebastian Siewior wrote:
> Yes, I heard of it. tglx told me that the IP-Core might show up in
> non-IBM HW and it would be better not to drop the platform support.

Thomas, any example of that? I would guess that all powerpc and microblaze
systems would use the of_platform drivers now, so is there any other
architecture that might get an ndfc?

	Arnd <><
