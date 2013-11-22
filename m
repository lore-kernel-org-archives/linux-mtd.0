From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 0/2] Regarding NAND core and drivers maintenance
Date: Fri, 22 Nov 2013 07:07:09 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4DCBC@DBDE04.ent.ti.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Ezequiel Garcia
> As it's obvious from the mailing list activity, in the past months Brian
> Norris took the NAND maintainership role. In my opinion, he's been doing
> a terrific work and as a result the reviewing cycle is now considerably
> shorter.
>=20
> Great work, Brian!
>=20
> This position is not at all easy, due to each NAND driver being filled
> with hardware controller specificities. For that reason, I think it
> would be healthy to take another step in setting maintainership
> responsabilites.
>=20
Absolutely Agree.. Thanks Brian..

> My proposal (copy-pasted from the media subsystem) is to define
> sub-maintainers, one for each NAND driver, in addition to the top-level
> NAND subsystem maintainer.
>=20
> When a patch comes for a given driver, the _ideal_ situation would be
> for the sub-maintainer to Ack-it first.
>=20
Specifically, we need someone to keep a watch on m25p80 (apart from
David and Brian). This is because I see lot of patches coming in but not
on generic framework approach. Serial Flash driver might be next big
component of MTD sub-system in coming times.


with regards, pekon
