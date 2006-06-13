Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqEsv-0000mn-6B
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 15:49:13 -0400
Received: by ug-out-1314.google.com with SMTP id q2so3269228uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jun 2006 12:49:07 -0700 (PDT)
From: Husam <husamsenussi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
Date: Tue, 13 Jun 2006 20:42:44 +0100
References: <4488665D.5010908@kalikstein.com>
	<200606101321.37502.husamsenussi@gmail.com>
	<1149977115.18635.158.camel@shinybook.infradead.org>
In-Reply-To: <1149977115.18635.158.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200606132042.44659.husamsenussi@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 10 June 2006 23:05, you wrote:
> On Sat, 2006-06-10 at 13:21 +0100, Husam wrote:
> > Yes thats correct but the 32MiB consist of two "NAND 16MiB, 8-bit" Chip,
> > providing 16 bit access using interleave, and that double size the page
> > "Page =3D 1024 + 32 OOB".
> >
> > But does NAND layer need to be abee to handle Multi floor device?
>
> Hm, no -- it's two separate device, isn't it? So don't we just have to
> probe them separately and then perhaps use something like mtdconcat?
>
OK ... I guess that would cleaner way and makes the interface more compatib=
le.
I haven't seen mtdconcat yet.

> > > > 2. When I set bus width to 16 in diskonchip level nand_scan return =
an
> > > > error because that doesn't match with table.
> > >
> > > Doesn't match with which table? What chip ID is detected?
> >
> > Yes the ID exist on the table "mfr =3D 0x98 (Toshiba) , id =3D 0x75" wh=
ich
> > match the id I get from trueffs driver for wince, so I would expect "NA=
ND
> > 16MiB, 8-bit". However as I said before the driver should double the si=
ze
> > of the page because of interleave.
>
> Hm, is it actually two 8-bit chips, rather than a single 16-bit chip?
>
> In that case, we might have to do a bit more to make it work.
>
Yes it's not single 16-bit, could we add anther flag to NAND say=20
"NAND_INTERLEAVE" .. or maybe pass number =C2=A0of chips from device layer =
to NAND=20
layer.

All we need to do I guess is to pass the right information so the NAND laye=
r=20
can calculate the right size for page and to block.
=C2=A0
> > > > 4. I found that read_buff terminate the read each time, and because
> > > > of that nand_read_ecc skip bytes when read across sections.
> > >
> > > I think the new code probably fixed this, didn't it? If not, we can
> > > make sure it does.
> >
> > No =C2=A0you are still terminating the read at the end of read_buf func=
tion,
> > you wold need to
> >
> > 1. Send READ command
> > 2. Read date "e.g. 512 bytes"
> > 3. Read ECC 6 bytes
> > 4. terminate read stream
> >
> > My be diskonchip layer should implement read_page !!!
>
> Yeah, I think that's probably a sane plan.
>
> > > > 5. Layout of the data on the page is different form 16M, but I'm not
> > > > sure if this is specific =C2=A0to INTFL.
> > >
> > > I _think_ it's specific to INFTL -- it's weird, though. I don't
> > > actually know why M-Systems did that interleaving. There are guys from
> > > M-Systems on the list though -- perhaps they can enlighten us?
> >
> > But would be able to use the same layout with jffs?
>
> I see no reason why not.
>
> > > Now is a good time to get the remaining issues fixed. I'd very much
> > > like to have the 32MiB and 64MiB DiskOnChip Millennium Plus devices
> > > working.
> >
> > Thats good ... because from what I see 64MiB is not even supported by
> > INTFL layer, in 64MiB each device has separate boot records but
> > information for some of the partitions into the two boot records.
>
> Hm, OK -- we'll need to work on that too.
>
> Let's forget INFTL for now -- can we work on getting basic read/write
> operations on the 32MiB unit working first? We can do 64MiB next, then
> INFTL (for 32MiB and then 64MiB).
I guess that would be the right way to go ... I'm looking at the code for m=
y=20
device bootloader and so far I manage to get alots of info about the MDOC+
