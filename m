Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2LRn-00014D-HE
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2013 13:19:13 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>, Adrian Hunter
 <adrian.hunter@intel.com>
Date: Thu, 25 Jul 2013 15:18:36 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C4037FE0E@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
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
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD66@post.tritech.se>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F4167DD@SI-MBX14.de.bosch.com>
 <51C005B8.3000709@intel.com>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F546220@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8761@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8761@post.tritech.se>
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

After two weeks of testing not seen any node 1 problem/orphan 0 logging any=
 more; so gives good feeling!

Regarding exended attributes, we do not use them for now.

-----Original Message-----
From: Mats K=E4rrman [mailto:Mats.Karrman@tritech.se]=20
Sent: vrijdag 28 juni 2013 11:05
To: Prins Anton (ST-CO/ENG1.1); Adrian Hunter
Cc: linux-mtd@lists.infradead.org; dedekind1@gmail.com
Subject: RE: UBIFS failure & stable page writes

Hi Anton,

Thanks for your efforts!
The tests I have run has shown no regressions, but some stability improveme=
nts in the integck test.
(I still have not been able to reproduce the orphan node 1 problem myself t=
hough.)

A question; do you use file extended attributes? I have seen problems in th=
is area while running
integck and also tested patches that seem to help.
ref: http://thread.gmane.org/gmane.linux.drivers.mtd/47021

BR // Mats

> From: Prins Anton (ST-CO/ENG1.1) [Anton.Prins@nl.bosch.com]
> Sent: Tuesday, June 25, 2013 10:21 AM
> To: Adrian Hunter
> Cc: Mats K=E4rrman; linux-mtd@lists.infradead.org; dedekind1@gmail.com
> Subject: RE: UBIFS failure & stable page writes
>=20
> Another weekend of tests, including the patches showed no more logging of=
 writing orphan node 0.
> Also the 0xdead4ead did not appear; so the patches certainly do their job=
!
>=20
> We do not have hard evidence the missing root node is caused by this 'wri=
ting of free-ed memory'.
> But at least it seems a good suspect! Because the occurrence is very low =
we will continue testing...
> (And go back mounting synchronous to get some higher occurrence...)
>=20
> I'll keep you up-to-date.
>=20
> Anton
