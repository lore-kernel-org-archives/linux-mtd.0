Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOfg-0003MH-Nu
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:39:45 +0000
Received: by mail-wi0-f180.google.com with SMTP id c10so653129wiw.1
 for <linux-mtd@lists.infradead.org>; Sat, 23 Mar 2013 06:39:42 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 0/3] fix NVRAM partition size if larger than expected
Date: Sat, 23 Mar 2013 14:39:38 +0100
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
In-Reply-To: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201303231439.39168.florian@openwrt.org>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le samedi 23 mars 2013 14:07:46, Jonas Gorski a =C3=A9crit :
> Some device vendors use a larger nvram size than expected. While Broadcom
> has defined it as 64K max, devices with 128K have been seen in the wild.
> Luckily they properly set the nvram's PSI size to the correct value, so
> we can use that to size the nvram partion.
>=20
> Yes it's a bit confusing as there are two nvrams, one with a fixed layout
> with in the bootloader, with the size information about the other.
>=20
> Since 2 of 3 patches are for the mtd tree, this patchset should go there
> (but it applies to both l2-mtd and mips-next fine).

Besides the minor nitpicks from patch 2, this serie looks good:

Acked-by: Florian Fainelli <florian@openwrt.org>

Thanks!
=2D-=20
=46lorian
