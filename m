Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QwVD-0004IQ-9W
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 22:54:31 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HGF00N0HWUW2I@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 13 Jun 2003 23:54:33 +0200 (MEST)
Date: Sat, 14 Jun 2003 00:52:38 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1055531892.3632.183.camel@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>, f.callaghan@ieee.org
Message-id: <200306140052.38541.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
 <200306131447.45138.f.callaghan@ieee.org>
 <1055531892.3632.183.camel@passion.cambridge.redhat.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
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

On Friday 13 June 2003 21:18, David Woodhouse wrote:
> On Fri, 2003-06-13 at 19:47, Frank R Callaghan wrote:
> > OK, this sounds bad !  Where can I go from here ?
>
> Well, you can start by just commenting out the whole of both the
> jffs2_{start,stop}_garbage_collect_thread() functions since the thread
> is an optimisation anyway. But basically you need to find out why
> kernel_thread() isn't working.
>
> It's not a uclibc bug -- it's a kernel bug, and not one in the standard
> kernel either -- I'm inclined to suspect RTAI at this stage, although
> you blatantly have other kernel threads running so it's not a simple and
> obvious breakage.

Maybe it's a RTAI problem. But I have JFFS2 / RTAI running on a couple of 
boards. 

Have you tried this with a vanilla kernel without RTAI ? If not, can you do 
that ?

If RTAI is the guilty one, then consider the following:
kernel_thread () is a syscall. RTAI captures syscalls. Maybe the syscall is 
lost anywhere in RTAI.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
