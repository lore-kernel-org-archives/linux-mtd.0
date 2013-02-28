From: "Philip, Avinash" <avinashphilip@ti.com>
To: Mark Jackson <mpfj-list@mimc.co.uk>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: RE: linux-next: JFFS2 corruption
Date: Thu, 28 Feb 2013 04:11:56 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA8EF4A@DBDE01.ent.ti.com>
References: <512CD9BA.3080300@mimc.co.uk>
 <20130227101824.6e18ba21fb99070594420f29@canb.auug.org.au>
 <512E2241.9040705@mimc.co.uk>
In-Reply-To: <512E2241.9040705@mimc.co.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 27, 2013 at 20:42:01, Mark Jackson wrote:
> On 26/02/13 23:18, Stephen Rothwell wrote:
> > Hi Mark,
> >=20
> > On Tue, 26 Feb 2013 15:50:18 +0000 Mark Jackson <mpfj-list@mimc.co.uk> =
wrote:
> >>
> >> Just tested the current next-20130226 on a custom AM335X board, and if=
 I mount
> >> our JFFS2 image as read/write, the next reboot shows the image as bein=
g corrupt.
> >>
> >> If I reprogram the jffs2 image into NAND and only mount the volume as =
read-only,
> >> no corruption occurs and the system remains intact.
> >>
> >> I have also tested:-
> >>
> >> (a) reprogram ubifs image into nand
> >> (b) boot the volume as read-only (corrupt -> no)
> >> (c) remount the volume as read/write
> >> (d) rebooting the volume as read-only (corrupt -> yes)
> >=20
> > Thanks for all the testing.  Sam questions as in my other email.
>=20
> Okay, just tested 3v8 plus:-
>=20
> https://patchwork.kernel.org/patch/1931251/
> https://patchwork.kernel.org/patch/1931221/
> https://patchwork.kernel.org/patch/1931201/
> and changed drivers/mtd/nand/elm.c, line 388 "ti,am33xx-elm" to "ti,am335=
2-elm"
>=20
> This produces an identical corruption.
>=20
> I have also tested next-20130225 and next-20130227, and both cause the sa=
me corruption.

JFFS2 is not supported in am335x with BCH8 ecc scheme because of ECC layout=
 constraints.
Reasons for disabling JFFS2 support documented in the wiki
http://processors.wiki.ti.com/index.php/AM335x_JFFS2_Support_Guide#Reasons_=
for_disabling_JFFS2_support


Thanks
Avinash
>=20
> Regards
> Mark J.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
