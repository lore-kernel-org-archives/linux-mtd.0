Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW5fs-0005O0-9j
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 08:37:44 +0000
Date: Thu, 21 Aug 2008 10:28:05 +0200
From: Sebastian Siewior <sebastian@breakpoint.cc>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] mtd: add OF2PDEV convertor for the NDFC driver
Message-ID: <20080821082805.GA8013@www.tglx.de>
References: <20080820205958.GA13371@www.tglx.de>
	<200808210040.58809.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <200808210040.58809.arnd@arndb.de>
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

* Arnd Bergmann | 2008-08-21 00:40:58 [+0200]:

>On Wednesday 20 August 2008, Sebastian Siewior wrote:
>> I didn't convert the NDFC driver to support OF because there are
>> non-OF-aware platforms with the ndfc chip.
>> All settings are mandatory except the oob layout.
>
>Are you aware of Sean's patch from
>http://patchwork.ozlabs.org/linuxppc/patch?id=20183 ?

Yes, I heard of it. tglx told me that the IP-Core might show up in
non-IBM HW and it would be better not to drop the platform support.

>	Arnd <><
Sebastian
