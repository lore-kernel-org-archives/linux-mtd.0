Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VToCx-0001p0-BF
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 07:29:24 +0000
Date: Wed, 9 Oct 2013 09:28:55 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
Message-ID: <20131009092855.77d311fd@parrot.com>
In-Reply-To: <20131008192846.A25E7380A65@gemini.denx.de>
References: <20131008192846.A25E7380A65@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 8 Oct 2013 20:28:46 +0100,
Wolfgang Denk <wd@denx.de> a =E9crit :

> so I can keep an existing MTD partition with a JFFS2
> file system. After copying the data from JFFS2 to a UBIFS volume, I
> would like to free and reuse the space of this JFFS2 partition.
>=20
> Is there a way to "grow" the existing UBI device so that it now also
> covers the rest of the NAND chip?  Or is my only option to create a
> second UBI device?
I don't remeber exactly but I think UBI (without fastmap) doesn't know
the size of the mtd partition.
The scan scan what you give to it.

A way to "grow an UBI device could be to append (before or after)
flash formated with ubi format (with --no-volume-table and the correct
--image-seq=3D and same other param).
If you give erased flash may be the linux driver will format it.



Matthieu
