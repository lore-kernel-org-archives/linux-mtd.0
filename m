Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hQN6-0007yE-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 08:57:44 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1600B0NORDGL@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 21 Aug 2002 09:57:14 +0200 (MEST)
Date: Wed, 21 Aug 2002 09:56:54 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: can i use the cvs code directly in kernel 2.2.19 ?
In-reply-to: <000b01c248de$37c21100$b30210ac@gv.com.tw>
To: =?UTF-8?Q?=E5=B0=8F?= =?UTF-8?Q?=E6=98=8E?= <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Message-id: <1029916619.1695.6.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: quoted-printable
References: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
 <1029793649.22781.129.camel@thomas.tec.linutronix.de>
 <015501c247f3$d13176a0$b30210ac@gv.com.tw>
 <1029830371.22775.150.camel@thomas.tec.linutronix.de>
 <1029858455.23122.191.camel@thomas.tec.linutronix.de>
 <000b01c248de$37c21100$b30210ac@gv.com.tw>
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

On Wed, 2002-08-21 at 08:44, =E5=B0=8F=E6=98=8E wrote:
> dear all,
> another question:
> can i use the cvs code directly in kernel 2.2.19 ?
> (currently it work fine with kernel 2.4.17)
Look for the inter_module patch in the patches/ directory of CVS.
It's for 2.2.17, but should apply to 2.2.19 too. There are some more
tweaks neccecary. There are 2 mailthreads (june, august 02) about that.
Citation dwmw2:
> I know of nobody else working on a 2.2 backport. Worst case, you=20
> should be able to ditch the page-based write code and call
> jffs2_write_file_range() from a jffs2_file_write() which you provide
> instead of generic_file_write().

BTW, did you test latest code in CVS ? Any problems left ?

--=20
Thomas=20
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
