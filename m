Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1diKSG-0006SE-41
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 13:03:22 +0000
Date: Thu, 17 Aug 2017 15:02:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] constify mtd pci_device_id
Message-ID: <20170817150243.38d1db3f@bbrezillon>
In-Reply-To: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
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

Le Thu,  3 Aug 2017 21:52:04 +0530,
Arvind Yadav <arvind.yadav.cs@gmail.com> a =C3=A9crit :

> pci_device_id are not supposed to change at runtime. All functions
> working with pci_device_id provided by <linux/pci.h> work with
> const pci_device_id. So mark the non-const structs as const.

Applied the whole series to l2-mtd/master.

Thanks,

Boris

>=20
> Arvind Yadav (6):
>   [PATCH 1/6] mtd: maps: ichxrom: constify pci_device_id.
>   [PATCH 2/6] mtd: amd76xrom: constify pci_device_id.
>   [PATCH 3/6] mtd: esb2rom: constify pci_device_id.
>   [PATCH 4/6] mtd: ck804xrom: constify pci_device_id.
>   [PATCH 5/6] mtd: intel_vr_nor: constify pci_device_id.
>   [PATCH 6/6] mtd: pci: constify pci_device_id.
>=20
>  drivers/mtd/maps/amd76xrom.c    | 4 ++--
>  drivers/mtd/maps/ck804xrom.c    | 4 ++--
>  drivers/mtd/maps/esb2rom.c      | 4 ++--
>  drivers/mtd/maps/ichxrom.c      | 4 ++--
>  drivers/mtd/maps/intel_vr_nor.c | 2 +-
>  drivers/mtd/maps/pci.c          | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>=20
