Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fM6eK-0000ih-E7
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 06:56:30 +0000
Date: Fri, 25 May 2018 08:56:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/13] mtd: rawnand: marvell: remove the dmaengine
 compat need
Message-ID: <20180525085614.6cdfb484@xps13>
In-Reply-To: <87603dx700.fsf@belgarion.home>
References: <20180524070703.11901-1-robert.jarzmik@free.fr>
 <20180524070703.11901-6-robert.jarzmik@free.fr>
 <20180524113006.3d5f393e@xps13> <87603dx700.fsf@belgarion.home>
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

Hi Robert,

On Thu, 24 May 2018 20:07:11 +0200, Robert Jarzmik
<robert.jarzmik@free.fr> wrote:

> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>=20
> > Hi Robert, =20
>=20
> Actually, a last time error slipped in this patch here (I'm really doing =
poorly
> on the copy paste side):
> +	nfc->dma_chan =3D	dma_request_slave_channel(&nfc->dev, "data");
>=20
> This should rather be :
> +	nfc->dma_chan =3D	dma_request_slave_channel(nfc->dev, "data");
>=20
> Would you grant your ack for the next iteration with this change folded i=
n ?

Didn't spot it. But, sure, I'm okay with the changes :)

Thanks,
Miqu=C3=A8l
