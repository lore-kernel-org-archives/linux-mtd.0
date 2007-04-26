Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh7ev-0007FT-RX
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 13:21:38 -0400
Subject: Re: NAND bad block checking when no memory based BBT is available
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177605068.2755.416.camel@pmac.infradead.org>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105514A@mchp7rfa.ww002.siemens.net>
	<1177605068.2755.416.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 19:23:24 +0200
Message-Id: <1177608204.25960.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Knobloch, Thomas" <knobloch@siemens.com>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 17:31 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 17:38 +0200, Knobloch, Thomas wrote:
> > Do you think there is some problem with this code or am I missing some
> > point. 
> 
> Looks entirely screwed in the head to me. Thomas?

Yep, it's screwed. Nobody noticed, as this code path is usually never
taken. I kept it as there was some academic discussion, why not using a
bad block table is superior, but I forgot the details.

Sure it needs the shift as well.

	tglx
