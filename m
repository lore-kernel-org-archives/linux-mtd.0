Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W30Mc-00068m-Qh
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 09:32:51 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: rcrb rcrb <rcrbsw@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS data integrity
Date: Tue, 14 Jan 2014 09:32:15 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FDD43AD@post.tritech.se>
References: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
In-Reply-To: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
On Tuesday, January 14, 2014 3:51 AM, rcrb rcrb [rcrbsw@gmail.com] wrote:=
=0A=
> I am considering using a database over UBIFS on my embedded device.=0A=
> The database file is approximately 1 MiB. I wonder if I can rely on=0A=
> the filesystem to be sure than this file will never have a corruption,=0A=
> even in case of power cut during update. Will the filesystem guarantee=0A=
> that, after reboot, the file will be either in the pre-update state or=0A=
> be correctly updated ?=0A=
=0A=
First of all, UBIFS relies on the underlying MTD driver also=0A=
doing its job so you should also make sure this works on your=0A=
board.=0A=
If your MTD driver works, UBIFS is supposed to guarantee=0A=
that every write operation is atomic, i.e. it is either fully written or=0A=
discarded.=0A=
If your database is guaranteed  correct after a power-cut then=0A=
depends on if it is consistent after every write or if it requires=0A=
several write operations to produce a new consistent state.=0A=
In general this requires that your database also is implemented=0A=
in a fault tolerant way.=0A=
=0A=
BR // Mats=0A=
