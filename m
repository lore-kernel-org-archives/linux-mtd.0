Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVFYM-0002hx-8Y
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 07:25:42 +0000
In-Reply-To: <1396393830.6474.31.camel@mars>
References: <1396287151.4857.50.camel@mars>	
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>	
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>	
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
To: Christoph Fritz <chf.fritz@googlemail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
Date: Wed, 2 Apr 2014 09:25:16 +0200
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Christoph Fritz <chf.fritz@googlemail.com> wrote on 2014/04/02 01:10:30:
>=20
> On Tue, 2014-04-01 at 21:13 +0200, Joakim Tjernlund wrote:
> > Christoph Fritz <chf.fritz@googlemail.com> wrote on 2014/04/01=20
17:09:51:
> > > I already tried all sorts of combinations of various delays and 0xff
> > > writes, which can be used wasteful without impact. And yes, errors=20
are
> > > happening less -- but are still happening (at for example -2=B0C=20
starting
> > > udev or a filesys-bench program like bonnie++).
> >=20
> > Amazing Micron still sells these defect chips
>=20
> Yeah, and it was pain to do all these kinds of tests to get it reliably
> working for a real world application where minus degrees can happen. For
> me it would be no problem to keep this quirk in my private queue, but
> involving a bigger audience seems to be right considering the facts.
>=20
> > > Sure, it's possible that I missed the holy right
> > > delay-0xff-quirk-combination to get this NOR flash reliable working=20
for
> > > its specified temperature range. But until nobody has found it, I=20
would
> > > prefer to stick to my posted quirk and just disable suspend erase.
> >=20
> > Problem is, if you add that quirk no-one will be able to remove it=20
later=20
> > so we
> > better make sure there isn't a less intrusive solution.
>=20
> What about a comment or printk which makes that clear? I anyway don't
> think that there are interested users of this specific NOR flash left
> using a current kernel -- but who knows, right.

Yes and a new commit msg which indicates you have tried all workarounds=20
suggested
by Micron to no avail.

>=20
> > hmm, have you checked you bus timing? Perhaps you need to relax it=20
> > somewhat.
>=20
> Sure, I rechecked the WEIM interface (imx35 bus) settings more than
> once. I also did testings with most relaxed settings (highest delays
> possible). But still, flash errors do occur.

Well, I am out of ideas and it seems you are too.
If not Micron comes back with a solution I guess there is no choice

>=20
> I should mention that a PC28F256P33BFE (a similar 32 MB NOR flash) works
> without any quirk in all my testing environments just reliable as it
> should be.
>=20
> > > Maybe someone from Micron can help?
> >=20
> > Yes, you should contact them.
>=20
> Is there anybody out there knowing a contact without the need of going
> through a business-ticket-support-hell ?

Sadly no.

 Jocke
