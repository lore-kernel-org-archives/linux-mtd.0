Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WMHd-0002IH-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 19:54:37 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8E001DLWPLNG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2003 21:24:59 +0100 (MET)
Date: Wed, 08 Jan 2003 21:23:57 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: 16 NANDS
In-reply-to: <4752.1042013699@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: manningc2@actrix.gen.nz, m.neiger@synergie-inf.com,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301082123.57689.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <200301072004.45259.tglx@linutronix.de>
 <20030106230808.9E85F439D@tiger.actrix.co.nz>
 <4752.1042013699@passion.cambridge.redhat.com>
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

On Wednesday 08 January 2003 09:14, David Woodhouse wrote:
> tglx@linutronix.de said:
> >  The  functions are not that different, but it's better to have a
> > little duplicated  code instead of if (buswitdh == x) then else....
> > crap.
>
> Bear in mind that if/then/else crap can be hidden inside #defines fairly
> effectively, and optimises away perfectly in the case where you compile for
> only one buswidth -- unlike out-of-line function calls.
>
> What Nico did with cfi_read() et al is worth considering.
I have the option already built in to compile for one buswidth only, but if 
you want to compile it for 8/16/32 3 different functions give you more code, 
but also more speed and more flexibility for code maintainence

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
