Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QLzUx-0007P8-Ss
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 15:14:20 +0000
Subject: Re: [PATCH v5 8/8] MTD: physmap: let set_vpp() pass a
	platform_device instead of a map_info
From: Marc Zyngier <Marc.Zyngier@arm.com>
To: Eric Miao <eric.y.miao@gmail.com>
In-Reply-To: <BANLkTi=-Lcg5Wk7yuipTTzrSxs0nNmpMaw@mail.gmail.com>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-9-git-send-email-marc.zyngier@arm.com>
	<BANLkTi=-Lcg5Wk7yuipTTzrSxs0nNmpMaw@mail.gmail.com>
Date: Mon, 16 May 2011 16:14:56 +0100
Message-ID: <1305558896.30788.15.camel@e102391-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
	Philipp Zabel <philipp.zabel@gmail.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-16 at 23:06 +0800, Eric Miao wrote:
> On Mon, May 16, 2011 at 10:59 PM, Marc Zyngier <marc.zyngier@arm.com> wro=
te:
> > The set_vpp() method provided by physmap passes a map_info back to
> > the platform code, which has little relevance as far as the platform
> > is concerned (this parameter is completely unused).
> >
> > Instead, pass the platform_device, which can be used in the pismo
> > driver to retrieve some important information in a nicer way, instead
> > of the hack that was in place.
>=20
> Not really sure if a 'struct device' would be more generic here, though t=
his
> case is simply a 'struct platform_device'.

While I agree that 'struct device' is more generic, physmap only knows
about platform_devices. Should another device type be added to physmap,
this would make sense. But at the moment I'd like to limit the code
churn to what is strictly necessary.

Cheers,

=09M.
--=20
Reality is an implementation detail.
