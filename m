Date: Wed, 3 Jan 2018 08:40:37 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180103084037.422b239a@xps13>
In-Reply-To: <87d12scbiy.fsf@belgarion.home>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon>
 <877etkecig.fsf@belgarion.home> <20171218092535.2ca1fe13@xps13>
 <87y3lxccr7.fsf@belgarion.home>
 <20171220224121.2cb6f690@bbrezillon>
 <87lghucykr.fsf@belgarion.home>
 <20171222222441.0fd77df9@bbrezillon>
 <20171222233730.68d9cb9d@xps13> <87k1xdblxf.fsf@belgarion.home>
 <20171223155709.2ba16e95@xps13> <87fu81bc45.fsf@belgarion.home>
 <20180102120326.7a2cf1d1@xps13> <87d12scbiy.fsf@belgarion.home>
MIME-Version: 1.0
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

On Tue, 02 Jan 2018 20:21:09 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Miquel RAYNAL <miquel.raynal@free-electrons.com> writes:
>=20
> > I think the ECC issue you faced was related to pages being written
> > *and* empty. If this guess is right, the board should boot fine with
> > these changes.
> >
> > Otherwise, please add the DEBUG define as before in both the core
> > and the driver and do not hesitate to add another dump_stack()
> > where it crashes (if applicable). =20
>=20
> The problem looks still the same :
> [    3.560163] Bad block table not found for chip 0

Mmmmh ok.

Can you please add this patch:
http://code.bulix.org/61at9p-254626

Thanks,
Miqu=C3=A8l


>=20
> Cheers.
>=20
> --
> Robert
>=20
