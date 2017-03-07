Received: from smtp-sh2.infomaniak.ch ([128.65.195.6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clFED-0000hy-DL
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 13:32:40 +0000
From: Thorsten Christiansson <thorsten.christiansson@idquantique.com>
To: linux-mtd@lists.infradead.org
Cc: "laurent.monat@idquantique.com" <laurent.monat@idquantique.com>
Subject: Timeout in denali.c on Micron nandflash (Altera SoC)
Message-ID: <58BEB65B.3050003@idquantique.com>
Date: Tue, 7 Mar 2017 14:32:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm using Linux on an Altera SoC (Arria V), on which I'm using UBIFS on a=

nandflash from Micron (MT29F8G08ADADAH4).  I have a 400Mb r/w partition o=
n
which I have a sqlite3-based database. We're running an application that
reads/writes fairly small blocks. After running for about a week at moder=
ate
load, I get an error message, and the filesystem becomes read-only.

The message I get is a timeout, originating in the denali.c driver.
[11744.733748] timeout occurred, status =3D 0x0, mask =3D 0x4
[11745.733685] timeout occurred, status =3D 0x0, mask =3D 0x120

I can also reproduce the error much faster (in ~1h) using the GNU 'stress=
'
command, writing/reading small files continuously.

I'm using Linux 4.4, with some patches from Altera. I have compared the
denali.c that I'm using with the current HEAD on github, and the differen=
ces
appear to be only cosmetic.

I have asked Altera for help, but their only response so far has been tha=
t
they can reproduce the issue on their latest SoCs (it apparently appears =
on
both Arria10 and CycloneV) with the same flash. (We have also tested with=
 a
Macronix MX66U51235FMI-10G, with the same results.)

At first we used the FASTMAP feature of the UBIFS, but then we ran into t=
his
issue after only a couple of hours running at moderate load. When we
disabled
that, we thought the problem was gone, but it appears that it was only
hiding,
and now comes out to bite us after about a week.


My questions are the following:
- Are there any known issues with the denali driver that could cause this=
?
- Could it be an issue in the MTD/UBI/UBIFS layers?
- Are there any other parameters that can be tuned in order to alleviate =
the
  problem?

and of course
- Have I missed something obvious? I'm pulling my hair here...


best regards,
--=20
Thorsten Christiansson
