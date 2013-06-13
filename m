Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un7dg-0004ot-Ri
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 13:32:34 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>, Adrian Hunter
 <adrian.hunter@intel.com>
Date: Thu, 13 Jun 2013 15:31:58 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3C5D@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
 <51B82A1D.30009@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3508@SI-MBX14.de.bosch.com>
 <51B862D6.2080807@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
 <51B87315.7090808@intel.com>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A36BC@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We decided not to patch for this weekend, but onlty make an additional logg=
ing in UBIFS:

diff -purN a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
--- a/fs/ubifs/orphan.c	2013-06-13 12:19:58.490931170 +0200
+++ b/fs/ubifs/orphan.c	2013-06-13 12:17:13.014931462 +0200
@@ -300,6 +300,9 @@ static int write_orph_node(struct ubifs_
 	for (i =3D 0; i < cnt; i++) {
 		orphan =3D cnext;
 		orph->inos[i] =3D cpu_to_le64(orphan->inum);
+		if (orph->inos[i] < UBIFS_FIRST_INO) {
+			printk(KERN_ERR "ERROR: Wrong ino in orphan list[%lu]: %lu\n", (unsigne=
d long)i, (unsigned long)orph->inos[i]);
+		}
 		cnext =3D orphan->cnext;
 		orphan->cnext =3D NULL;
 	}

This to make sure if UBIFS itself writes a node '0' or '1'... and it is for=
ced by UBI, NAND, Peripheral or NAND-Device.
If there is a relation between logging and failing after reboot it would ma=
ke sense... Means a lot of analyzing; but we have to find it!

Next step is to apply patches and to test again:
http://git.infradead.org/ubifs-2.6.git/commit/8afd500cb52a5d00bab4525dd5a56=
0d199f979b9
http://git.infradead.org/ubifs-2.6.git/commit/2928f0d0c5ebd6c9605c0d98207a4=
4376387c298

And hopefully we get rid of some unexpected orphan nodes.

How realistic is it that the double orphan free causes our problem?
Mats, are you sure the patches mentioned above are also not in your UBIFS?
