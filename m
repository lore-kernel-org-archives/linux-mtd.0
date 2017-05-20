Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC03q-0001s8-IP
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 08:48:32 +0000
Date: Sat, 20 May 2017 10:48:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: "linux-mtd@lists.infradead.org"@mail.free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Subject: Re:
Message-ID: <20170520104804.55cec3e6@bbrezillon>
In-Reply-To: <20170519213731.21484-1-mrugiero@gmail.com>
References: <20170519213731.21484-1-mrugiero@gmail.com>
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

Hi Mario,

Not sure how you created this patchset, but you miss a Subject, and the
diff-stat.

Please use

git format-patch -o <output-dir> -3 --cover-letter

to generate patches, then fill the cover letter in.

Once your cover letter is ready, you can send the patches with

git send-email --to ... --cc ... <output-dir>/*.patch

Regards,

Boris

Le Fri, 19 May 2017 18:37:28 -0300,
"Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :

> Some manufacturers use different layouts than MTD for the NAND, creating
> incompatibilities when going from a vendor-specific kernel to mainline.
> In particular, NAND devices for AllWinner boards write non-FF values to
> the bad block marker, and thus false positives arise when detecting bad
> blocks with the MTD driver. Sometimes there are enough false positives
> to make the device unusable.
> A proposed solution is NAND scrubbing, something a user who knows what
> she's doing (TM) could do to avoid this. It consists in erasing blocks
> disregarding the BBM. Since the user must know what she's doing, the
> only way to enable this feature is through a per-chip debugfs entry.
>=20
