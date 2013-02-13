Received: from inet-tsb5.toshiba.co.jp ([202.33.96.24] helo=imx2.toshiba.co.jp)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5VmV-0002ef-8m
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 06:25:25 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <matthieu.castet@parrot.com>
Subject: Re: [PATCH] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Wed, 13 Feb 2013 06:25:14 +0000
Message-ID: <F3B6523425E7914AA6214ED358D820AF25D99FB1@TGXML316.toshiba.local>
References: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
 <511A0D18.2030408@parrot.com>
In-Reply-To: <511A0D18.2030408@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <E6CD5695001E06458FC671492C491138@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Are you planning to add support to other Toshiba BENAND ?

Unfortunately, I am not currently, because I do not have=20
any boards of the other BENANDs.

But I suppose that it is easy to support the other BENANDs=20
by little modification of nand_read_page_benand() to get=20
a number of bitflips.
--=20
UWATOKO Katsuki=
