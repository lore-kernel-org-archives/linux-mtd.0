Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BYjfT-0001ST-RX
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2004 06:53:53 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Jason Chen <jason_chen@coventive.com>
Date: Fri, 11 Jun 2004 12:48:22 +0200
References: <40C97F5F.2070309@coventive.com>
	<200406111211.56014.tglx@linutronix.de>
	<40C98DD7.8090303@coventive.com>
In-Reply-To: <40C98DD7.8090303@coventive.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406111248.22503.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
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

On Friday 11 June 2004 12:47, Jason Chen wrote:
> There are no "tx4925_nand.h" in my kernel source. I use "tx4925.h"
> instead of it, but it seems to lack something. Please kindly tell me
> where can I find it?

This file is not part of the mtd subsystem.

Ask mvista / toshiba or contact the driver author. Alice will have it around

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
