Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaxfC-0004uH-DT
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 10:14:55 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: Oliver =?iso-8859-1?q?K=FChlert?= <oliver.kuehlert@sysgo.com>,
	linux-mtd@lists.infradead.org
Date: Thu, 17 Jun 2004 16:08:54 +0200
References: <40D1A1F2.1000103@sysgo.com>
In-Reply-To: <40D1A1F2.1000103@sysgo.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406171608.54071.tglx@linutronix.de>
Cc: mag@sysgo.com, rof@sysgo.com, acs@sysgo.com
Subject: Re: chip driver mar_ram.c never sets MTD_ERASE_DONE state
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 June 2004 15:51, Oliver K=FChlert wrote:
> Hello,
>
> trying to erase on an mtd devices using the map_ram.c driver
> blocks the current process and never wakes up. (see mtdchar.c, ioctl func)
>
> !!!!!!---->   instr->state =3D MTD_ERASE_DONE;   <----- !!!!!!

Thanks, fixed in CVS

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
