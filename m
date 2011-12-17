Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbuIz-00023J-Ps
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 13:28:02 +0000
Received: by wgbdt11 with SMTP id dt11so5647247wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 05:27:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJpamw5qTXwMC_HQXN+ehjxDDQ6GXT_-Kcfu8E7P5F2CnLqsZA@mail.gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
 <1324126698-9919-3-git-send-email-jonas.gorski@gmail.com>
 <CAJpamw5qTXwMC_HQXN+ehjxDDQ6GXT_-Kcfu8E7P5F2CnLqsZA@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 17 Dec 2011 14:27:38 +0100
Message-ID: <CAOiHx=km1TEy0r1zpk+iSiqHMfqR2qPmtJQA5RsuGKG09e60tQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM partitions
 are at least 64K
To: Guillaume LECERF <glecerf@gmail.com>
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

Hi Guillaume,

On 17 December 2011 14:13, Guillaume LECERF <glecerf@gmail.com> wrote:
> Hi Jonas,
>
> 2011/12/17 Jonas Gorski <jonas.gorski@gmail.com>:
>> - =C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(totallen, master->erasesize=
) + master->erasesize;
>> - =C2=A0 =C2=A0 =C2=A0 sparelen =3D master->size - spareaddr - master->e=
rasesize;
>> + =C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(totallen, master->erasesize=
) + cfelen;
>
> spareaddr =3D roundup(totallen, cfelen) + cfelen ?

The intention is to align the spareaddr to the next eraseblock (cfelen
can be bigger than the erasesize). Maybe writing it as

 =C2=A0 =C2=A0 =C2=A0 spareaddr =3D roundup(cfelen + totallen, master->eras=
esize);

would be cleaner.


Jonas
