Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BgEr-0002UQ-NW
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 20:30:33 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE900447Y6G4B@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 02 May 2003 21:30:17 +0200 (MEST)
Date: Fri, 02 May 2003 22:29:58 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030502190516.98480.qmail@web13905.mail.yahoo.com>
To: Michael Moedt <xemc@yahoo.com>, linux-mtd@lists.infradead.org
Message-id: <200305022229.58700.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <20030502190516.98480.qmail@web13905.mail.yahoo.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Building MTD utils w/ arm-linux- cross
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 May 2003 21:05, Michael Moedt wrote:
> Hi.

eraseall does not need zlib. fixed in CVS

> Well, I installed zlib-1.1.4 into
> /usr/local/arm/2.95.3 , but I needed to add -I and -L
> flags to the Makefile in order for it to find it.  It
> seems to work, but I didn't find this anywhere when I
> searched the mailing list.  Is this the standard
> procedure, or am I doing something wrong?

header in /usr/local/arm/2.95.3/arm-linux/include
lib in /usr/local/arm/2.95.3/arm-linux/lib

Then you don't need -L.

> Anyways, I also wanted to let someone with CVS access
> know that there's a typo in the Makefile.  In
> eraseall's build rule, it uses $(LDLAGS) instead of
> $(LDFLAGS).  I guess no one needs to add the '-L'
> LDFLAG other than me?
Fixed, thanks


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
