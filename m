Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRh44-00044n-GL
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 07:09:24 +0000
Received: by ey-out-1920.google.com with SMTP id 4so2140770eyg.26
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jan 2010 23:09:18 -0800 (PST)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
Date: Mon, 4 Jan 2010 08:09:12 +0100
References: <201001032117.37459.florian@openwrt.org>
	<1262552177.3181.5891.camel@macbook.infradead.org>
In-Reply-To: <1262552177.3181.5891.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201001040809.14480.florian@openwrt.org>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	ralf@linux-mips.org
Reply-To: Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Le dimanche 3 janvier 2010 21:56:17, David Woodhouse a =C3=A9crit :
> On Sun, 2010-01-03 at 21:17 +0100, Florian Fainelli wrote:
> > This patch modifies the physmap-flash driver to include
> > the ar7part partition parser in the list of parsers to
> > use when a physmap-flash driver is registered. This is
> > required for AR7 to create partitions correctly.
>=20
> Hrm, perhaps we'd do better to allow the probe types to be specified in
> the platform physmap_flash_data?

I guess so, will cook a patch which does that. Thanks!
=2D-=20
Best regards, Florian Fainelli
Email: florian@openwrt.org
Web: http://openwrt.org
IRC: [florian] on irc.freenode.net
=2D------------------------------
