Received: from service87.mimecast.com ([94.185.240.25])
	by casper.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QN2lz-0004Mg-E3
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 12:56:16 +0000
Subject: Re: [PATCH v6 0/8] Switch ARM platforms from integrator-flash to
	physmap
From: Marc Zyngier <Marc.Zyngier@arm.com>
To: dedekind1@gmail.com
In-Reply-To: <1305803946.2630.69.camel@localhost>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305803946.2630.69.camel@localhost>
Date: Thu, 19 May 2011 13:53:34 +0100
Message-ID: <1305809614.27474.41.camel@e102391-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 14:19 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-05-17 at 14:11 +0100, Marc Zyngier wrote:
> > As the integrator-flash driver is mostly a duplicate of physmap,
> > move all users of this driver to physmap and get rid of the
> > then unused driver.
> >=20
> > Also change the set_vpp() method in physmap to pass the
> > platform_device instead of the map_info. This allows for a substantial
> > cleanup in drivers/mtd/maps/pismo.c
> >=20
> > This patch set has been ok'ed by RMK, who is willing to take it
> > through his tree. This requires an ACK from the MTD maintainers. David
> > Woodhouse cc-ed on the whole patch set in case he'd prefer to merge it
> > via the MTD tree.
>=20
> I assume the whole series will go in via some subsystem arm tree?
>=20

Yes, it's been merged by Russell into his tree yesterday, after David's
ack.

=09M.
--=20
Reality is an implementation detail.
