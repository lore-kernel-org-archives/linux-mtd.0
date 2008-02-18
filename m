Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JR9FI-0003RP-K4
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 16:53:37 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1IGrQ58001608
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2008 11:53:26 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1IGrQfu240502
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2008 11:53:26 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1IGrPSl010080
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2008 11:53:26 -0500
Date: Mon, 18 Feb 2008 10:53:24 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: haver@vnet.ibm.com
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
Message-ID: <20080218105324.1734f9d5@weaponx>
In-Reply-To: <1203353343.8085.48.camel@august>
References: <1203342580.8085.23.camel@august>
	<alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
	<1203353343.8085.48.camel@august>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	"Monte K. Copeland" <catboat@texas.net>, Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Schmidt1 <ALEXSCHM@de.ibm.com>, Alexander
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Feb 2008 17:49:03 +0100
Frank Haverkamp <haver@vnet.ibm.com> wrote:

> Hi Thomas,
> 
> On Mon, 2008-02-18 at 17:01 +0100, Thomas Gleixner wrote:
> > I did not update for some time, but did now and noticed that my
> > packaging scripts need a real overhaul for no benefit.
> > 
> 
> I talked to Artem. He told me that the tools had deficiencies that
> prevented him using them. E.g. that he could not put the vid-hdr the
> offset he wanted it to put. He promissed me to write up the deficiencies
> so that we can work on them. I am sure that after fixing, we can move
> the tools back to their old location.

I have a patch for the vid header thing.  I also have a patch for
bin2nand/nand2bin since they are hard coded to use the SmartMedia ECC
byte ordering.

> Of course it would be nice, if we could move the tools back even before
> the fixup, to avoid changing our build scripts. Let us discuss that with
> Artem tomorrow.

I'm a bit grumpy about the move as well, not because they were moved,
but because there's a dozen or so completely useless commits in the
repo.  But, oh well.

josh
