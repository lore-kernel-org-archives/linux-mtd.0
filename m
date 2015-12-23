MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <87egedfmsm.fsf@free-electrons.com>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
 <20151222212350.GF30172@localhost>
 <87egedfmsm.fsf@free-electrons.com>
Date: Wed, 23 Dec 2015 15:21:29 +0100
Message-ID: <CAMuHMdVJY6+vFvO44kQkzbPJGDkY8SfRz3Dwt4-_RVJL2o=pdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: Add compatible property to "partitions"
 node
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Olof Johansson <olof@lixom.net>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 "arm@kernel.org" <arm@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Olof, Gregory,

On Wed, Dec 23, 2015 at 12:04 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
>  On mar., d=C3=A9c. 22 2015, Olof Johansson <olof@lixom.net> wrote:
>> On Mon, Dec 21, 2015 at 11:33:44AM +0100, Geert Uytterhoeven wrote:
>>> As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatibl=
e
>>> property to "partitions" node"), which is in v4.4-rc6, the "partitions"
>>> subnode of an SPI FLASH device node must have a compatible property. Th=
e
>>> partitions are no longer detected if it is not present.
>>>
>>> However, several DTSes in -next have already been converted to the
>>> "partitions" subnode without "compatible" property, introduced by
>>> commits 5cfdedb7b9a0fe38 ("mtd: ofpart: move ofpart partitions to a
>>> dedicated dt node") and fe2585e9c29a650a ("doc: dt: mtd: support
>>> partitions in a special 'partitions' subnode"). Hence all of these are
>>> now broken in -next, and will be broken in upstream during the merge
>>> window.
>>
>> So, if I understand this correctly, the partitions format was added for =
v4.4,
>> then this non-backwards compatible change was added in -rc6. But, there =
were
>> also DT files that had the new-for-v4.4 partitions nodes in them that th=
en
>> stopped working in -rc6?
>
> At least for the mvebu dts, the change was added for v4.5 not
> v4.4. Currently it is only in the next branches (and also in your
> arm-soc tree in next/dt).

The same is true for the shmobile changes: they are queued up for v4.5.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
