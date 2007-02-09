Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFWvJ-0003Tu-8X
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 09:40:28 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1171026729.4884.177.camel@zod.rchland.ibm.com>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
	<1171026729.4884.177.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 09 Feb 2007 16:40:00 +0200
Message-Id: <1171032000.17314.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: MTDML <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-09 at 07:12 -0600, Josh Boyer wrote:
> If writing zeroes to the field for all LEBs is valid, then I don't think
> the tools need updating.  At least not the image creation tools.  We've
> already declared the padding fields to be zero filled.
>=20
> The unubi tool will need updating though.

They should be updated because they should generate unique numbers to
the sqnum field, do not use old 'leb_ver' stuff, because leb_ver stuff
will go away eventually, say, in a year. Also boot-loaders should be
eventually updated.

> > When I move a PEB with low EC, and I need to pick the target PEB (T),
> > where I move the data to. I pick T with the highest EC if the data is
> > old, and I pick T with an average EC if the data is fresh.
>=20
> If you replace "old" with "stale" I agree.  My stupid english thinking
> brain equates "old" with the passage of time, and that isn't what sqnum
> is tracking.  It is valid to use stale though.

Just treat the steadily increasing sequential number as a kind of UBI
time, then my terminology start making sense.

> Ah, aligned within on a 64-bit boundary... I see.  Looks odd, but ok.

Nothing odd, actually. I do not want to deal with unaligned addresses.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
