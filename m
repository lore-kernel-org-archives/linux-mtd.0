Received: from smtp3.home.se ([212.78.199.23])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLbAT-0003eX-Va
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 02:20:42 -0500
From: "Tomas E" <tomas2003@home.se>
To: x0nishan@ti.com
Date: Tue, 21 Mar 2006 08:20:04 +0100
MIME-Version: 1.0
Message-ID: <1142925604.72140700tomas2003@home.se>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, nico@cam.org
Subject: Re: RE: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,=20

>Tomas,
> First you should tell us a bit more about your board reset.
>Just confirm if the warm-reset is linked to the reset pin of strata NOR.

The at91rm9200 has a built in hardware watchdog which has no external=20
pin to make use of for a reset of the flash.

The flash is the intel strata 28F640 (rev C)



>CFI command sequences can put the NOR flash into a >state(e.g. in
>buffered write) where the flash contents are not >visible. If the CPU
>resets in the middle of this process and the NOR flash >is not reset back
>to the reset state, and the first instruction is being >executed from
>NOR, then you might face a state where even your >bootloader does not

Yes, I think this is the case but every time I ioremap the flash
0080 show up. I only write a small file but I could never see the
0080 go away.=20

I expected the flash to become in a readable state
after a while when the write operation was done.


>work - this is not a fault of the driver or the flash,=20
>rather is a problem with the board's signal routing as such.

Yes this is a problem as well. As long as there is no external reset 
of the flash there is no 100% garantee but I would like to 
minimize the problem.

>
>Regards,
>Nishanth Menon

Tomas
