Received: from cnxtsmtp4.conexant.com ([198.62.9.251])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeNhT-0002KF-KU
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 04:57:24 +0000
Received: from CPS (wsmx1.nb.conexant.com [157.152.185.16]) (using TLSv1 with
	cipher RC4-MD5 ( 128/128 bits)) (No client certificate requested) by
	cnxtsmtp4.conexant.com (Tumbleweed MailGate
	3.5.1) with ESMTP id 2597319E0C86 for <linux-mtd@lists.infradead.org>;
	Tue, 25 Mar 2008 21:57:27 -0700 (PDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: RE: NAND driver
Date: Wed, 26 Mar 2008 10:27:16 +0530
Message-ID: <C80DC1B06774F9419F4E0920B46E54AE13F760@hyd-mail2.bbnet.ad>
In-Reply-To: <631124.21101.qm@web36909.mail.mud.yahoo.com>
References: <751269.90312.qm@web36904.mail.mud.yahoo.com>
	<631124.21101.qm@web36909.mail.mud.yahoo.com>
From: "RadhaKumar Pulyala" <radha.kumar@conexant.com>
To: "Mark Underwood" <basicmark@yahoo.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have faced situation similar to yours.

What I did was to start afresh instead of tweaking the generic nand
interface driver. I would suggest you to look at the OneNAND interface
driver. That will have a lot of similarities to an interface written for
a controller.

Hope that helps.

Regards,
RK

-----Original Message-----
=46rom: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Mark
Underwood
Sent: Tuesday, February 26, 2008 2:34 PM
To: linux-mtd@lists.infradead.org
Subject: Re: NAND driver


--- Mark Underwood <basicmark@yahoo.com> wrote:

> I'm writing a NAND driver for an ASIC. The NAND controller has been
designed to handle page read
> &
> writes with little SW intervention using interrupts or DMA, so I plan
to implement the
> write_page_raw & read_page_raw functions.
> However, looking through nand_base.c it looks like not all NAND access
go through these
> functions
> so to start with I have implemented the cmd_ctrl function & supplied
the IO_ADDR_R & IO_ADDR_W
> address with the thinking that these would be a fall back when the
access doesn't go through the
> raw functions.
> Unfortunately it seems the single write functionality of the
controller is broken. The page=20
> read
> & write functionality only allow me to work in 512byte blocks so I
can't write OOB that way. Can
> you confirm that there are cases where OOB is written separately and
if so do you have any
> suggestions for getting around this problem=3F
>=20
> Many thanks,
>=20
> Mark
>=20

I forgot to say that I'm working on a 2.6.21.1 kernel.

After some pondering I managed to implement the single write
=66unctionality by abusing the command
=66ifo and playing with GPIO pins.

Looking through nand_base.c I notice that although I can pass in
*_page_raw operations in the
nand_chip structure they are not used in the *_page_swecc functions but
instead they call the
internal *_page_raw functions directly. I propose just to replace the
direct calls with indirect
ones (via the function pointers in the nand_chip structure). Does this
proposal sound OK=3F

Mark

>=20
>=20
>       ___________________________________________________________=20
> Rise to the challenge for Sport Relief with Yahoo! For Good =20
>=20
> http://uk.promotions.yahoo.com/forgood/
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20



      ___________________________________________________________=20
Rise to the challenge for Sport Relief with Yahoo! For Good =20

http://uk.promotions.yahoo.com/forgood/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Conexant E-mail Firewall (Conexant.Com) made the following annotations
---------------------------------------------------------------------
********************** Legal Disclaimer ****************************=20

"This email may contain confidential and privileged material for the sole =
=
use of the intended recipient. Any unauthorized review, use or distribution=
 =
by others is strictly prohibited. If you have received the message in error=
,=
 please advise the sender by reply email and delete the message. Thank you.=
"=
=20

**********************************************************************=20

---------------------------------------------------------------------
