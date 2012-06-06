Received: from nm18-vm3.bullet.mail.ne1.yahoo.com ([98.138.91.148])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScEnb-00006G-DT
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 11:53:15 +0000
References: <1338902500.33577.YahooMailNeo@web39302.mail.mud.yahoo.com>
 <1338974098.6875.23.camel@sauron.fi.intel.com>
Message-ID: <1338983592.11759.YahooMailNeo@web39302.mail.mud.yahoo.com>
Date: Wed, 6 Jun 2012 04:53:12 -0700 (PDT)
From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: UBI: Single versus Multiple Images
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1338974098.6875.23.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Doug Kehn <rdkehn@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,=0A=0A=0A=0A> From: Artem Bityutskiy <dedekind1@gmail.com>=0A> Sen=
t: Wednesday, June 6, 2012 4:14 AM=0A> =0A> On Tue, 2012-06-05 at 06:21 -07=
00, Doug Kehn wrote:=0A>>  Hi Everyone,=0A>> =0A>>  I have the following NA=
ND flash MTD layout (presently JFFS2):=0A>> =0A>>  * Boot-loader=0A>>  * Ke=
rnel=0A>>  * Root file-system (rootfs)=0A>> =0A>>  * Data=0A>> =0A>>  I'm g=
oing to switch from JFFS2 to UBI/UBIFS.=A0 I'm wondering if it =0A> is=0A>>=
  better to create a single UBI image containing both rootfs and data=0A>> =
 volumes or to create separate UBI images (each with a single volume)=0A>> =
 or is the answer it depends?=0A> =0A> Are you actually talking about how t=
o partition your flash - whether to=0A> have one partition or several?=0A>=
=0A=0AI'm asking about whether to create one UBI image that contains multip=
le volumes or create UBI multiple images that contain a single volume.=A0 T=
he layout is:=0A=0Amtd0=A0 boot-loader=0Amtd1=A0 kernel=0Amtd2=A0 rootfs=0A=
mtd3=A0 data=0A=0AThus, is it better or does it matter if a single ubi.conf=
 is used to configure rootfs and data or if multiple ubi.conf are used (1 f=
or rootfs and 1 for data).=0A=0A>>  The data volume will be used for loggin=
g data.=A0 The volume won't=0A>>  completely fill as old data will be purge=
d to make room for new data.=0A>>  For the single image multiple volume cas=
e, if I understand the =0A>>  documentation correctly, UBI will use all PEB=
 from both volumes for=0A>>  mapping per-volume LEB, =0A>>  correct?=A0 If =
my understanding is correct, then it's possible, after=0A>>  enough time, m=
aximum PEB erase count will be reached and both rootfs=0A>>  and data volum=
es will be read-only?=A0 If the goal is to keep the rootfs=0A>>  volume wri=
table, even if the data volume become read-only, then would=0A>>  it be bet=
ter to create multiple UBI images?=A0 Or is my understanding=0A>>  all wron=
g?=0A> =0A> I do not really understand the questions. UBI will do wear-leve=
ling=0A> across the mtd device it is attached to. If you have one MTD parti=
tion=0A> which spans entire flash, you'll have wear-leveling across entire =
flash.=0A> You will ave /dev/ubi0 represinting the UBI device,=0A> and /dev=
/ubi0_0, /dev/ubi0_1, etc for each volume for this UBI device=0A> number 0.=
=0A> =0A> If you partition your flash, then each partition will be managed=
=0A> independently, and you'll have wear-leveling per-partition. So one=0A>=
 partition may wear out faster than another. You'll=0A> have /dev/ubi0, /de=
v/ubi1, etc for each partition. Then if you create a=0A> volume in each UBI=
 device, you'll have /dev/ubi0_0, /dev/ubi1_0, etc for=0A> each volume.=0A>=
 =0A=0AThis clears up my confusion.=0A=0AThanks,=0A...doug
