Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JeTw-0008VR-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 18:42:48 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6M00BWL01GK5@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 20:12:53 +0100 (MET)
Date: Wed, 04 Dec 2002 20:10:51 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Problem: 51MB partition max size on jffs2
In-reply-to: <20021204190914.6D7CD48FD@tiger.actrix.co.nz>
To: manningc2@actrix.gen.nz, David Woodhouse <dwmw2@infradead.org>,
 Dave Ellis <DGE@sixnetio.com>
Cc: 'Ken Offer' <koffer@arlut.utexas.edu>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212042010.51999.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <00512BA4F9D3D311912A009027E9B8F407E4A3@NT>
 <200212042001.08259.tglx@linutronix.de>
 <20021204190914.6D7CD48FD@tiger.actrix.co.nz>
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

On Wednesday 04 December 2002 20:04, Charles Manning wrote:
> On Thu, 05 Dec 2002 08:01, Thomas Gleixner wrote:
> > On Wednesday 04 December 2002 19:46, David Woodhouse wrote:
> > > DGE@sixnetio.com said:
> > > >  kmalloc() is limited to 128K and the 128MB Flash needs more than
> > > > twice that,
> > > >
> > > > so I tried vmalloc() and it seems to be OK (at least with PPC 2.4.18
> > > > patched for the new MTD code). Does anyone know if this change is
> > > > safe?
> > >
> > > You need to change the corresponding kfree() to vfree().
> >
> > That's right. In actual CVS-code this problem is solved by building
> > virtual blocks of 2,4 or 8 physical blocks.
>
> Does this have an impact on performance?
Not at all. It just consumes less memory. Maybe garbage collect is a little 
bit slower, but I did not notice a remarkable change.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
