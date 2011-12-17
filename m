Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbvJZ-0005B4-4F
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 14:32:42 +0000
Received: by vcbf11 with SMTP id f11so3069332vcb.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 06:32:40 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <CAOiHx=km1TEy0r1zpk+iSiqHMfqR2qPmtJQA5RsuGKG09e60tQ@mail.gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
 <CAJpamw5qTXwMC_HQXN+ehjxDDQ6GXT_-Kcfu8E7P5F2CnLqsZA@mail.gmail.com>
 <CAOiHx=km1TEy0r1zpk+iSiqHMfqR2qPmtJQA5RsuGKG09e60tQ@mail.gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 17 Dec 2011 15:32:19 +0100
Message-ID: <CAJpamw6JpENR4Us5c=-49MbL-2j1Aq1LnP5khbBkptDAXPvzJA@mail.gmail.com>
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

2011/12/17 Jonas Gorski <jonas.gorski@gmail.com>:
> The intention is to align the spareaddr to the next eraseblock (cfelen
> can be bigger than the erasesize). Maybe writing it as
>
> =C2=A0=C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(cfelen + totallen, maste=
r->erasesize);
>
> would be cleaner.


Humm, you're right, forget my comment.
BTW I don't mind what syntax you chose.

Good job ;)


--=20
Guillaume LECERF
OpenBricks developer - www.openbricks.org
