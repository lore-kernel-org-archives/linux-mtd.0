Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVyBN-0003s7-Mo
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 00:37:45 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7L0e8Mm021364
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2008 20:40:08 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m7L0bONs210546
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2008 20:37:24 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m7L0bNnn008178
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2008 20:37:24 -0400
Date: Wed, 20 Aug 2008 20:37:19 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] mtd: add OF2PDEV convertor for the NDFC driver
Message-ID: <20080820203719.5224dc78@zod.rchland.ibm.com>
In-Reply-To: <200808210040.58809.arnd@arndb.de>
References: <20080820205958.GA13371@www.tglx.de>
	<200808210040.58809.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, Sebastian Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Aug 2008 00:40:58 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Wednesday 20 August 2008, Sebastian Siewior wrote:
> > I didn't convert the NDFC driver to support OF because there are
> > non-OF-aware platforms with the ndfc chip.
> > All settings are mandatory except the oob layout.
> 
> Are you aware of Sean's patch from
> http://patchwork.ozlabs.org/linuxppc/patch?id=20183 ?

I need to look at that hard for .28 still.

> What are the other platforms using it?

There should be none.  It was an arch/ppc driver originally, and
arch/ppc is dead.  Since it's only found on 4xx SoCs, there's no reason
that I'm aware of to keep it as a platform driver.

Other than the fact that the whole of_platform thing might be replaced
with shims to convert them to platform devices.  There was talk of that
at one time and it made sense to me.

josh
