Received: from mail1.bemta8.messagelabs.com ([216.82.243.209])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fScdb-0006gj-B1
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 06:18:40 +0000
From: "Lachmann, Juergen" <juergen.lachmann@harman.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI Fastmap and checkmap
Date: Tue, 12 Jun 2018 06:18:20 +0000
Message-ID: <5123cb5c017e4316a11a0e83d1faa32d@HIMDWSMB06.ad.harman.com>
Content-Language: de-DE
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

We are very interested in your "Correctly handle interrupted erasures in EB=
A" patch,=20
since we observe occasional corruption of an UBIFS volume.

Currently we are running Linux 4.4.14, but I started testing with the lates=
t UBI code backported.
Here I had to learn that the check_mapping() function doesn't do anything o=
n dynamic volumes=20
since the creation of  the checkmap by calling ubi_fastmap_init_checkmap() =
is apparently=20
skipped  for dynamic volumes inside init_volumes():

585                 if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {=20
                     ...
 590                         continue;=20
 591                 }

>From the code I see no reason why this is done. Is it intentional behavior =
that check_mapping()=20
only works on static volumes, and what's the reason behind?
--
Regards,
J=FCrgen

J=DCRGEN LACHMANN
SW Engineer=20
Harman/Becker Automotive Systems
