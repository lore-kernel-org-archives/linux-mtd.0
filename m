Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BYj6B-00016e-1z
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2004 06:17:25 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Jason Chen <jason_chen@coventive.com>,
 linux-mtd@lists.infradead.org
Date: Fri, 11 Jun 2004 12:11:56 +0200
References: <40C97F5F.2070309@coventive.com>
In-Reply-To: <40C97F5F.2070309@coventive.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406111211.56014.tglx@linutronix.de>
Cc: 
Subject: Re: undefined reference to `tx4925_read_nfmc'
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 11 June 2004 11:46, Jason Chen wrote:
> Hello sir/madam;
>
> I'am working on Toshiba TX4925 board with Linux 2.4.22 and I want to use
> jffs2 on NAND flash. I have run the mtd patch on my kernel, but now my
> kernel doesn't compile anymore, the error message is:
>
> drivers/mtd/mtdlink.o: In function `tx4925ndfmc_readecc':
> drivers/mtd/mtdlink.o(.text+0x13ab4): undefined reference to
> `tx4925_read_nfmc'

This function is a macro / inline and not part of the mtd subsystem.=20

#include <asm/tx4925/tx4925_nand.h>

should contain this.=20

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
