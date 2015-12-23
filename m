From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Olof Johansson <olof@lixom.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, arm@kernel.org,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] ARM: mvebu: ix4-300d: Add compatible property to
 "partitions" node
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
 <1450694033-27717-2-git-send-email-geert+renesas@glider.be>
 <87zix3rbm7.fsf@free-electrons.com> <20151222212225.GE30172@localhost>
Date: Wed, 23 Dec 2015 12:07:12 +0100
In-Reply-To: <20151222212225.GE30172@localhost> (Olof Johansson's message of
 "Tue, 22 Dec 2015 13:22:25 -0800")
Message-ID: <87a8p1fmov.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Olof,
=20
 On mar., d=C3=A9c. 22 2015, Olof Johansson <olof@lixom.net> wrote:

> On Mon, Dec 21, 2015 at 05:48:48PM +0100, Gregory CLEMENT wrote:
>> Hi Geert,
>>=20=20
>>  On lun., d??c. 21 2015, Geert Uytterhoeven <geert+renesas@glider.be> wr=
ote:
>>=20
>> > As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatib=
le
>> > property to "partitions" node"), the "partitions" subnode of an SPI
>> > FLASH device node must have a compatible property. The partitions are =
no
>> > longer detected if it is not present.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > Acked-by: Brian Norris <computersforpeace@gmail.com>
>>=20
>> Applied on mvebu/dt (with the hope that it is still time to push it to
>> arm-soc)
>
> I think we should just take this directly, so feel free to drop it. I'll
> followup on 0/9.

OK I will drop it of my mvebu/dt and for-next branches.

Gregory


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
