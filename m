Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnyvC-0003sR-AU
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2013 22:26:11 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>, Adrian Hunter
 <adrian.hunter@intel.com>
Subject: RE: UBIFS failure & stable page writes
Date: Sat, 15 Jun 2013 22:25:32 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD57@post.tritech.se>
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
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3C5D@SI-MBX14.de.bosch.com>
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3C5D@SI-MBX14.de.bosch.com>
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

Those patches are not in my source.=0A=
// Mats=0A=
=0A=
________________________________________=0A=
From: Prins Anton (ST-CO/ENG1.1) [Anton.Prins@nl.bosch.com]=0A=
Sent: Thursday, June 13, 2013 3:31 PM=0A=
To: Mats K=E4rrman; Adrian Hunter=0A=
Cc: linux-mtd@lists.infradead.org; dedekind1@gmail.com=0A=
Subject: RE: UBIFS failure & stable page writes=0A=
=0A=
We decided not to patch for this weekend, but onlty make an additional logg=
ing in UBIFS:=0A=
=0A=
diff -purN a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c=0A=
--- a/fs/ubifs/orphan.c 2013-06-13 12:19:58.490931170 +0200=0A=
+++ b/fs/ubifs/orphan.c 2013-06-13 12:17:13.014931462 +0200=0A=
@@ -300,6 +300,9 @@ static int write_orph_node(struct ubifs_=0A=
        for (i =3D 0; i < cnt; i++) {=0A=
                orphan =3D cnext;=0A=
                orph->inos[i] =3D cpu_to_le64(orphan->inum);=0A=
+               if (orph->inos[i] < UBIFS_FIRST_INO) {=0A=
+                       printk(KERN_ERR "ERROR: Wrong ino in orphan list[%l=
u]: %lu\n", (unsigned long)i, (unsigned long)orph->inos[i]);=0A=
+               }=0A=
                cnext =3D orphan->cnext;=0A=
                orphan->cnext =3D NULL;=0A=
        }=0A=
=0A=
This to make sure if UBIFS itself writes a node '0' or '1'... and it is for=
ced by UBI, NAND, Peripheral or NAND-Device.=0A=
If there is a relation between logging and failing after reboot it would ma=
ke sense... Means a lot of analyzing; but we have to find it!=0A=
=0A=
Next step is to apply patches and to test again:=0A=
http://git.infradead.org/ubifs-2.6.git/commit/8afd500cb52a5d00bab4525dd5a56=
0d199f979b9=0A=
http://git.infradead.org/ubifs-2.6.git/commit/2928f0d0c5ebd6c9605c0d98207a4=
4376387c298=0A=
=0A=
And hopefully we get rid of some unexpected orphan nodes.=0A=
=0A=
How realistic is it that the double orphan free causes our problem?=0A=
Mats, are you sure the patches mentioned above are also not in your UBIFS?=
=0A=
=0A=
