Received: from mario.gams.at ([194.42.96.10])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oEA-0000gu-As
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:13:10 +0100
From: Bernd Petrovitsch <bernd@gams.at>
To: Miles Bader <miles@gnu.org>
References: <1049786306.27774.87.camel@localhost> 
In-reply-to: Your message of "08 Apr 2003 09:18:27 +0200."
             <1049786306.27774.87.camel@localhost>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 10:12:39 +0200
Message-ID: <1358.1049789559@frodo.gams.co.at>
Sender: bernd@maxxio.at
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
cc: Daniel Egger <degger@fhm.edu>
cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
cc: Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: [ANNOUNCE] New kernel tree for embedded linux 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel Egger <degger@fhm.edu> wrote:
>Am Die, 2003-04-08 um 06.38 schrieb Miles Bader:
>
>> How about dealing with uClinux?  That's almost entirely embedded
>> systems.

IMHO uClinux is a workaround the problem that the standard kernel =

needs a 32bit CPU and a MMU.

>... without MMU. If you have one you better use it.

Absolutely ACK. Especially since "embedded systems" nowadays may come =

with integrated (net-)snmp agents, a web server+CGI scripts or some =

pseudo-shell for configuration, image download via tftp/ftp/http/
[xyz]modem, etc.
Then you want to use a MMU and try to convince product mgmt/whoever
to get a MMU on the device.

	Bernd
-- =

Bernd Petrovitsch                              Email : bernd@gams.at
g.a.m.s gmbh                                  Fax : +43 1 205255-900
Prinz-Eugen-Stra=DFe 8                    A-1040 Vienna/Austria/Europe
                     LUGA : http://www.luga.at
