Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cR2d-0001X5-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 14:39:59 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0H00LHI79LAG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2002 15:39:29 +0200 (MEST)
Date: Wed, 07 Aug 2002 15:39:18 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Hardware ECC in NAND flash driver
In-reply-to: <20434.1028726885@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Steven Hein <ssh@sgi.com>, linux-mtd@lists.infradead.org
Message-id: <1028727565.19592.257.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <1028726139.19447.255.camel@thomas.tec.linutronix.de>
 <3D511B55.6ADABE4D@sgi.com> <20434.1028726885@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-08-07 at 15:28, David Woodhouse wrote:
> 
> tglx@linutronix.de said:
> > We thougt about that already, but nobody made an attempt to do so,
> > because we had no hardware supporting this.
> 
> Except the DiskOnChip, which probably ought to be using the generic NAND 
> driver too.
Yep, it could be handled the same way.
-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
