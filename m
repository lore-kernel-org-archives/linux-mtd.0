Received: from mail-co1nam03on0099.outbound.protection.outlook.com
 ([104.47.40.99] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byaeP-0007JV-5G
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 08:30:37 +0000
From: "Esponde, Joel" <Joel.Esponde@Honeywell.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: fixed spansion quad enable
Date: Mon, 24 Oct 2016 08:29:32 +0000
Message-ID: <F6CD090A69E64C4289DC608E1C5D20242545486D@DE08W1305.global.ds.honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
 <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
 <83e02f1d-2c58-10cc-567c-2a58a363767e@atmel.com>
In-Reply-To: <83e02f1d-2c58-10cc-567c-2a58a363767e@atmel.com>
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

> -----Message d'origine-----
> De=A0: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Envoy=E9=A0: vendredi 21 octobre 2016 15:45
> =C0=A0: Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
> mtd@lists.infradead.org
> Objet=A0: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>=20
> > That's a very good remark and I think the reason is that the current
> > implementation of spansion_quad_enable() suffers from a bug but this
> > one is almost harmless:
> >
> > I assume there is pull-up resistor on the MISO line:
> > spansion_quad_enable() sends a 35h command, which is not supported
> > hence ignored by some memories, then it reads a 1-byte value of FFh
> > due to the pull-up so we pass the test which checks that the Quad Enabl=
e
> bit has successfully been set.
> >
> > Then if we now add the same test before sending the Write Status (01h)
> > command with 2 bytes (SR1 then CR/SR2), we also read a FFh value for
> > the Configuration Register hence we skip the Write Status command
> > because we think the Quad Enable bit has already been set but if we
> > are using a brand new memory still using its factory settings the Quad
> > Enable has never been set and won't be set since we now skip the Write
> Status command.
> >
> > I think this what currently happens but I need to check with one of my
> > memory samples if I can find one which doesn't support the Read CR
> > command but I not sure to have such a sample...
>=20
> The JESD216B specification clearly deals with 2 cases: a first one where =
the
> 35h command is not used, I guess because not supported, and a second case
> using both the 05h and 35h commands to read the SR1 and SR2/CR1 memory
> registers before writing both SR1 and SR2/CR1 with the 01h command.
>=20
> However I can't provide any example of memory sample falling into the fir=
st
> case. I guess case 1 only applies to old and buggy memories and maybe not
> so used in production.
> Besides, your patch is great so I wonder whether it makes sense to reject=
 it
> just because it might introduce a regression with some unidentified
> memories...
> If so, I think we could still find a workaround later to handle those ver=
y few
> (deprecated) parts.
>=20
> The S25FL127S memory is still recommended by Cypress/Spansion for new
> designs.
>=20

I cannot help here as I have only one part number of flash memory...
But from a performance point of view, it would be really great to have this=
 pre test before writing quad enable bit to memory.
In my case, I will have to keep this patch because I cannot add useless 200=
ms delay at boot time.

Best regards,

Jo=EBl
