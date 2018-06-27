Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY6L0-0001GX-6q
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 09:02:07 +0000
Date: Wed, 27 Jun 2018 11:01:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180627110115.490a2477@xps13>
In-Reply-To: <1530089557-30918-1-git-send-email-martin@kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
 <1530089557-30918-1-git-send-email-martin@kaiser.cx>
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

On Wed, 27 Jun 2018 10:52:37 +0200, Martin Kaiser <martin@kaiser.cx>
wrote:

> Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> potentially be called at any time. After the __init functions are cleaned,
> mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.
>=20
> mxcnd_probe used to be marked as __init, this was removed years ago.
> Remove the __init qualifier from from mxcnd_probe_dt as well.
>=20
> Fixes: 06f2551 ("mtd: remove use of __devinit")

Nitpick: the Fixes tag should use at least the 12 first characters of
the SHA-1 ID, see:

https://www.kernel.org/doc/html/v4.16/process/submitting-patches.html#descr=
ibe-your-changes

Thanks,
Miqu=C3=A8l
