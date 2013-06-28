Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsUcl-0007ZP-CE
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 09:05:48 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>, Adrian Hunter
 <adrian.hunter@intel.com>
Subject: RE: UBIFS failure & stable page writes
Date: Fri, 28 Jun 2013 09:05:12 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8761@post.tritech.se>
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
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F546220@SI-MBX14.de.bosch.com>
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
Thanks for your efforts!=0A=
The tests I have run has shown no regressions, but some stability improveme=
nts in the integck test.=0A=
(I still have not been able to reproduce the orphan node 1 problem myself t=
hough.)=0A=
=0A=
A question; do you use file extended attributes? I have seen problems in th=
is area while running=0A=
integck and also tested patches that seem to help.=0A=
ref: http://thread.gmane.org/gmane.linux.drivers.mtd/47021=0A=
=0A=
BR // Mats=0A=
=0A=
> From: Prins Anton (ST-CO/ENG1.1) [Anton.Prins@nl.bosch.com]=0A=
> Sent: Tuesday, June 25, 2013 10:21 AM=0A=
> To: Adrian Hunter=0A=
> Cc: Mats K=E4rrman; linux-mtd@lists.infradead.org; dedekind1@gmail.com=0A=
> Subject: RE: UBIFS failure & stable page writes=0A=
> =0A=
> Another weekend of tests, including the patches showed no more logging of=
 writing orphan node 0.=0A=
> Also the 0xdead4ead did not appear; so the patches certainly do their job=
!=0A=
> =0A=
> We do not have hard evidence the missing root node is caused by this 'wri=
ting of free-ed memory'.=0A=
> But at least it seems a good suspect! Because the occurrence is very low =
we will continue testing...=0A=
> (And go back mounting synchronous to get some higher occurrence...)=0A=
> =0A=
> I'll keep you up-to-date.=0A=
> =0A=
> Anton=0A=
