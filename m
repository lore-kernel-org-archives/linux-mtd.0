Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbu5W-0001o8-Ba
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 13:14:07 +0000
Received: by vcbf11 with SMTP id f11so3031259vcb.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 05:14:04 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 17 Dec 2011 14:13:42 +0100
Message-ID: <CAJpamw5qTXwMC_HQXN+ehjxDDQ6GXT_-Kcfu8E7P5F2CnLqsZA@mail.gmail.com>
Subject: Re: [PATCH 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM partitions
 are at least 64K
To: Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jonas,

2011/12/17 Jonas Gorski <jonas.gorski@gmail.com>:
> - =C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(totallen, master->erasesize)=
 + master->erasesize;
> - =C2=A0 =C2=A0 =C2=A0 sparelen =3D master->size - spareaddr - master->er=
asesize;
> + =C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(totallen, master->erasesize)=
 + cfelen;

spareaddr =3D roundup(totallen, cfelen) + cfelen ?

--=20
Guillaume LECERF
OpenBricks developer - www.openbricks.org
