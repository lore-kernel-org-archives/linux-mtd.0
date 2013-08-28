Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEd7C-0007ac-Bx
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 10:36:43 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: ubifs: bad node type (255 but expected 6)
Date: Wed, 28 Aug 2013 10:36:07 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCE1BE2@post.tritech.se>
References: <CAAXf6LX44diB36-aFUFh1mcWcgj3X7z1jg-gwpeFyKaROjjaKQ@mail.gmail.com>
In-Reply-To: <CAAXf6LX44diB36-aFUFh1mcWcgj3X7z1jg-gwpeFyKaROjjaKQ@mail.gmail.com>
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

Hi Thomas,=0A=
=0A=
On Wednesday, August 28, 2013 12:13 PM Thomas De Schampheleire [patrickdepi=
nguin@gmail.com] wrote:=0A=
> Is this a known problem, fixed in a later release?=0A=
> Could it be just a bad NAND flash?=0A=
> Could it be a problem with the underlying MTD driver (or my modification =
to it)?=0A=
=0A=
I would put my money on the MTD driver.=0A=
Have you tried running the mtd tests (http://www.linux-mtd.infradead.org/do=
c/general.html#L_mtd_tests)?=0A=
=0A=
BR // Mats=0A=
