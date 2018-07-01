Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZgqN-0004GJ-1H
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 18:13:04 +0000
Date: Sun, 1 Jul 2018 20:12:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180701201250.5f93b70e@xps13>
In-Reply-To: <1530132464-8210-1-git-send-email-martin@kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
 <1530132464-8210-1-git-send-email-martin@kaiser.cx>
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

Hi Martin,

Martin Kaiser <martin@kaiser.cx> wrote on Wed, 27 Jun 2018 22:47:44
+0200:

> Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> potentially be called at any time. After the __init functions are cleaned,
> mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.
>=20
> mxcnd_probe used to be marked as __init, this was removed years ago.
> Remove the __init qualifier from from mxcnd_probe_dt as well.
>=20
> Fixes: 06f255106923 ("mtd: remove use of __devinit")
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---

Applied to nand/next, thanks!
Miqu=C3=A8l
