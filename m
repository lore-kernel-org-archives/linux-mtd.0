Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZapz-0004ya-JF
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2004 15:40:16 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Marc Singer <elf@buici.com>
Date: Sun, 13 Jun 2004 21:34:38 +0200
References: <20040612164706.GA11273@buici.com>
In-Reply-To: <20040612164706.GA11273@buici.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406132134.38967.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marc,

On Saturday 12 June 2004 18:47, Marc Singer wrote:
> This is the MTD patch.

Please clean up the code from unused code inside #if 0 / #endifs and commen=
ts.=20
Is there more than one chip on the board ? If not, then the whole for / arr=
ay=20
stuff is unneccecary and makes it just hard to understand.

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
