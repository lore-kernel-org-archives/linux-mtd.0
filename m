Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RzZp-0001mB-F8
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 20:23:37 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HGL00J7Q9VCM0@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 16 Jun 2003 21:23:37 +0200 (MEST)
Date: Mon, 16 Jun 2003 22:21:35 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200306161421.23307.f.callaghan@ieee.org>
To: f.callaghan@ieee.org, linux-mtd@lists.infradead.org
Message-id: <200306162221.35515.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
 <1055780708.2233.18.camel@passion.cambridge.redhat.com>
 <200306161421.23307.f.callaghan@ieee.org>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Please Help, problem mounting jffs2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 16 June 2003 20:21, Frank R Callaghan wrote:
> > No, it looks like your userspace program has such a _high_ priority
> > that the GC thread never runs. A subtle difference :)
>
> I have reniced the test program to +20 but the mount is still hung !
>
> > > What should I do/try next ?
> >
> > This is an RTAI-specific issue. I suspect your test program above has
> > its priority set such that when it's eating 100% CPU time in a tight
> > loop, nothing else gets to run. Have you asked on the RTAI mailing
> > lists?
>
> yes - no response yet !
>
> I'm not sure how rtai can be interfering if there are no-rtai modules
> loaded - unless the kernel patches messed something up !
A RTAI patched kernel without modules loaded should behave like a unpatched 
kernel. 

Switch off CONFIG_RTHAL and try again. This should remove all RTAI tweaks from 
the kernel.

If that does not work try a (RTAI) unpatched kernel.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
