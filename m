Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaBHq-0002Zr-Nq
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 06:35:27 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Andriy Korud" <a.korud@vector.com.pl>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 15 Jun 2004 12:29:45 +0200
References: <80908CC5B2C9DB47AAF8C77892FCB44315F7B2@lion.vector.com.pl>
In-Reply-To: <80908CC5B2C9DB47AAF8C77892FCB44315F7B2@lion.vector.com.pl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406151229.45239.tglx@linutronix.de>
Cc: 
Subject: Re: CLEANMARKER node found at has totlen 0xc != normal 0x0  ?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 15 June 2004 12:27, Andriy Korud wrote:
> Hi,
> I'm playing with jffs2 on NAND chips (Samsung 128Mbyte), MTD CVS is week
> old and kernel is 2.6.5.
>
> I'm making image with
> ./mkfs.jffs2 -b --eraseblock=3D131072 --pagesize=3D2048 -p -r /test_root =
=2Dv -o
> test_root.img
>
> and then copy it with cp (nandwrite seems to have problems wiht endianess=
).
> Everything work fine except on mounting filesystem I have messages:
>
> CLEANMARKER node found at 0x00000000 has totlen 0xc !=3D normal 0x0
> CLEANMARKER node found at 0x00020000 has totlen 0xc !=3D normal 0x0
> CLEANMARKER node found at 0x00040000 has totlen 0xc !=3D normal 0x0

On NAND we store the cleanmarker (markes a clean erased block) in the out o=
f=20
band area. So the cleanmarker node should be omitted when creating the fs=20
image. Add -n to the options

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
