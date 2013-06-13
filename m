Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un5B8-0000SY-It
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 10:54:55 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>, Adrian Hunter
 <adrian.hunter@intel.com>
Subject: RE: UBIFS failure & stable page writes
Date: Thu, 13 Jun 2013 10:54:15 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>
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
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A36BC@SI-MBX14.de.bosch.com>
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

Hi!=0A=
=0A=
Joining in from thread "UBIFS Orphaned inode 1" since it's the same problem=
.=0A=
This is an orphans block from one of my crashed units:=0A=
=0A=
=3D=3D=3D Orphan nodes (LEB 9) =3D=3D=3D=0A=
=0A=
$ dd if=3D/dev/ubi0_0 bs=3D1 count=3D130944 skip=3D1178496 |hd=0A=
00000000  31 18 10 06 a9 ec d2 ed  c8 f6 6a 01 00 00 00 00  |1.........j...=
..|=0A=
00000010  30 00 00 00 0b 00 00 00  a4 06 00 00 00 00 00 80  |0.............=
..|=0A=
00000020  14 72 12 00 00 00 00 00  01 00 00 00 00 00 00 00  |.r............=
..|=0A=
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|=0A=
*=0A=
0001ff80=0A=
=0A=
Decoded:=0A=
31 18 10 06 - UBIFS_NODE_MAGIC=0A=
a9 ec d2 ed - CRC=0A=
c8 f6 6a 01 00 00 00 00 - Sequence number=0A=
30 00 00 00 - node length =3D 48 bytes=0A=
0b - node type =3D Orphan node=0A=
00 - group type =3D Not part of group=0A=
00 00 - padding=0A=
a4 06 00 00 00 00 00 80 - commit number =3D 0x6a4, last node flag =3D set=
=0A=
14 72 12 00 00 00 00 00 - inode num =3D 0x127214=0A=
01 00 00 00 00 00 00 00 - inode num =3D 1 !!!=0A=
=0A=
I have v2.6.35 with a lot of patches from Artem's maintenance tree and some=
 more from the later developments.=0A=
I diffed my fs/ubifs to the files from Antion Prins and they are almost ide=
ntical, mostly debug print changes and some small things that I think are u=
nrelated.=0A=
=0A=
I have not been able to reproduce the error but haven't got the resources t=
o set up 100 test units. So far a hand-full of units has crashed in the fie=
ld.=0A=
=0A=
BR // Mats=0A=
=0A=
=0A=
________________________________________=0A=
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of Prins =
Anton (ST-CO/ENG1.1) [Anton.Prins@nl.bosch.com]=0A=
Sent: Wednesday, June 12, 2013 3:57 PM=0A=
To: Adrian Hunter=0A=
Cc: linux-mtd@lists.infradead.org; dedekind1@gmail.com=0A=
Subject: RE: UBIFS failure & stable page writes=0A=
=0A=
Ofcourse=0A=
=0A=
Met vriendelijke groeten | Best Regards,=0A=
Anton Prins=0A=
=0A=
Bosch Security Systems BV,=0A=
Conference Systems (ST-CO/ENG1.1)=0A=
Torenallee 49=0A=
5617 BA  Eindhoven=0A=
The Netherlands=0A=
www.boschsecurity.com=0A=
T. +31 (0)40 2577077=0A=
anton.prins@nl.bosch.com=0A=
=0A=
=0A=
-----Original Message-----=0A=
From: Adrian Hunter [mailto:adrian.hunter@intel.com]=0A=
Sent: woensdag 12 juni 2013 15:10=0A=
To: Prins Anton (ST-CO/ENG1.1)=0A=
Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org=0A=
Subject: Re: UBIFS failure & stable page writes=0A=
=0A=
Can you tar and send fs/ubifs directory?=0A=
=0A=
On 12/06/13 14:57, Prins Anton (ST-CO/ENG1.1) wrote:=0A=
> Ok clear!=0A=
>=0A=
> Regarding mount debug: I suppose I only will see this on the 'first' boot=
 after the problem is in the persistence storage?=0A=
> (Up to now I'm not able to signal the point-of-failure... I'm only lookin=
g to an (possibly) after recovery situation).=0A=
>=0A=
> Or makes this sense to do this mount debug on the existing failing device=
?=0A=
>=0A=
> FYI:=0A=
> - with 100 devices power cycling every 5 minutes for a weekend we DON'T s=
ee a problem.=0A=
> - with 100 devices powered on for a weekend and after that give a single =
power-cycle shows maybe 1 or 2 failing devices (but sometimes '0').=0A=
>=0A=
> So a main problem in analyzing is the 'moment of failure' and 'reproducti=
on (rate)'.=0A=
>=0A=
> Met vriendelijke groeten | Best Regards,=0A=
> Anton Prins=0A=
>=0A=
> Met vriendelijke groeten | Best Regards,=0A=
> Anton Prins=0A=
>=0A=
>=0A=
> -----Original Message-----=0A=
> From: Adrian Hunter [mailto:adrian.hunter@intel.com]=0A=
> Sent: woensdag 12 juni 2013 14:00=0A=
> To: Prins Anton (ST-CO/ENG1.1)=0A=
> Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org=0A=
> Subject: Re: UBIFS failure & stable page writes=0A=
>=0A=
> On 12/06/13 14:13, Prins Anton (ST-CO/ENG1.1) wrote:=0A=
>> Does it make sense to use chk_orphans?=0A=
> That checks for missing orphans but the problem is the opposite: the=0A=
> presence of orphans that should not be there.=0A=
>=0A=
>> I suppose I have to do: $ echo "1" > chk_orphans=0A=
>>=0A=
>> Or am I wrong?=0A=
>>=0A=
>> Met vriendelijke groeten | Best Regards,=0A=
>> Anton Prins=0A=
>>=0A=
=0A=
