Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ev6jA-0007G3-Bm
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2018 19:33:53 +0000
From: Richard Weinberger <richard@nod.at>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: use put_device() if device_register fail
Date: Sun, 11 Mar 2018 20:35:12 +0100
Message-ID: <3975609.gPYExXdWMR@blindfold>
In-Reply-To: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 9. M=E4rz 2018, 11:50:47 CET schrieb Arvind Yadav:
> if device_register() returned an error! Always use put_device()
> to give up the reference initialized.
>=20
> Arvind Yadav (2):
>   [PATCH 1/2] mtd: use put_device() if device_register fail
>   [PATCH 2/2] mtd: ubi: use put_device() if device_register fail

Uhh, this is not obvious. Does device_register() really always return with =
a=20
reference held in all (error) cases?

Thanks,
//richard
