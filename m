Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnzEj-00048m-Pr
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2013 22:46:22 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>, Adrian Hunter
 <adrian.hunter@intel.com>
Subject: RE: UBIFS failure & stable page writes
Date: Sat, 15 Jun 2013 22:45:51 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD66@post.tritech.se>
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
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3D7F@SI-MBX14.de.bosch.com>
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3D7F@SI-MBX14.de.bosch.com>
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

Hi Anton,=0A=
=0A=
1. Yes, there are files added, removed and renamed.=0A=
2. Single core, 32-bit PowerPC e300c4 in BE mode, CONFIG_PREEMPT=3Dy.=0A=
3. Never tried a graceful one ;) Normal procedure is shutting down applicat=
ion + sync + power off to be as quick as possible. However, as other people=
 are responsible for those units that experienced this problem I can't be s=
ure that no-one used the shutdown command but it's unlikely.=0A=
=0A=
BR // Mats=0A=
________________________________________=0A=
From: Prins Anton (ST-CO/ENG1.1) [Anton.Prins@nl.bosch.com]=0A=
Sent: Thursday, June 13, 2013 9:24 PM=0A=
To: Mats K=E4rrman; Adrian Hunter=0A=
Cc: linux-mtd@lists.infradead.org; dedekind1@gmail.com=0A=
Subject: RE: UBIFS failure & stable page writes=0A=
=0A=
Hi Mats,=0A=
=0A=
Some questions to get more feeling with our problem:=0A=
=0A=
1. Does your application add/remove files (delete/unlink?)=0A=
2. Does your kernel run on a single or multi-core machine?=0A=
3. Do you experience it with an ungraceful shutdown or also graceful?=0A=
=0A=
The statistics we see is that rebooting every 5 minutes will not give highe=
r occurrence.=0A=
It seems that device turned on for a longer time have more chance to fail; =
but as said not predictable.=0A=
=0A=
