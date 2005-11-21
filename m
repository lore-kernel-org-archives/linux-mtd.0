Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ee8aC-0007sn-H7
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 05:07:38 -0500
Date: Mon, 21 Nov 2005 11:07:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Message-ID: <20051121100724.GA13927@wohnheim.fh-wedel.de>
References: <20051118014055.GK11494@stusta.de>
	<20051118031751.GA2773@redhat.com>
	<20051118033702.GY11494@stusta.de>
	<200511211030.41684.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200511211030.41684.hs4233@mail.mn-solutions.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [2.6 patch] build kernel/intermodule.c only when required
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 November 2005 10:30:41 +0100, Holger Schurig wrote:
> 
> >  config MTD_GEN_PROBE
> >         tristate
> > +       select OBSOLETE_INTERMODULE
> 
> MTD_GEN_PROBE get's selected by MTD_CFI. If I know my flash chips and don't 
> need any CFI detected, can I (easily) put the info into some platform data 
> and omit the compilation/exection of cfi_probe.c ?

Not easily.  Someone needs to clean up the whole spaghetti plate in
drivers/mtd that currently still uses OBSOLETE_INTERMODULE.  After
that is done, it may be simple to solve your problem as well.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
