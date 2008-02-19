Received: from e31.co.us.ibm.com ([32.97.110.149])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRRcD-0003nu-2x
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 12:30:32 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1JCUEJ3027648
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2008 07:30:14 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1JCUReR222188
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2008 05:30:27 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1JCUQIB003947
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2008 05:30:27 -0700
Date: Tue, 19 Feb 2008 06:29:30 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: haver@vnet.ibm.com
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
Message-ID: <20080219062930.5998990f@zod.rchland.ibm.com>
In-Reply-To: <1203410856.7714.7.camel@august>
References: <1203342580.8085.23.camel@august>
	<alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
	<1203353343.8085.48.camel@august> <20080218105324.1734f9d5@weaponx>
	<1203410856.7714.7.camel@august>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Josh Boyer <jwboyer@linux.ibm.com>,
	"Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	"Monte K. Copeland" <catboat@texas.net>, Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 19 Feb 2008 09:47:36 +0100
Frank Haverkamp <haver@vnet.ibm.com> wrote:

> Hi Josh,
> 
> On Mon, 2008-02-18 at 10:53 -0600, Josh Boyer wrote:
> > I also have a patch for
> > bin2nand/nand2bin since they are hard coded to use the SmartMedia ECC
> > byte ordering.
> 
> I added fixes to be more flexible in the fashion the tools place the
> OOB-ECC bytes already some time ago. Please have a look if those changes
> already do what you had in mind here.

No, they don't.  That was a major part of what I needed (so thank you!),
but ecc layout isn't the same as ecc byte ordering.  I'll post a patch
soonish.

> Yesterday I sent a patch to move the location of bin2nand and nand2bin
> since those tools are not UBI related. If David accepts the change, you
> will find them at a different spot (but anyhow, you were on CC list for
> that patch).

Yes I saw that.  We don't need to wait for David.  I'll look it over
today.

josh
