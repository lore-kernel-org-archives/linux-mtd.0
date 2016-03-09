Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adf4m-0000QZ-Pr
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 14:27:02 +0000
Date: Wed, 9 Mar 2016 15:26:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "rnd4@dave-tech.it" <rnd4@dave-tech.it>, "andrea.scian@dave.eu"
 <andrea.scian@dave.eu>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Brian Norris"
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
Message-ID: <20160309152638.0b5e9250@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF69672@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF69672@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 Mar 2016 14:47:21 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Hi, Andrea and Boris
> This is a historical subject, and talked before.=20
> From our field issues, 8 bits of bad block mark for MLC NAND is not reaso=
nable.
> Because of bitflip on bad block mark, regard one good block as a bad bloc=
k is common
> Issue. Especially first time boot after reflow. The solution is modified =
this value to 4 for MLC
> NAND by hand, and the factory BB mark is =E2=80=9C0x00=E2=80=9D.
> I think, 4 bits for MLC NAND make sense.


I'm tempted to say "let's start with this value and see what happens in
real world". If we want to be a bit more conservative we could decide
to chose 2, which should address most problems too (during my tests, I
never seen such a huge concentration of bitflips in the same byte).

Brian, Andrea, what do you think?

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
