Received: from web30205.mail.mud.yahoo.com ([209.191.69.52])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q37bZ-0001Zu-J3
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 14:03:10 +0000
Message-ID: <759739.22764.qm@web30205.mail.mud.yahoo.com>
Date: Fri, 25 Mar 2011 07:03:07 -0700 (PDT)
From: Lars Michael <lars.michael@yahoo.com>
Subject: Re: NAND device: all blocks bad after restart, how to recover?
To: dedekind1@gmail.com
In-Reply-To: <1299762378.6676.7.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=0A--- On Thu, 10/3/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A=
=0A> From: Artem Bityutskiy <dedekind1@gmail.com>=0A> Subject: Re: NAND dev=
ice: all blocks bad after restart, how to recover?=0A> To: "Lars Michael" <=
lars.michael@yahoo.com>=0A> Cc: linux-mtd@lists.infradead.org=0A> Date: Thu=
rsday, 10 March, 2011, 14:06=0A> On Wed, 2011-03-09 at 08:39 -0800,=0A> Lar=
s Michael wrote:=0A> > Hello,=0A> > =0A> > I repost this issue, with correc=
t subject and hope to=0A> have some=0A> > feedback. After working with gett=
ing UBI images=0A> mounted in Linux (it did=0A> > work for a sec!) the NAND=
 device suddenly went totally=0A> bad after a system=0A> > restart! So all =
blocks are reported bad and the mtd is=0A> no longer visible=0A> > in Linux=
.=0A> =0A> So do mtd tests work fine with your flash?=0A> =0A> >=A0 Before =
it had just a few bad blocks.=0A> =0A=0AWe investigated more and have found=
 that the FlexBus on the Coldfire can cause problems for the NAND device. W=
hen the FlexBus devices are removed=0Athe NAND device comes back to life, a=
nd is again accessible. So now I =0Acan get back to the UBI part of the pro=
ject :-)=0A=0ARegards,=0A- Lars
