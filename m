Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmE7W-0003yg-Kb
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 00:06:35 +0000
Received: by gya1 with SMTP id 1so1690856gya.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jul 2011 17:06:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110727195512.GC3001@gallagher>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
	<20110727144501.7e0420cd@schlenkerla.am.freescale.net>
	<20110727195512.GC3001@gallagher>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 27 Jul 2011 17:06:08 -0700
Message-ID: <CAMjpGUcftT47FTVv15LDvswiXJdnorDiotEWkNDPkw5ABiQDQg@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
To: Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
	devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 27, 2011 at 12:55, Jamie Iles wrote:
> On Wed, Jul 27, 2011 at 02:45:01PM -0500, Scott Wood wrote:
>> On Wed, 27 Jul 2011 15:03:30 +0100
>> Jamie Iles <jamie@jamieiles.com> wrote:
>>
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
>> > @@ -0,0 +1,43 @@
>> > +GPIO assisted NAND flash
>> > +
>> > +Required properties:
>> > +- compatible : "gpio-nand"
>> > +- reg : should specify localbus chip select and size used for the chi=
p. =C2=A0For
>> > + =C2=A0ARM platforms where a dummy read is needed to provide synchron=
isation with
>> > + =C2=A0regards to bus reordering, an optional second resource describ=
es the
>> > + =C2=A0location to read from.
>>
>> I don't see how a pure "gpio nand" device would have any memory mapped
>> I/O. =C2=A0I think you need a more specific compatible for this.
>
> OK, fair point. =C2=A0I'm not sure what a better name would be though, ma=
ybe
> gpio-assisted-nand?

fwiw, i named the parallel flash mapping driver "gpio-addr-flash"
(where some of the address lines are done with GPIOs)
-mike
