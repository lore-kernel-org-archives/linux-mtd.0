Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdOy3-0000yt-BZ
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2005 04:52:52 -0400
Date: Wed, 1 Jun 2005 10:51:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050601085117.GA14126@wohnheim.fh-wedel.de>
References: <429C5347.1080208@anagramm.de>
	<1117542307.14566.79.camel@tglx.tec.linutronix.de>
	<1117554669.12591.284.camel@hades.cambridge.redhat.com>
	<1117554933.4821.2.camel@weaponx.rchland.ibm.com>
	<1117555070.12591.287.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1117555070.12591.287.camel@hades.cambridge.redhat.com>
Cc: tglx@linutronix.de, Clemens Koller <clemens.koller@anagramm.de>,
	linux-mtd@lists.infradead.org
Subject: Re: Oops on rmmod mtdblock module while in dev dir.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 May 2005 16:57:49 +0100, David Woodhouse wrote:
> On Tue, 2005-05-31 at 10:55 -0500, Josh Boyer wrote:
> > It's even more complicated when working with partitions.  A MTD
> > partition is actually a whole new device to MTD, whereas a partition in
> > general block terms is just a subset of a particular device.  Things in
> > this area need some help.
> 
> That's just a terminology mismatch though, and shouldn't really be
> relevant.

Unless you add hotplug.  Treating partitions as independent devices
might have some interesting effects.

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
