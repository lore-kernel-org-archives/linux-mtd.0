Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192ogW-0001YI-73
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:42:28 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HD000HQWO5Z4L@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 08 Apr 2003 10:42:00 +0200 (MEST)
Date: Tue, 08 Apr 2003 11:42:15 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1049790892.18045.120.camel@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>,
 =?utf-8?q?J=C3=B6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304081142.15852.tglx@linutronix.de>
MIME-version: 1.0
References: 
 <20030407171037.GB8178@wohnheim.fh-wedel.de.suse.lists.linux.kernel>
 <20030407194039.GF8178@wohnheim.fh-wedel.de>
 <1049790892.18045.120.camel@passion.cambridge.redhat.com>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: Andi Kleen <ak@suse.de>
cc: linux-kernel@vger.kernel.org
Subject: Re: [ANNOUNCE] New kernel tree for embedded linux
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 April 2003 10:34, David Woodhouse wrote:
> On Mon, 2003-04-07 at 20:40, J=C3=B6rn Engel wrote:
> > Some more partitioning code that only applies to spinning discs of
> > some sort (ide, scsi) or code that emulates spinning discs is always
> > included. No config option.
>
> We definitely want CONFIG_BLK_DEV. CONFIG_SWAP is a good start.
>
> > Another one is serial.c. In an ltp test run, plus serial console, som=
e
> > 90% were unused. And the code gave me some shivers. Volunteers?
>
> The new serial code is somewhat nicer. Still contains unconditional
> support for a lot of bizarre 8250 variations, but I don't think that's
> really taking up much space though.
This driver should really supersede the ugly drivers/char/serial.c. And i=
ts=20
definitly usefull for all embedded systems, not only for x86 based stuff.

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
