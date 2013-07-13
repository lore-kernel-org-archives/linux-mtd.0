Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uy78j-0003Bn-Oo
 for linux-mtd@lists.infradead.org; Sat, 13 Jul 2013 21:14:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net"
 <olof@lixom.net>, "N, Mugunthan V" <mugunthanvnm@ti.com>
Subject: RE: [PATCH v5 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Sat, 13 Jul 2013 21:13:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E7FDB@DBDE04.ent.ti.com>
References: <1373748891-7779-1-git-send-email-pekon@ti.com>
In-Reply-To: <1373748891-7779-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "tony@atomide.com" <tony@atomide.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Changes v4 -> v5
> - Rebased to linux-next
> IMPORTANT: Need to revert commit fb1585b, [PATCH 2/4] part of previous
> version
> 	http://lists.infradead.org/pipermail/linux-mtd/2013-July/047441.html
>=20
> - Swapped PATCH-1 & PATCH-2 to maintain bisectibility & compilation
> dependency
> 	http://lists.infradead.org/pipermail/linux-mtd/2013-July/047461.html
>=20
> - PATCH-2: re-ordered call to is_elm_present() for later updates ELM driv=
er
> 	- dropped changes in include/linux/platform_data/elm.h (not
> needed)
> - PATCH-3: re-ordered call to is_elm_present() for later updates ELM driv=
er
> - Re-formated patch description (replaced tabs with white-spaces)
>=20

Hi Olof, Arnd,

I have re-submitted patch with minor updates and re-ordered PATCH-1 & 2
to preserve bisectibility. And there is no comment | objection from
maintainers about the DT bindings. So request you to please Ack | Review
this series for it to be picked by Artem | David Woodhouse in MTD tree.

Also please revert commit fb1585b in linux-next, as its left-over piece of
same series v4.

- This series is the base for further clean-up of omap2-nand driver, hence
its important for it to be up-streamed for future work.


with regards, pekon
